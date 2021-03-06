k=input('please enter integer value for k (1 is recommended): ');
multiple_t=input('please enter a multiple for t: ');
multiple_x=input('please enter a multiple for n: ');
L=pi;
T=10;
t=10*multiple_t; %Number of points in time, not counting the 2 boundary points
N=10*multiple_x; %Number of points in space, not counting the point at t=0
del_x=L/(N+1); %N+1 is number of segments in space
del_t=T/(t+1) ; %t+1 is number of segments in time
D=0.1; 
%row is for time
%column is for space
gamma=(D*del_t)/(del_x)^2;
a=(gamma+1)*ones(t+1,N);         
b=[zeros(t+1,1),(-gamma/2)*ones(t+1,N-1)];
c=(-gamma/2)*ones(t+1,N-1);
alpha_1=a(:,1);
alpha=[alpha_1,zeros(t+1,N-1)];
u=[zeros(t+2,1),zeros(t+2,N),zeros(t+2,1)];
right_side=zeros(t+1,N);
x_j=zeros(1,N);
t_j=zeros(1,t+1);
%u_exact=
  

for A=2:N+1  
    u(1,A)=sin(k*(del_x*(A-1))); % this computes the condition at t=0 along space direction
    x_j(A-1)=(A-1)*del_x;
    
end


for E=1:t+1     %E is index for time (E=1 is t=0)
    for j=2:N+1   %j is index for space 
        right_side(E,j-1)=(gamma/2)*u(E,j-1)+(1-gamma)*u(E,j)+(gamma/2)*u(E,j+1);
        t_j(E)=E*del_t; %t_j is in different loop than x_j since the number of  points in time nad space can be different)
    end
    
g=[right_side(:,1),zeros(t+1,N-1)];
   

    for C=2:N
        alpha(E,C)=a(E,C)-((b(E,C)*c(E,C-1))/alpha(E,C-1)); 
         g(E,C)=right_side(E,C)-((b(E,C)*g(E,C-1))/alpha(E,C-1));   
    end
    
u(E+1,N+1)=g(E,N)/alpha(E,N); %N+1 is the point right behind the boundary point

    for F=N:-1:2
        u(E+1,F)=(g(E ,F-1)-(c(E,F-1)*u(E+1,F+1)))/alpha(E,F-1);
    end
    
end
time=input('Please enter the point of time you want to look at:' )
time_point=round(time/del_t);
time_slice=t_j(time_point);
 u_exact=(exp(-D*(k^2)*time_slice))*sin(k*x_j);
plot(x_j,u_exact)
hold 
plot(x_j,u(time_point,[2:N+1])) %plot at T=10 (which is the final line in the u martix)
error_indiv=zeros(1,N);
for F=1:N
    error_indiv(F)=abs((u(t+2,F+1)-u_exact(F))/u_exact(F));
end
error= (1/N)*sum(error_indiv)
    
 
         
    
 