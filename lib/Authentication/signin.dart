import 'dart:async';

import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/CommonUI/formFields/CustomTF.dart';
import 'package:cv_checker/JobSeeker/jobseekerHome.dart';
import 'package:cv_checker/Providers/userProvider.dart';
import 'package:cv_checker/Recruiter/RDash.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:cv_checker/Services/cvService.dart';
import 'package:cv_checker/Services/jobSeekerService.dart';
import 'package:cv_checker/Services/recruiterService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  final Function goLogin;
  const Signin({Key? key,
  required this.goLogin}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController _passwordSignupController = TextEditingController();
  TextEditingController _emailSignupController = TextEditingController();
  TextEditingController _accountTypeController = TextEditingController();
  TextEditingController _nameSignupController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  final _signUpformKey = new GlobalKey<FormState>();

  @override
  void initState() {
    _accountTypeController.addListener(() {
        setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _signUpformKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            const SizedBox(
              width: 456,
              child: Text(
                'Sign Up',
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
              label: 'Full Name',
              hint: 'Enter your name here',
              controller: _nameSignupController,
            ),
            CustomTF(
              showLabel: false,
              isShort: true,
              type: TextInputType.emailAddress,
              label: 'Email',
              hint: 'Enter email',
              controller: _emailSignupController,
            ),
            CustomTF(
              showLabel: false,
              type: TextInputType.visiblePassword,
              isShort: true,
              label: 'Password',
              hint: 'Enter password',
              controller: _passwordSignupController,
            ),

            //additional field DOB for job seeker
            _accountTypeController.text != "Job seeker"?
            Offstage():CustomTF(
              isShort: true,
              isDate: true,
              label: 'D.O.B',
              hint: 'Enter your date of birth',
              controller: _dobController,
            ),

            //additional field for gender for job seeker
            _accountTypeController.text != "Job seeker"?
            Offstage():CustomTF(
              isDropDown: true,
              values: [' ', 'Male', 'Female', 'Other'],
              isShort: true,
              label: 'Gender',
              hint: 'Please select your gender',
              controller: _genderController,
            ),


            const SizedBox(height: 20,),
            // Sign up button
            MaterialButton(
              color: AppColors.primaryColor,
              onPressed: () {
                final form = _signUpformKey.currentState;
                print('Button pressed ...');
                //check if form is filled correctly
                if (form!.validate()) {
                  int gender = CommonService()
                      .gender(_genderController.text);

                  var data = _accountTypeController.text != "Job "
                      "seeker"?
                  {
                    "email": _emailSignupController.text,
                    "password": _passwordSignupController.text,
                    "fullname": _nameSignupController.text,
                  }:
                  {
                    "email": _emailSignupController.text,
                    "password": _passwordSignupController.text,
                    "fullname": _nameSignupController.text,
                    "doB": CommonService().dateLong(_dobController.text),
                    "gender": gender,
                  };

                  //Sign up Recruiter
                  if(_accountTypeController.text == "Recruiter"){
                    RecruiterService().signUp(data).then((result){
                      print(result);
                      if(result['status']) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                Text("Account Created, please login")
                            ));
                        widget.goLogin();
                      }
                      else{
                        String err = "error: $result";
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                Text(err)
                            ));
                      }

                    });
                  }

                  //Sign up jobseeker
                  else if(_accountTypeController.text == "Job seeker"){
                    JobSeekerService().signUp(data).then((result) async {
                      print(result);

                      if(result['status']) {
                        //Save user data to cv and locally
                        var user = Provider.of<UserProvider>(context, listen:
                        false);

                        user.setUser({
                          "fullName": _nameSignupController.text,
                          "role": _accountTypeController.text,
                          "email": _emailSignupController.text
                        });


                        /*await CvService().createCV(context);*/

                        CommonService().showSnack(context, "Account Created, "
                            "please login");
                        widget.goLogin();
                      }
                      else{
                        String err = "error: $result";

                        CommonService().showSnack(context, err);
                      }
                    });
                  }

                  //
                  else if(_accountTypeController.text == " "){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                            Text( "Please fill all the details")
                        ));
                  }

                }
                else {
                  print("form is invalid");
                  //shows an error message when form is not filled
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                          Text( "Please fill all the details")
                      ));
                }
              },
              height: 40,
              padding: const EdgeInsetsDirectional.fromSTEB(
                  24, 0, 24, 0),
              elevation: 3,
              child: const Text('Sign up', style: TextStyle(
                  color: Colors.white
              ),),
            ),

            const SizedBox(height: 30,),
            const SizedBox(
              width: 456,
              child: Text(
                'Already have an Account?',
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
            const SizedBox(height: 16,),

            // redirect to login
            GestureDetector(
              onTap: (){
                widget.goLogin();
              },
              child: SizedBox(
                width: 456,
                child: Text(
                  'Login here.',
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
      ),
    );
  }
}
