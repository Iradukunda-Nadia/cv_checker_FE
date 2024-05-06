import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/CommonUI/navBar.dart';
import 'package:cv_checker/CommonUI/searchWidget.dart';
import 'package:cv_checker/Recruiter/RSearch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class RHomeWidget extends StatefulWidget {
  final Function(String? search) nextTap;
  const RHomeWidget({super.key,
  required this.nextTap
  });

  @override
  State<RHomeWidget> createState() => _RHomeWidgetState();
}

class _RHomeWidgetState extends State<RHomeWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.75,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: 100,
                    height: 0,
                    decoration: const BoxDecoration(
                      color: Color(0x0AFFFFFF),
                      shape: BoxShape.rectangle,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0, 1),
                      child: Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(25, 20, 25, 60),
                        child: Text(
                          'Helping you hire the right person for the job',
                          style: Theme.of(context)
                              .textTheme.titleLarge!
                              .apply(
                            fontFamily: 'Montserrat',
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Container(
                            width: 240,
                            height: 372,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/doc.jpg',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                          child: Container(
                            width: 256,
                            height: 275,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                alignment: const AlignmentDirectional(0, 0),
                                image: Image.asset(
                                  'assets/images/plumber.png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 324,
                    height: 100,
                    child: Align(
                      alignment: const AlignmentDirectional(1, -1),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                        child: Column(
                          children: [
                            SearchWidget(
                              searchController: searchController,
                              onSearch: (){
                                widget.nextTap(searchController.text);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(70, 0, 0, 0),
                          child: Container(
                            width: 256,
                            height: 275,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                alignment: const AlignmentDirectional(0, 0),
                                image: Image.asset(
                                  'assets/images/chef.jpg',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                          child: Container(
                            width: 248,
                            height: 372,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/coder.png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
