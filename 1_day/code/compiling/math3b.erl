-module(math3b).
-compile(export_all).

test() ->
    10 = sum([1,2,3,4]).

sum([H|T]) -> H + sum(T).
