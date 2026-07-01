{ include ( "vesna.asl" ) }

+!start
    <-  !walk( junior_10_desk );
        !work;
        !take_break;
        !work;
        !take_break;
        !work;
        !take_break;
        !work.

@work_focused[temper( [focused(0.5)] ), effects( [focused(-0.2)] )]
+!work
    :   .my_name( Me )
    <-  .print( "Working hard." );
        .wait( 5000 ).

@work_distracted[temper( [focused(0.2)] ), effects( [focused(0.2)] )]
+!work
    :   .my_name( Me )
    <-  .print( "Hardly working." );
        .wait( 2000 ).

+!take_break
    :   .my_name( Me )
    <-  .print( "Taking a break." );
        !walk( common );
        .wait( 5000 );
        !walk( junior_10_desk ).