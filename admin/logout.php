<?php

unset($_SESSION['admin']);
unset($_SESSION);
header("Location: index.php?page=admin/login");

?>