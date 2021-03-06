import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maneja/constant/color_pallete.dart';
import 'package:maneja/model/profile.dart';
import 'package:maneja/presentation/viewmodel/auth_viewmodel.dart';
import 'package:maneja/presentation/viewmodel/main_viewmodel.dart';
import 'package:maneja/screens/network_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfilePage> {
  List<Widget> form = [];
  final AuthViewmodel _authViewmodel = Get.find(tag: "ac");
  final Map<String, Map<String, dynamic>> _element = {
    'nama': {
      'label': 'nama',
      'controller': TextEditingController(),
      'isEdit': false
    },
    'phone': {
      'label': 'nomor telepon',
      'controller': TextEditingController(),
      'isEdit': false
    },
    'pekerjaan': {
      'label': 'pekerjaan',
      'controller': TextEditingController(),
      'isEdit': false
    }
  };
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          child: LayoutBuilder(
            builder: (context, constraint) => Obx(
              () {
                if (_authViewmodel.loginStatus.value) {
                  initWidget();
                }
                return Container(
                  constraints: constraint,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: (_authViewmodel.loginStatus.value)
                                  ? SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(children: form),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                color: Colors.red,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      bool willLogout = await showDialog<bool>(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text('peringatan'),
                                          content: Text('yakin akan logout?'),
                                          actions: [
                                            FlatButton(
                                              color: Colors.blue,
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(false),
                                              child: Text('tidak'),
                                            ),
                                            FlatButton(
                                              color: Colors.redAccent,
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(true),
                                              child: Text('ya'),
                                            )
                                          ],
                                        ),
                                      );

                                      if (willLogout ?? false) {
                                        Get.delete<MainViewmodel>(tag: "mc");

                                        _authViewmodel.logOut();
                                      }
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'logout',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.exit_to_app_sharp,
                                            color: ColorPallete.mainWhite,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  initWidget() {
    {
      _element['nama']['controller'].text =
          _authViewmodel.profile.value.nama ?? ' ';
      _element['phone']['controller'].text =
          _authViewmodel.profile.value.phone ?? ' ';
      _element['pekerjaan']['controller'].text =
          _authViewmodel.profile.value.pekerjaan ?? ' ';
    }
    List<Widget> widgets = [];
    widgets.addAll([
      CircleAvatar(
        maxRadius: 50,
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Text(
          _authViewmodel.email.value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ]);
    _element.forEach(
      (key, value) {
        widgets.add(
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: value['controller'],
                  enabled: value['isEdit'],
                  decoration: InputDecoration(labelText: value['label']),
                  keyboardType: (key == 'phone')
                      ? TextInputType.phone
                      : TextInputType.text,
                ),
              ),
              IconButton(
                icon: (_element[key]['isEdit'])
                    ? Icon(Icons.save)
                    : Icon(Icons.edit),
                onPressed: () async {
                  if (_element[key]['isEdit']) {
                    Profile profile = Profile.fromJson(
                      {
                        key: value['controller'].text,
                        'id_user': _authViewmodel.uid.value.toString()
                      },
                    );

                    bool result =
                        (await NetworkService().updateProfil(profile)) ?? false;
                    _authViewmodel.loadAuthentication();
                    Get.showSnackbar(
                      GetBar(
                          duration: Duration(seconds: 2),
                          message: key +
                              " ${(result) ? 'berhasil' : 'gagal'} di ubah"),
                    );
                  }
                  setState(
                    () {
                      _element[key]['isEdit'] = !_element[key]['isEdit'];
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
    form = widgets;
  }
}
