import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maneja/constant/color_pallete.dart';
import 'package:maneja/model/tips_n_trick.dart';
import 'package:maneja/presentation/view/screens/detail_tnt.dart';

class Listtnt extends StatelessWidget {
  Listtnt(this.tnt);
  final List<TipsNTrick> tnt;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: (tnt.length < 1)
          ? Center(child: Text('maaf anda tidak mempunyai daftar berita'))
          : ListView.builder(
              itemCount: tnt.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: ()  {
                  Get.to(
                    DetailTnt(
                      tnt[index],
                      tnt[index].title + tnt[index].idTnt,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.all(8),
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        width: size.width * 0.38,
                        child: Stack(
                          children: [
                            Hero(
                              tag: tnt[index].title + tnt[index].idTnt,
                              child: Image.network(
                                tnt[index].urlImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 7),
                                height: 20,
                                color: Colors.blue.withOpacity(0.9),
                                child: Text(
                                  tnt[index].type,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: ColorPallete.mainWhite),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                tnt[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                tnt[index].content,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
