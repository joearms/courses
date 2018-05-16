-module(counter5).

-export([start/0, tick/1, read/1]).

start() -> abs_server:start(0).
    
tick(Pid) -> abs_server:cast(Pid, fun(X) -> X+1 end).
read(Pid) -> abs_server:rpc(Pid,  fun(X) -> {X, X} end).

					  
