<?php
 session_start();
 //tworzymy sesję do zapamiętywania id produktów
?>
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
 //var_dump($_SESSION['cart']); 
  //var_dump($_REQUEST); odebranie id z inputa produktu bez sesji
  if(isset($_REQUEST{'id'}))
    {      
            if(isset($_SESSION{'cart'}))
        {
            array_push($_SESSION['cart'], $_REQUEST['id']);    
        }
        else
        {
            $_SESSION['cart'] = array();
            array_push($_SESSION['cart'], $_REQUEST['id']);
        }
    }  
    if(isset($_REQUEST['remove']))
        array_splice($_SESSION['cart'], $_REQUEST['remove'], 1);
    if (isset($_SESSION['cart'])){
        $db = new mysqli('localhost', 'root', '', 'pizza');
        $q = "SELECT * FROM food";
        $result = $db->query($q);
        $names = array();
        $prices = array();
        while($row = $result->fetch_assoc()){
            $id = $row['id'];
            $name = $row['name'];
            $price = $row['price'];
            $names[$id] = $name;
            $prices[$id] = $price;
        }
        echo '<table>';
        $sum = 0;
        foreach ($_SESSION['cart'] as $id => $cartItem){
            echo '<tr>';
            echo '<td>' . $names[$cartItem] . '</td>';
            echo '<td>' . $prices[$cartItem] . '</td>';
            echo '<td><a href="koszyk.php?remove=' . $id
                    . '">Usuń</a>';
            echo '</tr>';
            $sum += $prices[$cartItem];
        }
        echo '</table>';
        echo 'Suma zamówienia:' . $sum . ' zł';
    } else {
        echo 'koszyk jest pusty';
    }
    //echo '<table>'; //tabela wyświetlania id produktów
        // foreach ($_SESSION['cart'] as $cartItem) {
           // echo '<tr><td>'.$cartItem.'</td></tr>';
        // }
        // echo '</table>';
   // var_dump($_SESSION); z sesją do zapamiętania produktów  

?>
<form action="order.php" metod="post">
    <input type="text" name="firstName"> 
    <input type="text" name="lastName">
    <input type="text" name="address">
    <input type="text" name="phone">
    <input type="submit" value="Zamow">

</body>
</html>