import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/CommonUI/formFields/CustomTF.dart';
import 'package:cv_checker/JobSeeker/currentCV.dart';
import 'package:cv_checker/JobSeeker/jobseekerHome.dart';
import 'package:cv_checker/Recruiter/RDash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../Providers/userProvider.dart';


class WorkExperience extends StatefulWidget {
  final Function() nextTap;
  const WorkExperience({Key? key,
    required this.nextTap
  }) : super(key: key);

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(color: Color(0x0FD9D9D9)),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 661,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(color: Colors.white),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Work Experience',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      color: Color(0xD61E1E1E),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Please fill in any releveant Work experience',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      color: Colors.black.withOpacity(0.3199999928474426),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTF(
                                    isShort: true,
                                    isDate: true,
                                    label: 'Start Date',
                                    hint: '01-01-2001',
                                    controller: _startDateController,
                                  ),
                                  const SizedBox(width: 10,),
                                  CustomTF(
                                    isShort: true,
                                    isDate: true,
                                    label: 'EndDate',
                                    hint: '01-01-2001',
                                    controller: _endDateController,
                                  ),
                                ],
                              ),
                            ),
                            CustomTF(
                              label: 'Job Role',
                              hint: 'Android Developer',
                              controller: _positionController,
                            ),
                            CustomTF(
                              label: 'company',
                              hint: 'ABC corp',
                              controller: _companyController,
                            ),
                            CustomTF(
                              label: 'Description',
                              hint: '',
                              controller: _descriptionController,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Add more", style: TextStyle(
                          color: AppColors.primaryColor,
                        ),),
                        IconButton(onPressed: (){
                          final form = _formKey.currentState;
                          print('Add pressed ...');
                          //check if form is filled correctly
                          if (form!.validate()) {
                            var user = Provider.of<UserProvider>(context, listen: false);
                            //save experience to the current state provider
                            user.setWorkExperience(
                                {
                                  "startDate": _startDateController.text,
                                  "endDate": _endDateController.text,
                                  "role": _positionController.text,
                                  "company": _companyController.text,
                                  "description": _descriptionController.text
                                }
                            );
                            print('saved experience');
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                    Text( "Experience added")
                                ));
                            setState(() {
                              _startDateController.text == '';
                              _endDateController.text == '';
                            });

                            form.reset();
                          }
                          else {
                            print("form is invalid");
                            //shows an error message when form is not filled
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                    Text( "Please fill all thedetails")
                                ));
                          }
                        }, icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: AppColors.primaryColor,
                          size: 50,
                        ))
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greylighten1, width: 1.0),
                          ),
                          child: MaterialButton(
                            color: Color(0x0FD9D9D9),
                            onPressed: () {
                              print('Button pressed ...');
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: JSHome(),
                                ),
                              );
                            },
                            child: Text('Cancel', style: TextStyle(
                                color: Colors.white
                            ),),
                            height: 40,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 24, 0),
                            elevation: 3,
                          ),
                        ),
                        const SizedBox(width: 30,),
                        MaterialButton(
                          color: AppColors.primaryColor,
                          onPressed: () {
                            final form = _formKey.currentState;
                            print('Button pressed ...');
                            //check if form is filled correctly
                            if (form!.validate()) {
                              var user = Provider.of<UserProvider>(context, listen: false);
                              //save experience info to the current state
                              // provider
                              user.setWorkExperience(
                                  {
                                    "startDate": _startDateController.text,
                                    "endDate": _endDateController,
                                    "role": _positionController.text,
                                    "company": _companyController.text,
                                    "description": _descriptionController.text
                                  }
                              );
                              widget.nextTap();
                            }
                            else {
                              print("form is invalid");
                              //shows an error message when form is not filled
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                      Text( "Please fill all thedetails")
                                  ));
                            }

                          },
                          height: 40,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 0, 24, 0),
                          elevation: 3,
                          child: const Text('Proceed >>', style: TextStyle(
                              color: Colors.white
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,child: CurrentCV())
            ],
          ),
        ),
      ),
    );
  }
}
