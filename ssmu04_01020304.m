clear
clc
close all


%parameters to generate random square matrices
rows=5;
columns=5;


%generating random matrix b
[a,b] = sort(rand(rows,49),2);
b = b(:,1:columns);
b


%scaling matrix b
%scale factor z
%scaling matrix b with factor z which results in matrix b_scale
z=0.5;
for i=1:1:rows
    for j=1:1:columns
        b_scale(i,j)=z*b(i,j);
    end
end
disp('b_scale = z * b')
b_scale


%adding matrix b_scale and d which results in matrix e_sum
%firstly, generating random matrix d 
[c,d] = sort(rand(rows,100),2);
d = d(:,1:columns);
d
for i=1:1:rows
    for j=1:1:columns
        e(i,j)=b_scale(i,j)+d(i,j);
    end
end
disp('e_sum = b_scale + d')
e_sum = e


%multiplication of matrix e and g which results in matrix h_multi
%firstly, generating random matrix g 
[f,g] = sort(rand(columns,100),2);
g = g(:,1:rows);
g
repetitions=rows;
sum_multi= zeros(rows,columns);
for i=1:1:rows
    for j=1:1:columns
        for k=1:1:repetitions
                sum_multi(i,j)=sum_multi(i,j)+e(i,k)*g(k,j);
        end
    end
end
disp('h_multi = e_sum * g')
h_multi=sum_multi


%maclaurin series for sinus(x)
%values for x are hold in an array. those values are then used to calculate 
%the maclaurin series for sinus(array_value)
[l]=rand(columns,columns);
z=pi;
for i=1:1:columns
    for j=1:1:columns
        l(i,j)=z*l(i,j);
    end
end
disp('maclaurin series for sinus(x); x=l')
l
%order n:
n=2;
sum=zeros(columns,columns);
for i=1:1:columns
    for j=1:1:columns
        for k=0:1:(n-1)
            k;
            sum(i,j)=sum(i,j)+((-1)^k)*(l(i,j)^(2*k+1))/(factorial(2*k+1));
        end
    end
end
% Taylor Series Calculator: http://www.wolframalpha.com/widgets/view.jsp?id=f9476968629e1163bd4a3ba839d60925
l_maclaurin = sum

