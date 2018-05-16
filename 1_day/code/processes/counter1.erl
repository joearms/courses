-module(counter1).
-export([start/0]).

start() -> 
    Pid = spawn(fun() -> counter(1) end),
    tick(Pid),
    tick(Pid).

tick(Pid) -> Pid ! bump.

counter(N) ->
    io:format("Counter is now ~w~n", [ N ]),
    receive
        bump ->
            io:format("Got bumped~n"),
            counter(N+1)
    end.
