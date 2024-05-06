import 'dart:async';

import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/Authentication/login.dart';
import 'package:cv_checker/Authentication/signin.dart';
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

class LoginSignup extends StatefulWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {

  bool showSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width
            ),
            padding: const EdgeInsets.only(top: 80),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgImage.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white.withOpacity(0.7),
              elevation: 2,
              child: Container(
                constraints: const BoxConstraints(minWidth: 100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0),
                  child: showSignUp ? Signin(
                      goLogin: (){
                        setState(() {
                          showSignUp = false;
                        });
                      }
                  ):Login(
                    goSignUp: (){
                      setState(() {
                        showSignUp = true;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
