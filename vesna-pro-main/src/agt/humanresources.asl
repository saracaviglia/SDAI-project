{ include( "vesna.asl" ) }
{ include( "worker.asl" ) }

+!start
    <- +my_region( reception );
        !work_p;
        !take_break_p.

// speak with? how to ask questions?

+!go_to_work
    :   .my_name( Me ) & my_desk( MyDesk ) & not at( Me, MyDesk )
    <-  vesna.walk( MyDesk );
        .print( "I am at my desk" ).

@work_focus[temper( [ hardworking( 0.5 ), social( 0.3 ) ] ), effects( [ focusness( 0.7 ), availability( -0.05 ) ] ) ]
+!work_p
    :   .my_name( Me ) & my_desk( MyDesk ) & at( Me, MyDesk )
    <-  .print( "I am working a lot because I'm focused." );
        .wait( 10000 ).

@work_distracted[temper( [ hardworking( 0.5 ), social( 0.3 ) ] ), effects( [ focusness( -0.1 ), availability( 0.2 ) ] ) ]
+!work_p
    :   .my_name( Me ) & my_desk( MyDesk ) & at( Me, MyDesk )
    <-  .print( "I am working a little because I'm distracted." );
        .wait( 5000 ).

// fallback (if he's not at his desk, he goes there and then works)
+!work_p
    :   .my_name( Me ) & my_desk( MyDesk ) & not at( Me, MyDesk )
    <-  // .print( "I am not at my work station!" );
        .print( "Walking to " , MyDesk, " to work." );
        vesna.walk( MyDesk );
        .wait( at( Me, MyDesk ), 100000, _ );
        !work_p.

@take_break_focused[temper( [ hardworking( 0.5 ), social( 0.3 ) ] ), effects( [ focusness( 0.7 ), availability( -0.05 ) ] ) ]
+!take_break_p
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  .print( "I am taking a break because I worked a lot." );
        .wait( 10000 );
        vesna.walk( common );
        !take_coffee( Cup );
        .wait( 4000 );
        .print( "Break is over, back to work!" );
        vesna.walk( MyDesk );
        !go_to_work.

@take_break_distracted[temper( [ hardworking( 0.5 ), social( 0.3 ) ] ), effects( [ focusness( 0.1 ), availability( 0.2 ) ] ) ]
+!take_break_p
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  .print( "I am taking a break because I worked a little." );
        .wait( 5000 );
        vesna.walk( outside );
        .wait( 5000 );
        .print( "Break is over, back to work!" );
        vesna.walk( MyDesk );
        !go_to_work.

@answer_available[temper( [ hardworking( 0.5 ), social( 0.3 ) ] ), effects( [ focusness( -0.5 ), availability( -0.05 ) ] ) ]
+!answer_client ( Client, Question )
    <-  .print( "Answering ", Client, "'s question: ", Question );
        .wait( 2000 );
        .print( "I answered ", Client, "'s question." ).

@answer_not_available[temper( [ hardworking( 0.5 ), social( 0.3 ) ] ), effects( [ focusness( -0.1 ), availability( 0.2 ) ] ) ]
+!answer_client ( Client, Question )
    <-  .print( "I cannot answer ", Client, "'s question: ", Question, " because I am not available." ).