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

%Rows represent different positions;
%Columns represent different times;
t_j=[0,zeros(1,t_points),T];
x_j=zeros(1,N_points);
right_side_first=zero(1,t_points+1)    %first refers to the first element in the matrix on the right hand side
right_side_last=zero(1,t_points+1)     %last refers to the last element in the matrix on the left had side

for A=2:t_points+1    %Computing time point with given corresponding time indices
  t_j(A)=del_t*(A-1);  %t_points+2 is the last time point
end                     %1 corresponds to the first time point (t=0)

for B=1:N_points
    x_j(B)=del_x*(B);
end

g_0=sin(omega*t_j);    %Computing boundary conditions at diffrerent time points
g_L=sin(omega*t_j);
u_numerical=[g_0;zeros(N_points,t_points+2);g_L];
right_side_first=zero(1,t_points+1)    %first refers to the first element in the matrix on the right hand side
right_side_last=zero(1,t_points+1)     %last refers to the last element in the matrix on the left had side
right_side= [right_side_first;zero(N_points-2,t_points+1);right_side_last]; 
a=zeros(1,N_points);
b=zeros(1,N_points);
c=zeros(1,N_points-1);

for C=1:t_points+1
    for E=1
      right_side_first(C)=(gamma/2)*u_numerical(1,C)+(1-gamma)*u_numerical(2,C)+(gamma/2)*u_numerical(3,C)+ del_t*F(E,C)+(gamma/2)*u_numerical(1,C+1);
      right_side_last(C)=(gamma/2)*u_numerical(N_points-1,C)+(1-gamma)*u_numerical(N_points,C)+(gamma/2)*u_numerical(N_points+1,E)+del_t*F(N_points,C)+(gamma/2)*g_L(C+1);
      right_side(E+1,C)=(gamma/2)*u_numerical(E-1,C)+(1-gamma)*u_numerical(E,C)+(gamma/2)*u_numerical(E+1,C)+del_t*F(E,C)
    end
end
u_exact=(sin(omega*t_j(t_points+2)))*cos(k*x_j); 
plot(x_j,u_exact)
 


