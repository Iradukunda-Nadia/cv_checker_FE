import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:flutter/material.dart';


class CandidateCard extends StatefulWidget {
  final String id;
  final String name;
  final String email;
  final String image;
  final Map item;
  const CandidateCard({Key? key,
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.item,
  }) : super(key: key);

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {
  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
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
                      child: Text(widget.name, style: Theme.of(context).textTheme
                          .bodyMedium),
                    ),
                    Text(widget.item["jobInterest"], style: Theme.of(context).textTheme
                        .labelSmall),
                    Text(widget.item["Education"][0]["courseTitle"], style: Theme.of(context)
                        .textTheme
                        .labelSmall),
                    Text("Years of Experience: " + widget.item["yrs"], style:
                    Theme.of(context)
                        .textTheme
                        .labelSmall),
                    const SizedBox(height: 8,),
                    Text("Skills: ${widget.item["skills"]}", style:
                    Theme.of(context)
                        .textTheme
                        .bodySmall),
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
                  child: Text(widget.item["experience"], style: TextStyle(
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
