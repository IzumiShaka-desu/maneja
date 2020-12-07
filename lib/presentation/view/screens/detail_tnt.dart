import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:maneja/constant/color_pallete.dart';
import 'package:maneja/model/tips_n_trick.dart';
import 'package:maneja/presentation/components/header_cust.dart';
import 'package:maneja/presentation/components/sliver_header.dart';

class DetailTnt extends StatelessWidget {
  DetailTnt(this.tnt, this.tags);
  final String tags;
  final TipsNTrick tnt;
  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                snap: true,
                stretch: true,
                floating: true,
                pinned: true,
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: size.width / 8.5, right: 10),
                      child: Text(
                        tnt.title,
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                    ),
                  ),
                  background: Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: tags,
                          child: Image.network(
                            tnt.urlImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white.withOpacity(0.6),
                      )
                    ],
                  ),
                ),
                leading: IconButton(
                  icon: Icon(LineIcons.chevron_circle_left),
                  onPressed: () => Get.back(),
                ),
              ),
              SliverCustHeader(
                HeaderCust(
                  height: 50,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    color: Get.theme.primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tnt.dateString,
                          style: TextStyle(
                            color: ColorPallete.textWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      child: Text(tnt.content),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
