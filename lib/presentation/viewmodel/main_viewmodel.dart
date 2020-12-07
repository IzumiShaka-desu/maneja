import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maneja/constant/type_tx.dart';
import 'package:maneja/model/tips_n_trick.dart';
import 'package:maneja/model/transaction.dart';
import 'package:maneja/screens/network_service.dart';
import 'package:slider_button/slider_button.dart';

class MainViewmodel extends GetxController {
  var transactions = <Transaction>[].obs;
  var balance = '0'.obs;
  var isLoading = false.obs;
  var tipsNTrick = <TipsNTrick>[].obs;
  Rx<Widget> iconDarkmode = Icon(Icons.wb_sunny_outlined).obs;
  final NetworkService _networkService = NetworkService();
  var selectedIndex = 0.obs;
  var creditVal = 0.obs;
  var creditDescription = " ".obs;
  var pages = <Widget>[].obs;
  Widget get currentPage => pages[selectedIndex.value];
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  changeThemeMode() {
    if (Get.isDarkMode) {
      iconDarkmode.value = Icon(Icons.wb_sunny_outlined);
      Get.changeThemeMode(ThemeMode.light);
    } else {
      iconDarkmode.value = Icon(Icons.nightlight_round);
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  Future<void> loadData() async {
    isLoading.value = true;
    try {
      var result = await Future.wait(
        [
          _networkService.getBalance(),
          _networkService.getTransaction(),
          _networkService.getTipsNTricks()
        ],
      );

      balance.value = (result[0]).toString();
      transactions.assignAll((result[1] as List<Transaction>));
      tipsNTrick.assignAll((result[2] as List<TipsNTrick>));
      print(result[0]);
    } catch (e) {
      printError(
        info: e.toString(),
      );
    }
    isLoading.value = false;
  }

  addCreditTransaction() async {
    Get.bottomSheet(
      Container(
        height: Get.height / 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Send Money',
                      style: Get.textTheme.headline6,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('Your Balance : IDR ${balance.value}')],
                ),
              ),
              TextFormField(
                onChanged: (val) {
                  creditVal.value = int.tryParse(val) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "minimum value is 1000"),
              ),
              TextFormField(
                onChanged: (val) {
                  creditDescription.value = val ?? " ";
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "description ( optional )"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: Get.width,
                child: SliderButton(
                  dismissible: false,
                  action: () async {
                    if ((creditVal.value ?? 0) < 1000) {
                      Get.snackbar('Warning', 'minimum value is 1000');
                    } else {
                      var result = await _networkService.addTransaction(
                        Transaction(
                            value: creditVal.value.toString(),
                            description: creditDescription.value ?? " "),
                        TypeTx.credit,
                      );
                      if(!result['error']){
                        Get.back();
                      }
                      Get.snackbar('notification', result['message']);
                      loadData();
                     
                    }
                  },
                  label: Text(
                    " Slide to Process transaction",
                    style: TextStyle(
                        color: Color(0xff4a4a4a),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  icon: Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Get.theme.backgroundColor,
        ),
      ),
    );
  }
  addDebitTransaction() async {
    Get.bottomSheet(
      Container(
        height: Get.height / 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Top Up Money',
                      style: Get.textTheme.headline6,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text('Your Balance : IDR ${balance.value}')],
                ),
              ),
              TextFormField(
                onChanged: (val) {
                  creditVal.value = int.tryParse(val) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "minimum value is 10000"),
              ),
              TextFormField(
                onChanged: (val) {
                  creditDescription.value = val ?? " ";
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "description ( optional )"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: Get.width,
                child: SliderButton(
                  dismissible: false,
                  action: () async {
                    if ((creditVal.value ?? 0) < 10000) {
                      Get.snackbar('Warning', 'minimum value is 10000');
                    } else {
                      var result = await _networkService.addTransaction(
                        Transaction(
                            value: creditVal.value.toString(),
                            description: creditDescription.value ?? " "),
                        TypeTx.debit,
                      );
                      
                      if(!result['error']){
                        Get.back();
                      }
                      Get.snackbar('notification', result['message']);
                      loadData();
                      Get.back();
                    }
                  },
                  label: Text(
                    " Slide to Process transaction",
                    style: TextStyle(
                        color: Color(0xff4a4a4a),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  icon: Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Get.theme.backgroundColor,
        ),
      ),
    );
  }
}
