-module(reg_counter1).
-export([start/0, tick/0, read/0]).

start()   -> 
    register(counter, spawn(fun() -> counter(1) end)).

tick() -> counter ! bump.

read() ->
    counter ! {self(), read},
    receive 
        {counter, N} ->  N
    end.

counter(N) ->
    receive
        bump         -> counter(N+1);
        {From, read} -> From ! {counter, N}, counter(N)
    end.
