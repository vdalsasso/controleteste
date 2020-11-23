<?php

/*
 Class produtos
*/

 require_once 'connect.php';

class Fabricante extends Connect
 {
 	
 	public function index()
 	{
 		$this->query = "SELECT *FROM `fabricante`";
 		$this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

 		if($this->result){
 		
 			while ($row = mysqli_fetch_array($this->result)) {
 				echo '<li>
                  <!-- drag handle -->
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                  <!-- checkbox -->
                  <input type="checkbox" value="'.$row['idFabricante'].'">
                  <!-- todo text -->
                  <span class="text"><span class="badge left">'.$row['idFabricante'].'</span> '.$row['NomeFabricante'].'</span>
                  <!-- Emphasis label -->
                  <!-- <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small> -->
                  <!-- General tools such as edit or delete-->
                  <div class="tools">
                    <a href="editfabricante.php?id='.$row['idFabricante'].'"<i class="fa fa-edit"></i></a>
                    <i class="fa fa-trash-o"></i>
                  </div>
                </li>';
                 				
 			}
 			
 		}

 	}

 	public function listfabricante($value = NULL){

    
 		$this->query = "SELECT *FROM `fabricante`";
 		$this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL));

 		if($this->result){
 		
 			while ($row = mysqli_fetch_array($this->result)) {
        if($value == $row['idFabricante']){
          $selected = "selected";
        }else{
          $selected = "";
        }
 				echo '<option value="'.$row['idFabricante'].'" '.$selected.' >'.$row['NomeFabricante'].'</option>';
 			}

 	}

 }

  public function InsertFabricante($NomeFabricante, $CNPJFabricante, $EmailFabricante, $EnderecoFabricante, $TelefoneFabricante, $idUsuario, $NomeRepresentante, $TelefoneRepresentante, $EmailRepresentante){

 		$this->query = "INSERT INTO `fabricante`(`idFabricante`, `NomeFabricante`, `CNPJFabricante`, `EmailFabricante`, `EnderecoFabricante`, `TelefoneFabricante`, `Ativo`, `Usuario_idUser`) VALUES (NULL, '$NomeFabricante', '$CNPJFabricante', '$EmailFabricante', '$EnderecoFabricante', '$TelefoneFabricante', 1, '$idUsuario')";
 		if($this->result = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){

      $idFabricante = mysqli_insert_id($this->SQL);

      $this->representante = "INSERT INTO `representante`(`idRepresentante`, `NomeRepresentante`, `TelefoneRepresentante`, `EmailRepresentante`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES (NULL, '$NomeRepresentante', '$TelefoneRepresentante', '$EmailRepresentante','$idFabricante', '$idUsuario')";
         
          if($this->rep = mysqli_query($this->SQL, $this->representante) or die(mysqli_error($this->SQL))){
              header('Location: ../../views/fabricante/index.php?alert=1'); 
          }else{
              header('Location: ../../views/fabricante/index.php?alert=0');
          } 

         header('Location: ../../views/fabricante/index.php?alert=1'); 

 		}else{
 			header('Location: ../../views/fabricante/index.php?alert=0');
 		}

 	}//Insert

  public function EditFabricante($idFabricante) {
    $this->query = "SELECT * FROM `fabricante` WHERE `idFabricante` = '$idFabricante'";

    if($this->result = mysqli_query($this->SQL, $this->query) or die ( mysqli_error($this->SQL))) {

      if($row = mysqli_fetch_array($this->result)) {

        $NomeFabricante = $row['NomeFabricante'];
        $CNPJFabricante = $row['CNPJFabricante'];
        $EmailFabricante = $row['EmailFabricante'];
        $EnderecoFabricante = $row['EnderecoFabricante'];
        $TelefoneFabricante = $row['TelefoneFabricante'];
        $Ativo = $row['Ativo'];
        $Usuario_idUser = $row['Usuario_idUser'];

        $array = array('Fabricante' => [ 'Nome' => $NomeFabricante, 'CNPJ' => $CNPJFabricante, 'Email' => $EmailFabricante, 'Endereco' => $EnderecoFabricante, 
        'Telefone' => $TelefoneFabricante, 'Ativo' => $Ativo, 'Usuario' => $Usuario_idUser], );

        return $array;
      }
    } else {

      return 0;
    }

  }
  
  public function UpdateFabricante($idFabricante, $NomeFabricante, $CNPJFabricante, $EmailFabricante, $EnderecoFabricante, $TelefoneFabricante, $Ativo, $idUsuario){

    $this->query = "UPDATE `fabricante` SET `NomeFabricante`='$NomeFabricante',`CNPJFabricante`= '$CNPJFabricante',`EmailFabricante`= '$EmailFabricante',`EnderecoFabricante`= '$EnderecoFabricante',`TelefoneFabricante`= '$TelefoneFabricante', `Ativo`= '$Ativo', `Usuario_idUser`='$idUsuario' WHERE `idFabricante` = '$idFabricante'";

    if($this->rep = mysqli_query($this->SQL, $this->query) or die(mysqli_error($this->SQL))){
      header('Location: ../../views/fabricante/index.php?alert=1'); 
    }else{
        header('Location: ../../views/fabricante/index.php?alert=0');
    } 
  }

  public function DeleteFabricante($idFabricante){

    //if(mysqli_query($this->SQL, "DELETE FROM `fabricante` WHERE `idFabricante` = '$idFabricante'") or die(mysqli_error($this->SQL))){
    if(mysqli_query($this->SQL, "UPDATE `fabricante` SET `Ativo` = 0 WHERE `idFabricante` = '$idFabricante'") or die(mysqli_error($this->SQL))){
    
      header('Location: ../../views/fabricante/index.php?alert=1'); 
    }else{
        header('Location: ../../views/fabricante/index.php?alert=0');
    } 
  }


 }

 $fabricante = new Fabricante;