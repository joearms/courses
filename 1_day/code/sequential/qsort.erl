-module(qsort).
-export([sort/1]).

sort([Pivot|T]) ->
    sort([ X || X <- T, X < Pivot ]) 
	++ [Pivot] ++
    sort([ X || X <- T, X >= Pivot ]);
sort([]) ->
    [].
