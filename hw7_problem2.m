k=input('please enter a value for k (1 is recommended): ');
N_points=input ('Please enter number of internal points in space: ');
t_points=input ('Please enter numbers of internal points in time: ');
omega=input('Please enter a value for omega: ');  
T=10;
L=pi;
D=0.1;
del_x= L/(N_points+1);
del_t= T/(t_points+1);
gamma=(D*del_t)/(del_x)^2;
F=zeros(N_points,t_points+1); 
a=(1+gamma)*ones(1,N_points);
b=(-gamma/2)*ones(1,N_points);
c=(-gamma/2)*ones(1,N_points-1);
alpha_1=a(1);
alpha=[alpha_1,zeros(1,N_points-1)]; %alpha is a vector instead of matrix since alpha is constant in time


%Rows represent different positions;
%Columns represent different times;
t_j=[0,zeros(1,t_points),T];
x_j=zeros(1,N_points);
right_side_first=zeros(1,t_points+1)    %first refers to the first element in the matrix on the right hand side
right_side_last=zeros(1,t_points+1)     %last refers to the last element in the matrix on the left had side

for A=2:t_points+2    %Computing time point with given corresponding time indices
  t_j(A)=del_t*(A-1);  %t_points+2 is the last time point
end                     %1 corresponds to the first time point (t=0)

for B=1:N_points
    x_j(B)=del_x*(B);
   
end

for AI=2:N_points
     alpha(AI)=a(AI)-((b(AI)*c(AI-1))/alpha(AI-1));
end

g_0=sin(omega*t_j);    %Computing boundary conditions at diffrerent time points
g_L=sin(omega*t_j);
u_numerical=[g_0;zeros(N_points,t_points+2);g_L];
right_side_first=zeros(1,t_points+1)    %first refers to the first element in the matrix on the right hand side
right_side_last=zeros(1,t_points+1)     %last refers to the last element in the matrix on the left had side
right_side= [right_side_first;zeros(N_points-2,t_points+1);right_side_last]; 


for C=1:t_points+1    %C=1 is equivalent of t=0
    
    for E=1:N_points
      F(E,C)=(omega*cos(omega*del_t*(C-1))+D*(k^2)*sin(omega*del_t*(C-1)))*cos(k*del_x*(E));
    end
    
 right_side_first(C)=(gamma/2)*u_numerical(1,C)+(1-gamma)*u_numerical(2,C)+(gamma/2)*u_numerical(3,C)+ del_t*F(E,C)+(gamma/2)*g_0(C+1);
 right_side_last(C)=(gamma/2)*u_numerical(N_points-1,C)+(1-gamma)*u_numerical(N_points,C)+(gamma/2)*u_numerical(N_points+1,E)+del_t*F(N_points,C)+(gamma/2)*g_L(C+1);  
 
    for G=2
      right_side(G,C)=(gamma/2)*u_numerical(G-1,C)+(1-gamma)*u_numerical(G,C)+(gamma/2)*u_numerical(G+1,C)+del_t*F(G,C);
    end
    
 g=[right_side(1,:);zeros(N_points-1,t_points+1)];
 
    for H=2:N_points
      g(H,C)=right_side(H,C)-((b(H)*g(H-1,C))/alpha(H-1));
    end
    
  u_numerical(N_points+1,C+1)=g(N_points,C)/alpha(N_points)
  
    for HI=N_points:-1:2
       u_numerical(HI,C+1)=(g(HI-1,C)-(c(HI-1)*u_numerical(HI+1,C+1)))/alpha(HI-1);
    end
    
end

u_exact=(sin(omega*t_j(t_points+2)))*cos(k*x_j); 
plot(x_j,u_exact)
 


