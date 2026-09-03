{ include ( "vesna.asl" ) }
{ include( "office_map.asl")}

+!start
    <-  !work;
        !take_break( common );
        !work;
        !take_break( common );
        !work;
        !take_break( common ).

+!work
    :   .my_name( Me )
    <-  .print( "Working hard to help the company." );
        .wait( 50000 ).

+!take_break( Location )
    :   my_desk( Desk )
    <-  .print( "Taking a break from work." );
        !walk( Location );
        .wait( 10000 );
        !walk( Desk );
        .print( "Back at the desk." ).

+!break( Location, Time )[ source( humanresources ) ]
    :   my_desk( Desk )
    <-  .print( "Taking a MANDATORY break from work." );
        !walk( Location );
        .wait( 10000 );
        !walk( Desk );
        .print( "Back at the desk." ).
