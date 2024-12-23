import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/user_controller.dart';

import '../../../main.dart';
import '../../../utils.dart';


class ProfilePictureCircle extends StatelessWidget {
  const ProfilePictureCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defPadding * 1.5),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () async {
            await userController.setImage();
          },
          child: Column(
            children: [
              GetBuilder<UserController>(
                builder: (myCtrl) =>  CircleAvatar(
                  backgroundImage: myCtrl.image !=
                      null
                      ? MemoryImage(myCtrl.image!)
                      : const AssetImage('assets/images/profile.png'),
                  radius: height * 0.05,
                ),
              ),
              const SizedBox(height: defPadding),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, size: height * 0.02, color: Colors.blue,),
                  const SizedBox(width: defPadding / 2,),
                  Text('Edit', style: TextStyle(fontSize: height * 0.018, color: Colors.blue),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
