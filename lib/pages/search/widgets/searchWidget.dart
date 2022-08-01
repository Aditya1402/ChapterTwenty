import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seventh_word/domain/services/api.dart';
import '../../../domain/custom_widgets/loadingIndicator.dart';
import '../../details/details.dart';

class SearchBook extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(
            CupertinoIcons.clear,
            size: 20,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          CupertinoIcons.arrow_left,
          size: 20,
        ));
  }

  @override
  String get searchFieldLabel => 'Titles, authors, or topics';

  var _bookList = ApiService.fetchBooks();

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      height: double.infinity,
      child: FutureBuilder(
        future: _bookList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => DetailPage(
                              snapshot.data[index]['volumeInfo']['authors'],
                              snapshot.data[index]['volumeInfo']
                                  ['averageRating'],
                              snapshot.data[index]['volumeInfo']['description'],
                              snapshot.data[index]['volumeInfo']['pageCount'],
                              snapshot.data[index]['volumeInfo']['previewLink'],
                              snapshot.data[index]['volumeInfo']
                                  ['publishedDate'],
                              snapshot.data[index]['volumeInfo']['publisher'],
                              snapshot.data[index]['volumeInfo']['imageLinks']
                                  ['thumbnail'],
                              snapshot.data[index]['volumeInfo']['title'],
                              snapshot.data[index]['saleInfo']['isEbook'],
                              snapshot.data[index]['accessInfo']['epub']
                                  ['acsTokenLink'],
                              snapshot.data[index]['accessInfo']
                                  ['webReaderLink'],
                            )),
                      ))),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 110,
                          width: 80,
                          child: snapshot.data[index]['volumeInfo']
                                      ['imageLinks'] !=
                                  null
                              ? Image.network(
                                  snapshot.data[index]['volumeInfo']
                                      ['imageLinks']['thumbnail'],
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "https://cdn.bookauthority.org/dist/images/book-cover-not-available.6b5a104fa66be4eec4fd16aebd34fe04.png",
                                  fit: BoxFit.cover),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data[index]['volumeInfo']['title'],
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                snapshot.data[index]['volumeInfo']
                                        ['publisher'] ??
                                    "",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data[index]['volumeInfo']
                                    ['description'],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: LoadingIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return const Center(
      child: Text("Titles, authors, or topics"),
    );
  }
}
