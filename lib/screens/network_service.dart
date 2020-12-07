import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:maneja/constant/type_tx.dart';
import 'package:maneja/model/profile.dart';
import 'package:maneja/model/tips_n_trick.dart';
import 'package:maneja/model/transaction.dart';
import 'package:maneja/screens/spref_service.dart';

abstract class BaseService {
  Future<String> getBalance();
  Future<List<Transaction>> getTransaction();
  Future<Map> login(String email, String password);
  Future<Map> register(String email, String password);
  Future<Map> addTransaction(Transaction transaction, TypeTx type);
  Future<bool> updateProfil(Profile profile);
  Future<Profile> getProfile();
  Future<List<TipsNTrick>> getTipsNTricks();
}

class NetworkService extends BaseService {
  static const String BASEURL = "http://192.168.43.150/";
  static const String LOGINPATH = "auth/login";
  static const String REGISTERPATH = "auth/register";
  static const int TIMEOUT = 10000;
  final SPrefService sPrefService = SPrefService();
  final dio = Dio(
    BaseOptions(
      baseUrl: BASEURL,
      connectTimeout: TIMEOUT,
      receiveTimeout: TIMEOUT,
    ),
  );
  @override
  Future<Map> addTransaction(Transaction transaction, TypeTx type) async {
    int idUser = (await sPrefService.getLoginDetails())['idUser'];
    String endpoint;
    Map<String, dynamic> data = transaction.toJson();
   
    try {
       switch (type) {
      case TypeTx.debit:
        endpoint = "user/$idUser/transaction/debit";
        data['type'] = 'debit';
        break;
      case TypeTx.credit:
        endpoint = "user/$idUser/transaction/credit";
        data['type'] = 'credit';
        break;
    }
      data.removeWhere((key, value) => value == null);

      FormData formData = FormData.fromMap(data);

      var response = await dio.post(
        endpoint,
        data: formData,
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
    }
    return {
      'error': false,
      'statusMessage': 500,
      'message': 'error when connecting the server'
    };
  }

  @override
  Future<String> getBalance() async {
    int idUser = (await sPrefService.getLoginDetails())['idUser'];
    String endpoint = "user/$idUser/balance/";
    try {
      var response = await dio.get(endpoint);
      print(response.data);
      return response.data['balance'];
    } catch (e) {
      debugPrint(e.toString());
    }
    return '0';
  }

  @override
  Future<List<Transaction>> getTransaction() async {
    int idUser = (await sPrefService.getLoginDetails())['idUser'];
    String endpoint = "user/$idUser/transaction/";
    try {
      var response = await dio.get(endpoint);
      return transactionFromJson(jsonEncode(response.data??[]));
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  @override
  Future<Profile> getProfile() async {
    Profile result = Profile();
    int idUser = (await sPrefService.getLoginDetails())['idUser'];
    String path = "user/$idUser/profile";
    try {
      var response = await dio.get(path);
      if (response.statusCode == 200) {
        var json = response.data;
        result = Profile.fromJson(json);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return result;
  }

  @override
  Future<Map> login(String email, String password) async {
    var data = {"email": email, "password": password};
    var result = {'result': false, 'message': 'login gagal'};
    String path = LOGINPATH;
    var response = await dio.post(path, data: FormData.fromMap(data));
    if (response.statusCode == 200) {
      Map json = response.data;
      if (json != null) {
        result = json['data'];
      }
    }

    return result;
  }

  @override
  Future<Map> register(String email, String password) async {
    var data = {"email": email, "password": password};
    var result = {"result": false, "message": "register gagal"};
    String path = REGISTERPATH;
    var response = await dio.post(path, data: FormData.fromMap(data));
    if (response.statusCode == 200) {
      Map json = response.data;
      result = json['data'];
    }
    return result;
  }

  @override
  Future<bool> updateProfil(Profile profile) async {
    if (profile.idUser != null) {
      Map<String, String> json = (profile.toJson()
        ..removeWhere((key, value) => value == null || value is! String));

      String path = "user/${profile.idUser}/profile/edit";

      var response = await dio.post(path, data: FormData.fromMap(json));
      if (response.statusCode == 200) {
        var json = response.data;
        return !json['error'];
      }
    }
    return false;
  }

  @override
  Future<List<TipsNTrick>> getTipsNTricks() async{

    try {
      var response = await dio.get('post');
      return tipsNTrickFromJson(jsonEncode(response.data??[]));
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
