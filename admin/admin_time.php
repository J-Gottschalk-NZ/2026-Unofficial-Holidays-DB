<?php 

    // Use this file to create a hashed version of the password you want.  Then copy it and paste it into the database

    // adjust targer time below (tradeoff between speed and security)
    $timeTarget = 0.01;

    $cost = 12;
do {
    $cost++;
    $start = microtime(true);
    
    // password below is admin.  Change it desired
    $hashed = password_hash("admin", PASSWORD_BCRYPT, ["cost" => $cost]);
    
    
    $end = microtime(true);
} while (($end - $start) < $timeTarget);

echo "Appropriate Cost Found: " . $cost."<br />";

echo "Password Hash: ".$hashed

    



?>