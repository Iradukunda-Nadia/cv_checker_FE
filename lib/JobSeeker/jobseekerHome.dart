import 'dart:convert';

import 'package:cv_checker/Classes/jobClass.dart';
import 'package:cv_checker/CommonUI/fetchingLoader.dart';
import 'package:cv_checker/CommonUI/navBar.dart';
import 'package:cv_checker/JobSeeker/cvForm.dart';
import 'package:cv_checker/Jobs/jobDetails.dart';
import 'package:cv_checker/Jobs/jobList.dart';
import 'package:cv_checker/Providers/userProvider.dart';
import 'package:cv_checker/Services/apiService.dart';
import 'package:cv_checker/Services/appURLS.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:cv_checker/Services/jobSeekerService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class JSHome extends StatefulWidget {
  const JSHome({Key? key}) : super(key: key);

  @override
  State<JSHome> createState() => _JSHomeState();
}

class _JSHomeState extends State<JSHome> {

  Job? _selectedItem;

  List navChildren = [];
  List <Job>jobsList = [];
  setNavChildren (){
    navChildren = [
      {
        "title": "Home",
        "onTap": (){}
      },
      {
        "title": "Cv-details",
        "onTap": (){
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => cvForm()));
        }
      },
    ];
  }

  late Future _getJobs;

  Future fetchJobs({counter = 0}) async {
    final response = await http.get(
      Uri.parse(ApiService.apiServer + AppUrl.getJobs),
      headers: {
        'Content-Type': 'application/json;charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      jobsList = List<Job>.from(json.decode(response.body)['data']
      ["jobPostingList"].map((results) => Job.fromJson
        (results)).toList());

      return jsonDecode(response.body);
    } else {
      print('Failed to load post: ${response.statusCode}: ${response.body}');
      throw Exception('Failed to load post: ${response.body}');
    }
  }

  @override
  void initState() {
    setNavChildren ();
    _getJobs = fetchJobs();
     super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
        appBar: NavBar(navChildren: navChildren,),
        body: FutureBuilder(
            future: _getJobs,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const FetchingLoader();
              }
              else if (snapshot.hasData){
                print(snapshot.data);
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(
                              height: 100,
                              child: ListTile(
                                title: Text('Top job picks for you'),
                              )),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: ItemListing(
                                  // Instead of pushing a new route here, we update
                                  // the currently selected item, which is a part of
                                  // our state now.
                                  jobs: jobsList,
                                  itemSelectedCallback: (item) {
                                    setState(() {
                                      _selectedItem = item;
                                    });
                                  },
                                ),
                              ),
                              _selectedItem == null
                                  ? Container()
                                  : Expanded(
                                flex: 3,
                                child: ItemDetails(
                                  // The item details just blindly accepts whichever
                                  // item we throw in its way, just like before.
                                  item: _selectedItem,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              else {
                return const FetchingLoader();
              }
            }
        )
    );
  }
}
