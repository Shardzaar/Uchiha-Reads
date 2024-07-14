import 'package:flutter/material.dart';
import 'package:uchiha_reads/templates/book.dart';
import 'package:uchiha_reads/widgets/book_detail.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: _buildAppbar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BookDetail(book),
            ],
          ),
        )
        );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back),
        color: Colors.deepPurple
      ),
      actions: [
        IconButton(
          onPressed:  () {},
          icon: const Icon(Icons.more_horiz_outlined))
      ],
    );
  }
}
