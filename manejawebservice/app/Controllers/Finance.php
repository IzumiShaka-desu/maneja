<?php

namespace App\Controllers;

use CodeIgniter\Config\Services;
use CodeIgniter\RESTful\ResourceController;

class Finance extends ResourceController
{
    protected $modelName = 'App\Models\Finance_model';
    protected $format = 'json';
    function index()
    {
        return $this->respond($this->model->findAll()??[], 200);
    }
    function balance($idUser){
        if($idUser!=null){
            return  $this->respond($this->model->getBalanceByUserId($idUser), 200);;
        }

    }
   function debit($idUser){
       if($idUser!=null){
        $data=[
            "id_user"=>$idUser,
            "value"=>$this->request->getPost('value'),
            "description"=>$this->request->getPost('description'),
        ];
        if($this->model->addDebitTransaction($data)){
            $response = [
                'status' => 200,
                'error' => false,
                'message'=>'success add transaction'
              ];
              return $this->respond($response, 200);
        }else{
            $response = [
                'status' => 500,
                'error' => true,
                'message'=>'cannot add transaction'
              ];
              return $this->respond($response, 200);
        }
    }
   }
   function credit($idUser){
    if($idUser!=null){
        $data=[
            "id_transaction"=>null,
            "id_user"=>$idUser,
            "value"=>$this->request->getPost('value'),
            "description"=>$this->request->getPost('description'),
        ];
        if($this->model->addCreditTransaction($data)){
            $response = [
                'status' => 200,
                'error' => false,
                'message'=>'success add transaction'
              ];
              return $this->respond($response, 200);
        }else{
            $response = [
                'status' => 500,
                'error' => true,
                'message'=>'cannot add trnsaction'
              ];
              return $this->respond($response, 200);
        }
    }
   }
   function transaction($idUser){
    if($idUser!=null){
        return $this->respond($this->model->transactionByUser($idUser)??[],200);
    }
   }
   
}