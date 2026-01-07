<?php
// check user is logged in
if(isset($_SESSION['admin'])) {
    $ID = $_REQUEST['ID'];

    $heading = "";
    $help_text = "";

    $params = [$ID];
    $sql_condition = "WHERE `ID` LIKE ?";

    ?>

    <h2>Delete Item..</h2>
    <p>Are you sure you want to delete this item?</p>

    <div class="single-holder">


    <?php

    include("content/results.php");

    ?>

    <div class="error">
        <p>Are you sure you want to delete this entry?</p>

        <img class="msg-image pad-10" src="images/delete_confirm"  alt="Are you sure?">


        <div class="trait-tags delete-tags">
            <a class="trait pad-10" href="index.php?page=admin/delete_entry&ID=<?= $ID; ?>">Yes, Delete it!</a>     
            <a class="trait pad-10" href="javascript:history.back()">No, take me back</a>
    </div>  <!-- / yes / no delete buttons -->

    </div>  <!-- / end error / are you sure --> 

</div>  <!-- / single holder -->

    <?php


}   // end logged in if

else {
    // error if users is not logged in
    $login_error = 'Please login to access this page';
    header("Location: index.php?page=admin/login&error=$login_error");

}   // end not logged in else

?>