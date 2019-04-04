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
F=zeros(N_points+2,t_points+2);

t_j=zeros(1,t_points+2);

for A=1:t_points+2    %Computing time point with given corresponding time indices
  t_j(A)=del_t*(A-1);  %t_points+2 is the last time point
end                     %1 corresponds to the first time point (t=0)

g_0=sin(omega*t_j);    %Computing boundary conditions at diffrerent time points
g_L=sin(omega*t_j);
%u_numerical=[g_0,zeros(,

 




