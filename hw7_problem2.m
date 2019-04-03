k=input('please enter a value for k (1 is recommended): ');
N_points=input ('Please enter number of internal points in space: ');
t_points=input ('Please enter numbers of internal points in time: ');
omega==input('Please enter a value for omega: ');
T=10;
L=pi;
D=0.1;
del_x= L/(N_points+1);
del_t= T/(t_points+1);
gamma=(D*del_t)/(del_x)^2;
F=zeros(N_points+2,t_points+2)
g_0=zeros(1,t+2);
g_L=zeros(1,t+2);

for A= 1:t_points+2                %Computing the boundary conditions at different time points.
  g_0(1)=sin(omega*del_t*(A-1));     %A=1 is index for t=0 and A=t_points+2 is index for the final time.
  g_L(1)=sin(omega*del_t*(A-1));
  t_j=del_t*(A-1);
end


