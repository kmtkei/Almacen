<?php
function controllers_autoload($classname){
    include ("Controladores/".$classname.".php");
}

spl_autoload_register("controllers_autoload");
?>