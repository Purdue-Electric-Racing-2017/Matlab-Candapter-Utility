avg = [0:.01:1]
for i = 1:length(avg)
    if avg(i) >= .1
        if avg(i) >= .9
            o(i) = 1
        else
            o(i) = (avg(i) - .1) / 0.8
        end
    else
        o(i) = 0
    end
end
plot(avg, o, '-')
