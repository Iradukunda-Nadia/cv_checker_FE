import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/AppUtils/lists.dart';
import 'package:cv_checker/CommonUI/candidateCard.dart';
import 'package:cv_checker/CommonUI/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class RSearch extends StatefulWidget {
  const RSearch({Key? key}) : super(key: key);

  @override
  State<RSearch> createState() => _RSearchState();
}

class _RSearchState extends State<RSearch> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, bool> categories = {};
  Map<String, bool> experience = {};
  Map<String, bool> education = {};

  @override
  void initState() {
    setValues();
    super.initState();
  }

  setValues(){
    Lists.categories.forEach((element) {
      categories.putIfAbsent(element, () => false);
    });

    Lists.education.forEach((element) {
      education.putIfAbsent(element, () => false);
    });

    Lists.experience.forEach((element) {
      experience.putIfAbsent(element, () => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          // This is the flip side of the SliverOverlapAbsorber above.
          handle:
          NestedScrollView.sliverOverlapAbsorberHandleFor(
              context),
        ),
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 1406,
                height: 150,
                child: Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 20),
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
              const SizedBox(height: 20,),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                                vertical: 8
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide( //                   <--- right side
                                      color: AppColors.greylighten1,
                                      width: 1.0,
                                    ),
                                  )
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(vertical: 20.0),
                                          child: Text("Filters", style: Theme.of(context)
                                              .textTheme.titleMedium,),
                                        ),
                                        //categories checklist
                                        Text("Categories", style: Theme.of(context)
                                            .textTheme.titleSmall,),
                                        ListView(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          children: categories.keys.map((String key) {
                                            return CheckboxListTile(
                                              title: Text(key, style: Theme.of
                                                (context).textTheme.bodySmall,),
                                              value: categories[key],
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  categories[key] = value?? false;
                                                });
                                              },
                                            );
                                          }).toList(),
                                        ),

                                        //experience checklist
                                        Text("Experience level", style: Theme.of(context)
                                            .textTheme.titleSmall,),
                                        ListView(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          children: experience.keys.map((String key) {
                                            return CheckboxListTile(
                                              title: Text(key, style: Theme.of
                                                (context).textTheme.bodySmall,),
                                              value: experience[key],
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  experience[key] = value?? false;
                                                });
                                              },
                                            );
                                          }).toList(),
                                        ),

                                        //Education checklist
                                        Text("Education Level", style: Theme.of(context)
                                            .textTheme.titleSmall,),
                                        ListView(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          children: education.keys.map((String key) {
                                            return CheckboxListTile(
                                              title: Text(key, style: Theme.of
                                                (context).textTheme.bodySmall,),
                                              value: education[key],
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  education[key] = value?? false;
                                                });
                                              },
                                            );
                                          }).toList(),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 20.0),
                                child: Text("${Lists.candidates.length.toString()} "
                                    "Candidates", style: Theme
                                    .of(context)
                                    .textTheme.titleMedium,),
                              ),

                              Flexible(
                                fit: FlexFit.loose,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(10),
                                    itemCount: Lists.candidates.length,
                                    reverse: false,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {

                                      var candidate =
                                      Lists.candidates[index];

                                      return CandidateCard(
                                        id: candidate['id'],
                                        email: candidate['email'],
                                        image: candidate['image'],
                                        name: candidate['name'],
                                        item: candidate,
                                      );
                                      //}
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
