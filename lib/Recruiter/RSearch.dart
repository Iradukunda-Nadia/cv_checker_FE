import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/AppUtils/lists.dart';
import 'package:cv_checker/CommonUI/candidateCard.dart';
import 'package:cv_checker/CommonUI/fetchingLoader.dart';
import 'package:cv_checker/CommonUI/navBar.dart';
import 'package:cv_checker/CommonUI/searchWidget.dart';
import 'package:cv_checker/Services/recruiterService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class RSearch extends StatefulWidget {
  final int? selectedSector;
  const RSearch({Key? key,
  this.selectedSector
  }) : super(key: key);

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



    if(widget.selectedSector != null){
      int val = Lists.categories.indexOf(widget.selectedSector);
      jobSectorFilter.add(val);
    }
    _getCandidates = refreshSearch();
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

  TextEditingController searchController = TextEditingController();

  List <int> jobSectorFilter= [0];
  List <int> experienceLevelFilter = [0];
  List <int> educationLevelFilter = [0];

  List candidates = [];

  late Future _getCandidates;

  refreshSearch() async {
   RecruiterService().getJobSeekers(
        {
          "jobSectorFilter": jobSectorFilter,
          "experienceLevelFilter": educationLevelFilter,
          "educationLevelFilter": educationLevelFilter,
        }
    ).then((result){
      if (result['status']){
        setState(() {
          candidates = result['message']['data']["jobSeekers"];
          print(candidates);
        });
      }
   });

   return candidates;
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 1406,
                height: 150,
                child: Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 20),
                    child: SearchWidget(
                      searchController: searchController,
                      onSearch: (){
                        refreshSearch();
                      },
                    )
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                              value: jobSectorFilter
                                                  .contains(Lists.categories
                                                      .indexOf(key))? true:
                                              false,
                                              onChanged: (bool? value) {
                                                setState(() {

                                                  if( jobSectorFilter
                                                      .contains(Lists.categories
                                                      .indexOf(key))){
                                                    jobSectorFilter.
                                                    removeWhere((e) => e== Lists.categories
                                                        .indexOf(key));

                                                  }
                                                  else{
                                                    jobSectorFilter.add(Lists.categories
                                                        .indexOf(key));
                                                  }
                                                });
                                                refreshSearch();
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
                                              value: experienceLevelFilter
                                                  .contains(Lists.experience
                                                  .indexOf(key))? true:
                                              false,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  if( experienceLevelFilter
                                                      .contains(Lists.experience
                                                      .indexOf(key))){
                                                    experienceLevelFilter.
                                                    removeWhere((e) => e==
                                                        Lists.experience
                                                        .indexOf(key));

                                                  }
                                                  else{
                                                    experienceLevelFilter.add
                                                      (Lists.experience
                                                        .indexOf(key));
                                                  }
                                                });
                                                refreshSearch();
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
                                              value: educationLevelFilter
                                                  .contains(Lists.education
                                                  .indexOf(key))? true:
                                              false,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  if( educationLevelFilter
                                                      .contains(Lists.education
                                                      .indexOf(key))){
                                                    educationLevelFilter.
                                                    removeWhere((e) => e==
                                                        Lists.education
                                                            .indexOf(key));

                                                  }
                                                  else{
                                                    educationLevelFilter.add
                                                      (Lists.education
                                                        .indexOf(key));
                                                  }
                                                });
                                                refreshSearch();
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
                          child: FutureBuilder(
                              future: _getCandidates,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState != ConnectionState.done) {
                                  return const FetchingLoader();
                                }
                                else if (snapshot.hasData){
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Text(
                                          "${candidates.length.toString()} "
                                          "Candidates",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(10),
                                            itemCount: candidates.length,
                                            reverse: false,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              var candidate = candidates[index];

                                              return CandidateCard(
                                                  id: candidate["id"].toString(),
                                                  email: candidate['email'],
                                                  image: candidate['image'],
                                                  jobSeekerName: candidate[
                                                      'jobSeekerName']??'Anon'
                                                      'ymous',
                                                  item: candidate,
                                                  createdDate:
                                                      candidate['createdDate'],
                                                  modifiedDate:
                                                      candidate['modifiedDate'],
                                                  jobSector:
                                                      candidate['jobSector'] ??
                                                          0,
                                                  jobSectorLabel: candidate[
                                                      'jobSectorLabel'],
                                                  educationLevel: candidate[
                                                          'educationLevel'] ??
                                                      0,
                                                  educationLevelLabel: candidate[
                                                      'educationLevelLabel'],
                                                  experienceLevel: candidate[
                                                          'experienceLevel'] ??
                                                      0,
                                                experienceLevelLabel: candidate[
                                                'experienceLevelLabel'] ?? '',);
                                              //}
                                            }),
                                      ),
                                    ],
                                  );
                                }
                                else {
                                  return const FetchingLoader();
                                }
                              }
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
