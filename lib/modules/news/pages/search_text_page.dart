import 'package:flutter/material.dart';
import 'package:news/modules/news/models/search_query_model.dart';
import 'package:news/modules/news/pages/search_query_page.dart';

class SearchTextPage extends StatefulWidget {
  const SearchTextPage();

  static const routeName = '/searchText';

  @override
  _SearchTextPageState createState() => _SearchTextPageState();
}

class _SearchTextPageState extends State<SearchTextPage> {
  String _searchText = '';

  void _goToSearchResults() {
    if (_searchText.isNotEmpty) {
      Navigator.of(context).pushNamed(SearchQueryPage.routeName,
          arguments: SearchQuery.fromSearchText(_searchText));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (t) => _searchText = t,
            onSubmitted: (_) => _goToSearchResults(),
            autofocus: true,
            cursorColor: Colors.white,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.search,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Search for topics, places and sources',
              hintStyle: TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
              hintMaxLines: 1,
              enabledBorder: InputBorder.none,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
            ),
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: () => _goToSearchResults(),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                textStyle: TextStyle(fontSize: 15),
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              child: Text('Search'),
            ),
          ),
        ),
      ),
    );
  }
}
