import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/utils/constants.dart';

class GroupFolder extends StatefulWidget {
  final Group group;
  final TextEditingController groupController;
  final TextEditingController groupNameController;

  const GroupFolder({
    Key? key,
    required this.group,
    required this.groupController,
    required this.groupNameController,
  }) : super(key: key);

  @override
  State<GroupFolder> createState() => _GroupState();
}

class _GroupState extends State<GroupFolder> {
  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          widget.groupController.text = widget.group.id.toString();
          widget.groupNameController.text = widget.group.name!;
          Navigator.of(context).pop();
        },
        child: SizedBox(
          height: 80,
          width: 80,
          child: Neumo(
            border: 10,
            child: Column(
              children: [
                Image.asset(Imgs.folder),
                Text(
                  widget.group.name ?? locale.unnamed,
                  style: TextStyle(
                    color: ThemeColours.txtBlack,
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
