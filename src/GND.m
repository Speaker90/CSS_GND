%% Define the weights, wheter to use the approximation and the target threshold
degree_based= true;
spectralApproximation = true;
target_value = 0.01;

%adjust matlab's eigs parameter here:
opts.tol = 1e-3;
opts.maxit = 10000;

%% Import the data
data=csvread('aggregated_lightning_network.csv');
node_ID_data=unique(data(:,1:2));
nr_nodes = length(node_ID_data);

%relabel
for i=1:size(data,1)
    data(i,1)=find(node_ID_data==data(i,1));
    data(i,2)=find(node_ID_data==data(i,2));
end

%% calculate weights and adjacency matrix

if degree_based
    % calculate the adjacency matrix
    A=sparse(nr_nodes,nr_nodes);
    for i=1:size(data,1)
        A(data(i,1),data(i,2))=1;
        A(data(i,2),data(i,1))=1;
    end

    %calculate the degree weights
    G=graph(A);
    degrees=degree(G);
    D_max=max(degrees);
    W=sparse(diag(degrees));
    W_total = sum(degrees);
    W_max = max(max(W));

else
    W=sparse(nr_nodes,nr_nodes);
    for i=1:size(data,1)
        W(data(i,1),data(i,2))=W(data(i,1),data(i,2))+data(i,3);
        W(data(i,2),data(i,1))=W(data(i,2),data(i,1))+data(i,3);
    end
    % calculate the adjacency matrix
    A=zeros(size(W));
    A(W>0)=1;
    A=sparse(A);
    G=graph(A);
    degrees=degree(G);
    D_max=max(degrees);

    % calculate the weight matrix
    weights= sum(W,2);
    W=sparse(diag(weights));
    W_total = sum(weights);
    W_max = max(max(W));
end

%% Prepare output
LCC=largestcomponent(A);
removed_nodes_ids = 0;
cost = 0;
gcc = length(LCC);


target = target_value*nr_nodes;
jj=0;
%% Loop
while length(LCC) > target
    jj=jj+1;
    
    [jj length(LCC)]

    Acc = A(LCC,LCC);
    Wcc = W(LCC,LCC);
    Gcc = graph(Acc);
    
    % calculate B
    B=Acc*Wcc + Wcc*Acc - Acc;

    % calculate the Laplacian of B
    DB = diag(sum(B,2));
    LB = DB - B;

    % get second-smallest Eigenvector of LB
    if spectralApproximation
        V = spectralApprox(LB,W_max,D_max,degree_based);
    else
        [V,D] = eigs (LB,2,'sr');
        V = V(:,2);
    end
        

    % minimum vertex problem
    %find all edges
    [node1,node2] = findedge(Gcc);
    n1=[];
    n2=[];
 
    %get the nodes adjacent to the separating set 
    for i=1:length(node1)
        if V(node1(i))*V(node2(i)) <= 0
            n1=[n1,node1(i)];
            n2=[n2,node2(i)];
        end
    end
    
    % get the IDs and the weights
    node_ID=unique([n1,n2]);
    w=diag(W(node_ID,node_ID));

    %relabel
    for i=1:length(n1)
        n1(i)=find(node_ID==n1(i));
        n2(i)=find(node_ID==n2(i));
    end
      
    %solve the minVertexproblem
    E=[n1;n2]';
    minCover=grMinVerCover(E,w);

    % Remove the nodes one by one
    Nodes_to_remove=node_ID(minCover);
    Weights = w(minCover);
    
    % Remove the high degree nodes first
    [~,idx]=sort(degrees(node_ID_data(Nodes_to_remove)),'descend');
    Nodes_to_remove = Nodes_to_remove(idx);
    Weights = Weights(idx);
    for j=1:length(Nodes_to_remove)
        node = Nodes_to_remove(1);
        
        % ID in the full network
        removed_nodes_ids = [removed_nodes_ids, node_ID_data(node)]; 
        cost = [cost, Weights(1)];
        
        % Remove the node
        A(node,:) = [];
        A(:,node) = [];
        
        % Calculate the largest connected component
        LCC=largestcomponent(A);
        gcc = [gcc, length(LCC)];
        
        % Shift the indices
        Nodes_to_remove(Nodes_to_remove>node) = Nodes_to_remove(Nodes_to_remove>node)-1;
        Nodes_to_remove(1)=[];
        Weights(1)=[];
    end
        
end

% get the relative costs
cost = cumsum(cost);
cost = cost./W_total;
unit_cost = [1:length(removed_nodes_ids)]/nr_nodes;
gcc = gcc./nr_nodes;

% plot the results
figure(1)
plot(cost,gcc)
xlabel("cost")
ylabel("GCC size")
xlim([0,1])


figure(2)
plot(unit_cost,gcc)
xlabel("cost")
ylabel("GCC size")
xlim([0,1])

%save the results
save('output.mat','cost','unit_cost','gcc','removed_nodes_ids');


