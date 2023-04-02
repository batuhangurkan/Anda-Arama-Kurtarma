import 'package:bthn_test/Pages/anasayfa/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bthn_test/core/res/color.dart';
import 'package:bthn_test/widgets/circle_gradient_icon.dart';
import 'package:bthn_test/widgets/task_group.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                _onGoingHeader(),
                const SizedBox(
                  height: 5,
                ),
                const OnGoingTask(),
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
                const AlarmSound(),
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

  Row _onGoingHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Duyurular",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Güncelleme: $time', style: GoogleFonts.openSans(fontSize: 8),),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Text(
            "Hepsini Gör",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }


  Row _taskHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectableText(
          "Yardım Ağı",
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
      mainAxisSpacing: 10,
      crossAxisSpacing: 12,
      children: const [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.0,
          child: TaskGroupContainer(
            color: Colors.red,
            icon: Icons.notification_important_outlined,
            taskCount: 1,
            isSmall: true,
            taskGroup: "Ben / Tanıdığım Enkazda",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
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
          crossAxisCellCount: 1,
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
          crossAxisCellCount: 1,
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

class OnGoingTask extends StatelessWidget {
  const OnGoingTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          Icon(FontAwesomeIcons.circleInfo, size: 25, color: Colors.blue,),
          Text(" Test Deneme Duyuru!", style: GoogleFonts.openSans(color: Colors.black),)
        ],
      ),
    );
  }
}

class AlarmSound extends StatelessWidget {
  const AlarmSound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeScreen())
        );

      },
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1,
          margin: EdgeInsets.only(top: 20),
          height: 50,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red,Colors.red]),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 2),
                    blurRadius: 5
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Icon(FontAwesomeIcons.volumeHigh, size: 20, color: Colors.white,),
              Text("   Sesini Duyur", style: GoogleFonts.openSans(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}







