<?php

// check user is logged in
if(isset($_SESSION['admin'])) {

     // check button has been pressed
    if(isset($_REQUEST['submit']))
    {

        $ID = $_REQUEST['ID'];

        // retrieve data from form...
        $character_name = $_REQUEST['character'];
        $play = $_REQUEST['play'];
        $gender = $_REQUEST['gender'];
        $role = $_REQUEST['role'];
        $alignment = $_REQUEST['alignment'];
        $COD_action = $_REQUEST['COD_action'];
        $COD_method = $_REQUEST['COD_method'];
        $description = $_REQUEST['description'];

        $featured = "";

        // get traits...
        $trait1 = $_REQUEST['Trait1'];
        $trait2 = $_REQUEST['Trait2'];
        $trait3 = $_REQUEST['Trait3'];

        // retrieve trait ID's if they exist...
        
        // Initialise IDs
        $trait_ID_1 = $trait_ID_2 = $trait_ID_3 = "";        

        // replace blank Trait's with n/a
        if ($trait2 == "") {
        $trait2 = "n/a";
        }

        if ($trait3 == "") {
        $trait3 = "n/a";
        }

        // check to see if the trait DB, if it isn't add it.
        $traits = array($trait1, $trait2, $trait3);
        $trait_IDs = array();

        // Prepared statement to add traits (if necessary).  Note that the ? does not have speech marks!
        $stmt = $dbconnect -> prepare("INSERT INTO `key_traits` (`Trait`) VALUES (?); ");        

        foreach($traits as $trait) {
            $traitID = get_search_ID($dbconnect, $trait);

            // add the trait if it doesn't exist...
            if($traitID == "no results") {
                $stmt -> bind_param("s", $trait);
                $stmt -> execute();

                // retrieve ID of trait that has been added
                $traitID = $dbconnect -> insert_id;
            }   // end add new trait if

            $trait_IDs[] = $traitID;

        }   // key trait foreach

        // retrieve Trait IDs from array
        $trait_ID_1 = $trait_IDs[0];
        $trait_ID_2 = $trait_IDs[1];
        $trait_ID_3 = $trait_IDs[2];

    }   // end form button pushed 'if'


    // Edit DB Entry
    $stmt_edit = $dbconnect -> prepare("UPDATE `data` SET `Character_name` = ?, `PlayID` = ?, `RoleID` = ?, `GenderID` = ?, `Moral_AlignmentID` = ?, `Trait_1ID` = ?, `Trait_2ID` = ?, `Trait_3ID` = ?, `COD_ActionID` = ?, `COD_MethodID` = ?, `Description` = ? WHERE `data`.`ID` = ?; ");

    $stmt_edit -> bind_param("siiiiiiiiisi", $character_name, $play, $role, $gender, $alignment, $trait_ID_1, $trait_ID_2, $trait_ID_3, $COD_action, $COD_method, $description, $ID);

    $stmt_edit -> execute();
    $stmt_edit -> close();

    // retrieve the entry we have just added and generate a success screen
    $heading = "Edit Character Success";
    $help_text = "";
    $params = [$ID];
    $sql_condition = "WHERE ID = ?";


    include("content/results.php");

}   // end logged in 'if'

else {
    // error if users is not logged in
    $login_error = 'Please login to access this page';
    header("Location: index.php?page=admin/login&error=$login_error");

}   // end not logged in 'else'


?>