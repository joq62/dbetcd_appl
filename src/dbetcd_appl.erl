%%%-------------------------------------------------------------------
%%% @author c50 <joq62@c50>
%%% @copyright (C) 2023, c50
%%% @doc
%%%
%%% @end
%%% Created :  3 May 2023 by c50 <joq62@c50>
%%%-------------------------------------------------------------------
-module(dbetcd_appl).

%% API
-export([ping/0]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------
ping()->
    dbetcd:ping().
%%%===================================================================
%%% Internal functions
%%%===================================================================
