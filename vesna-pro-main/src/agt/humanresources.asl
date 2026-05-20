{ include( "vesna.asl" ) }

+!start
    <- +my_region( reception );
        .wait( 3000 );
        !go_to_work.

+!go_to_work
    : .my_name( Me ) & my_desk( MyDesk ) & not at( Me, MyDesk )
    <-  .print( "Walking to my desk." );
        !walk( MyDesk );
        !work_p;
        // !take_break_p;
        // !go_to_work.
        !work_p;
        !work_p;
        !work_p;
        !work_p.

+!go_to_work
    : .my_name( Me ) & my_desk( MyDesk ) & at( Me, MyDesk )
    <-  !work_p;
        !take_break_p;
        !go_to_work.

@work_focus[temper( [ focused( 0.5 ) ] ), effects( [ focused( -0.2 )] ) ]
+!work_p
    :   .my_name( Me ) & my_desk( MyDesk ) & at( Me, MyDesk )
    <-  .print( "I am working a lot because I'm focused." );
        .wait( 10000 ).

@work_distracted[temper( [ focused( 0.3 ) ] ), effects( [ focused( -0.1 ) ] ) ]
+!work_p
    :   .my_name( Me ) & my_desk( MyDesk ) & at( Me, MyDesk )
    <-  .print( "I am working a little because I'm distracted." );
        .wait( 5000 ).

@take_break_focused[temper( [ focused( 0.5 ) ] ) ]
+!take_break_p
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  .print( "I am taking a break because I worked a lot." );
        !walk( common );
        .wait( 4000 );
        .print( "Break is over, back to work!" ).

@take_break_distracted[temper( [ focused( 0.3 ) ] ), effects( [ focused( 0.2 ) ] ) ]
+!take_break_p
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  .print( "I am taking a break because I worked a little." );
        !walk( outside );
        .wait( 5000 );
        .print( "Break is over, back to work!" ).

@answer_available[temper( [ hardworking( 0.5 ), availability( 0.3 ) ] ), effects( [ hardworking( -0.5 ), availability( -0.05 ) ] ) ]
+!answer_client ( Client, Question )
    <-  .print( "Answering ", Client, "'s question: ", Question );
        .wait( 2000 );
        .print( "I answered ", Client, "'s question." ).

@answer_not_available[temper( [ hardworking( 0.5 ), availability( 0.3 ) ] ), effects( [ hardworking( -0.1 ), availability( 0.2 ) ] ) ]
+!answer_client ( Client, Question )
    <-  .print( "I cannot answer ", Client, "'s question: ", Question, " because I am not available." ).