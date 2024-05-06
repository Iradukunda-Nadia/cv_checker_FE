import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/AppUtils/lists.dart';
import 'package:flutter/material.dart';

import '../Services/commonService.dart';


class CandidateCard extends StatefulWidget {
  final String id;
  final String jobSeekerName;
  final String? email;
  final String? image;
  final String? createdDate;
  final String? modifiedDate;
  final int jobSector;
  final String jobSectorLabel;
  final int educationLevel;
  final String educationLevelLabel;
  final int experienceLevel;
  final String experienceLevelLabel;
  final Map item;
  const CandidateCard({Key? key,
    required this.id,
    required this.jobSeekerName,
    this.email,
    this.image,
    required this.item,
    required this.createdDate,
    this.modifiedDate,
    required this.jobSector,
    required this.jobSectorLabel,
    required this.educationLevel,
    required this.educationLevelLabel,
    required this.experienceLevel,
    required this.experienceLevelLabel,
  }) : super(key: key);

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {

  List images = Lists.randomImages;
  @override
  Widget build(BuildContext context) {
    images.shuffle();
    var imagePath = images[0];
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                key: UniqueKey(),
                backgroundColor: Colors.white,
                radius: 40,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(40),
                    child: Image.asset(imagePath)
                  ),
                ),
              ),
            )
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(widget.jobSeekerName, style: Theme.of(context).textTheme
                          .bodyMedium),
                    ),
                    Text(widget.jobSectorLabel, style: Theme.of(context).textTheme
                        .labelSmall),
                    Text(widget.educationLevelLabel, style: Theme.of(context)
                        .textTheme
                        .labelSmall),
                    Text(widget.experienceLevelLabel, style:
                    Theme.of(context)
                        .textTheme
                        .labelSmall),
                    const SizedBox(height: 8,),
                  ],
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8,16,16,8),
            child: SizedBox(
              width: 80,
              height: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.7),
                ),
                child: Center(
                  child: Text(CommonService().experienceString
                    (widget.experienceLevel), style: TextStyle(
                    color: Colors.white, fontSize: 10,
                  )),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
