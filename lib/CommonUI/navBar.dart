import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/Authentication/LoginSignup.dart';
import 'package:cv_checker/Authentication/signin.dart';
import 'package:cv_checker/Providers/userProvider.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';


class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final Size preferredSize = Size.fromHeight(70);
  final List navChildren;
  NavBar({Key? key, required this.navChildren}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);

    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
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
            const SizedBox(width: 10,),
            Flexible(
              fit: FlexFit.loose,
                child: Row(
                  children: widget.navChildren.map<Widget>((data) =>
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: InkWell(
                            onTap: (){
                              if (kDebugMode) {
                                print(data['title']);
                              }
                              data["onTap"]();
                            },
                            child: Container(
                              width: 100,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors
                                    .greylighten1, width: 0.5)
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
              width: 150,
              height: 100,
            ),

            PopupMenuButton(
              offset: Offset(12, 80),
              child: Container(
                width: 400,
                height: 53,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Logged in as: ${user.user.fullName!}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 70,
                        height: 70,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.account_circle_sharp)
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
      actions: const [],
      centerTitle: false,
      elevation: 0,
    );
  }
}
