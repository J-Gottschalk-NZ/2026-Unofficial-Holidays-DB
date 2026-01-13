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

    <a href="#">
        <div class="button-link full-button bottom-spacing">
            <span class="button-text">Random</span>
            <span class="button-icon"><i class="fa-solid fa-shuffle"></i></span>
        </div>  <!-- / show all button div -->
    </a>

    <hr>

    <!-- Keyword Search -->
     <form>

        <div class="search-container bottom-spacing">
            <input class="search" type="text" name="keyword_search" required value="" placeholder="keyword">

            <button class="button-link" type="submit" name="keyword">
                <span><i class="fa-solid fa-magnifying-glass"></i></span>
            </button>

        </div>  <!-- / search container -->

    </form>

    <!-- Topic Search -->
    <form>

    <div class="search-container bottom-spacing">

        <select name="topic_search" class="search" required>
            <option value="" selected disabled>Choose...</option>
            <option value="first thing">First thing</option>
            <option value="second thing">Second thing</option>
        </select>

        <button class="button-link" type="submit" name="topic">
            <span><i class="fa-solid fa-magnifying-glass"></i></span>
        </button>

    </div>  <!-- / search container, topic -->

    </form>

    <!-- Date Search -->
     <form>

        <div class="search-container bottom-spacing">
            <input class="search" type="date" name="date_search" required value="" >

            <button class="button-link" type="submit" name="date">
                <span><i class="fa-solid fa-magnifying-glass"></i></span>
            </button>

        </div>  <!-- / date search container -->

    </form>

</nav>