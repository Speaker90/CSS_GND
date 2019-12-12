function [fraction_LCC] = LCC_removed_centrality()


load 'data.mat'
node_ID_data=unique(data(:,1:2));
n_nodes = length(node_ID_data);

for i=1:size(data,1)
    data(i,1)=find(node_ID_data==data(i,1));
    data(i,2)=find(node_ID_data==data(i,2));
end



A=sparse(n_nodes,n_nodes);

for i=1:size(data,1)
    A(data(i,1),data(i,2))=1;
    A(data(i,2),data(i,1))=1;
end


G=graph(A);



degree = centrality(G,'degree');

betweenness = centrality(G,'betweenness');

closeness = centrality(G,'closeness');

eigenvector = centrality(G,'eigenvector');

[~,removed_node(:,1)] = sort(degree,'descend');
[~,removed_node(:,2)] = sort(betweenness,'descend');
[~,removed_node(:,3)] = sort(closeness,'descend');
[~,removed_node(:,4)] = sort(eigenvector,'descend');


core_number=2;
parpool('local',core_number);

parfor ii = 1:4
    
    disp(ii)
    
    A0=A;
    
    [B] = largestcomponent(A0);
    
    t=0;
    
    while length(B)/length(A0)>0.01
        
        t=t+1;
        disp(t);
        A0(removed_node(t,ii),:) = 0;
        A0(:,removed_node(t,ii)) = 0;
        
        [B] = largestcomponent(A0);
        
        fraction_LCC{ii}(t) = length(B)/length(A);

    end
end
save 'fraction_LCC.mat'

delete(gcp('nocreate'));
