<?php

session_start();
if (isset($_SESSION["user"])) {
  header("location:index.php");
}

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" media="screen" title="no title" charset="utf-8">
    <script src="js/jquery-2.1.4.js" charset="utf-8"></script>
    <script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
  </head>
  <style>
@font-face{
font-family:Fuentechida;
src:url(fonts/OleoScript-Regular.ttf);
}
    body{
        background-image: url(imagenes/vaca.jpg);
        background-size:cover;
        background-repeat: no-repeat;
        background-attachment:fixed;
    }
    .formulario{
        transition: 2s;
        margin-top: 30px;
        width: 30%;
        box-shadow: 0px 0px 40px rgba(42, 255, 0, 1),0px 0px 80px rgba(70,19,209,1);
    }

    .formulario:hover{
        transition: .8s;
        background-color: rgba(0,0,0,.5);
    }
    fieldset{
        transition: 2s;
        margin-bottom: 50px;
        border-color: rgba(213,0,0 ,1);
        border-style: groove;
        border-width: 5px;
        border-radius: 20px;
    }
    


    
 .espaciado{
        margin-top: 60px;

    }

   


    h1{
        
        color:white;
        font-family: Verdana;
        font-weight: bold;
        position: relative;
        margin-left: 60px;
        

        
        
    }
    .gordo{
      color:white;

    }
  
    .Input{
        transition: .8s;
        background-color: rgba(0,0,0,.5);
        color: white;
        border-color:#006;
  border-bottom-color:white;
        border-bottom-style:groove;
  border-left:none;
  border-right:none;
  border-top:none;
        border-width: 4px;
        
    }

    .Input:hover{
        transition: .8s;
  background-color:rgba(55,71,79 ,.5);
  box-shadow:inset;
        border-bottom-color:blue;
  }
    
    .Input:focus{
        transition: .8s;
  border-bottom-color:blue;
    }

  



    @media screen and (max-width:750px) {
        
        .logo{
            height: 100px;
  }
        
        .formulario{
            transition: 2s;
            width: 100%;
            margin-top: 10px;
        }
        .lulu{
          box-shadow: 0px 0px 40px rgba(42, 255, 0, 1),0px 0px 80px rgba(42, 255, 0, 1)
        }
    }


   
 
    #footer {
   position:fixed;
   left:0px;
   bottom:0px;
   height:30px;
   width:100%;
   color: white;
   margin-left: 30px;
   font-size: 15px;
  
}

</style>

  <body>
    <div class="container formulario">
     <div class="row">
               <div class="col-xs-4 col-xs-offset-4  ">
               
                </div>
            
        </div>
         <div class=" espaciado">
               
                </div>
      
       <h1>PALMILLANO</h1>

     <div class="row">

           
            
      <div class="row">

       <div class="col-xs-4 col-xs-offset-4  ">

          <form method="post" role="form" class="form-horizontal">
            <br><br>
          
           
            <div class="form-group">
              <label class="col-xs-12 text-center gordo " for="user"> Usuario</label>
              <input type="text" name="user" id="user" class="form-control Input">
            </div>
            <div class="form-group">
              <label class="col-xs-12 text-center gordo" for="pass">Password</label>
              <input type="password" name="pass" id="pass" class="form-control Input">
            </div>
            <br><br>
             <br><br>
             <br><br>

            <div class="form-group">
              <input type="button" name="login" id="login" value="Login" class="btn btn-success center-block lulu">
            </div>
            <br>
            <span id="result"></span>
               </fieldset>
          </form>
        </div>
      </div>
    </div>

  </body>
 <footer>
  <div>

</div>

<div id="footer">© 2018 Todos los Derechos Reservados PALIMILLANO C.A. </div>
 </footer>
 
</html>

<script>
  $(document).ready(function() {
    $('#login').click(function(){
      var user = $('#user').val();
      var pass = $('#pass').val();
      if($.trim(user).length > 0 && $.trim(pass).length > 0){
        $.ajax({
          url:"logueame.php",
          method:"POST",
          data:{user:user, pass:pass},
          cache:"false",
          beforeSend:function() {
            $('#login').val("Conectando...");
          },
          success:function(data) {
            $('#login').val("Login");
            if (data=="1") {
              $(location).attr('href','index.php');
            } else {
              $("#result").html("<div class='alert  alert-danger'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>¡Error!</strong> las credenciales son incorrectas.</div>");
            }
          }
        });
      };
    });
  });
</script>


