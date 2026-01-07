<?php

    $search_term = to_clean($_REQUEST['quick_search_term']);
    
    $heading=$search_term;
    $help_text = "";
    $order = " ORDER BY d.Character_name ASC";


    // Associate the button that has been pressed with a search type
    $search_type_array = [
            "quick_search"  => "quick",
            "play_search" => "play",
            "character_search" => "character",
            "death_search" => "death"
    ];

    // Loop through the array and detect which button was pressed
    foreach($search_type_array as $submit_name => $type_value) {
        
        // if button pressed...
        if(isset($_POST[$submit_name])) {
            $search_type = $type_value;
            break;
        }   // end button pressed if

    }   // end which button 'for each'


    $search_term = '%'.$search_term.'%';

    // Parameters for all the searches except 'Trait' (one term)
    $params = [$search_term];

    // Dictionary containing 'single' searches and columns
    $search_columns = [
    "play"      => "Play",
    "character"  => "Character_Name",
    ];

    // Play / Character search (single column)
    if(array_key_exists($search_type, $search_columns)) {
        $column = $search_columns[$search_type];
        $sql_condition = "WHERE `$column` LIKE ?";

    }

    // Quick Search
    elseif($search_type == "quick") {

        $sql_condition = "
        WHERE `Play` LIKE ?
        OR `Method` LIKE ?
        OR `Action` LIKE ?
        OR `Character_Name` LIKE ?    
        OR k1.Trait LIKE ?
        OR k2.Trait LIKE ?
        OR k3.Trait LIKE ?    
        ";

    $params = array_fill(0, 7, $search_term);
    $help_text = "Results are based on play name, character name, cause of death and key trait/s.";

    }

    else{
        // Cause of death (method and action)
        $sql_condition = "
        WHERE `Method` LIKE ?
        OR `Action` LIKE ?
        "; 

        $params = [$search_term, $search_term];
    }

    $sql_condition .= $order;

    include("results.php");

  ?>