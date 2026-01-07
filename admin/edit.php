<?php

// check user is logged in
if(isset($_SESSION['admin'])) {

    // get ID for quote to be edited
    $ID = $_REQUEST['ID'];

    // get Key Traits from database
    $all_traits_sql = "SELECT * FROM key_traits ORDER BY Trait ASC ";
    $all_traits = autocomplete_list($dbconnect, $all_traits_sql, 'Trait');

    // retrieve entry details
    $get_entry_sql = "WHERE ID LIKE ?";
    $params = [$ID];

    // use our function but just get the query, not the number of results.
    $get_entry_query = get_query($dbconnect, $get_entry_sql, $params)[0];
    $get_entry_rs = mysqli_fetch_assoc($get_entry_query);

    // retrieve existing data to populate form
    $character_name = $get_entry_rs['Character_name'];
    $description = $get_entry_rs['Description'];

    $PlayID = $get_entry_rs['PlayID'];
    $Play = $get_entry_rs['Play'];

    $Gender = $get_entry_rs['M_or_F'];
    $GenderID = $get_entry_rs['GenderID'];
    
    $Role = $get_entry_rs['Role'];
    $RoleID = $get_entry_rs['RoleID'];

    $Alignment = $get_entry_rs['Alignment'];
    $Moral_AlignmentID = $get_entry_rs['Moral_AlignmentID'];
    
    $COD_Action = $get_entry_rs['Action'];
    $COD_ActionID = $get_entry_rs['COD_ActionID'];
    
    $COD_Method = $get_entry_rs['Method'];
    $COD_MethodID = $get_entry_rs['COD_MethodID'];

    $trait_1 = $get_entry_rs['Trait1'];
    $trait_2 = $get_entry_rs['Trait2'];
    $trait_3 = $get_entry_rs['Trait3'];

    // set trait 2 / 3 to blank if they say (n/a), not worth looping for only two entities.  Would make this a function if we needed to do this more 
    if($trait_2 == "n/a") {$trait_2 = "";}
    if($trait_3 == "n/a") {$trait_3 = "";}


// set up dropdown array...

        // retrieval name | table | ID | Value | "Placeholder" | value ID
        $dropdown_details = [
        ['play', 'play_name', 'PlayID', 'Play', $Play, $PlayID],
       ['gender', 'gender', 'GenderID', 'M_or_F', $Gender, $GenderID],
        ['role', 'ms_role', 'RoleID', 'Role', $Role, $RoleID],
        ['alignment', 'moral_alignment', 'Moral_AlignmentID', 'Alignment', $Alignment, $Moral_AlignmentID],
        ['COD_action', 'cod_action', 'COD_ActionID', 'Action', $COD_Action, $COD_ActionID],
        ['COD_method', 'cod_method', 'COD_MethodID', 'Method', $COD_Method, $COD_MethodID],

        ];

?>

<div class="big-form">

    <h2>Edit Entry</h2>

    <form action="index.php?page=admin/edit_entry&ID=<?= $ID; ?>" method="post">

        <p><input name="character" value="<?= htmlspecialchars($character_name); ?>" required></p>

        <?php 
        
        // Loop to generate drop downs...
        foreach($dropdown_details as $drop) {
            list($name, $table, $id_field, $label_field, $placeholder, $value) = $drop;
        ?>

        <select class="marg-bottom" name="<?= htmlspecialchars($name); ?>" required>
            <option value="<?= htmlspecialchars($value); ?>" selected><?= htmlspecialchars($placeholder); ?></option>
           
            <?php             
                get_options($dbconnect, $table, $id_field, $label_field);
            ?>

        </select>

        <?php

        } // end dropdown foreach

        ?>

    <p>
        <textarea name="description" required><?= htmlspecialchars($description); ?></textarea>

    </p>

    <div class="autocomplete marg-bottom">
            <input name="Trait1" id="Trait1" value="<?= htmlspecialchars($trait_1); ?>" required>
    </div>  <!-- / autocomplete (trait 1) -->

    <div class="autocomplete marg-bottom">
        <input name="Trait2" id="Trait2" value="<?= htmlspecialchars($trait_2); ?>">
    </div> <!-- / autocomplete (trait 2) -->
 
    <div class="autocomplete marg-bottom">
        <input name="Trait3" id="Trait3" value="<?= htmlspecialchars($trait_3); ?>">
    </div> <!-- / autocomplete (trait 3) -->

    <button class="form-submit pad-10" type="submit" name="submit">Submit</button>

    </form>

</div>  <!-- / big-form -->

<script>
    <?php include("autocomplete.php"); ?>  
    
    /* Arrays containing lists. */
    var all_traits = <?php print("$all_traits")?>;
    autocomplete(document.getElementById("Trait1"), all_traits);
    autocomplete(document.getElementById("Trait2"), all_traits);
    autocomplete(document.getElementById("Trait3"), all_traits);


</script>

<?php

}

// not logged in else
else {
    $login_error = 'Please login to access this page';
    header("Location: index.php?page=admin/login&error=$login_error");
}


?>