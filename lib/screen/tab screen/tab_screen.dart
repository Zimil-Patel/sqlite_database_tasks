import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/screen/add%20screen/add_screen.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

import '../../controller/tab_controller.dart';
import '../../main.dart';


class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [

           GetBuilder<TabsController>(builder: (tabCtrl) => tabCtrl.tabScreen,),

          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: height * 0.139,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: defPadding * 2, horizontal: defPadding * 4),
                    padding: const EdgeInsets.symmetric(horizontal: defPadding * 2.5, vertical: defPadding * 1.5),
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Row(
                      children: [
                        TabIcon(icon: Icons.home_rounded, index: 0,),
                        Spacer(flex: 1,),
                        TabIcon(icon: Icons.filter_list_alt, index: 1,),
                        Spacer(
                          flex: 5,
                        ),
                        TabIcon(icon: Icons.settings, index: 2,),
                        Spacer(flex: 1,),
                        TabIcon(icon: Icons.bar_chart, index: 3,),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Get.to(() => const AddScreen());
                      },
                      child: Hero(
                        tag: 'addScreen',
                        child: CircleAvatar(
                          radius: height * 0.032,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: Icon(
                            Icons.add,
                            size: height * 0.03,
                            color: Colors.white,
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
  }
}

class TabIcon extends StatelessWidget {
  const TabIcon({
    super.key, required this.icon, required this.index,
  });

  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: (){

        tabController.setTabIndex(index);

      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // TAB ICON
           Obx(
               () => Icon(icon, color: index == tabController.tabIndex.value ? third : Colors.white, size: height * 0.028,)),

          Obx(() => index == tabController.tabIndex.value ? const Spacer() : const SizedBox()),


          // SELECTED INDEX INDICATOR
          Obx(() =>
          index == tabController.tabIndex.value ? Container(
            height: height * 0.005,
            width: width * 0.04,
            decoration: BoxDecoration(
              color:  third,
              borderRadius: BorderRadius.circular(10)
            ),
          ) : const SizedBox(),),
        ],
      ),
    );
  }
}
