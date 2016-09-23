resource r0 {
 protocol C;
 incon-degr-cmd "halt -f";
 startup {
    degr-wfc-timeout 120;    # 2 minutes.
  }
  disk {
    on-io-error   detach;
  }
  net {
  }
  syncer {
    rate 10M;
    group 1;
    al-extents 257;
  }
 on nfsPrimaryNode01 {                   
   device     /dev/drbd1;                
   disk       /dev/sdc;                  
   address    10.10.200.4:7789;        
   meta-disk  internal;              
  }
 on servenfsPrimaryNode02r2 {            
   device    /dev/drbd1;                 
   disk      /dev/sdc;                  
   address   10.10.200.5:7789;         
   meta-disk internal;               
  }
 on nfsSecondaryNode01 {                 
   device     /dev/drbd1;                
   disk       /dev/sdc;               
   address    10.12.200.4:7789;        
   meta-disk  internal;              
  }
 on nfsSecondaryNode02 {                 
   device    /dev/drbd1;                 
   disk      /dev/sdc;                  
   address   10.12.200.5:7789;         
   meta-disk internal;               
  }
}