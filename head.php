<!DOCTYPE html>
<html lang="en">

<?php
    include("config.php");

    // Connect to the database
    $dbconnect = mysqli_connect(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if(mysqli_connect_errno())
    {
        echo "Connection Failed".mysqli_connect_error();
        exit;
    }
?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Database showcasing unofficial holidays">
    <meta name="keywords" content="unofficial holidays, holiday, fun, celebration, special occasions">
    <meta name="author" content="Jennifer Gottschalk">

    <title>Unofficial Holidays Database</title>

    <link rel="stylesheet" href="holiday_style.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Agbalumo&family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">


    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/37c3bd2981.js" crossorigin="anonymous"></script>

    </head>