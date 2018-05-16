-module(abs_server).
-export([start/1, cast/2, rpc/2]).

start(Data) ->
    spawn(fun() -> loop(Data) end).

cast(Pid, F) -> Pid ! {cast, F}.

rpc(Pid, F) -> 
    Pid ! {rpc,self(), F},
    receive
        {Pid, Reply} -> Reply
    end.

loop(State) ->
    receive
        {cast, F} -> loop(F(State));
        {rpc, From, F} ->
            {Reply, State1} = F(State),
            From ! {self(), Reply},
            loop(State1)
    end.
