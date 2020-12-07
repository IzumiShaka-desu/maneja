<?php namespace App\Models;

use CodeIgniter\Model;

class Finance_model extends Model{
    protected $table='finance';
    function addDebitTransaction($transaction){
        $transaction['type']='debit';
        return $this->db->table($this->table)->insert($transaction);
    }
    function addCreditTransaction($transaction){
        $transaction['type']='credit';
        return $this->db->table($this->table)->insert($transaction);
    }
    function transactionByUser($idUser){
        return $this->db->table($this->table)->getWhere(['id_user'=>$idUser])->getResultArray();
    }
    function getBalanceByUserId($idUser){
        
        return $this->db->query("SELECT balance($idUser) AS balance ")->getResultArray()[0]??0;
        // return "SELECT balance($idUser) AS balance ";
    }
}