<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/vendor/autoload.php';

$app = AppFactory::create();
$app->addRoutingMiddleware();
$app->addErrorMiddleware(true, true, true);
$app->add( function ($request, $handler) {
    $response = $handler->handle($request);

    return $response
        ->withHeader('Access-Control-Allow-Origin', '*')
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'OPTIONS, GET, POST, PUT, PATCH, DELETE')
        ->withHeader('Content-Type', 'application/json')
    ;
});

// ACÁ VAN LOS ENDPOINTS
$app->post('/login', function  (Request $request, Response $response){
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
        if($email === 'ejemplo@gmail' && $password === 'ejemplo'){
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

});
$app->run();
