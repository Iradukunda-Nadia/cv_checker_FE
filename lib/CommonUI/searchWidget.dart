import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/AppUtils/lists.dart';
import 'package:cv_checker/CommonUI/formFields/CustomTF.dart';
import 'package:flutter/material.dart';


class SearchWidget extends StatefulWidget {
  final Function onSearch;
  final TextEditingController searchController;
  const SearchWidget({Key? key,
  required this.onSearch,
  required this.searchController,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: CustomTF(
                    isSearch: true,
                    controller: widget.searchController,
                    isDropDown: true,
                    values: Lists.categories,
                    hint: "Select Job Sector to search",
                    label: '',

                  )
                ),
              ),
            ),
            MaterialButton(
              color: AppColors.primaryColor,
              onPressed: () {
                print('Button pressed ...');
                widget.onSearch();
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
    );
  }
}
