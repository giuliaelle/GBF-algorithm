function A=GaussElimination(A)

% FUNCTION : The function GaussElimination computes the determinant of the
% matrix A by performing Gauss elimination method.

% INPUTS:
% A = square matrix 

% OUTPUTS:
% A = determinant of the matrix

%NOTES: Function based on the code written by
% Sergey Kasyanov (2022). GaussElimination (https://www.mathworks.com/matlabcentral/fileexchange/90661-gausselimination), MATLAB Central File Exchange.

p=size(A,1);

a=ones(size(A));

a(A==0)=0;

for i=1:p

    a(:,i)=a(:,i).*[1:p]';

end

P=zeros(1,p);

k=1;j=1;m=ones(1,p);

while true

    if j==1

        if a(m(j),j)~=0

            P(1,j)=a(m(j),j);

            j=j+1;

        else

            m(j)=m(j)+1;

            continue

        end

    end
    
    k=setdiff(a(:,j),P(1,:));

    k(k==0)='';

    if isempty(k)||m(j)>length(k)

        j=j-1;

        m(j)=m(j)+1;

        m(j+1)=1;

        if j==0

            j=1;

        end
        P(1,j)=0;

        continue

    else

        P(1,j)=k(m(j));

        j=j+1;

    end

    if isempty(find(P==0,1))

        break

    end
end
%%
%elimination in loop
A=A(P,:);

for i=1:p-1

    temp_var = repmat({[]}, 1, p-i);

    parfor j=i+1:p

        temp_var{j}=((A(j,:)-A(i,:)/A(i,i)*A(j,i)));

    end

    for j=i+1:p

        A(j,:) = temp_var{j};

    end
end

end