<html>
<head>
<title>md5 en javascript</title>
  <!--  <script src="js/jquery-1.11.0.min.js"> -->
   <script src="js/md5.js" type="text/javascript"></script>
<script src="js/jquery-1.11.0.min.js"> </script> 
   <script>
   function convierteMd5(formulario){
      var  mypass =  md5(formulario.usernametxt.value)+ md5(formulario.md5txt.value);
      formulario.md5txt.value = mypass
      formulario.remd5txt.value = mypass
      
      var mypass1 = formulario.md5txt.value;
      var mypass2 = formulario.remd5txt.value;
      //alert(mypass1);
      //alert(mypass2);
      //if (mypass2 == mypass1) {
      //  alert("Iguales")
        document.forms["sp2"].submit();
      //}else {
      //  alert("Diferentes");
      //}
      //aalert("El Hash MD5 es: " + md5(formulario.usernametxt.value)+ md5(formulario.md5txt.value));
     // document.forms["sp2"].submit();
     alert("Pass" + mypass1);
    /* $.post("demo.php",   {
      name:formulario.usernametxt.value,
      pass:mypass  
         },
        function(data,status){
          alert("Data: " + data + "\nStatus: " + status);
        });
*/
   }
   </script>
</head>
<body>
<h1>Bienvenido a tu Sitio de Confianza</h1>
   <form name=sp2 action="https://localhost/demo.php" method="POST">
     <table>
      <tr>
     <td> username:</td><td> <input type="text" name="usernametxt"></td>
     </tr>
     <tr>
     <td> password: </td><td><input type="password" name="md5txt"></td>
     </tr>
     <tr>
      <td>RE-password:</td> <td><input type="password" name="remd5txt"></td>
     </tr>
     <tr>
      <td><input type="button" onclick="convierteMd5(this.form)" value="Convierte a md5"></td>
      </tr>
   </form>
   <br>
   
</body>
</html>