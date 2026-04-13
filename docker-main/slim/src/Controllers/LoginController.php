<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
require __DIR__ . '/../Models/DB.php';
class loginController {

public function login(Request $request, Response $response, array $args){
        //recibo los datos en $datos
    $datos = $request->getParsedBody();
    if(empty($datos['email'] || empty($datos['password']))){
        //Si falta email o contraseña envio un Bad request
        $error = ["status" => "400 Bad request", "message" => "Falto ingresar email o contraseña, debe completar todos los campos"];        //<-creo el mensaje
        $response->getBody()->write(json_encode($error));       
        return $response->withHeader('Content-Type', 'application/json')->withStatus(400);      //<-envio el json con el Bad request
    } else {
        //Guardo el email y contraseña en sus respectivas varaibles
        $email = $datos['email'];
        $password = $datos['password'];
        //Si el email y la contraseña coinciden con un usuario existente envio un OK
        //Esto se compara asi porque no hay base de datos para comparar
        $db = DB::getConnection();
        $prueba =  $db->query("SELECT email, password FROM users WHERE email = '$email' AND password = '$password'")->fetch(PDO::FETCH_ASSOC);
        if($prueba['email'] == $email && $prueba['password'] == $password){ 
            $cumple = ["status" => "200 OK", "message" => "Se completo existosamente el login"];    //<-creo el mensaje
            $response->getBody()->write(json_encode($cumple));  

            return $response->withHeader("Content-Type", "application/json")->withStatus(200);      //<-envio el json con el OK
        } else {
            //Si no cumplen con un usuario existente envio un Bad request
            $error = ["Status" => "400 Bad request", "message" => "El email o contraseña no coinciden con un usuario existente"];       //<-creo el mensaje
            $response->getBody()->write(json_encode($error));       

            return $response->withHeader("Content-Type", "application/json")->withStatus(400);      //<-envio el json con el Bad request
        }
    }

}




}