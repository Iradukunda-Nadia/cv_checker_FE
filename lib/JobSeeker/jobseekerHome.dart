import 'package:cv_checker/Classes/jobClass.dart';
import 'package:cv_checker/CommonUI/navBar.dart';
import 'package:cv_checker/JobSeeker/cvForm.dart';
import 'package:cv_checker/Jobs/jobDetails.dart';
import 'package:cv_checker/Jobs/jobList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JSHome extends StatefulWidget {
  const JSHome({Key? key}) : super(key: key);

  @override
  State<JSHome> createState() => _JSHomeState();
}

class _JSHomeState extends State<JSHome> {

  Job? _selectedItem;

  List navChildren = [];
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

  @override
  void initState() {
    setNavChildren ();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(navChildren: navChildren,),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  const SizedBox(
                    height: 100,
                      child: ListTile(title: Text('Top job picks for you'),)),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ItemListing(
                          // Instead of pushing a new route here, we update
                          // the currently selected item, which is a part of
                          // our state now.
                          itemSelectedCallback: (item) {
                            setState(() {
                              _selectedItem = item;
                            });
                          },
                        ),
                      ),
                      _selectedItem == null ? Container():
                      Expanded(
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
        )
    );
  }
}
