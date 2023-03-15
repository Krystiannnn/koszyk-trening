<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
  
    <div class="products">    
        <div class="box-container">    
            <?php

            

            $conn = new mysqli('localhost', 'root', '', 'pizza');
            

            $q = $conn->query("SELECT * FROM food");
            if(mysqli_num_rows($q) > 0){

            while($fetch_product = mysqli_fetch_assoc($q)){
            ?>
            <form action="koszyk.php" method="post" class="box">

            <img src="img/<?php echo $fetch_product['Image']; ?>" alt="">
            <div class="name"><?php echo $fetch_product['name']; ?></div>
            <div class="name"><?php echo $fetch_product['price']; ?></div>
            
            
            <input type="hidden" name="id" value="<?php echo $fetch_product['id']; ?>">
            
            <input type="submit" value="add to cart">
            </form>


            
            
            <?php    
            }


            } else {
                $conn->close();
            }

            
            ?>   
        </div>
                    
                

       
    </div>
   
    
</body>
</html>