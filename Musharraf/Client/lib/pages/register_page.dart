import 'package:client/controller/login_controller.dart';
import 'package:client/pages/login_page.dart';
import 'package:client/widgets/otp_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create Your Account!!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,

                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: ctrl.registerNameCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.phone_android),
                  labelText: 'Your Name',
                  hintText: 'Enter Your Name',

                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: ctrl.registerNumberCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.phone_android),
                  labelText: 'Mobile Number',
                  hintText: 'Enter Your Mobile Number',

                ),
              ),
              const SizedBox(height: 20),
              OtpTxtField(
                  otpController: ctrl.otpController,
                  visible: ctrl.otpFieldShown, onComplete: (otp) {
                    ctrl.otpEntered = int.tryParse(otp ?? '0000');
              },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if(ctrl.otpFieldShown){
                    ctrl.addUsers();
                  }else {
                    ctrl.sendOTP();
                  }
              },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text(ctrl.otpFieldShown ?  'Register' : 'Send Otp'),

              ),

              // ElevatedButton(onPressed: () {
              //   ctrl.addUsers();
              // },
              //   style: ElevatedButton.styleFrom(
              //     foregroundColor: Colors.white,
              //     backgroundColor: Colors.deepPurple,
              //   ),
              //   child: Text("Register"),
              // ),
              TextButton(onPressed: () {
                Get.to(const LoginPage());
              },
                  child: const Text('Login'))


            ],
          ),
        ),
      );
    });
  }
}
