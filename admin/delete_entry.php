<?php
// check user is logged in
if(isset($_SESSION['admin'])) {
    $ID = $_REQUEST['ID'];

// Prepared statement so we know if the item is featured or not
$stmt_featured = $dbconnect -> prepare("SELECT * FROM `data` WHERE `ID` = ? LIMIT 1");
$stmt_featured -> bind_param("i", $ID);
$stmt_featured -> execute();

$result = $stmt_featured -> get_result();
$find_rs = $result -> fetch_assoc();
$stmt_featured -> close();

// Retrieve whether or not the item is featured
$featured = $find_rs['Featured_Image'];

// If the item is not featured, delete it
if ($featured == "") {

// Prepared statement so we know if the item is featured or not
$stmt_select = $dbconnect -> prepare("DELETE FROM data WHERE `data`.`ID` = ?");
$stmt_select -> bind_param("i", $ID);
$stmt_select -> execute();

$stmt_select -> close();

?>

<h2>Delete Success</h2>

<p>The entry has been deleted.</p>

<?php

} // delete item if

else {

    ?>
    <h2>Oops</h2>

    <div class="error">You tried to delete a featured item.  This is not possible.</div>
    <?php


}   // can't delete featured item else

}   // end logged in if

else {
    // error if users is not logged in
    $login_error = 'Please login to access this page';
    header("Location: index.php?page=admin/login&error=$login_error");

}   // end not logged in else

?>