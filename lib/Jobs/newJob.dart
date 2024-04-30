import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/Authentication/signin.dart';
import 'package:cv_checker/CommonUI/formFields/CustomTF.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewJob extends StatefulWidget {
  const NewJob({Key? key}) : super(key: key);

  @override
  State<NewJob> createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {

  final _formKey = new GlobalKey<FormState>();

  TextEditingController _jobTitleController = TextEditingController();
  TextEditingController _experienceLevelController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _yrsController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _webLinkController = TextEditingController();
  TextEditingController _skillsController = TextEditingController();

  /*String? company;
  String? webLink;
  String? yrs;
  String? location;
  List? skills;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  print("Home");
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 202,
                    height: 100,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            'assets/images/Jobs.co-4.png',
                          ),
                        )
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                child: InkWell(
                  onTap: (){
                    if (kDebugMode) {
                      print('New Job');
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 48,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "New Job",
                          style:
                          Theme.of(context).textTheme.bodyMedium!.apply(
                            fontFamily: 'Readex Pro',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: PopupMenuButton(
              offset: Offset(12, 80),
              child: Container(
                width: 176,
                height: 53,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 70,
                        height: 70,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/536/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.textColor,
                      size: 24,
                    ),
                  ],
                ),
              ),
              onSelected: (String value) {},
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  onTap: (){
                    print('logout');
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Signin()),
                            (Route<dynamic> route) => false);
                  },
                  value: "logout",
                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color:Colors.black,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(color: Color(0x0FD9D9D9)),
                  constraints: const BoxConstraints(
                    maxWidth: 800
                  ),
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
                                'New Job posting',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Color(0xD61E1E1E),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Add details for your new job posting below',
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
                        CustomTF(
                          label: 'Job Title',
                          hint: '',
                          controller: _jobTitleController,
                        ),
                        CustomTF(
                          isDropDown: true,
                          values: [" ","Entry-level","Mid-level","Expert"],
                          label: 'Experience Level Required',
                          hint: '',
                          controller: _experienceLevelController,
                        ),
                        CustomTF(
                          label: 'Special Skills',
                          hint: '',
                          controller: _skillsController,
                        ),
                        CustomTF(
                          label: 'Website Link',
                          hint: '',
                          controller: _webLinkController,
                        ),
                        CustomTF(
                          label: 'Location',
                          hint: '',
                          controller: _webLinkController,
                        ),
                        CustomTF(
                          label: 'Job description',
                          hint: '',
                          isMultiline: true,
                          controller: _descriptionController,
                        ),

                        SizedBox(height: 30,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                  Navigator.of(context).pop();
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

                                /*if (form!.validate()) {
                                  var user = Provider.of<UserProvider>(context, listen: false);
                                  //save personal info to the current state provider
                                  user.setPersonalInfo(
                                      {
                                        "name": "${_firstNameController.text} ${_lastNameController.text}",
                                        "phone": _phoneController.text,
                                        "email": _emailController.text,
                                        "dob": _dobController.text
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
                                }*/

                              },
                              height: 40,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24, 0, 24, 0),
                              elevation: 3,
                              child: const Text('Post Job', style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          ],
                        ),

                        const SizedBox(height: 50,),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
