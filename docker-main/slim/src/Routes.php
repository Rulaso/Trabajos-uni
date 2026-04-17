<?php

require_once __DIR__ . '/Controllers/LoginController.php';
require_once __DIR__ .'';
//login
$app->post('/login', [LoginController::class ,'login']);
//logout
$app->post('/logout', [LoginController::class ,'logout']);