import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/Classes/jobClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({required this.item});
  final Job? item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final content = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item!.title!,
            style: Theme.of(context)
                .textTheme.titleMedium!
                .apply(
                fontFamily: 'Istok Web',
                color: AppColors.greylighten1
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on, size: 20,),
            title: Text(
              item!.location??'',
              style: Theme.of(context)
                  .textTheme.labelSmall!
                  .apply(
                  fontFamily: 'Istok Web',
                  color: AppColors.greylighten1
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.business_outlined, size: 20,),
            title: Text(
              "Company: ${item!.company??[]}",
              style: Theme.of(context)
                  .textTheme.labelSmall!
                  .apply(
                  fontFamily: 'Istok Web',
                  color: AppColors.greylighten1
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.checklist, size: 20,),
            title: Text(
              "Skills: ${item!.skills??[]}",
              style: Theme.of(context)
                  .textTheme.labelSmall!
                  .apply(
                  fontFamily: 'Istok Web',
                  color: AppColors.greylighten1
              ),
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Job Description",
                    style: textTheme.subtitle1,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item!.description??'',
                    style: Theme.of(context)
                        .textTheme.labelSmall!
                        .apply(
                        fontFamily: 'Istok Web',
                        color: AppColors.greylighten1
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item!.title!,
            style: Theme.of(context)
                .textTheme.titleMedium!
                .apply(
                fontFamily: 'Istok Web',
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on, size: 20,),
            title: Text(
              item!.location??'',
              style: Theme.of(context)
                  .textTheme.labelSmall!
                  .apply(
                  fontFamily: 'Istok Web',
                  color: AppColors.labelColor
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.business_outlined, size: 20,),
            title: Text(
              "Company: ${item!.company??[]}",
              style: Theme.of(context)
                  .textTheme.labelSmall!
                  .apply(
                  fontFamily: 'Istok Web',
                  color: AppColors.labelColor
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.checklist, size: 20,),
            title: Text(
              "Skills: ${item!.skills??[]}",
              style: Theme.of(context)
                  .textTheme.labelSmall!
                  .apply(
                  fontFamily: 'Istok Web',
                  color: AppColors.labelColor
              ),
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Job Description",
                    style: textTheme.subtitle1,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item!.description??'',
                    style: Theme.of(context)
                        .textTheme.bodyMedium!
                        .apply(
                        fontFamily: 'Istok Web',
                        color: Colors.black,
                      fontWeightDelta: -2
                    ),
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