+!start
    <- !check_availability();
       .print( "I am starting to wait." );
       !waiting.

// how to check availability? if someone is working is not available, and if he is on break is available?
+!check_availability( Person )
    <- .print( "Checking if ", Person, " is available." );
       .wait( 2000 );
       .print( Person, " is not available." ).

@asking_understanding[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( 0.5 ), patience( 0.3 ) ] ) ]
+!ask_question( Worker, Question )
    <- .print( "Asking ", Worker, " the question: ", Question );
       .wait( 2000 );
       .print( Worker, " answered the question." ).

@asking_not_understanding[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( -0.3 ), patience( -0.1 ) ] ) ]
+!ask_question( Worker, Question )
    <- .print( "Asking ", Worker, " the question: ", Question );
       .wait( 2000 );
       .print( "I asked ", Worker, " a question, but didn't receive an understandable answer." ).

@waiting1[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( -0.1 ), patience( -0.1 ) ] ) ]
+!waiting
    <- .wait( 5000 );
       .print( "I waited a proper amount of time." ).

@waiting2[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( -0.1 ), patience( -0.2 ) ] ) ]
+!waiting
    <- .wait( 10000 );
       .print( "I waited more than a proper amount of time." ).

@waiting3[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( -0.1 ), patience( -0.5 ) ] ) ]
+!waiting
    <- .wait( 100000 );
       .print( "I waited a very long time and I am getting impatient." ).