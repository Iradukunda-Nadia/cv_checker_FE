import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/Authentication/LoginSignup.dart';
import 'package:cv_checker/Authentication/signin.dart';
import 'package:cv_checker/JobSeeker/education.dart';
import 'package:cv_checker/JobSeeker/personalInfo.dart';
import 'package:cv_checker/JobSeeker/skills.dart';
import 'package:cv_checker/JobSeeker/workExperience.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class cvForm extends StatefulWidget {
  const cvForm({Key? key}) : super(key: key);

  @override
  State<cvForm> createState() => _cvFormState();
}

class _cvFormState extends State<cvForm> with
    RestorationMixin,
    WidgetsBindingObserver,
    SingleTickerProviderStateMixin {
  late TabController controller;

  int _currentIndex = 0;
  int _previousIndex = 0;

  final _scrollController = ScrollController();

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this, initialIndex: 0);
    _currentIndex= 0;
    super.initState();
  }

  Widget progressButton(int i, String title){
    print ("current index: $_currentIndex, progress index: $i");
    return InkWell(
      onTap: (){},
      child: Container(
        height: 28,
        constraints: BoxConstraints(maxWidth: 200,
            minWidth: 50),
        decoration: BoxDecoration(
          color: _currentIndex == i? AppColors
              .primaryLighten: _currentIndex>i? AppColors
              .accent2Color: Colors.white,
          border: Border(
            left: BorderSide(width: 1.5, color: AppColors
                .greylighten1),
            right: BorderSide(width: 1.5, color: AppColors
                .greylighten1),
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              title,
              style:
              Theme.of(context).textTheme.bodyMedium!.apply(
                fontFamily: 'Readex Pro',
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar:  AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  print("Home");
                  _currentIndex = 0;
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
              const SizedBox(width: 10,),
            ],
          ),
        ),
        actions: [
          progressButton(0, 'Personal information'),
          progressButton(1, 'Skills'),
          progressButton(2, 'Work Experience'),
          progressButton(3, 'Education'),
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
                    CommonService().logout(context);
                  },
                  value: "logout",
                  child: Row(
                    children: const [
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
      body: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          PersonalInfo(
              nextTap: (){
                print("to work experience");
                setState(() {_currentIndex = 1;});
                print("current index; $_currentIndex");
                controller.animateTo(1);
              }
          ),
          Skills(
              nextTap: (){
                print("back home");
                setState(() {_currentIndex = 2;});
                print("current index; $_currentIndex");
                controller.animateTo(2);
              }
          ),
          WorkExperience(
              nextTap: (){
                print("to education");
                setState(() {_currentIndex = 3;});
                print("current index; $_currentIndex");
                controller.animateTo(3);
              }
          ),
          Education(
              nextTap: (){
                print("to skills");
                setState(() {_currentIndex = 0;});
                print("current index; $_currentIndex");

                //close current page and go back home
                Navigator.of(context).pop();
              }
          )
        ],
      ),
    );
  }
  @override
  // TODO: implement restorationId
  String? get restorationId => 'HomePage';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
  }
}



