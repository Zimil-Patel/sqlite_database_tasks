import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlite_database_tasks/controller/helper/user_db_helper.dart';
import 'package:sqlite_database_tasks/model/user_model.dart';

class UserController extends GetxController {

  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  RxInt genderValue = 0.obs;

  Uint8List? image;
  RxList<UserModel> userList = <UserModel>[].obs;
  RxBool isRegistered = false.obs;
  RxInt currentUser = 0.obs;
  RxBool isEditing = false.obs;


  Future<void> _init() async {
    await fetchRecord();
    await getRegisterPreference();
  }

  UserController(){
    log("Called user constructor...");
    _init();
  }

  // SET IS EDIT
  void setIsEditing(value){
    isEditing.value = value;
  }

  // SET GENDER VALUE
  void setGenderValue(int value){
    genderValue.value = value;
  }

  void setUserValue(UserModel model){
    txtFirstName.text = model.firstName;
    txtLastName.text = model.lastName;
    txtEmail.text = model.email;
    txtPhone.text = model.phoneNumber;
    txtAge.text = model.age == null ? 'Set age' : model.age.toString();
    if(model.gender != null){
      if (model.gender?.toLowerCase() == 'male') {
        genderValue.value = 0;
      } else {
        genderValue.value = 1;
      }
    } else {
      genderValue.value = 3;
    }
    image = model.profilePicture ?? null;
    update();
  }

  // SET REGISTER PREFERENCE
  Future<void> setRegisterPreference(bool value) async {
    isRegistered.value = value;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final result = await preferences.setBool('isRegistered', value);
    if(result){
      log("Preference set...");
    } else {
      log("Failed to set preference");
    }
  }

  // GET REGISTER PREFERENCE
  Future<void> getRegisterPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final result = preferences.getBool('isRegistered') ?? false;
    isRegistered.value = result;
    log("Got preference : $isRegistered");
  }

  void clearController() {
    txtFirstName.clear();
    txtLastName.clear();
    txtEmail.clear();
    txtPassword.clear();
    txtPhone.clear();
  }


  // SET IMAGE
  Future<void> setImage() async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    if(xFile != null) {
      image = await xFile.readAsBytes();
    }
    update();
  }

  // INSERT USER RECORD
  Future<int> insertRecord(UserModel userModel) async {
    final result = await UserDbHelper.userDbHelper.dbInsertRecord(userModel);
    await fetchRecord();
    if (result == 1){
      setRegisterPreference(true);
    } else {
      setRegisterPreference(false);
    }
    return result;
  }

  // FETCH USER RECORDS
  Future<void> fetchRecord() async {
    final result = await UserDbHelper.userDbHelper.dbFetchRecord();
    userList.value = result.map((e) => UserModel.fromDb(e)).toList();
  }

  // UPDATE USER RECORD
  Future<void> updateRecord(UserModel userModel) async {
    await UserDbHelper.userDbHelper.dbUpdateRecord(userModel);
    await fetchRecord();
  }
}