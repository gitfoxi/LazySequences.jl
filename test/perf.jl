
using LazySequences

fibs = cat([0, 1], @lazyseq map(+, rest(fibs), fibs))

function ezfibs(n)
    if n == 0
        return 0
    elseif n == 1
        return 1
    else
        return ezfibs(n-1) + ezfibs(n-2)
    end
end

#compile
@show ezfibs(29)
#time
@time ezfibs(29)

#compile
@show fibs[30]
#time
@time fibs[30]

# Uh, yeah. This is going to need some work.
#ezfibs(29) => 514229
#elapsed time: 0.005175439 seconds (6676 bytes allocated)
#fibs[30] => 514229
#elapsed time: 8.805086668 seconds (1210120592 bytes allocated)
