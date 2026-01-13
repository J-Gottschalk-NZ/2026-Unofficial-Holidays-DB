
<div class="all-cards">

<?php

while($find_rs=mysqli_fetch_assoc($find_query))

        {

        // Retrieve date and format it nicely...
        $date_from_db = htmlspecialchars($find_rs['date']);

        // Create a new DateTime object that can be formatted...
        $date_object = new DateTime($date_from_db);

        // Format the date as 'day Month' (e.g. '2nd January')
        $formatted_date = $date_object -> format('jS F');

        // Add in correct superscript using donated regular expression...
        $formatted_date = preg_replace('/(\d+)(st|nd|rd|th)/', '$1<sup>$2</sup>', $formatted_date);

        // image file set up because images are hosted elsewhere...
        $image_file_name = htmlspecialchars($find_rs['image']);
        $image_path = $image_URL.$image_file_name;

        // Event name for heading and alt text
        $event_name = htmlspecialchars($find_rs['holiday']);

         ?>

        <div class="results pad-20 radius-10 bottom-spacing" >

            <!-- Category, Event name and date -->
            <span class="category radius-10"><?= htmlspecialchars($find_rs['category']); ?></span>
            <b><?= $event_name; ?> - <?= $formatted_date; ?></b>

            <img class="results-image" src="<?= $image_path; ?>" alt="<?= $event_name; ?>">

            <p>
                <?= htmlspecialchars($find_rs['description']); ?>
            </p>

        </div>  <!-- / result box -->

        <?php

        } // end results while loop


?>

</div> <!-- / all-cards -->