%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(deployment_test).   
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------

%% External exports
-export([start/0]).



%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function:tes cases
%% Description: List of test cases 
%% Returns: non
%% --------------------------------------------------------------------
start()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),

    ok=setup(),
    ok=read_specs_test(),
 
    io:format("End testing  SUCCESS!! ~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),
%    init:stop(),
%    timer:sleep(3000),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
read_specs_test()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
    
    AllDepSpecs=lists:sort(db_deployment_spec:get_all_id()),
    true=lists:member("production",AllDepSpecs),
    
    {"production",
     [
      {"dbetcd_appl","c200"},{"dbetcd_appl","c201"},{"adder","c200"},{"divi","c200"},
      {"divi","c201"},{"test_appl","c200"},{"test_appl","c201"}
     ]
    }=db_deployment_spec:read("production"),
    
    {ok,
     [
      {"dbetcd_appl","c200"},{"dbetcd_appl","c201"},{"adder","c200"},{"divi","c200"},{"divi","c201"},
      {"test_appl","c200"},{"test_appl","c201"}
     ]
    }=db_deployment_spec:read(deployment,"production"),
    
    {error,[eexist,"glurk",db_deployment_spec,_]}=db_deployment_spec:read(deployment,"glurk"),
    {error,['Key eexists',glurk,"production",db_deployment_spec,_]}=db_deployment_spec:read(glurk,"production"),
 
    ok. 
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
setup()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),

   
    ok.
