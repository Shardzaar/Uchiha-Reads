import 'package:flutter/material.dart';
import 'package:uchiha_reads/templates/book.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(book.type.toUpperCase()),
          const SizedBox(height: 10),
          Text(book.name,
          style: TextStyle(
            fontSize: 24,
            color: Colors.deepPurple,
            height: 1.2,
          ),)
          ,
        ],
      )
    );
  }
}
