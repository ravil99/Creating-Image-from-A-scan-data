%��������� �������
EXT = '.mat';               
FP = 'for_picture';
p=1;
k = 88/6;
 AmplTime=zeros(7818,2);%������ "����� - ���������"
 t=1.9488;
 result=zeros(88,88); 
%// helper function
isqrt = @(x) int32(sqrt(double(x)));


%// ���������� �-������ - �� ������
for u=1:25;
    NUM = int2str(u);
    fileName = strcat('0',NUM, EXT);
    load (fileName);
for r=1:1:7818;             %������� ���������-�����
    t=t+Tinterval*10^5*1.76;
    AmplTime(r,1)=t;
    AmplTime(r,2)=A(r);
end;

%������� ������ �����
i = fix(1+0.199*u); 
if rem(u,5)==0
    p=5 
else
    p=rem(u,5)
end


for q=0:1:7743;
h = (1+fix(q/88));
v = (1+q-(h-1)*88);
if (v>k*i);
    l=(v-k*i);
else;
    l=(k*i-v);
end
if (v>k*p);
    d=(v-k*p);
else
    d=(k*p-v);
end
S=(sqrt(l^2+h^2)+sqrt(d^2+h^2));
T=(S*10^3/2550);

result(h,v)=T;%� ������� ���������� ������ � 1!

end;
%��� ������� ������� ������� �� �������� (� ������������ � ������). 
%��� ����������� ����� ��� ������ ����� ������ �������� ������� ��������
%�� AmplTime

for x=1:1:88;
    for j=1:1:88;
    AA=abs(result(x,j)-AmplTime(1,1));%������� ����� ������� ��-��� � ��-��� AmplTime
    for z=1:1:7818;
        dif=abs(result(x,j)-AmplTime(z,1));
        if dif<AA
            AA=dif;
            check(x,j)=AmplTime(z,1);
            for_picture(x,j)=AmplTime(z,2);
        end;
    end;
    
    end;
end;
save(NUM,FP);  %�������� ������� 88*88 ��� 1 �-�����
disp(NUM);
end;

%����� 5 ��������, ������ ����� ���� � ����������� � ���������, ������� 25
%������. 

EXT = '.mat';
FP = 'for_picture';
final = zeros(88,88);
for i = 1:25
NUM = int2str(i);
fileName = strcat(NUM, EXT);
disp(fileName);
disp(FP);
L = load(fileName, FP);
final = final + L.for_picture;
end
imagesc(final);
colorbar