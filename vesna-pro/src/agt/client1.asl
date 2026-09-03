{ include( "vesna.asl" ) }
{ include( "office_map.asl")}

+!start
    :   .my_name( Me ) & my_desk( AssignedDesk )
    <-  .wait( 2000 );
        !walk( AssignedDesk );
        !write;
        !take_break;
        !write;
        !take_break;
        !write;
        !finish_up.

+!write
    <-  .print( "Writing at the assigned desk." );
        .wait( 30000 ).

+!take_break
    :   my_desk( AssignedDesk )
    <-  .print( "Taking a break from writing." );
        !walk( outside );
        .wait( 10000 );
        !walk( AssignedDesk );
        .print( "Back at the desk." ).

+!finish_up
    :   my_desk( AssignedDesk )
    <-  .print( "I'm finishing up my work and going home." );
        !walk( reception ).

+!go_home[ source( director ) ]
    <-  .print( "The director sent me home." );
        !walk( reception ).