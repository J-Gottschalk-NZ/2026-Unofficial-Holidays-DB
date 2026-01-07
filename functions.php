<?php

function get_query($dbconnect, $sql_condition, $params = [])
 {
   // d ==> data table
    // c ==> category table
    // a ==> cod_action
	// m ==> cod_method
	// g ==> gender
	// k ==> k1, k2, and k3 are key_traits
	// ma ==> moral_alignment
	// r ==> role
	// p ==> play_name

    $find_sql = "
    SELECT d.*,
            p.*, 
            c.*,
            g.*,
            r.*,
            ma.*,
            a.*,
            m.*,
            
            -- 'Trait' is the COLUMN name with the 'word'
            k1.Trait AS Trait1,
            k2.Trait AS Trait2,
            k3.Trait AS Trait3            

    FROM data d

    JOIN play_name p ON p.PlayID = d.PlayID
    JOIN category c ON c.CategoryID = p.CategoryID
    JOIN gender g ON g.GenderID = d.GenderID
    JOIN ms_role r ON r.RoleID = d.RoleID
    JOIN moral_alignment ma ON ma.Moral_AlignmentID = d.Moral_AlignmentID
    JOIN cod_action a ON a.COD_ActionID = d.COD_ActionID
    JOIN cod_method m ON m.COD_MethodID = d.COD_MethodID
    JOIN key_traits k1 ON d.Trait_1ID = k1.TraitID
    JOIN key_traits k2 ON d.Trait_2ID = k2.TraitID
    JOIN key_traits k3 ON d.Trait_3ID = k3.TraitID

    -- Adds additional sql condition
    $sql_condition

    ";

     // Prepared Statements
    $stmnt = $dbconnect -> prepare($find_sql);

    if(!empty($params)) {
          $types = str_repeat('s', count($params));  // all params treated as strings
          
          $bind_values = [];
          foreach ($params as $key => $value) {
            $bind_values[$key] = &$params[$key];
          }  // end bind fo each    
          
      array_unshift($bind_values, $types);
      call_user_func_array([$stmnt, 'bind_param'], $bind_values);

    } // end bind parameters if

    $stmnt -> execute();

    $find_query = $stmnt -> get_result();
    $find_count = $find_query -> num_rows;

    $stmnt -> close();

    return [$find_query, $find_count];

 }

 // trims white space from our search term
 function to_clean($data) {
	$data = trim($data);	
	return $data;
}

// generate drop down menu based on table
function get_options($dbconnect, $table, $idField, $valueField) {

    // retrieve options from database
    $dropdownSql = "SELECT * FROM `$table` ORDER BY `$table`.`$valueField` ASC ";
    $dropdownQuery = mysqli_query($dbconnect, $dropdownSql);

    // create options!
    while($dropdownRs = mysqli_fetch_assoc($dropdownQuery)) {

      ?>
        <option value="<?= $dropdownRs[$idField]; ?>">
          <?= htmlspecialchars($dropdownRs[$valueField]); ?>
        </option>
      <?php

    } // end dropdown while

}

// entity is trait (ie: thing that needs to be autocompleted)
function autocomplete_list($dbconnect, $item_sql, $entity)    
{
// Get entity / topic list from database
$all_items_query = mysqli_query($dbconnect, $item_sql);
    
// Make item arrays for autocomplete functionality...
while($row=mysqli_fetch_array($all_items_query))
{
  $item=$row[$entity];
  $items[] = $item;
}

$all_items=json_encode($items);
return $all_items;
    
}

// get search ID
function get_search_ID($dbconnect, $search_term)
{
    $stmnt_findID = $dbconnect -> prepare("SELECT * FROM key_traits WHERE Trait LIKE ?");
    $stmnt_findID -> bind_param("s", $search_term);
    $stmnt_findID -> execute();

    $result = $stmnt_findID -> get_result();
    $find_rs = $result -> fetch_assoc();
    $find_count = $result -> num_rows;

  if($find_count == 1) {
	return $find_rs['TraitID'];
	}
	else {
		return "no results";
	}

    $stmnt_findID -> close();

}

?>