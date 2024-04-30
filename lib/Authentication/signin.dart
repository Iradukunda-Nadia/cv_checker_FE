import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/CommonUI/formFields/CustomTF.dart';
import 'package:cv_checker/JobSeeker/jobseekerHome.dart';
import 'package:cv_checker/Providers/userProvider.dart';
import 'package:cv_checker/Recruiter/RDash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  TextEditingController _passwordSigninController = TextEditingController();
  TextEditingController _passwordSignupController = TextEditingController();
  TextEditingController _emailSigninController = TextEditingController();
  TextEditingController _emailSignupController = TextEditingController();
  TextEditingController _accountTypeController = TextEditingController();

  final _signUpformKey = new GlobalKey<FormState>();
  final _signInformKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 133),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgImage.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Form(
                key: _signUpformKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 16,),
                    const SizedBox(
                      width: 456,
                      child: Text(
                        'Sign up here',
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
                    const SizedBox(height: 20,),
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

                    CustomTF(
                      showLabel: false,
                      isDropDown: true,
                      values: [' ', 'Recruiter', 'Job seeker'],
                      type: TextInputType.visiblePassword,
                      isShort: true,
                      label: 'Account type',
                      hint: 'Account type',
                      controller: _accountTypeController,
                    ),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      color: AppColors.primaryColor,
                      onPressed: () {
                        final form = _signUpformKey.currentState;
                        print('Button pressed ...');
                        //check if form is filled correctly
                        if (form!.validate()) {
                          Navigator.of(context).pushReplacement(CupertinoPageRoute(
                              builder: (context) => RDash()));
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
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Form(
                key: _signInformKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                    const SizedBox(
                      width: 456,
                      child: Text(
                        'Sign in here.',
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
                    const SizedBox(height: 20,),
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
                      onPressed: () {
                        final form = _signInformKey.currentState;
                        print('Button pressed ...');
                        //check if form is filled correctly

                        var user = Provider.of<UserProvider>(context, listen: false);

                        user.cv.email = _emailSigninController.text;

                        if (form!.validate()) {
                          Navigator.of(context).pushReplacement(CupertinoPageRoute(
                              builder: (context) => JSHome()));
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
                      child: const Text('Sign in', style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                    const SizedBox(height: 100,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
