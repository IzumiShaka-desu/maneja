import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maneja/presentation/viewmodel/auth_viewmodel.dart';
import 'package:maneja/presentation/viewmodel/main_viewmodel.dart';

class HomePage extends StatelessWidget {
  final MainViewmodel _mainViewmodel = Get.find(tag: "mc");
  final AuthViewmodel _authViewmodel = Get.find(tag: "ac");
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 2 / 1,
            child: Obx(
              () => Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 10),
                        Text(
                            'Hello, ${_authViewmodel.profile.value?.nama ?? ' '}')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              'IDR ${_mainViewmodel.balance}',
                              style: Get.textTheme.headline4,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Your Balance'),
                          Text(
                              '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute} ')
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                  ),
                  color: Get.theme.primaryColor,
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: FlatButton(
                    color: Get.theme.primaryColor,
                    onPressed: _mainViewmodel.addCreditTransaction,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.send_outlined),
                          Text('Send money')
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: FlatButton(
                    color: Get.theme.primaryColor,
                    onPressed: () => _mainViewmodel.addDebitTransaction(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add_circle_outline),
                          Text('Top up money')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  child: Text(
                    'Transactions',
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => _mainViewmodel.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : _mainViewmodel.transactions.length < 1
                      ? Center(
                          child:
                              Text('sorry you haven\'t done any transaction'),
                        )
                      : Container(
                          child: ListView.builder(
                            itemCount: _mainViewmodel.transactions.length,
                            itemBuilder: (ctx, index) => Container(
                              child: _mainViewmodel.transactions[index].type ==
                                      'debit'
                                  ? ListTile(
                                      leading: Icon(Icons.trending_up),
                                      title: Text(_mainViewmodel
                                              .transactions[index]
                                              .description ??
                                          " "),
                                      subtitle: Text("+"+_mainViewmodel
                                              .transactions[index]
                                              .value ??
                                          " "),
                                    )
                                  : ListTile(
                                      leading: Icon(Icons.trending_down),
                                      title: Text(_mainViewmodel
                                              .transactions[index]
                                              .description ??
                                          " "),
                                      subtitle: Text("-"+_mainViewmodel
                                              .transactions[index]
                                              .value ??
                                          " "),
                                    ),
                            ),
                          ),
                        ),
            ),
          )
        ],
      ),
    );
  }
}
