import 'package:flutter/material.dart';
import 'package:uchiha_reads/templates/book.dart';
import 'package:uchiha_reads/widgets/book_items.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BookStaggeredGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;
  BookStaggeredGridView(this.selected, this.pageController, this.callback,
      {super.key});
      
  final bookList = Book.generateBooks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: [
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 4,
            itemCount: bookList.length,
            itemBuilder: (_, index) =>BookItem(bookList[index]),
            staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
          ),
          Container()
        ],
      ),
    );
  }
}
