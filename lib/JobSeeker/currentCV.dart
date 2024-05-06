import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/Providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class CurrentCV extends StatefulWidget {
  const CurrentCV({Key? key}) : super(key: key);

  @override
  State<CurrentCV> createState() => _CurrentCVState();
}

class _CurrentCVState extends State<CurrentCV> {



  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'CurrentCV',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Montserrat',
                color: const Color(0xD61E1E1E),
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: 545,
            padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 31),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 311,
                  height: 64,
                  child: Text(
                    user.cv.jobSeekerName?? '',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 400,
                  height: 40,
                  child: Text(
                    'Job Interest: ${user.cv.jobSector?? ''}',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 429,
                        height: 25,
                        child: Text(
                          'PERSONAL DETAILS ',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 429,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 15,
                              child: Text(
                                'Email',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 20,
                              child: Text(
                                user.cv.email?? '',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greylighten1, width: 1.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 429,
                        height: 25,
                        child: Text(
                          'Experience ',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      user.cv.experience != [] && user.cv.experience != null ?
                      Flexible(
                          fit: FlexFit.loose,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: user.cv.experience!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var experience = user.cv.experience![index];
                              return SizedBox(
                                width: 429,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height: 15,
                                      child: Text(
                                        '${experience['startDate']} - '
                                            '${experience['endDate']}',
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 250,
                                      height: 20,
                                      child: Text(
                                        '${experience['jobRole']} - '
                                            '${experience['company']}',
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )):
                      SizedBox(
                        width: 429,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 15,
                              child: Text(
                                'Start Date - End Date',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 20,
                              child: Text(
                                'Description',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greylighten1, width: 1.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 429,
                        height: 25,
                        child: Text(
                          'Education ',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      user.cv.education != [] && user.cv.education != null ?
                      Flexible(
                          fit: FlexFit.loose,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: user.cv.education!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var education = user.cv.education![index];
                              return SizedBox(
                                width: 429,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height: 15,
                                      child: Text(
                                        '${education['startDate']} - '
                                            '${education['endDate']}',
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 250,
                                      height: 20,
                                      child: Text(
                                        '${education['title']} ( '
                                            '${education['qualification']})',
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )):
                      SizedBox(
                        width: 429,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 15,
                              child: Text(
                                'Start Date - End Date',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 20,
                              child: Text(
                                'Course Description',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greylighten1, width: 1.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 429,
                        height: 25,
                        child: Text(
                          'Skills',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 429,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              height: 15,
                              child: Text(
                                'Skills',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            user.cv.skills != [] && user.cv.skills !=
                                null ? SizedBox(
                              width: 250,
                              height: 20,
                              child: Text(
                                user.cv.skills!.join(', ').toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ):
                            const SizedBox(
                              width: 250,
                              height: 20,
                              child: Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
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
        ],
      ),
    );
  }
}
