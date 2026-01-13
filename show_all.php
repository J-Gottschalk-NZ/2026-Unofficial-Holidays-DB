<?php
    include("head.php");

    $find_sql = "SELECT * FROM `holidays`";
    $find_query = mysqli_query($dbconnect, $find_sql);
    $count = mysqli_num_rows($find_query);
?>

<body>

<div class="wrapper">

    <?php 
        include("banner_nav.php");
    ?>

    <main class="pad-20">
    <h2>All Entries (<?= $count; ?> results)</h2>

    <?php

    // Only use this if your images are hosted elsewhere.  Normally we'd just use <img src="images/filename.jpg'>
    $image_URL = "https://projectspace.nz/masseyhighschool/L1_unofficial_holidays/images/";

    include('results_v1.php');
    
    ?>


</main>

<?php
    include("footer.php");
?>

</div>  <!-- / wrapper -->


</body>

</html>