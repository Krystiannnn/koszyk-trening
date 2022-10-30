<?php session_start(); ?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php

// tablica z id produktów zamówionych
$cart = $_SESSION['cart'];
$firstName = $_REQUEST['firstName'];
$lastName = $_REQUEST['lastName'];
$address = $_REQUEST['address'];
$phone = $_REQUEST['phone'];

// skrypt wkładania do bazy danych osobowych zamawiającego
$db = new mysqli('localhost', 'root', '', 'pizza');
$q = $db->prepare("INSERT INTO zamowienie VALUES (NULL, ?, ?, ?, ?)");
$q->bind_param('ssss', $firstName,$lastName,$address,$phone);
$q->execute();

// skrypt wkładania do bazy zamówionych produktów
$orderId = $db->insert_id; 
//var_dump($db); spr czy są bagi
$q = $db->prepare("INSERT INTO orderedFood VALUES (NULL, ?, ?)");

foreach($cart as $foodId) {
     $q->bind_param('ii', $orderId, $foodId);
     $q->execute();
//echo "its work!";

}


?>
</body>
</html>