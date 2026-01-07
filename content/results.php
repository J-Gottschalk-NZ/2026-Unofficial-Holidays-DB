<?php
list($find_query, $find_count) = get_query($dbconnect, $sql_condition, $params);

if($find_count > 0) {

// Heading for single results (does not include count)
if($find_count == 1) {
    $results_heading = $heading;
} // end single result if

else {
    $results_heading = $heading." (".$find_count." results)";
} // end multi-result 'else'

if($heading != "")
{

    ?>
        <h2><?= htmlspecialchars($results_heading); ?></h2>

    <?php

} // end output heading

if($help_text != "")
{
    ?>
        <i class="fa-solid fa-circle-info"></i> <?= $help_text; ?></i><br>
        <br>
    <?php
}   // end help text if
   
?>


<div class='all-cards'>

<?php

while($find_rs = mysqli_fetch_assoc($find_query)) {

    include("retrieve_all.php");
    include("character_details.php");


} // while

?>

</div>  <!-- / all-cards -->

<?php

    }   // we have results if

// if we don't have results...
else {
    ?>

       <h2>No Results</h2>

       <div class="error">

        <p>
            Sorry!  There are no results for your search.
        </p>

        <p>
            Please try another search term / user fewer characters in the 'quick search' box.
        </p>
        
        </div>

    <?php
}   // end of no results else

?>
