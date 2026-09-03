{ include( "vesna.asl" ) }
{ include( "office_map.asl" ) }

+!start
    <-  !work;
        !check_employee( worker );
        !work;
        !check_employee( worker );
        !work;
        !check_employee( worker ).

+!work
    :   .my_name( Me )
    <-  .print( "Working hard." );
        .wait( 5000 ).

+!check_employee( Employee )
    :   .my_name( Me )
    <-  .print( "Checking employee: ", Employee );
        .send( Employee, askOne, my_desk( Desk ), my_desk( Desk ), 10000 );
        .send( Employee, askOne, ntpp( Employee, Region ), Reply, 10000 );
        if ( Reply == false ) {
            .print( Employee, "'s location is currently unknown." );
        } else {
            Reply = ntpp( Employee, Region );
            !check_employee_result( Employee, Region, Desk );
        }.

-!check_employee( Employee )
    <-  .print( "Could not check ", Employee, " (ask failed)." ).

+!check_employee_result( Employee, Region, Desk )
    :   Desk == Region & ntpp( Desk, Region )
    <-  .print( "Employee ", Employee, " is at their desk." ).

+!check_employee_result( Employee, Region, Desk )
    :   Desk \== Region & not ntpp( Desk, Region )
    <-  .print( "Employee ", Employee, " is not at their desk." ).

+!check_desk_result( Employee, Region, Desk )
    <-  .print( "Could not determine ", Employee, "'s status (no reply received)." ).