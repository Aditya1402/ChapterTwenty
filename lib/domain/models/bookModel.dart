import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  BookModel({
    required this.items,
  });

  final List<Item> items;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;
  final SearchInfo searchInfo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: SearchInfo.fromJson(json["searchInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
        "saleInfo": saleInfo.toJson(),
        "accessInfo": accessInfo.toJson(),
        "searchInfo": searchInfo.toJson(),
      };
}

class AccessInfo {
  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
  });

  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final Epub epub;
  final Epub pdf;
  final String webReaderLink;

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: Epub.fromJson(json["epub"]),
        pdf: Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
      };
}

class Epub {
  Epub({
    required this.isAvailable,
  });

  final bool isAvailable;

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
      };
}

class SaleInfo {
  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
  });

  final String country;
  final String saleability;
  final bool isEbook;

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
      };
}

class SearchInfo {
  SearchInfo({
    required this.textSnippet,
  });

  final String textSnippet;

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  VolumeInfo({
    required this.title,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.printType,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
  });

  final String title;
  final String publishedDate;
  final String description;
  final int pageCount;
  final String printType;
  final int averageRating;
  final int ratingsCount;
  final String maturityRating;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        publishedDate: json["publishedDate"],
        description: json["description"],
        pageCount: json["pageCount"],
        printType: json["printType"],
        averageRating: json["averageRating"],
        ratingsCount: json["ratingsCount"],
        maturityRating: json["maturityRating"],
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "publishedDate": publishedDate,
        "description": description,
        "pageCount": pageCount,
        "printType": printType,
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "maturityRating": maturityRating,
        "imageLinks": imageLinks.toJson(),
        "language": language,
        "previewLink": previewLink,
      };
}

class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  final String smallThumbnail;
  final String thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}
