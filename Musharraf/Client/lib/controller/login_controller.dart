import 'dart:math';

import 'package:client/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

import '../model/user/user.dart';

class LoginController extends GetxController {
  GetStorage box = GetStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;
  
  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  TextEditingController loginNumberCtrl = TextEditingController();
  bool otpFieldShown = false;
  int? otpSent ;
  int? otpEntered ;
  User? loginUser;
  
  @override
  void onReady() {
    Map<String, dynamic>? user = box.read('loginUser');
    if(user!=null){
      Get.to(const HomePage());
      loginUser = User.fromJson(user);
    }
    super.onReady();
  }

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }

  addUsers() {
    try {
      if(otpSent == otpEntered){
        DocumentReference doc = userCollection.doc();
        User user = User(
          id: doc.id,
          name: registerNameCtrl.text,
          number: int.tryParse(registerNumberCtrl.text),

        );
        final userJson = user.toJson();
        doc.set(userJson);
        Get.snackbar(
            'Success', 'User Added Successfully', colorText: Colors.green);
        registerNumberCtrl.clear();
        registerNameCtrl.clear();
        otpController.clear();
      }else{
        Get.snackbar('ERROR', 'OTP is Incorrect', colorText: Colors.redAccent);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    }
  }

  sendOTP(){
    try {
      if(registerNameCtrl.text.isEmpty ||registerNumberCtrl.text.isEmpty ){
        Get.snackbar('Error', 'Please Add Fields', colorText: Colors.red);
        return;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      print(otp);
      if(otp!=null){
            otpFieldShown = true;
            otpSent = otp;

            Get.snackbar('Success', 'OTP sent Successfully', colorText: Colors.green);
          }else{
            Get.snackbar('Error', 'OTP Request Failed', colorText: Colors.red);
          }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }

  Future<void> loginWithPhone() async {

    try {
      String phoneNumber = loginNumberCtrl.text;
      if(phoneNumber.isNotEmpty){
            var querySnapshot = await userCollection.where('number',isEqualTo: int.tryParse(phoneNumber)).limit(1).get();
            if(querySnapshot.docs.isNotEmpty){
              var userDoc = querySnapshot.docs.first;
              var userData = userDoc.data() as Map<String,dynamic>;
              box.write('loginUser', userData);
              loginNumberCtrl.clear();
              Get.to(HomePage());
              Get.snackbar('Success', 'Login Successful',colorText: Colors.green);
            }else{
              Get.snackbar('Error', 'User not found, Please Register',colorText: Colors.red);
            }
          }else{
            Get.snackbar('Error', 'Please Enter the Phone Number',colorText: Colors.red);
          }
    } catch (e) {
      print(e);
    }

}
}
