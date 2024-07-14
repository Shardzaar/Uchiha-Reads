import 'package:flutter/material.dart';
import 'package:uchiha_reads/templates/book.dart';
import 'package:uchiha_reads/detail/detail.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailPage(book))
      ),
      child: Container(
        height: book.height as double,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(book.imgUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
