import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/group.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/providers/group_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:provider/provider.dart';

class GroupsSelect extends StatefulWidget {
  final TextEditingController groupController;
  final TextEditingController groupNameController;

  const GroupsSelect({
    Key? key,
    required this.groupController,
    required this.groupNameController,
  }) : super(key: key);

  @override
  State<GroupsSelect> createState() => _GroupsSelectState();
}

class _GroupsSelectState extends State<GroupsSelect> {
  Group g1 = Group(id: 1, name: 'abc', logo: Imgs.folder);
  Group g2 = Group(id: 2, name: 'abec', logo: Imgs.folder);
  Group g3 = Group(id: 3, name: 'abqwc', logo: Imgs.folder);
  Group g4 = Group(id: 4, name: 'abc2', logo: Imgs.folder);
  Group g5 = Group(id: 5, name: 'abc8hg', logo: Imgs.folder);

  @override
  Widget build(BuildContext context) {
    Provider.of<GroupsProvider>(context, listen: false).setModels([]);
    Provider.of<GroupsProvider>(context, listen: false).addModel(g1);
    Provider.of<GroupsProvider>(context, listen: false).addModel(g2);
    Provider.of<GroupsProvider>(context, listen: false).addModel(g3);
    Provider.of<GroupsProvider>(context, listen: false).addModel(g4);
    Provider.of<GroupsProvider>(context, listen: false).addModel(g5);

    List<Group> groups = Provider.of<GroupsProvider>(context).models;
    List<Widget> groupWidgets = groups
        .map((group) => GroupFolder(
              group: group,
              groupController: widget.groupController,
              groupNameController: widget.groupNameController,
            ))
        .toList();

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        child: Neumo(
          onlyBlackShaodw: true,
          border: 10,
          child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: groupWidgets),
        ),
      ),
    );
  }
}
