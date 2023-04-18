#	Makefile for rebar3 RELEASE 
all:
	rm -rf  *~ apps/dbetcd/src/*~ *~ apps/dbetcd/src/*.beam test/*.beam test/*~ erl_cra* config/*~;
	rm -rf _build ebin test_ebin;
	rm -rf common sd api;
	rm -rf Mnesia.* logs;
	rebar3 compile;
	git add -f *;
	git commit -m $(m);
	git push;
	echo Ok there you go!make

start_dbetcd_for_testing:
	rm -rf  *~ apps/dbetcd/src/*~ *~ apps/dbetcd/src/*.beam test/*.beam test/*~ erl_cra* config/*~;
	rm -rf _build ebin test_ebin;
	rm -rf common sd api;
	rm -rf Mnesia.* logs;
	rebar3 compile;
	rm -rf rebar.lock;
	mkdir api;
	cp apps/dbetcd/src/*.api api;
	mkdir test_ebin;
	erlc -I api -I /home/joq62/erlang/infra/api_repo -o test_ebin test/*.erl;
	erl -pa _build/default/lib/*/* -pa test_ebin\
	    -config config/sys.config\
	    -sname dbetcd -run dbetcd_for_testing start $(a) $(b)\
	    -setcookie $(c)
build:
	rm -rf  *~ apps/dbetcd/src/*~ *~ apps/dbetcd/src/*.beam test/*.beam test/*~ erl_cra* config/*~;
	rm -rf common sd api;
	rm -rf Mnesia.* logs;
	rm -rf  _build/test; # A bugfix in rebar3 or OTP
	rm -rf  _build;
	rebar3 compile;
	rm -rf _build*

clean:
	rm -rf  *~ apps/dbetcd/src/*~ *~ apps/dbetcd/src/*.beam test/*.beam test/*~ erl_cra* config/*~;
	rm -rf _build ebin test_ebin;
	rm -rf common sd api;
	rm -rf Mnesia.* logs;

eunit:
	rm -rf  *~ apps/dbetcd/src/*~ *~ apps/dbetcd/src/*.beam test/*.beam test/*~ erl_cra* config/*~;
	rm -rf _build ebin test_ebin;
	rm -rf common sd api;
	rm -rf Mnesia.* logs;
	rm -rf rebar.lock;
	rebar3 compile;
	mkdir test_ebin;
	erlc -I api -I /home/joq62/erlang/infra/api_repo -o test_ebin test/*.erl;
	erl -pa _build/default/lib/*/*\
	    -pa test_ebin\
	    -config config/sys.config\
	    -sname do_test -run $(m) start\
	    -setcookie $(c)
