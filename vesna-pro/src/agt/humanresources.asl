{ include( "vesna.asl" ) }
{ include( "office_map.asl")}

+!start
    <-  !work;
        !check_email;
        !send_employee_on_break( worker1, outside, 10000 );
        !work;
        !take_break( common );
        !send_employee_on_break( worker2, common, 10000 ).

+!work
    <-  .print( "Working hard to improve the workplace." );
        .wait( 15000 ).

+!send_employee_on_break( Employee, Location, Time )
    <-  .print( "Sending ", Employee, " on break." );
        .send( Employee, achieve, break( Location, Time ) );
        .wait( Time+20000 );
        .send( Employee, achieve, start ).

+!check_email
    <-  .print( "Checking email." );
        .wait( 5000 ).

+!take_break( Location )
    :   my_desk( Desk )
    <-  .print( "Taking a break from work." );
        !walk( Location );
        .wait( 5000 );
        !walk( Desk );
        .print( "Back at the desk." ).
