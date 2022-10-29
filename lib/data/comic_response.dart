/// month : "10"
/// num : 2691
/// link : ""
/// year : "2022"
/// news : ""
/// safe_title : "Encryption"
/// transcript : ""
/// alt : "WARNING: PEOPLE NAMED EVE ARE PROHIBITED FROM INSTALLING THIS APP!"
/// img : "https://imgs.xkcd.com/comics/encryption.png"
/// title : "Encryption"
/// day : "28"

class ComicResponse {  
  String? month;
  int? num;
  String? link;
  String? year;
  String? news;
  String? safeTitle;
  String? transcript;
  String? alt;
  String? img;
  String? title;
  String? day;
  String? status;
  String? code;
  String? message;

  ComicResponse({
      this.month, 
      this.num, 
      this.link, 
      this.year, 
      this.news, 
      this.safeTitle, 
      this.transcript, 
      this.alt, 
      this.img, 
      this.title, 
      this.day,
      this.status,
     this.code,
     this.message
  });

  ComicResponse.fromJson(dynamic json) {
    month = json["month"];
    num = json["num"];
    link = json["link"];
    year = json["year"];
    news = json["news"];
    safeTitle = json["safe_title"];
    transcript = json["transcript"];
    alt = json["alt"];
    img = json["img"];
    title = json["title"];
    day = json["day"];
    status = json["status"];
    code = json["code"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["month"] = month;
    map["num"] = num;
    map["link"] = link;
    map["year"] = year;
    map["news"] = news;
    map["safe_title"] = safeTitle;
    map["transcript"] = transcript;
    map["alt"] = alt;
    map["img"] = img;
    map["title"] = title;
    map["day"] = day;
    return map;
  }

}