{ include( "vesna.asl" ) }
{ include( "worker.asl" ) }

+!start
    !work;
    !take_break;
    !work;
    !take_break;
    !work;
    !take_break;
    !work.

+!hear_complaint( Client, Complaint, Worker )
    :   .my_name( Me ) & near( self, Client )
    <-  .print( "Hearing ", Client, "'s complaint ", Complaint, " about ", Worker );
        .wait( 3000 );
        .print( "Heard ", Client, "'s complaint." ).