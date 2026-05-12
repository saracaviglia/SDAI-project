+!start
    <- !check_availability();
       .print( "I am starting to wait." );
       !waiting.

// how to check availability? if someone is working is not available, and if he is on break is available?
+!check_availability( Person )
    <- .print( "Checking if ", Person, " is available." );
       .wait( 2000 );
       .print( Person, " is not available." ).

@waiting1[temper( [ prop1( 0.5 ), prop2( 0.5 ) ] ), effects( [ prop3( -0.1 ), prop4( -0.1 ) ] ) ]
+!waiting
    <- .wait( 5000 );
       .print( "I waited a proper amount of time." ).

@waiting2[temper( [ prop1( 0.5 ), prop2( 0.5 ) ] ), effects( [ prop3( -0.1 ), prop4( -0.1 ) ] ) ]
+!waiting
    <- .wait( 10000 );
       .print( "I waited more than a proper amount of time." ).

@waiting3[temper( [ prop1( 0.5 ), prop2( 0.5 ) ] ), effects( [ prop3( -0.1 ), prop4( -0.1 ) ] ) ]
+!waiting
    <- .wait( 100000 );
       .print( "I waited a very long time and I am getting impatient." ).