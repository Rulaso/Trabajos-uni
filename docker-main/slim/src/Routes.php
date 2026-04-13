<?php

require_once __DIR__ . '/Controllers/LoginController.php';
//login
$app->post('/login', [LoginController::class ,'login']);