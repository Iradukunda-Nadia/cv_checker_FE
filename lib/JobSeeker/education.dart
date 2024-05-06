import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/CommonUI/formFields/CustomTF.dart';
import 'package:cv_checker/JobSeeker/currentCV.dart';
import 'package:cv_checker/JobSeeker/jobseekerHome.dart';
import 'package:cv_checker/Providers/userProvider.dart';
import 'package:cv_checker/Recruiter/RDash.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Education extends StatefulWidget {
  final Function() nextTap;
  const Education({Key? key,
    required this.nextTap
  }) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _levelController = TextEditingController();
  TextEditingController _courseController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
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
                                        'Education History',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          color: Color(0xD61E1E1E),
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Please fill in details about your education',
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
                                  isDropDown: true,
                                  values: const [" ","PHD","Masters", "Bachelors"],
                                  label: 'level of education',
                                  hint: 'Masters..',
                                  controller: _levelController,
                                ),
                                CustomTF(
                                  label: 'Course Title',
                                  hint: '',
                                  controller: _courseController,
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
                                //save education info to the current state provider
                                user.setEducation(
                                    context,
                                    {
                                      "startDate": _startDateController.text,
                                      "endDate": _endDateController.text,
                                      "title": _courseController.text,
                                      "qualification": _levelController.text,
                                      "userId": user.user.id,
                                    }
                                );
                                setState(() {
                                  _startDateController.text == '';
                                  _endDateController.text == '';
                                  _levelController.text == '';
                                });

                                CommonService().showSnack(context, "Education added");


                                form.reset();
                              }
                              else {
                                print("form is invalid");
                                //shows an error message when form is not filled
                                CommonService().showSnack(context,
                                    "Please fill all the details");
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
                                var user = Provider.of<UserProvider>(context, listen: false);
                                //check if form is filled correctly
                                if (form!.validate()) {

                                  //save education info to the current state
                                  // provider

                                  user.setEducation(
                                    context,
                                      {
                                        "startDate": _startDateController.text,
                                        "endDate": _endDateController.text,
                                        "title": _courseController.text,
                                        "qualification": _levelController.text,
                                        "userId": user.user.id,
                                      }
                                  );

                                  CommonService().showSnack(context,
                                      "Data has been saved");
                                  widget.nextTap();
                                }
                                else {
                                  print("form is invalid");
                                  //shows an error message when form is not filled

                                  CommonService().showSnack(context,
                                      "Please fill all the details");
                                }

                              },
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24, 0, 24, 0),
                              elevation: 3,
                              child: const Text('Save', style: TextStyle(
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
        ],
      ),
    );
  }
}