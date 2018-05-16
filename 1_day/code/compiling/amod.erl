%% File name is amod.erl
-module(amod).           
%% these can be called from outside the module
-export([foo/1, bar/2]).
%% import this function from lists
-import(lists, [reverse/1]).  

foo(L) ->
    L1 = lists:flatten(L),   %% call 'flatten' which must be exported from lists
    reverse(L1).             %% same as lists:reverse(L1) 

bar(A, B) -> A + B.
