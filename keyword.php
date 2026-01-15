<?php
    include("head.php");

    // check that keyword button has been pressed
    if(isset($_POST['keyword']))

        {
            // Retrieve the search term...
            $keyword = $_REQUEST['keyword_search'];

            $find_sql = "SELECT * FROM `holidays` WHERE `description` LIKE '%$keyword%' ORDER BY `date` ASC ";
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
    <h2>Keyword Search (<?= $keyword; ?> - <?= $count; ?> results)</h2>

    <?php

    // Check that we have results...
    if($count > 0)
    {
        include('results.php');
    } // end of results if

    else{
        ?>

        <div class="error pad-20 radius-10">

        Sorry - there are no results for <?= $keyword ?>.  Please try a different search term.

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