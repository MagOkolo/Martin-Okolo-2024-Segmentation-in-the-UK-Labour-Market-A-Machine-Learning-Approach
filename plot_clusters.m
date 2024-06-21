
type=zeros(nobs,1);
type_2=zeros(nobs,1);
type_3=zeros(nobs,1);

for i=1:nobs
   if A_level_plus(i,1)==1
       if highSOC(i,1)==1
                   type(i,1)=1;  
       elseif highSOC(i,1)==0
                   type(i,1)=3;
       end
   end
end
for i=1:nobs
   if A_level_plus(i,1)==0
       if highSOC(i,1)==1
                   type(i,1)=4;  
       elseif highSOC(i,1)==0
                   type(i,1)=2;
       end
   end
end

%%%%%%%%%% Type 3

for i=1:nobs
   if type(i,1)==1
       if IDX_2(i,1)==2
                   type_3(i,1)=1;  
       elseif IDX_2(i,1)==1
                   type_3(i,1)=2;
       end
   end
end
for i=1:nobs
   if type(i,1)==2
       if IDX_2(i,1)==2
                   type_3(i,1)=3;  
       elseif IDX_2(i,1)==1
                   type_3(i,1)=4;
       end
   end
end

for i=1:nobs
   if type(i,1)==3
       if IDX_2(i,1)==2
                   type_3(i,1)=5;  
       elseif IDX_2(i,1)==1
                   type_3(i,1)=6;
       end
   end
end
for i=1:nobs
   if type(i,1)==4
       if IDX_2(i,1)==2
                   type_3(i,1)=7;  
       elseif IDX_2(i,1)==1
                   type_3(i,1)=8;
       end
   end
end

type11=NaN(nobs,1);
for i=1:nobs
   if grad(i,1)==1
       if highSOC(i,1)==1
                   type11(i,1)=1;  
       elseif medSOC(i,1)==1
                   type11(i,1)=2;
       else type11(i,1)=3;
       end
   end
end
for i=1:nobs
   if grad(i,1)==0
       if highSOC(i,1)==1
                   type11(i,1)=4;  
       elseif medSOC(i,1)==1
                   type11(i,1)=5;
       else type11(i,1)=6;
       end
   end
end


type12=NaN(nobs,1);
for i=1:nobs
   if type11(i,1)==1
       if IDX_2(i,1)==2
                   type12(i,1)=1;  
       elseif IDX_2(i,1)==1
                   type12(i,1)=2;
       end
   end
end
%
for i=1:nobs
   if type11(i,1)==2
       if IDX_2(i,1)==2
                   type12(i,1)=3;  
       elseif IDX_2(i,1)==1
                   type12(i,1)=4;
       end
   end
end
%
for i=1:nobs
   if type11(i,1)==3
       if IDX_2(i,1)==2
                   type12(i,1)=5;  
       elseif IDX_2(i,1)==1
                   type12(i,1)=6;
       end
   end
end
%
for i=1:nobs
   if type11(i,1)==4
       if IDX_2(i,1)==2
                   type12(i,1)=7;  
       elseif IDX_2(i,1)==1
                   type12(i,1)=8;
       end
   end
end
%
for i=1:nobs
   if type11(i,1)==5
       if IDX_2(i,1)==2
                   type12(i,1)=9;  
       elseif IDX_2(i,1)==1
                   type12(i,1)=10;
       end
   end
end
%
for i=1:nobs
   if type11(i,1)==6
       if IDX_2(i,1)==2
                   type12(i,1)=11;  
       elseif IDX_2(i,1)==1
                   type12(i,1)=12;
       end
   end
end

z12=zeros(6,2);
 z12(1,1)=sum(type12(:,1) == 1)/nobs;
 z12(1,2)=sum(type12(:,1) == 2)/nobs;
 z12(2,1)=sum(type12(:,1) == 3)/nobs;
 z12(2,2)=sum(type12(:,1) == 4)/nobs;
 z12(3,1)=sum(type12(:,1) == 5)/nobs;
 z12(3,2)=sum(type12(:,1) == 6)/nobs;
 z12(4,1)=sum(type12(:,1) == 7)/nobs;
 z12(4,2)=sum(type12(:,1) == 8)/nobs;
 z12(5,1)=sum(type12(:,1) == 9)/nobs;
 z12(5,2)=sum(type12(:,1) == 10)/nobs;
 z12(6,1)=sum(type12(:,1) == 11)/nobs;
 z12(6,2)=sum(type12(:,1) == 12)/nobs;

figure(301)
a3=bar(z12,'stacked')
legend({'High Productivity Segmemnt','Low Productivity Segmemnt'})
xlabel('Grad in High Skill                Grad in Medium Skill                   Grad in Low Skill                     Non-Grad in High Skill             Non-Grad in Medium Skill                     Non-Grad in Low Skill')
ylabel('Proportion of Employment')
title('Composition of Employment By Education, Occupation and Segment')
z12p = z12';
xbarCnt = vertcat(a3.XEndPoints); 
ybarTop = vertcat(a3.YEndPoints);
ybarCnt = ybarTop - z12p/2;
% Create text strings
txt = compose('%.3f',z12p);
% Add text 
th = text(xbarCnt(:), ybarCnt(:), txt(:), ...
    'HorizontalAlignment', 'center', ....
    'VerticalAlignment', 'middle', ...
    'Color', 'w',....
    'FontSize', 12);
