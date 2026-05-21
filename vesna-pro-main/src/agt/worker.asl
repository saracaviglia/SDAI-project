{ include ( "vesna.asl" ) }

+!start
    <- !go_to_work.

+!go_to_work
    :   my_desk( MyDesk )
    <-  !walk( MyDesk );
        !work.

+!work
    :   my_name( Me )
    <-  .print( "Working hard." );
        .wait( 5000 );
        !take_break.

+!take_break
    :   my_name( Me )
    <-  .print( "Taking a break." );
        !walk( common );
        .wait( 5000 );
        !go_to_work.