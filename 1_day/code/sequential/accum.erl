-module(accum).
-export([evens_and_odds/1]).
-import(lists, [reverse/1]).

evens_and_odds(L) -> evens_and_odds(L,[], []).

evens_and_odds([H|T], E, O) when H rem 2 =:= 0 -> evens_and_odds(T, [H|E], O);
evens_and_odds([H|T], E, O) ->  evens_and_odds(T, E, [H|O]);
evens_and_odds([], E, O)    ->  {E, O}.