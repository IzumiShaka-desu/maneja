import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:maneja/constant/color_pallete.dart';
import 'package:maneja/presentation/components/list_Tnt.dart';
import 'package:maneja/presentation/viewmodel/main_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class TntPage extends StatelessWidget {
  final MainViewmodel _mainViewmodel = Get.find(tag: "mc");
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => LiquidPullToRefresh(
          key: _refreshIndicatorKey,
          onRefresh: _mainViewmodel.loadData,
          springAnimationDurationInMilliseconds: 500,
          showChildOpacityTransition: false,
          child: _mainViewmodel.isLoading.value
              ? Shimmer.fromColors(
                  enabled: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemBuilder: (_, __) => Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: 40.0,
                              height: 8.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      itemCount: 6,
                    ),
                  ),
                  baseColor: ColorPallete.mainWhite,
                  highlightColor: ColorPallete.mainGrey,
                )
              : Listtnt(_mainViewmodel.tipsNTrick),
        ),
      ),
    );
  }
}
