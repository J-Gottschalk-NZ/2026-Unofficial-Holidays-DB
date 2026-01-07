<?php
    $search_term = "%%";
    $params = [$search_term];

    $sql_condition = "WHERE `Play` LIKE ? ORDER BY RAND() LIMIT 5";    
    
    $heading="Random";
    $help_text = "Press 'random' again to generate another set of characters.";

    include("results.php");

  ?>