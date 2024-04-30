import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/AppUtils/lists.dart';
import 'package:cv_checker/Classes/jobClass.dart';
import 'package:flutter/material.dart';

class ItemListing extends StatelessWidget {
  ItemListing({
    required this.itemSelectedCallback,
    this.selectedItem,
  });

  final ValueChanged<Job> itemSelectedCallback;
  final Job? selectedItem; // Also new.

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: List<Job>.from(Lists.jobs.map((results) => Job.fromJson(results))
          .toList()).map((item) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(item.title!,
                style: Theme.of(context)
                  .textTheme.bodyMedium!
                  .apply(
                  fontFamily: 'Istok Web',
                  color: Colors.black)
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(item.company??'',
                      style: Theme.of(context)
                          .textTheme.labelSmall!
                          .apply(
                          fontFamily: 'Istok Web',
                          color: Colors.black)),
                  Text(item.location??'',
                      style: Theme.of(context)
                          .textTheme.labelSmall!
                          .apply(
                          fontFamily: 'Istok Web',
                          color: Colors.black)),
                ],
              ),
              onTap: () => itemSelectedCallback(item),
              selected: selectedItem == item,
            ),
          ),
        );
      }).toList(),
    );
  }
}