<?php
    include("head.php");

    // check that keyword button has been pressed
    if(isset($_POST['date']))

        {
            // Retrieve the search term...
            $date_term = $_REQUEST['date_search'];

            $date_term_object = new DateTime($date_term);

            // Format the date as 'day Month' (e.g. '2nd January')
            $output_date = $date_term_object -> format('jS F');
            
            // remove the year from the date
            $month_day = date('m-d', strtotime($date_term));

            $find_sql = "SELECT * FROM `holidays` WHERE DATE_FORMAT(`date`, '%m-%d') = '$month_day' ORDER BY `holidays`.`holiday` ASC ";
            $find_query = mysqli_query($dbconnect, $find_sql);
            $count = mysqli_num_rows($find_query);

        } // end of keyword if

    else{
        header('Location: index.php');

    } // end of keyword else


?>

<body>

<div class="wrapper">

    <?php 
        include("banner_nav.php");
    ?>

    <main class="pad-20">

    <div class="results-wrapper">
    <h2>Date Search (<?= $output_date ?> - <?= $count; ?> results)</h2>

    <?php

    // Check that we have results...
    if($count > 0)
    {
        include('results.php');
    } // end of results if

    else{
        ?>

        <div class="error pad-20 radius-10">

        Sorry - there are no results for the <?= $output_date; ?>.  Please try a different search term.

        </div>  <!-- / no results error -->

        <?php
    }

    ?>

    </div>  <!-- / results-wrapper -->

</main>

<?php
    include("footer.php");
?>

</div>  <!-- / wrapper -->


</body>

</html>