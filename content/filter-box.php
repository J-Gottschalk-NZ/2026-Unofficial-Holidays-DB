<!--  panel from W3C Schools -->
<div id="myFilterpanel" class="panel">

    <!-- Control  panel styling -->
    <div class="PanelWrapper">

        <!-- Put cross next to heading -->
        <div class="panel-header">
            <h2>Filters...</h2>
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

        </div>  <!-- / panel-header -->

        <i class="fa-solid fa-circle-info"></i> <i>Start typing in a box to jump to the option you want.  Leave everything blank to show all the data.</i>
        <br><br>

        <?php

        $dropdowns = [
        // table/name      id_col      label_col   prompt
        ['play_name',   'PlayID',   'Play',     'Play ...'],
        ['ms_role',     'RoleID',   'Role',     'Role ...'],
        ['cod_action',  'COD_ActionID',  'Action',    'Cause of Death ...'],
        ['cod_method',  'COD_MethodID', 'Method',   'Method of Death ...'],
        ['moral_alignment','Moral_AlignmentID',  'Alignment','Moral Alignment ...']
    ];

        ?>

        <form method="post" action="index.php?page=content/filter_search" enctype="multipart/form-data">

        <?php

        foreach($dropdowns as $d) {
        
        list($table, $id_col, $label_col, $prompt) = $d;

        echo '<select name="' . $table . '" class="advanced pad-10-round">';
        echo '<option value="">' . $prompt . '</option>';

        $sql = "SELECT `$id_col`, `$label_col` FROM `$table` ORDER BY `$label_col` ASC";
        $query = mysqli_query($dbconnect, $sql);

        while ($row = mysqli_fetch_assoc($query)) {
        echo '<option value="' . $row[$id_col] . '">' . $row[$label_col] . '</option>';
        }   // end of option while

        echo '</select><br>';


        }   // end of dropdown box creation for each

        ?>

        <button class="advanced-button advanced-search pad-10-round">
            <span>Filter</span> <i class="fa-solid fa-filter"></i>
        </button>

        </form>

    </div>  <!-- / PanelWrapper -->

</div>  <!-- / Panel-->