using Core.Source;
 

context JobsDemo {
 
     Entity Details {
     	key TIME: Timestamp;
     	SOURCE: Source;
     };	
     
     Entity RuntimeSchedules {
     	key NAME: hana.VARCHAR(40);
     	ID: Integer;
     	JOBTYPE: hana.VARCHAR(40);
     };	
};
