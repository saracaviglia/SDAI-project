{ include( "vesna.asl" ) }

+!start
    :   .my_name( Me ) & my_desk( AssignedDesk )
    <-  !walk( AssignedDesk );
        !write;
        !take_break;
        !start.

+!write
    :   .my_name( Me ) & my_desk( AssignedDesk ) & same_region( Me, AssignedDesk )
    <-  .print( "Writing at the desk assigned." );
        .wait( 30000 ).

// clients do not have to be aware of HR and the director
+!take_break
    :   .my_name( Me ) & my_desk( AssignedDesk )
    <-  .print( "Taking a break from writing." );
        !walk( outside );
        .wait( 10000 ).