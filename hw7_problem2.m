k=input('please enter a value for k (1 is recommended): ');
N_points=input ('Please enter number of internal points in space: ');
t_points=input ('Please enter numbers of internal points in time: ');
omega=input('Please enter a value for omega: ');  %omega greater than 0.4 can make negative
T=10;
L=pi;
D=0.1;
del_x= L/(N_points+1);
del_t= T/(t_points+1);
gamma=(D*del_t)/(del_x)^2;
F=zeros(N_points+2,t_points+2);

%Rows represent diffent positions;
%Columns represent different times;
t_j=[0,zeros(1,t_points),T];
x_j=zeros(1,N_points);

for A=2:t_points+1    %Computing time point with given corresponding time indices
  t_j(A)=del_t*(A-1);  %t_points+2 is the last time point
end                     %1 corresponds to the first time point (t=0)

for B=1:N_points
    x_j(B)=del_x*(B)
end

g_0=sin(omega*t_j);    %Computing boundary conditions at diffrerent time points
g_L=sin(omega*t_j);
u_numerical=[g_0;zeros(N_points,t_points+2);g_L];

 




