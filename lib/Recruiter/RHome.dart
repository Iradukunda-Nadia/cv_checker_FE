import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/CommonUI/navBar.dart';
import 'package:cv_checker/Recruiter/RSearch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class RHomeWidget extends StatefulWidget {
  final Function() nextTap;
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
                        child: Container(
                          width: 664,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 20, 16, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 0),
                                      child: TextFormField(
                                        key: const ValueKey('searchHome'),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: GoogleFonts.getFont(
                                            'Istok Web',
                                            fontSize: 25,
                                          ),
                                          hintText: 'Search Job or Sector',
                                          hintStyle: Theme.of(context)
                                              .textTheme.bodyMedium!
                                              .apply(
                                              fontFamily: 'Istok Web',
                                              color: AppColors.greylighten1
                                          ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder:
                                          InputBorder.none,
                                          prefixIcon: const Icon(
                                            Icons.search_sharp,
                                          ),
                                        ),
                                        style: Theme.of(context)
                                            .textTheme.bodyMedium!
                                            .apply(
                                          fontFamily: 'Istok Web',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  color: AppColors.primaryColor,
                                  onPressed: () {
                                    print('Button pressed ...');
                                    widget.nextTap();
                                  },
                                  child: Text('Search', style: TextStyle(
                                      color: Colors.white
                                  ),),
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  elevation: 3,
                                ),
                              ],
                            ),
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
