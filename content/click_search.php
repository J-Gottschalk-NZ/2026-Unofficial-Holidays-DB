<?php
    $search_type = to_clean($_REQUEST['search_type']);
    $search_term = to_clean($_REQUEST['search_term']);
   
    $heading=$search_term;
    $help_text = "";
    $order = " ORDER BY d.Character_name ASC";


    // Dictionary containing 'single' searches and columns
$search_columns = [
    "play"      => "Play",
    "category"  => "Play_Cat",
    "gender"    => "M_or_F",
    "ms_role"      => "Role",
    "moral_alignment" => "Alignment",
    "cod_action"    => "Action",
    "cod_method"    => "Method",

    "character" => "Character_name"
];

    // Parameters for all the searches except 'Trait' (one term)
    $params = [$search_term];

    // Look up column based on search type (if it exists)
    if(array_key_exists($search_type, $search_columns)) {
        $column = $search_columns[$search_type];
        $sql_condition = "WHERE `$column` LIKE ?";

    }

    else{
        // Trait Search...
        $sql_condition = "
        WHERE k1.Trait LIKE ?
        OR k2.Trait LIKE ?
        OR k3.Trait LIKE ?
        ";

        $params = [$search_term, $search_term, $search_term];
    }

    $sql_condition .= $order;

    include("results.php");

  ?>