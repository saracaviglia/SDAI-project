{ include ( "vesna.asl" ) }

+!start
    <-  !work;
        !take_break;
        !work;
        !take_break;
        !work;
        !take_break;
        !work.

+!work
    :   .my_name( Me )
    <-  .print( "Working hard." );
        .wait( 3000 ).

+!take_break
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  .print( "Taking a break." );
        !walk( common );
        .wait( 5000 );
        !walk( MyDesk ).
