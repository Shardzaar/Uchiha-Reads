import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uchiha_reads/screens/home_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library', style: TextStyle(fontSize: 34)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SearchPage(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    final bottoms = [
      Icons.home_outlined,
      Icons.search_outlined,
      Icons.library_books_outlined,
      Icons.notifications_outlined,
      Icons.abc_rounded
    ];
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () => setState(() {
            bottomIndex = index;
          }),
          child: Container(
            width: (width - 40) / 5,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: bottomIndex == index
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: Colors.deepPurple,
                      ),
                    ),
                  )
                : null,
            child: Icon(
              bottoms[index],
              size: 30,
              color: bottomIndex == index
                  ? Colors.deepPurple
                  : Colors.grey[400],
            ),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(
          width: 10,
        ),
        itemCount: bottoms.length,
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  late Stream<QuerySnapshot> _searchResults = Stream.empty();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Stories',
                prefixIcon: Icon(Icons.search),
                helperText: 'Enter story title',
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.trim();
                  _searchResults = _performSearch(_searchQuery);
                });
              },
            ),
          ),
          SizedBox(height: 20),
          StreamBuilder<QuerySnapshot>(
            stream: _searchResults,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No Results Found'));
              }
              return Column(
                children: snapshot.data!.docs.map((storySnapshot) {
                  return Material(
                    child: ListTile(
                      title: Text(storySnapshot['title']),
                      onTap: () {
                        _showStory(storySnapshot);
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Stream<QuerySnapshot> _performSearch(String query) {
    if (query.isEmpty) {
      return FirebaseFirestore.instance.collection('stories').snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('stories')
          .where('title', isGreaterThanOrEqualTo: query)
          .where('title', isLessThan: query + 'z')
          .snapshots();
    }
  }

  void _showStory(DocumentSnapshot storySnapshot) {
    String story = storySnapshot['story'];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Story'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Text(
                story,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
