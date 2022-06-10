<?php
class Database{

    public static function connect(){
            $host = "localhost";
            $user ="root";
            $pass = "";
            $bdname="almacen";
            $db= new mysqli($host, $user, $pass, $bdname);
            $db->query("SET NAMES 'utf8'");
            return $db;
    }

}

?>