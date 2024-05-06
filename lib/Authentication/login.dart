import 'dart:async';

import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/CommonUI/formFields/CustomTF.dart';
import 'package:cv_checker/JobSeeker/jobseekerHome.dart';
import 'package:cv_checker/Providers/userProvider.dart';
import 'package:cv_checker/Recruiter/RDash.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:cv_checker/Services/jobSeekerService.dart';
import 'package:cv_checker/Services/recruiterService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final Function goSignUp;
  const Login({Key? key,
  required this.goSignUp}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _passwordSigninController = TextEditingController();
  TextEditingController _emailSigninController = TextEditingController();
  TextEditingController _accountTypeController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  final _signInformKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //loginForm
    return Form(
      key: _signInformKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          const SizedBox(
            width: 456,
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SizedBox(height: 20,),

          CustomTF(
            showLabel: false,
            isDropDown: true,
            values: [' ', 'Recruiter', 'Job seeker'],
            isShort: true,
            label: 'Account type',
            hint: 'Account type',
            controller: _accountTypeController,
          ),
          CustomTF(
            showLabel: false,
            isShort: true,
            type: TextInputType.emailAddress,
            label: 'Email',
            hint: 'Enter email',
            controller: _emailSigninController,
          ),
          CustomTF(
            showLabel: false,
            type: TextInputType.visiblePassword,
            isShort: true,
            label: 'Password',
            hint: 'Enter password',
            controller: _passwordSigninController,
          ),
          const SizedBox(height: 20,),
          MaterialButton(
            color: AppColors.primaryColor,
            onPressed: () async {
              final form = _signInformKey.currentState;
              print('Button pressed ...');
              //check if form is filled correctly

              var user = Provider.of<UserProvider>(context, listen: false);

              user.cv.email = _emailSigninController.text;

              if (form!.validate()) {

                if (form!.validate()) {
                  int gender = CommonService()
                      .gender(_genderController.text);

                  var data = {
                    "email": _emailSigninController.text,
                    "password": _passwordSigninController.text,
                  };

                  // Request Login from database with provided
                  // credentials

                  //login up Recruiter
                  if(_accountTypeController.text == "Recruiter"){
                    RecruiterService().login(data).then((result){
                      print(result);
                      if(result['status']) {
                        var user = Provider.of<UserProvider>(context, listen: false);
                        //save user info to the current state provider
                        user.setUser(
                            {
                              "id": result['data']['data']["id"],
                              "fullName": "",
                              "role": result['data']['data']["role"],
                              "email": _emailSigninController.text
                            }
                        );
                        Navigator.of(context).pushReplacement(
                            CupertinoPageRoute(
                                builder: (context) => const RDash()));
                      }
                      else{
                        String err = "error: $result";
                        CommonService().showSnack(context, err);
                      }

                    });
                  }

                  //login up jobseeker
                  else if(_accountTypeController.text == "Job seeker"){
                    JobSeekerService().login(data).then((result) async {
                      print(result);
                      // if login is successful
                      if(result['status']) {
                        var user = Provider.of<UserProvider>(context, listen: false);
                        //save user info to the current state provider
                        user.setUser(
                            {
                              "id": result['data']['data']["id"],
                              "fullName": result['data']['data']["fullName"],
                              "role": result['data']['data']["role"],
                              "email": _emailSigninController.text
                            }
                        );
                        Navigator.of(context).pushReplacement(
                            CupertinoPageRoute(
                                builder: (context) => const JSHome()));
                      }
                      else{
                        String err = "error: $result";
                        CommonService().showSnack(context, err);
                      }

                    });
                  }

                  //
                  else if(_accountTypeController.text == " "){
                    CommonService().showSnack(context, "Please fill all the details");
                  }

                }
                else {
                  print("form is invalid");
                  //shows an error message when form is not filled
                  CommonService().showSnack(context, "Please fill all the details");
                }

              }
              else {
                print("form is invalid");
                //shows an error message when form is not filled
                CommonService().showSnack(context, "Please fill all the details");

              }

            },
            height: 40,
            padding: const EdgeInsetsDirectional.fromSTEB(
                24, 0, 24, 0),
            elevation: 3,
            child: const Text('Log in', style: TextStyle(
                color: Colors.white
            ),),
          ),


          const SizedBox(height: 30,),
          const SizedBox(
            width: 456,
            child: Text(
              'Don’t have an Account?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SizedBox(height: 10,),

          // redirect to signup
          GestureDetector(
            onTap: (){
              widget.goSignUp();
            },
            child: SizedBox(
              width: 456,
              child: Text(
                'Sign up here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50,),


        ],
      ),
    );
  }
}