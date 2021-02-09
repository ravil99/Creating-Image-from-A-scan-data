%Начальные условия
EXT = '.mat';               
FP = 'for_picture';
p=1;
k = 88/6;
 AmplTime=zeros(7818,2);%Массив "Время - амплитуда"
 t=1.9488;
 result=zeros(88,88); 
%// helper function
isqrt = @(x) int32(sqrt(double(x)));


%// Считывание А-сканов - по одному
for u=1:25;
    NUM = int2str(u);
    fileName = strcat('0',NUM, EXT);
    load (fileName);
for r=1:1:7818;             %Матрица Амплитуда-Время
    t=t+Tinterval*10^5*1.76;
    AmplTime(r,1)=t;
    AmplTime(r,2)=A(r);
end;

%Перебор каждой точки
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

result(h,v)=T;%В массиве индексация всегда с 1!

end;
%Тут пытаюсь создать матрицу из амплитуд (в соответствии с точкой). 
%Для расчитанных врёмен для каждой точки ищется наиболее близкое значение
%из AmplTime

for x=1:1:88;
    for j=1:1:88;
    AA=abs(result(x,j)-AmplTime(1,1));%разница между текущим эл-том и эл-том AmplTime
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
save(NUM,FP);  %Создание Матрицы 88*88 для 1 А-скана
disp(NUM);
end;

%Всего 5 датчиков, каждый может быть и излучателем и приёмников, поэтому 25
%файлов. 

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