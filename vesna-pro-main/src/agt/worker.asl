// { include( "vesna.asl" ) }

+!go_to_work
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  !go_to( MyDesk );
        .print( "I am at my desk" ).

+!work
    :   .my_name( Me ) & my_desk( MyDesk ) & at( Me, MyDesk )
    <-  .print( "I am working..." );
        .wait( 10000 ).

+!work
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  .print( "I am not at my work station!" );
        !go_to_work;
        !work.

+!take_coffee( Cup )
    :   .my_name( Me ) & not at( coffee_machine ) & not ntpp( Me, common )
    <-  .print( "Going to take a coffee" );
        !go_to( coffee_machine );
        !take_coffee( Cup ).

+!take_coffee( Cup )
    :   not grab( Cup )
    <-  !grab( Cup );
        !take_coffee( Cup ).

+!take_coffee( Cup )
    :   grab( Cup )
    <-  !use( coffee_machine );
        make_coffee( Cup );
        .wait( { +status( coffee ) } );
        take_cup;
        !free( coffee_machine );
        .wait( 4000 );
        .print( "I drank a coffee!" ).

+!speak_with( Privacy, Person, Performative, Msg )
    <-  get_location( Person, Location );
        !go_to( Location );
        .send( Privacy, Person, Performative, Msg ).

+!print( Stuff )
    :   my_desk( Desk ) & at( Desk )
    <-  .print( "I am printing ", Stuff, "...");
        .wait( 4000 );
        .print( "Printed!" ).

+!print( Stuff )
    <-  !go_to_work;
        !print( Stuff ).

+!take_break
    :   .my_name( Me ) & my_desk( MyDesk )
    <-  .print( "I am taking a break" );
        !go_to( common );
        .take_coffee( Cup );
        .wait( 4000 );
        .print( "Break is over, back to work!" );
        !go_to_work.

+at( Me, Location )
    :   .my_name( Me )
    <-  .print( "I arrived at ", Location, "." );
        .broadcast( tell, arrived_at( Me, Location ) ).