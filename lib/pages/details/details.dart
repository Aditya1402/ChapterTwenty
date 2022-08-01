// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seventh_word/config/colors.dart';
import 'package:seventh_word/domain/custom_widgets/appBar.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  var thumbnail,
      title,
      authors,
      description,
      averageRating,
      pageCount,
      publisher,
      publishedDate,
      previewLink,
      isEbook,
      pdfLink,
      webRead;

  DetailPage(
      this.authors,
      this.averageRating,
      this.description,
      this.pageCount,
      this.previewLink,
      this.publishedDate,
      this.publisher,
      this.thumbnail,
      this.title,
      this.isEbook,
      this.pdfLink,
      this.webRead);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: widget.thumbnail != null
                        ? Image.network(widget.thumbnail)
                        : Image.network(
                            "https://cdn.bookauthority.org/dist/images/book-cover-not-available.6b5a104fa66be4eec4fd16aebd34fe04.png")),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title ?? "",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(widget.authors
                          .toString()
                          .replaceAll(RegExp(r'\['), "")
                          .replaceAll(RegExp(r'\]'), "")),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.publisher ?? "",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.publishedDate ?? "",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      CupertinoIcons.star,
                      size: 15,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.averageRating.toString() == "null"
                          ? "N/A"
                          : widget.averageRating.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
                const Text(
                  "│",
                  style: TextStyle(color: Palette.shadowGray),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      CupertinoIcons.doc_checkmark,
                      size: 16,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.isEbook == true ? "EBook" : "N/A",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
                const Text("│",
                    style: const TextStyle(color: Palette.shadowGray)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.pageCount.toString() == "null"
                          ? "N/A"
                          : widget.pageCount.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Pages",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                    width: 130,
                    child: ElevatedButton(
                        onPressed: () async {
                          final url = widget.webRead;
                          if (await canLaunch(url)) {
                            print(url);
                            await launch(url,
                                forceWebView: true, enableJavaScript: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const Text("Read Now"))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () async {
                          final url = widget.pdfLink;
                          if (await canLaunch(url)) {
                            print(url);
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const Text("Download"))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              "About this book",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              widget.description,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ]),
      ),
    );
  }
}
