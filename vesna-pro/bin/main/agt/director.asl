{ include( "vesna.asl" ) }

+!start
    <-  !work;
        !read_complaint(  client1, "The worker is not responsive.", humanresources );
        !work;
        !read_complaint(  client2, "The worker is not helpful.", humanresources );
        !work;
        !read_complaint_angry(  client1, "The worker is not professional.", humanresources ).

+!work
    :   .my_name( Me )
    <-  .print( "Working hard." );
        .wait( 10000 ).

// @read_complaint_std[temper( [angry(0.1)] ), effects( [angry(0.3)] )]
+!read_complaint( Client, Complaint, HumanResources )
    :   .my_name( Me )
    <-  .print( "Reading ", Client, "'s complaint ", Complaint, " about ",  HumanResources, "." );
        .wait( 3000 );
        .print( "Heard ", Client, "'s complaint." ).

// @read_complaint_angry[temper( [angry(0.4)] ), effects( [angry(0.7)] )]
+!read_complaint_angry( Client, Complaint, HumanResources )
    :   .my_name( Me )
    <-  .print( "Reading ", Client, "'s complaint ", Complaint, " about ",  HumanResources, ". I'm angry!" );
        .wait( 3000 );
        .print( "Heard ", Client, "'s complaint." ).
