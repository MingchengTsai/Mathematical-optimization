f=[zeros(52,1);1];
A=[1,1,1,0,-1,0,0,0,0,0,0,0,0;
  -1,0,0,1,0,0,0,0,-1,0,0,0,0;
   0,-1,0,0,1,1,0,0,0,0,0,0,0;
   0,0,-1,0,0,0,1,1,0,0,-1,0,0;
   0,0,0,-1,0,0,-1,0,1,1,0,0,-1;
   0,0,0,0,0,-1,0,-1,0,0,1,1,0;
   0,0,0,0,0,0,0,0,0,-1,0,-1,1];
Aeq=[blkdiag(A,A,A,A),zeros(28,1)];
b1=[4,-4,0,0,0,0,0]';
b2=[4,0,-4,0,0,0,0]';
b3=[0,-4,4,0,0,0,0]';
b4=[4,0,0,0,0,0,-4]';
beq=[b1;b2;b3;b4];
I=eye(13);
c=5*ones(13,1);
a=[I,I,I,I,-c];
b=zeros(13,1);
lb=zeros(53,1);
x=linprog(f,a,b,Aeq,beq,lb,[]);
F=[x(1:13,:)';
   x(14:26,:)';
   x(27:39,:)';
   x(40:52,:)']
F
x(53,1)
%所得结果如下
%  F =
% 
%      4     0     0     0     0     0     0     0     0     0     0     0     0
%      0     4     0     0     0     0     0     0     0     0     0     0     0
%      0     0     0     0     0     4     0     0     4     0     0     4     4
%      0     0     4     0     0     0     4     0     0     4     0     0     0
% ans =
% 
%     0.8000
