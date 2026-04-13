<?php

require_once __DIR__ . '/Controllers/LoginController.php';

$app->post('/login', [LoginController::class ,'login']);