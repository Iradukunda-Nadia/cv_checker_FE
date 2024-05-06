import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/Authentication/LoginSignup.dart';
import 'package:cv_checker/Authentication/signin.dart';
import 'package:cv_checker/Jobs/newJob.dart';
import 'package:cv_checker/Recruiter/RHome.dart';
import 'package:cv_checker/Recruiter/RSearch.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RDash extends StatefulWidget {

  const RDash({Key? key}) : super(key: key);

  @override
  State<RDash> createState() => _RDashState();
}

class _RDashState extends State<RDash> with
    RestorationMixin,
    WidgetsBindingObserver,
    SingleTickerProviderStateMixin {
  late TabController controller;

  int _currentIndex = 0;
  int _previousIndex = 0;

  final _scrollController = ScrollController();

  List navChildren = [];
  setNavChildren (){
    navChildren = [
      {
        "title": "Home",
        "onTap": (){
          print("Home");
          _currentIndex = 0;
          controller.animateTo(0);
        }
      },
      {
        "title": "Search",
        "onTap": (){
          print("Search");
          _currentIndex = 0;
          controller.animateTo(1);
        }
      },
      {
        "title": "Post Job",
        "onTap": (){
          print("Post a new Job");
          _currentIndex = 0;
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => const NewJob()));
        }
      },
    ];
  }

  @override
  void initState() {
    setNavChildren();
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    _currentIndex= 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.mainBg,
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: new Offstage(),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    print("Home");
                    _currentIndex = 0;
                    controller.animateTo(0);
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
                Flexible(
                    fit: FlexFit.loose,
                    child: Row(
                      children: navChildren.map<Widget>((data) =>
                          Align(
                            alignment: const AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: InkWell(
                                onTap: data["onTap"],
                                child: Container(
                                  width: 82,
                                  height: 28,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        data['title'],
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
                          )).toList(),
                    )),
                Container(
                  width: 176,
                  height: 100,
                ),
                PopupMenuButton(
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
              ],
            ),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          bottom: false,
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: TabBarView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                RHomeWidget(
                    nextTap: (searchQ){
                      print("to Search");
                      setState(() {_currentIndex = 1;});
                      print("current index; $_currentIndex");
                      controller.animateTo(1);
                    }
                ),
                RSearch(),
              ],
            ),
          ),
        ),
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
