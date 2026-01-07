<?php

// default search order and help text
$order = " ORDER BY d.Character_Name ASC";
$heading="Filter Results...";
$help_text = "Results show characters which match ALL the filters you chose.  If there are no results, try fewer parameters.";


// retrieve user input ...  
$playID = $_REQUEST['play_name'];
$roleID = $_REQUEST['ms_role'];
$actionID = $_REQUEST['cod_action'];
$methodID = $_REQUEST['cod_method'];
$alignmentID = $_REQUEST['moral_alignment'];

// if the item is blank, replace it with a %% wildcard.
$all_input = [$playID, $roleID, $actionID, $methodID, $alignmentID];

foreach($all_input as $index => $value) {

    if ($value === "") {
        $all_input[$index] = "%%";
    }    // end value is blank if

}   // end of blank checker for each
  
  // put wildcards into our 'all input' list
  list($playID, $roleID, $actionID, $methodID, $alignmentID) = $all_input;


    $sql_condition = "
    WHERE d.PlayID  LIKE ?
    AND d.RoleID LIKE ?
    AND d.COD_ActionID LIKE ?
    AND d.COD_MethodID LIKE ?
    AND d.Moral_AlignmentID LIKE ?

    "; 

    $params = [$playID, $roleID, $actionID, $methodID, $alignmentID];

    // Add order
    $sql_condition .= $order;


    include("results.php");

?>