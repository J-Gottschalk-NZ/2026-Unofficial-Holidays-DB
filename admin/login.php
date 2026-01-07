<div class="admin-form">

<h2>Login</h2>

<form action="index.php?page=admin/adminlogin" method="post">
    <p><input name="username" placeholder="Username"/></p>
    <p><input name="password" placeholder="Password" type="password"/></p>

    <?php

    if(isset($_GET['error'])) {

        ?>
            <div class="error">
            <?= $_GET['error'] ?> 
        </div>

        <?php

    } // end error if

    ?>

    <button class="form-submit pad-10" type="submit" name="login">Log In</button>


</form>

</div>