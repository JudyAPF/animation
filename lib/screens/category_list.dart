import 'package:flutter/material.dart';
import '../components/category_tile.dart';
import '../data/back_data.dart';

class CategoryListScreen extends StatefulWidget {
  CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  var categoryList = CATEGORIES;
  bool show = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 800,
        // seconds: 4,
      ),
      // lowerBound: 0,
      // upperBound: 100,
    );
    // animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinoy Recipes'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {
              // animationController.forward();
              setState(() {
                show = !show;
              });
            },
            icon: Icon(
              Icons.play_arrow,
            ),
          )
        ],
      ),
      body: AnimatedOpacity(
        opacity: show ? 1 : 0,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeIn,
        child: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: categoryList.map((element) {
            return CategoryTile(
              category: element,
            );
          }).toList(),
        ),
      ),
    );
  }
}

// body: AnimatedBuilder(
//         animation: animationController,
//         builder: (context, child) {
          // return Padding(
          //   padding: EdgeInsets.only(top: animationController.value),
          //   child: child!,
          // );
          // return Opacity(
          //   opacity: animationController.value,
          //   child: child,
          // );
          // return SlideTransition(
          //   position: animationController.drive(
          //     Tween<Offset>(
          //       begin: Offset(0, 0),
          //       end: Offset(0, 1),
          //     ),
          //   ),
          //   child: child,
          // );
          // return SlideTransition(
          //   position: Tween(begin: Offset(0, 0), end: Offset(0, 1)).animate(
          //     CurvedAnimation(
          //       parent: animationController,
          //       curve: Curves.elasticIn,
          //     ),
          //   ),
          //   child: child,
          // );
          // return FadeTransition(
          //   opacity: Tween<double>(begin: 0.5, end: 1).animate(
          //     CurvedAnimation(
          //       parent: animationController,
          //       curve: Curves.linear,
          //     ),
          //   ),
          //   child: child,
          // );
          // return SizeTransition(
          //   sizeFactor: Tween<double>(begin: 0, end: 1).animate(
          //     CurvedAnimation(
          //       parent: animationController,
          //       curve: Curves.linear,
          //     ),
          //   ),
          //   axis: Axis.horizontal,
          //   child: child,
          // );
      //     return ScaleTransition(
      //       scale: Tween<double>(begin: 0.5, end: 1).animate(
      //         CurvedAnimation(
      //           parent: animationController,
      //           curve: Curves.easeIn,
      //         ),
      //       ),
      //       alignment: Alignment.bottomCenter,
      //       child: child,
      //     );
      //   },
      //   child: GridView(
      //     padding: const EdgeInsets.all(10),
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       childAspectRatio: 3 / 2,
      //       crossAxisSpacing: 10,
      //       mainAxisSpacing: 10,
      //     ),
      //     children: categoryList.map((element) {
      //       return CategoryTile(
      //         category: element,
      //       );
      //     }).toList(),
      //   ),
      // ),