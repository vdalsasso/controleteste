<?php

/*
 Class produtos
*/

 require_once 'connect.php';

  class Itens extends Connect
 {
 	
 	public function index()
 	{
 		$this->query = "SELECT *FROM `itens`";
 		$this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

 		if($this->result){
 		
 			while ($row = mysqli_fetch_array($this->result)) {
 				echo '<li>
                  <!-- drag handle -->
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                  <span class="text">
                  <!-- checkbox -->
                  <form class="badge" name="ativ'.$row['idItens'].'" action="action.php" method="post">
                  <input type="hidden" name="id" id="id" value="'.$row['idItens'].'">
                  <input type="hidden" name="status" id="status" value="'.$row['Ativo'].'">
                  <input type="checkbox" id="status" name="status" ';
                   if($row['Ativo'] == 1){ echo 'checked'; } 
                  echo ' value="'.$row['Ativo'].'" onclick="this.form.submit();"></form>
                  <!-- todo text -->
                  <span class="badge left">'.$row['idItens'].'</span> '.$row['QuantItens'].'
                   - '.$row['QuantItensVend'].'
                  - '.$row['ValCompItens'].'
                  - '.$row['ValVendItens'].'
                  - '.$row['DataCompraItens'].'
                  - '.$row['DataVenci_Itens'].'
                  - '.$row['Ativo'].'
                  - '.$row['Produto_CodRefProduto'].'
                  - '.$row['Fabricante_idFabricante'].'
                  - '.$row['Usuario_idUser'].'</span>

                  <!-- Emphasis label -->
                  
                  <!-- General tools such as edit or delete-->
                  <div class="tools right">
                    
                    <form class="right" name="editItens'.$row['idItens'].'" action="editItens.php" method="post">
                      <input type="hidden" name="idItens" id="idItens" value="'.$row['idItens'].'">
                      <a href="#" type="button" onclick="this.form.submit();"><i class="fa fa-edit"></i></a></form>
                    <form class="right" name="delItens'.$row['idItens'].'" action="delItens.php" method="post">
                    <input type="hidden" name="idItens" id="idItens" value="'.$row['idItens'].'">
                     <a href="#" type="button" onclick="this.form.submit();"><i class="fa fa-trash-o"></i></a></form>
                  </div>
                </li>';
                 				
 			}
 			
 		}

 	}

 	public function InsertItens($QuantItens, $ValCompItens, $ValVendItens, $DataCompraItens, $DataVenci_Itens, $Produto_CodRefProduto, $Fabricante_idFabricante, $idusuario){

 		$this->query = "INSERT INTO `itens`(`idItens`, `QuantItens`, `QuantItensVend`, `ValCompItens`, `ValVendItens`, `DataCompraItens`, `DataVenci_Itens`, `Ativo`, `Produto_CodRefProduto`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES (NULL, '$QuantItens', 0, '$ValCompItens', '$ValVendItens', '$DataCompraItens', '$DataVenci_Itens', 1, '$Produto_CodRefProduto', '$Fabricante_idFabricante', '$idusuario')";
 		if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

 			header('Location: ../../views/itens/index.php?alert=1');
 		}else{
 			header('Location: ../../views/itens/index.php?alert=0');
 		}
 	}//InsertItens

  public function editItens($value)
  {
    $this->query = "SELECT *FROM `itens` WHERE `idItens` = '$value'";
    $this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

    if($row = mysqli_fetch_array($this->result)){

        $idItens = $row['idItens'];
        $QuantItens = $row['QuantItens'];
        $ValCompItens = $row['ValCompItens'];
        $ValVendItens = $row['ValVendItens'];
        $DataCompraItens= $row['DataCompraItens'];
        $DataVenci_Itens = $row['DataVenci_Itens'];
        $Produto_CodRefProduto = $row['Produto_CodRefProduto'];
        $Fabricante_idFabricante = $row['Fabricante_idFabricante'];
        
       return $resp = array('Itens' => ['idItens' => $idItens,
                      'QuantItens'   => $QuantItens,
                      'ValCompItens' => $ValCompItens,
                      'ValVendItens' => $ValVendItens,
                      'DataCompraItens' => $DataCompraItens,
                      'DataVenci_Itens' => $DataVenci_Itens,
                      'CodRefProduto' => $Produto_CodRefProduto,
                      'idFabricante' => $Fabricante_idFabricante ] , );  
     }
    
  }

  public function updateItens($idItens, $QuantItens, $ValCompItens, $ValVendItens, $DataCompraItens, $DataVenci_Itens, $Produto_CodRefProduto, $Fabricante_idFabricante, $idusuario)
  {
    $this->query = "UPDATE `itens` SET 
                    `QuantItens`= '$QuantItens',
                    `ValCompItens`='$ValCompItens',
                    `ValVendItens`='$ValVendItens',
                    `DataCompraItens`='$DataCompraItens',
                    `DataVenci_Itens`='$DataVenci_Itens',
                    `Produto_CodRefProduto`='$Produto_CodRefProduto',
                    `Fabricante_idFabricante`='$Fabricante_idFabricante',
                    `Usuario_idUser`='$idusuario' 
                    WHERE `idItens`= '$idItens'";

    if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

      header('Location: ../../views/itens/index.php?alert=1');
    }else{
      header('Location: ../../views/itens/index.php?alert=0');
    }

  }

  public function QuantItensVend($value, $idItens)
  { 
    $this->query = "UPDATE `itens` SET `QuantItensVend` = '$value' WHERE `idItens`= '$idItens'";
    
    if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

      header('Location: ../../views/itens/index.php?alert=1');
    }else{
      header('Location: ../../views/itens/index.php?alert=0');
    }
  }

  public function ItensAtivo($value, $idItens)
  {

    if($value == 0){ $v = 1; }else{ $v = 0; }

    $this->query = "UPDATE `itens` SET `Ativo` = '$v' WHERE `idItens` = '$idItens'";
    $this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL));
       
    header('Location: ../../views/itens/');
    /*

    $this->queryAtivo = "SELECT `Ativo` FROM `itens` WHERE `idItens`= '$idItens'";
    $this->resultAtivo = mysqli_query($this->SQL, $this->queryAtivo) or die ( mysqli_error($this->SQL));
      
      if($rep = mysqli_fetch_array($this->resultAtivo)) {
       $valueResp = $rep['Ativo'];
      } 

    switch ($valueResp) {
      case 1:
          $value = 0;
        break;
      case 0:
          $value = 1;
        break;      
     
   }

    
    $this->query = "UPDATE `itens` SET `Ativo` = '$value' WHERE `idItens`= '$idItens'";
    if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

      header('Location: ../../views/itens/index.php?alert=1');
    }else{
      header('Location: ../../views/itens/index.php?alert=0');
    }*/
  
  }//ItensAtivo



 }

 $itens = new Itens;