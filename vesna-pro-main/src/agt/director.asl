{ include( "vesna.asl" ) }

+!start
    !work;
    !hear_complaint;
    !work;
    !hear_complaint;
    !work;
    |hear_complaint.

+!work
    :   .my_name( Me )
    <-  .print( "Working hard." );
        .wait( 10000 ).

+!hear_complaint( Client, Complaint, HumanResources )
    :   .my_name( Me ) & near( self, Client )
    <-  .print( "Hearing ", Client, "'s complaint ", Complaint, " about ", HumanResources );
        .wait( 3000 );
        .print( "Heard ", Client, "'s complaint." ).
