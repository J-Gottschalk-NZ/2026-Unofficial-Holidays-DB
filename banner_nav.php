<header>
    <a href="index.php"><img class="logo" src="images/holidays_logo_v4.png" alt="Unofficial Holidays Logo"></a>
    <h1>Unofficial Holidays</h1>
</header>

<nav class="pad-20">
    <h2>Search</h2>

    <a href="show_all.php">
        <div class="button-link full-button bottom-spacing">
            <span class="button-text">Show All</span>
            <span class="button-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
        </div>  <!-- / show all button div -->
    </a>

    <a href="random.php">
        <div class="button-link full-button bottom-spacing">
            <span class="button-text">Random</span>
            <span class="button-icon"><i class="fa-solid fa-shuffle"></i></span>
        </div>  <!-- / show all button div -->
    </a>

    <hr>

    <!-- Keyword Search -->
    <form method="post" action="keyword.php" enctype="multipart/form-data">


        <div class="search-container bottom-spacing">
            <input class="search" type="text" name="keyword_search" required value="" placeholder="keyword">

            <button class="button-link" type="submit" name="keyword">
                <span><i class="fa-solid fa-magnifying-glass"></i></span>
            </button>

        </div>  <!-- / search container -->

    </form>

    <!-- Category Search -->
    <form class="search form" method="post" action="category.php" enctype="multipart/form-data">

    <div class="search-container bottom-spacing">

        <?php
            $dropdown_sql = "SELECT DISTINCT `category` FROM `holidays` ORDER BY `holidays`.`category` ASC ";
            $dropdown_query = mysqli_query($dbconnect, $dropdown_sql);

        ?>

        <select name="category_search" class="search" required>
            <option value="" selected disabled>Choose...</option>

            <?php 
                while($dropdown_rs=mysqli_fetch_assoc($dropdown_query)) {

                $category = htmlspecialchars($dropdown_rs['category']);


            ?>
                <option value="<?= $category; ?>"><?= $category; ?></option>
            <?php
                }   // end of option while
            ?>


        </select>

        <button class="button-link" type="submit" name="category">
            <span><i class="fa-solid fa-magnifying-glass"></i></span>
        </button>

    </div>  <!-- / search container, category -->

    </form>

    <!-- Date Search -->
    <form class="search form" method="post" action="date.php" enctype="multipart/form-data">

        <div class="search-container bottom-spacing">
            <input class="search" type="date" name="date_search" required value="" >

            <button class="button-link" type="submit" name="date">
                <span><i class="fa-solid fa-magnifying-glass"></i></span>
            </button>

        </div>  <!-- / date search container -->

    </form>

</nav>