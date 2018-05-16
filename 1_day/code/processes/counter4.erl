-module(counter4).
-export([counter/1, rpc/2]).

rpc(Pid, What) ->
    Pid ! {self(), What},
    receive 
        {Pid, N} ->  N
    end.

counter(N) ->
    receive
        bump         -> counter(N+1);
        {From, read} -> From ! {self(), N}, counter(N)
    end.
