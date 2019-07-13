% Function generates Rotation Matrix
function R = rotation(fi)
    R=[cos(fi) -sin(fi)
       sin(fi)  cos(fi)];
end