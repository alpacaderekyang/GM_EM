function likelihood = logLike(data, model)

%mu = model.mu;
%Sigma = model.Sigma;
%w = model.w;
mu = model.means;
Sigma = model.covs;
w = model.mixweights';

n = size(data,2);
k = size(mu,2);
logRho = zeros(n,k);

for i = 1:k
    logRho(:,i) = loggausspdf(data,mu(:,i),Sigma(:,:,i));
end
%bsxfun : operate on every column (log(w))
logRho = bsxfun(@plus,logRho,log(w));
T = logsumexp(logRho,2);
likelihood = sum(T)/n;

end

function y = loggausspdf(X, mu, Sigma)

d = size(X,1);
X = bsxfun(@minus,X,mu);
[U,p]= chol(Sigma);
if p ~= 0
    error('ERROR: Sigma is not PD.');
end
Q = U'\X;
q = dot(Q,Q,1);  % quadratic term (M distance)
c = d*log(2*pi)+2*sum(log(diag(U)));   % normalization constant
y = -(c+q)/2;

end
