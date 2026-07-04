{ include ( "vesna.asl" ) }

+!start
    <-  !walk( junior_10_desk );
        !work;
        !take_break;
        !work;
        !answer_question( client1, "What is the policy on remote work?" );
        !take_break;
        !work;
        !take_break;
        !work.

@work_focused[temper( [focused(0.5)] ), effects( [focused(-0.2)] )]
+!work
    :   .my_name( Me )
    <-  .print( "Working hard." );
        .wait( 10000 ).

@work_distracted[temper( [focused(0.2)] ), effects( [focused(0.2)] )]
+!work
    :   .my_name( Me )
    <-  .print( "Hardly working." );
        .wait( 6000 ).

+!take_break
    :   .my_name( Me )
    <-  .print( "Taking a break." );
        !walk( common );
        .wait( 5000 );
        !walk( junior_10_desk ).

@answer_question[temper( [focused(0.2)] )]
+!answer_question( Client, Question )
    :   .my_name( Me ) & near( self, Client )
    <-  .print( "Answering ", Client, "'s question: ", Question );
        .wait( 3000 );
        .send( Client, achieve, answer_client( Me, Question ) );
        .print( "Answered ", Client, "'s question." ).

@not_answer_question[temper( [focused(0.5)] )]
+!answer_question( Client, Question )
    :   .my_name( Me ) & near( self, Client )
    <-  .print( "I am too busy to answer ", Client, "'s question: ", Question );
        .wait( 3000 );
        .print( "I didn't answer ", Client, "'s question." ).