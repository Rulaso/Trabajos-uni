<?php

// DB imported on index.php
// require_once __DIR__ . '/DB.php';

class User {
    // Get all users from the database
    public static function getAll()
    {
        $db = DB::getConnection();
        $stmt = $db->query("SELECT * FROM usuario");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    //recupero el email, password e id del usuario
    public static function getLoginData($emal, $password){
        $db = DB::getConnection();
        $datos = $db->query("SELECT email, password, id FROM users WHERE email = $emal and password = $password");
        return $datos->fetchAll(PDO::FETCH_ASSOC);
    }

    //creo y guardo el token
    public static function crearToken($id){
        $db = DB::getConnection();  //<- abro la base de datos
        //genero el token
        $token = bin2hex(random_bytes(32));
        $tokenExpire = date('Y-m-d H:i:s', strtotime('+5 minutes'));
        //guardo el token y su tiempo de expiracion en la base de datos utilizando el id como referencia
        $db->query("UPDATE users SET token = '$token', token_expired_at = '$tokenExpire' WHERE id = '$id'"); 
    }

    //Reestablesco la duracion del token en 5 minutos
    public static function updateToken($id){
        $db = DB::getConnection();
        $tokenExpire = date('Y-m-d H:i:s', strtotime('+5 minutes'));
        $db->query("UPDATE users SET token_expired_at = '$tokenExpire' WHERE id = '$id'");
    }
}
