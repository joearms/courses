-module(counter2).
-export([start/0, tick/1, read/1]).

start()   -> spawn(fun() -> counter(1) end).
tick(Pid) -> Pid ! bump.

read(Pid) ->
    Pid ! {self(), read},
    receive 
        N ->  N
    end.

counter(N) ->
    receive
        bump         -> counter(N+1);
        {From, read} -> From ! N, counter(N)
    end.
