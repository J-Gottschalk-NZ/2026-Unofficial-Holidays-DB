<h2>Welcome</h2>

<p>This site features many of Shakespeare's more well known characters.  Please use the Search feature / random button to explore the data.</p>

<p>Note that you can mouse over the icons on the results cards if you are not sure what a given icon means.</p>

<p>Here are some featured items...</p>

<p>&nbsp;</p>


<div class='all-cards'>


<?php

$sql_condition = "WHERE `Featured_Image` != ?";
$params = [''];

$featured_items = get_query($dbconnect, $sql_condition, $params);
$featured_query = $featured_items[0]; 


while($find_rs = mysqli_fetch_assoc($featured_query)) {

    // set up variables needed for character card
    include("retrieve_all.php");

    ?>

    <div class="container">

    <img src="<?= $avatar; ?>" alt="<?= htmlspecialchars($character); ?>" class="featured-image"> 

    <div class="overlay">

        <?php 
            include("character_details.php");
        ?>

    </div>  <!-- / overlay -->

    </div>  <!-- / container -->

    <?php


} // end featured loop


?>


</div>  <!-- / all cards -->
