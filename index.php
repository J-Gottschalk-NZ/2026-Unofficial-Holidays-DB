
<!DOCTYPE html>

<?php
    include("config.php");
    include("functions.php");
    
    // Connect to database...
    $dbconnect=mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME);

    if(mysqli_connect_errno()) {
        echo "Connection failed:".mysqli_connect_error();
        exit;
    }

    // use ob_start to buffer content so that we can use header(Location:foo) to redirect users to a given page
    ob_start();
    session_start();

?>

<html lang="en">

<?php
    include("content/head.php");
?>

<body>

    <div class="wrapper">

    <?php 
        include("content/banner_nav.php");
    ?>

    <main class="pad-20">
        <?php
        
        // either display contents of link or default to home page
        if(!isset($_REQUEST['page'])) 
            {
                include("content/home.php");
            }

        else {
            $page = preg_replace('/[^0-9a-zA-Z]-/','',$_REQUEST['page']);
            include("$page.php");
        }


        ?>
    </main>  

    <?php
        include("content/footer.php");
    ?>

    </div>  <!-- / wrapper -->

</body>


</html>