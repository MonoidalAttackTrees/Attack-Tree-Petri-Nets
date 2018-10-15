-- Try to do these point-free using projects and composition (the period).

f :: (((a,b),c) -> (((a',b'),c'))) -> ((a,(b,c)) -> ((a',(b',c'))))
f = undefined

g :: ((a,(b,c)) -> ((a',(b',c')))) -> (((a,b),c) -> (((a',b'),c')))
g = undefined

