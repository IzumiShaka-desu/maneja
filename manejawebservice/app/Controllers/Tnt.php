<?php

namespace App\Controllers;

use CodeIgniter\Config\Services;
use CodeIgniter\RESTful\ResourceController;

class Tnt extends ResourceController
{
    protected $modelName = 'App\Models\Tnt_model';
    protected $format = 'json';
    function index()
    {
        return $this->respond($this->model->findAll()??[], 200);
    }
   
}
