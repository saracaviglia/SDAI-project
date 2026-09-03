{ include( "vesna.asl" ) }
{ include( "office_map.asl")}

+!start
    <-  !work;
        !check_email;
        !work;
        !take_break( outside );
        !send_client_home( client1 );
        !send_client_home( client2 ).

+!work
    :   .my_name( Me )
    <-  .print( "Working hard as a director." );
        .wait( 10000 ).

+!check_email
    <-  .print( "Checking email." );
        .wait( 5000 ).

+!take_break( Location )
    :   my_desk( Desk )
    <-  .print( "Taking a break from work." );
        !walk( Location );
        .wait( 10000 );
        !walk( Desk );
        .print( "Back at the desk." ).

+!send_client_home( Client )
    <-  .print( "Sending ", Client, " home." );
        .send( Client, achieve, go_home ).
