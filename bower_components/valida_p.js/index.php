<html>
  <head>
    <meta charset="UTF-8" />
    <title>mi primer plugin jquery</title>
    <link rel="stylesheet" type="text/css" href="css/iconos/iconos.css">
  </head>
  <body>

    <div id="div1" class="">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    </div>

    <div id="div2" class="">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    </div>

    <div id="div3" class="">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    </div>

    <div id="div_f">

      <form id="f_prueba" method="post">
        <input type="text" id="in" name="in" required="true">
        <input type="text" id="in1" name="in1" required="true">
        <input type="text" id="in2" name="in2">
        <input type="text" id="in3" name="in3">
        <input type="text" id="in4" name="in4" required="true">
        <!----><select id="lista" name="lista">
          <option>cosa1</option>
          <option>cosa2</option>
        </select>
        <textarea id="area" name="area" rows="8" cols="40" required="true"></textarea>
      </form>
      <button id="btn_valida">validar</button>

    </div>

    <!-- jquery-->
    <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="js/valida_p.js"></script>
    <script src="js/css_p.js"></script>
    <script>
      $(function(){

        $("#btn_valida").click(function(){

          /*
          var objt_form = $("#f_prueba").valida({
            color_ok:"rgb(66, 133, 244)"
          });
          */
          var objt_form = $("#f_prueba").valida();

          if(objt_form.estado == true){
            console.log(objt_form.srlz);
          }else{
            alert("Aún no se puede enviar el formulario.");
          }

        });

        $("#in").colorInput();
        $("#in1").colorInput({
          color:"rgb(251, 121, 34)"
        });

      });
    </script>
  </body>
</html>
