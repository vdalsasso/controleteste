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
                    <i class="fa fa-edit"></i>
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

 		$this->query = "INSERT INTO `fabricante`(`idFabricante`, `NomeFabricante`, `CNPJFabricante`, `EmailFabricante`, `EnderecoFabricante`, `TelefoneFabricante`, `Usuario_idUser`) VALUES (NULL, '$NomeFabricante', '$CNPJFabricante', '$EmailFabricante', '$EnderecoFabricante', '$TelefoneFabricante', '$idUsuario')";
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

  public function UpdateFabricante($idFabricante, $NomeFabricante, $CNPJFabricante, $EmailFabricante, $EnderecoFabricante, $TelefoneFabricante, $idUsuario){


  }//update



 }

 $fabricante = new Fabricante;