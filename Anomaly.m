
ds = readtable('house_prices_data_training_data.csv');

x=table2array(ds(1:17999,4:21));
%normalization
[n m]=size(x);
for w=1:m
    if max(abs(x(:,w)))~=0;
        x(:,w)=(x(:,w)-mean((x(:,w))))./std(x(:,w));  
    end
end


mean_data = mean(X);
std_data = std(X);
pdf_data=zeros(1,18);
for i=1:18
    for j=1:17999
  pdf_data(i,j) = normpdf(X(j,i),mean_data(i),std_data(i));
    end
end 
a=prod(pdf_data);

for i=1:length(a)
if a(i)<0.0000000000001
 anomly(i)=0;
end
if a(i)>0.0000000000001
    anomly(i)=1;
end
end


number_of_ones = sum(anomly);
