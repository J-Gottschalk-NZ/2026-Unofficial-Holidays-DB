<h2>Icons</h2>
<i class="fa-solid fa-circle-info"></i> Click on any of the icons below to see characters with that feature / characteristic.

<br><br>

<?php

// URL helpers
$click_type = "index.php?page=content/click_search&search_type=";
$click_term = "&search_term=";

// CONFIG ARRAY
// table = DB table name
// label_field = column for visible text
// icon_field = column for icon filename
$icon_sets = [

    ["heading" =>"Gender", "table" => "gender", "label_field" => "M_or_F", "icon_field" => "Gender_Icon"],

    ["heading" => "Category","table" => "category", "label_field" => "Play_Cat", "icon_field" => "Category_Icon"],


    ["heading" =>"Role", "table" => "ms_role", "label_field" => "Role", "icon_field" => "Role_Icon"],
    ["heading" =>"Moral Alignment", "table" => "moral_alignment", "label_field" => "Alignment", "icon_field" => "Moral_Icon"],

    ["heading" =>"Method of Death", "table" => "cod_method", "label_field" => "Method", "icon_field" => "Method_Icon"],
    ["heading" =>"Cause of Death", "table" => "cod_action", "label_field" => "Action", "icon_field" => "Action_Icon"]

];

?>

<div class='all-cards'>

<?php
foreach ($icon_sets as $set) {

    // Make heading from table name (Category, Gender, etc.)
    $display_name = ($set['heading']);

    // Query data
    $sql = "SELECT * FROM `{$set['table']}` ORDER BY `{$set['table']}`.`{$set['label_field']}` ASC";
    $query = mysqli_query($dbconnect, $sql);

    echo "<div class='icon-list text-large pad-10-round'>";
    echo "<div class='character-name pad-10-round'>{$display_name}</div>";

    while($rs = mysqli_fetch_assoc($query)) {

        $label = $rs[$set['label_field']];
        $icon_path = "images/icons/" . $rs[$set['icon_field']];

        echo "
        <div class='row pad-10'>
            <a 
                title='{$label}'
                class='legend'
                href='{$click_type}{$set['table']}{$click_term}{$label}'
                alt='{$label}'
            >
                <img class='icon' src='{$icon_path}'>
                {$label}
            </a>
        </div>";
    }

    echo "</div> <!-- / icon-list -->";
}
?>

</div> <!-- / all-cards -->
