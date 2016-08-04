<?php 
     //Dont forget to  -createhero <unit_name> [enemy]
     //or just the bot populate command in the console

     //hide file not found warnings
     //TODO: use a Pipe or Sockets for interprocess communication
     error_reporting(E_ALL ^ E_WARNING);

     $usePHPonly = true;
     if(  $usePHPonly  == true ){
       if ($_GET["hpvalue"] < 400){
         echo "RETREAT";
       } else {
         echo "ATTACK";
       }
     } else {
 

      $unitID = $_GET["unitid"];
      //C++ example interaction
      // "C:\Dota2AI\"
      unlink( "C++toPHP" . $unitID  . ".txt" );
      unlink( "C++toPHPLock" . $unitID  . ".txt" );      

      //$filename = "C:\Dota2AI\PHPtoC++.txt";
      $filename = "PHPtoC++" . $unitID  . ".txt";
      $file = fopen( $filename, "w" );   
      fwrite( $file, $_GET["hpvalue"] );
      fclose( $file );

      $filename = "PHPtoC++Lock" . $unitID  . ".txt";
      $file = fopen( $filename, "w" );   
      //fwrite( $file, $_GET["hpvalue"] );
      fclose( $file ); 


      /*
      $fp = fopen("C:\Dota2AI\C++toPHP.txt", "r+");
      if (flock($fp, LOCK_EX)) {  // acquire an exclusive lock
        ftruncate($fp, 0);      // truncate file
        fwrite($fp, $_GET["hpvalue"] );
        fflush($fp);            // flush output before releasing the lock
        flock($fp, LOCK_UN);    // release the lock
      } else {
        echo "Couldn't get the lock!";
      }
      */


      $filename = "C++toPHPLock" . $unitID  . ".txt";
      $file = fopen( $filename, "r" );
         
      while( $file == false ) {
         //echo ( "Error in opening file" );
         $file = fopen( $filename, "r" );
      }  
    
      fclose( $file );

      $filename = "C++toPHP" . $unitID  . ".txt";
      $file = fopen( $filename, "r" );

      $filesize = filesize( $filename );
      $filetext = fread( $file, $filesize );    
      fclose( $file );
      echo (  $filetext  );

     }
     


?>