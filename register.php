<?php
// register.php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Preverjanje gesla
    if ($password !== $confirm_password) {
        echo "Gesli se ne ujemata!";
    } else {
        // Simulacija dodajanja uporabnika v bazo
        echo "Registracija uspešna za uporabnika: " . $username . ".";
    }
}
?>
