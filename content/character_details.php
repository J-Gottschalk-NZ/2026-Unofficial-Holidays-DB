<div class="char-details">
    <div class="character-name"><?= htmlspecialchars($character); ?></div>

<div class="play-title">
    <a title="<?= htmlspecialchars($category); ?>" href="<?= $click_type."category".$click_term.urlencode($category) ?>"><img src="<?= htmlspecialchars($category_icon); ?>"></a>
    
    <a class="play" href="<?= $click_type."play".$click_term.urlencode($play) ?>"><?= htmlspecialchars($play);?></a>

</div>  <!-- / play title -->

<?php

    // list to hold icons to easily generate 'icon row'
    // Title (and alt) | URL | icon     
    $all_icons = [
        [$gender, $click_type."gender".$click_term.$gender, $gender_icon],
        [$role, $click_type."ms_role".$click_term.$role, $role_icon],
        [$alignment, $click_type."moral_alignment".$click_term.$alignment, $alignment_icon],
        [$action, $click_type."cod_action".$click_term.$action, $action_icon],
        [$method, $click_type."cod_method".$click_term.$method, $method_icon]
    ];

?>

<!-- Icon Row...  -->

<div class="icon-row">

<?php

foreach($all_icons as $icon) {

    ?>

    <a title="<?= htmlspecialchars($icon[0]); ?>" href="<?= $icon[1];?>"><img src="<?= htmlspecialchars($icon[2]); ?>" alt="<?= htmlspecialchars($icon[0]); ?>" ></a>

    <?php

}   // end icon for each


?>

   
</div>  <!-- / icon row -->

<div class="description pad-10">
    <?=  htmlspecialchars($find_rs['Description']); ?>
</div>  <!-- / description -->

<div class="trait-tags">

<?php
    $all_traits = [$trait1, $trait2, $trait3];

    // iterate through list of traits and output them (if they are not n/a)
    foreach($all_traits as $trait) {

        if($trait != "n/a") {

            ?>
                <a class="trait pad-10" href="<?= $click_type?>trait<?= $click_term.$trait; ?>"><?= $trait; ?></a>
            <?php

        } // end if not n/a

    }   // trait for each

?>

</div>  <!-- / trait-tags -->

<?php

    // if user is logged in, show delete option
if (isset($_SESSION['admin']))  {

    ?>

    <div class="tools pad-10 text-large">

        <a class="nav-button pad-10-round" href="index.php?page=admin/edit&ID=<?= $ID; ?>"><i class="fa-solid fa-pen-nib"></i></a> 
        <?php

            if($featured == "")
            {
                ?>
            <a class="nav-button pad-10-round" href="index.php?page=admin/delete_confirm&ID=<?= $ID; ?>"><i class="fa-solid fa-trash"></i></a>
                <?php
            }   // end can delete if

            else {
            ?>
                <a title="Featured item (can't be deleted)" class="nav-button grey-button" href="#"><i class="fa-solid fa-trash"></i></a>
            <?php

            }   // end can't delete featured else
        ?>



    </div>  <!-- / tools --> 

    <?php

    }

?>


</div>  <!-- / char-details -->