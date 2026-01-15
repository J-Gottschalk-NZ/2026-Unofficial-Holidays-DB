<?php
    include("head.php");

    $find_sql = "SELECT * FROM(
    SELECT * FROM `holidays` ORDER BY RAND() LIMIT 5) 
    AS random_holidays ORDER BY `date` ASC;
    ";
    $find_query = mysqli_query($dbconnect, $find_sql);
    $count = mysqli_num_rows($find_query);
?>

<body>

<div class="wrapper">

    <?php 
        include("banner_nav.php");
    ?>

    <main class="pad-20">

    <div class="results-wrapper">
    <h2>Random (<?= $count; ?> results)</h2>

    <?php

    // Only use this if your images are hosted elsewhere.  Normally we'd just use <img src="images/filename.jpg'>
    $image_URL = "https://projectspace.nz/masseyhighschool/L1_unofficial_holidays/images/";

    include('results.php');
    
    ?>

    </div>  <!-- / results-wrapper -->

</main>

<?php
    include("footer.php");
?>

</div>  <!-- / wrapper -->


</body>

</html>