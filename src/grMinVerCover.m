function nMC=grMinVerCover(E,d)
% Function nMC=grMinVerCover(E,d) solve the minimal vertex cover problem.
% Input parameters: 
%   E(m,2) - the edges of graph;
%     1st and 2nd elements of each row is numbers of vertexes;
%     m - number of edges.
%   d(n) (optional) - the weights of vertexes,
%     n - number of vertexes.
%     If we have only 1st parameter E, then all d=1.
% Output parameter:
%   nMC - the list of the numbers of vertexes included 
%     in the minimal (weighted) vertex cover.
% Uses the reduction to integer LP-problem.
% Required the Optimization Toolbox v.3.0.1 or over.
% Author: Sergii Iglin
% e-mail: siglin@yandex.ru
% personal page: http://iglin.exponenta.ru
% ============= Input data validation ==================
if nargin<1,
  error('There are no input data!')
end
[m,n,E] = grValidation(E); % E data validation
if nargin<2, % we may only 1st parameter
  d=ones(n,1); % all weights =1
else
  d=d(:); % reshape to vector-column
  if length(d)<n % the poor length
    error('The length of the vector d is poor!')
  else
    n=length(d); % Number of Vertexes
  end
end
% ============= Parameters of integer LP problem ==========
A=zeros(n,m); % for incidence matrix
A(E(:,1:2)+repmat(([1:m]'-1)*n,1,2))=1; % we fill the incidence matrix
options=optimoptions('intlinprog'); % the default options
options.Display='off'; % we change the output
% ============= We solve the MILP problem ==========
xmin=intlinprog(d,1:n,-A',-ones(m,1),[],[],zeros(n,1),ones(n,1),options);
nMC=find(round(xmin)); % the answer - numbers of vertexes
return