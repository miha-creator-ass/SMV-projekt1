<?php
// Začni sejo
session_start();

// Počisti vse seje
session_destroy();

// Preusmeri uporabnika na začetno stran ali na stran za prijavo
header("Location: prijava.html"); // Spremenite index.php na ustrezno pot do vaše začetne strani ali strani za prijavo
exit;
?>