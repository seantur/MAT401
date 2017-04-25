iterations = 100;

v = [1 .5 1]; % vector
p = [1 0 0 0]; % initial quaternion, does not rotate
q = [1 0 1 0]; % Random Quaternion

radians = quat2eul(q) %Makes visualization easier, return euler angles in ZYX

pn = quatnormalize(p); % normalization to unit quaternions
qn = quatnormalize(q);
qi = quatinterp(pn,qn,1/iterations,'slerp'); % performs interpolation between extremes

plot3([0 v(1)], [0 v(2)], [0 v(3)]); % plot initial vector
grid on;
hold on;
r = quatrotate(p,v); % doesn't rotate, but initializes r

for i = 1:iterations % loops over iterations and applies rotation about quaternion
    r = quatrotate(qi, r); 
    plot3([0 r(1)], [0 r(2)], [0 r(3)]);
end
    
rotate3d; % allows for click and drag in 3d plot