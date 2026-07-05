{ include( "vesna.asl" ) }

+!start
    <- .wait( 5000 );
        .print( "I am starting to wait." );
        !waiting;
        !walk( junior_10_desk_front );
        !ask_question( worker, "Where can I find the document I need?" );
        !waiting.

// to fix
@asking_understanding[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( 0.5 ), patience( 0.3 ) ] ) ]
+!ask_question( Worker, Question )
    : near( self, Worker )
    <- .print( "Asking ", Worker, " the question: ", Question );
        .send( Worker, achieve, answer_client( client1, Question ) );
        .wait( 3000 );
        .print( Worker, " answered the question." ).

// to fix
@asking_not_understanding[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( -0.3 ), patience( -0.1 ) ] ) ]
+!ask_question( Worker, Question )
    : near( self, Worker )
    <- .print( "Asking ", Worker, " the question: ", Question );
        .send( Worker, achieve, answer_client( client1, Question ) );
        .wait( 3000 );
        .print( "I asked ", Worker, " a question, but didn't receive an understandable answer." ).

// to fix
@asking_far[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( -0.1 ), patience( -0.2 ) ] ) ]
+!ask_question( Worker, Question )
    : not near( self, Worker )
    <- .print( "I want to ask ", Worker, " a question, but they are too far away." );
        .wait( 3000 );
        .print( "I couldn't ask ", Worker, " a question because they were too far away." ).

@waiting1[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( -0.1 ), patience( -0.1 ) ] ) ]
+!waiting
    <- .wait( 5000 );
        .print( "I waited a proper amount of time." ).

@waiting2[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( -0.1 ), patience( -0.2 ) ] ) ]
+!waiting
    <- .wait( 10000 );
        .print( "I waited more than a proper amount of time." ).

@waiting3[temper( [ curiosity( 0.6 ), social( 0.4 ) ] ), effects( [ understanding( -0.1 ), patience( -0.5 ) ] ) ]
+!waiting
    <- .wait( 100000 );
        .print( "I waited a very long time and I am getting impatient." ).

+!complain( Worker, Complaint )
    :   .my_name( Me ) & near( self, HumanResources )
    <-  .print( "Complaining to ", Worker, " about ", Complaint );
        .wait( 3000 );
        .print( "Complained to ", Worker, " about ", Complaint ).

+!complain( HumanResources, Complaint )
    :   .my_name( Me ) & near( self, Director )
    <-  .print( "Complaining to ", HumanResources, " about ", Complaint );
        .wait( 3000 );
        .print( "Complained to ", HumanResources, " about ", Complaint ).