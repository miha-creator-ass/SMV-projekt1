<?php
// login.php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Simulacija uporabnika iz baze
    $uporabniki = [
        'uporabnik1' => 'geslo1',
        'uporabnik2' => 'geslo2',
    ];

    $username = $_POST['username'];
    $password = $_POST['password'];

    if (isset($uporabniki[$username]) && $uporabniki[$username] == $password) {
        echo "Prijava uspešna! Dobrodošli, " . $username . ".";
    } else {
        echo "Napačno uporabniško ime ali geslo!";
    }
}
?>
