import 'package:flutter/material.dart';
import 'package:uchiha_reads/screens/login.dart';
import 'package:uchiha_reads/screens/write.dart';
import 'package:uchiha_reads/screens/search.dart';
import 'package:uchiha_reads/widgets/book_staggered_gridview.dart';
import 'package:uchiha_reads/widgets/custom_tab.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabIndex = 0;
  var bottomIndex = 0;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.account_box_rounded),
              title: const Text("Madara"),
              subtitle: const Text("My Account"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Search"),
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => SearchPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.abc),
              title: const Text("Write"),
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => WritingPage()),
                );
              },
            ),
            SizedBox(
              height: 250,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => Login()),
                );
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Explore Books', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        CustomTab(tabIndex, (int index) {
          setState(() {
            tabIndex = index;
          });
          pageController.jumpToPage(index);
        }),
        Expanded(
            child: BookStaggeredGridView(
                tabIndex,
                pageController,
                (int index) => setState(
                      () {
                        tabIndex = index;
                      },
                    )))
      ]),
      //bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}

 // Widget _buildBottomNavigationBar() {
  //  final bottoms = [
    //  Icons.home_outlined,
    //  Icons.search_outlined,
     // Icons.library_books_outlined,
     // Icons.notifications_outlined,
    //  Icons.abc_rounded
///   ];
   // final width = MediaQuery.of(context).size.width;
 //   return SizedBox(
    //  width: MediaQuery.of(context).size.width,
    //  height: 56,
   //       scrollDirection: Axis.horizontal,
       //   itemBuilder: (_, index) => GestureDetector(
            //    onTap: () => setState(() {
             //     bottomIndex = index;
             //   }),
             //   child: Container(
               //     width: (width - 40) / 5,
               //     padding: const EdgeInsets.symmetric(vertical: 10),
                   // decoration: bottomIndex == index
                     //   ? const BoxDecoration(
                     //       border: Border(
                     //         bottom: BorderSide(
                      //          width: 3,
                     //           color: Colors.deepPurple,
                     //         ),
                    //        ),
                    //      )
                 //       : null,
                //    child: Icon(bottoms[index],
               //        size: 30,
                    //    color: bottomIndex == index
                   //        ? Colors.deepPurple
                  //          : Colors.grey[400])),
          //    ),
          //separatorBuilder: (_, index) => const SizedBox(
       //    //   ),
       //   itemCount: bottoms.length),
  //  );
 // }
///