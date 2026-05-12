{ include( "vesna.asl" ) }

+!start
    <- +my_region( reception );
        +my_desk( junior_10_desk );
        !work_p;
        !take_break_p.

// speak with? how to ask questions?

+!go_to_work
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  !go_to( MyDesk );
        .print( "I am at my desk" ).

@work_p1[temper( [ prop1( 0.0 ), prop2( 0.3 ) ] ), effects( [ prop3( 0.7 ), prop4( -0.05 ) ] ) ]
+!work_p
    :   .my_name( Me ) & my_desk( MyDesk ) & at( Me, MyDesk )
    <-  .print( "I am working a lot because I'm focused." );
        .wait( 10000 ).

@work_p2[temper( [ prop3( 0.2 ), prop2( 0.3 ) ] ), effects( [ prop3( -0.1 ), prop4( 0.2 ) ] ) ]
+!work_p
    :   .my_name( Me ) & my_desk( MyDesk ) & at( Me, MyDesk )
    <-  .print( "I am working a little because I'm distracted." );
        .wait( 5000 ).

// fallback (if he's not at his desk, he goes there and then works)
+!work_p
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  .print( "I am not at my work station!" );
        !go_to_work;
        !work_p.

@take_break_p1[temper( [ prop1( 0.0 ), prop2( 0.3 ) ] ), effects( [ prop3( 0.7 ), prop4( -0.05 ) ] ) ]
+!take_break_p
    :   true
    <-  .print( "I am taking a break because I worked a lot." );
        .wait( 10000 );
        !go_to( common );
        !take_coffee( Cup );
        .wait( 4000 );
        .print( "Break is over, back to work!" );
        !go_to_work.

@take_break_p2[temper( [ prop3( 0.2 ), prop2( 0.3 ) ] ), effects( [ prop3( -0.1 ), prop4( 0.2 ) ] ) ]
+!take_break_p
    :   true
    <-  .print( "I am taking a break because I worked a little." );
        .wait( 5000 );
        !go_to( outside );
        .wait( 5000 );
        .print( "Break is over, back to work!" );
        !go_to_work.

@talk_with_p1[temper( [ prop1( 0.0 ), prop2( 0.3 ) ] ), effects( [ prop3( 0.7 ), prop4( -0.05 ) ] ) ]
+!talk_with( Person )
    :   .my_name( Me ) & MyDesk( MyDesk ) & at( Me, MyDesk ) & get_location( Person, MyDesk )
    <-  .print( "I am talking with ", Person, " at my desk." );
        .wait( 5000 );
        .print( "We finished talking." ).