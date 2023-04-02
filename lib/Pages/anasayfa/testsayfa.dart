import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bthn_test/core/res/color.dart';
import 'package:bthn_test/widgets/circle_gradient_icon.dart';
import 'package:bthn_test/widgets/task_group.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TestSayfa extends StatefulWidget {
  const TestSayfa({Key? key}) : super(key: key);

  @override
  State<TestSayfa> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TestSayfa> {
  var time = DateTime.now();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Afet Acil Yardım Ağı",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        elevation: 0,
        actions: [
        ],
      ),
      extendBody: true,
      body: _buildBody(),
    );
  }

  Stack _buildBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                _taskHeader(),
                const SizedBox(
                  height: 10,
                ),
                buildGrid(),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }




  Row _taskHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectableText(
          "Anasayfa",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        ),
      ],
    );
  }


  StaggeredGrid buildGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 35,
      children: const [
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: TaskGroupContainer(
            color: Colors.red,
            icon: Icons.notification_important_outlined,
            taskCount: 1,
            isSmall: true,
            taskGroup: "Ben / Tanıdığım Enkazda",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1.0,
          child: TaskGroupContainer(
            color: Colors.orange,
            isSmall: true,
            icon: Icons.local_fire_department,
            taskCount: 15,
            taskGroup: "Isınmaya İhtiyacım Var",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: TaskGroupContainer(
            color: Colors.green,
            icon: Icons.food_bank,
            isSmall: true,
            taskCount: 2,
            taskGroup: "Gıdaya İhtiyacım Var",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: TaskGroupContainer(
            color: Colors.blue,
            isSmall: true,
            icon: Icons.bed,
            taskCount: 9,
            taskGroup: "Barınmaya İhtiyacım Var",
          ),
        ),
      ],
    );
  }
}


