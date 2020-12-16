import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  String selectedResult;

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
          child: Text(selectedResult)
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> list = ["Ravenna", "Cesena", "Roma", "Milano"];
    List<String> suggestions = List();
    query.isEmpty ? suggestions = list : suggestions.addAll(list.where((element) => element.startsWith(query)));
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(suggestions[index]),
            onTap: () {
              selectedResult = suggestions[index];
              showResults(context);
            }
        );
      },
    );
  }
}