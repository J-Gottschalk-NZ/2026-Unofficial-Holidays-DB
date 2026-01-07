<?php

if(isset($_REQUEST['login'])) {

    // get username from form
    $username = $_REQUEST['username'];

    // Get username and hashed password from database
    $login_stmt = $dbconnect->prepare("SELECT * FROM `users` WHERE `username` = ?");
    $login_stmt->bind_param("s", $username);
    $login_stmt->execute();

    $result = $login_stmt->get_result();
    $login_rs = $result->fetch_assoc();

    $login_stmt->close();

    // First check: Did we find a user AND password matches?
    if($login_rs && password_verify($_REQUEST['password'], $login_rs['password'])) {

        $_SESSION['admin'] = $login_rs['username'];
        header("Location: index.php?page=admin/add_entry");
        exit;

    } // end user if (success)

    else {

        unset($_SESSION);
        $login_error = urlencode("Incorrect username / password");
        header("Location: index.php?page=admin/login&error=$login_error");
        exit;

     } // end 'else' (login failed)


}   // admin login button pushed

?>