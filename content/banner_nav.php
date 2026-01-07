        <div class="logo-banner pad-20 flex">
            <a href="index.php">
                <img class="logo-image pad-10-round" src="images/logo.png" alt="Line Drawing of William Shakespeare">
            </a>

            <h1>Shakespeare's People</h1>


        </div>  <!-- / logo-banner -->

        <nav class="pad-20">
 
            <!-- Random Search -->
            <a href="index.php?page=content/random" class="nav-button pad-10-round text-large" title="Displays five random characters"><i class="fa-solid fa-shuffle"></i>
            </a>

            <?php include("filter-box.php"); ?>

            <!-- Filter Button -->
            <a href="#" class="nav-button pad-10-round text-large" title="Filter results based play, role etc" onclick="openNav()"><i class="fa-solid fa-filter"></i>
            </a>

            <!-- Quick Search hamburger -->
             <div class="nav-combo">
                
                <div class="pad-10-round text-large hamburger">
                    <i class="fa-solid fa-bars" onclick="changeIcon(this)"></i>

                </div>  <!-- / hamburger -->

                  <div class="nav-items flex">

                  <?php

                        // button name => Placeholder
                        $quick_searches = [
                            'quick_search' => 'Quick',
                            'play_search'      => 'Play',
                            'character_search' => 'Character',
                            'death_search'     => 'Death'
                        ];

                        foreach($quick_searches as $name => $placeholder) : 
                  ?>

                    <!-- Quick search forms... -->
                    <form class="key-search" method="post" action="index.php?page=content/quick_search" enctype="multipart/form-data">
                        
                        <input class="search quicksearch" type="text" name="quick_search_term" value="" required placeholder="<?= $placeholder; ?>">

                        <button class="submit" type="submit" name="<?= $name; ?>">
                            <i class="fa-solid fa-magnifying-glass fa-flip-horizontal"></i>
                        </button>

                    </form>

                    <?php 
                        endforeach;
                    ?>

                </div>  <!-- / nav items -->              

            </div>  <!-- / nav combo -->

        </nav>

        <div class="log-in-out pad-20">

        <?php

        if(isset($_SESSION['admin'])) {

            ?>

            <a href="index.php?page=admin/add_entry" class="nav-button pad-10-round text-large" title="Add Entry"><i class="fa-solid fa-plus"></i></a>
            
            <a href="index.php?page=admin/logout" class="nav-button pad-10-round text-large" title="Log Out"><i class="fa-solid fa-right-to-bracket fa-flip-horizontal"></i></a>

            <?php

        } // end of admin if

        else {

        ?>

            <a href="index.php?page=admin/login" class="nav-button pad-10-round text-large" title="Log In"><i class="fa-solid fa-arrow-right-to-bracket"></i>
            </a>

        <?php } ?>

        </div>  <!-- / log-in-out -->

        