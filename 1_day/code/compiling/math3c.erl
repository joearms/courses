-module(math3c).
-compile(export_all).

test() ->
    10 = sum([1,2,3,4]),
    -5 = sum([-6,1]),
    0 = sum([]),
    horray.

sum([H|T]) -> H + sum(T);
sum([]) -> 0.
