function [ X Y ] = pcaNew(f, i)
%UNTÝTLED3 Summary of this function goes here
%   Detailed explanation goes here

if i == 1
    [W, pc] = princomp(f);
    pc=pc'; 
    W=W';
    %plot(pc(1,:),pc(2,:),'b.'); 
else
    [W, pc] = princomp(f);
    pc=pc'; 
    W=W';
    %plot(pc(1,:),pc(2,:),'r.'); 
end
X = pc(1,:);
Y = pc(2,:);
end

