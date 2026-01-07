<?php

    // Search term / Text setup (retrieve text and save as variables for easy reference)
    // This is mostly to make searching / clickable links easy
    $ID = $find_rs['ID'];
    $avatar = "images/avatars/".$find_rs['Featured_Image'];

    $character = $find_rs['Character_name']; 
    $play = $find_rs['Play'];

    $category = $find_rs['Play_Cat'];
    $gender = $find_rs['M_or_F'];
    $role = $find_rs['Role'];
    $alignment = $find_rs['Alignment'];   
    $action = $find_rs['Action'];    
    $method = $find_rs['Method'];    
    
    $trait1 = $find_rs['Trait1'];
    $trait2 = $find_rs['Trait2'];
    $trait3 = $find_rs['Trait3'];

    $featured = $find_rs['Featured_Image'];

    // Image and icon set up...
    $category_icon = "images/icons/".$find_rs['Category_Icon'];
    $gender_icon = "images/icons/".$find_rs['Gender_Icon'];
    $role_icon = "images/icons/".$find_rs['Role_Icon'];
    $alignment_icon = "images/icons/".$find_rs['Moral_Icon'];
    $action_icon = "images/icons/".$find_rs['Action_Icon'];
    $method_icon = "images/icons/".$find_rs['Method_Icon']; 
    
    // URL Helpers
    $click_type = "index.php?page=content/click_search&search_type=";
    $click_term="&search_term="

?>