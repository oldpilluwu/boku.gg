import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

const List<String> genreList = [
"Action",
"Adventure",
"Cars",
"Comedy",
"Dementia",
"Demons",
"Drama",
"Dub",
"Ecchi",
"Family",
"Fantasy",
"Game",
"Harem",
"Historical",
"Horror",
"Josei",
"Kids",
"Magic",
"Martial Arts",
"Mecha",
"Military",
"Music",
"Mystery",
"Parody",
"Police",
"Psychological",
"Romance",
"Samurai",
"School",
"Sci-Fi",
"Seinen",
"Shoujo",
"Shoujo Ai",
"Shounen",
"Shounen Ai",
"Slice of Life",
"Space",
"Sports",
"Super Power",
"Supernatural",
"Thriller",
"Vampire",
"Yaoi",
"Yuri"
];

List<GenreAndColor> listOfGenreAndColor = [
GenreAndColor(text: "Action", color: Color(0xFFFF6060)),
GenreAndColor(text: "Adventure", color: Colors.cyan),
GenreAndColor(text: "Cars", color: Color(0xFFFED56D)),
GenreAndColor(text: "Comedy", color: Colors.purpleAccent),
GenreAndColor(text: "Dementia", color: Colors.white54),
GenreAndColor(text: "Demons", color: Color(0xFFAA0000)),
GenreAndColor(text: "Drama", color: Color(0xFF9AF3FF)),
GenreAndColor(text: "Dub", color: Color(0xffe9e9e9)),
GenreAndColor(text: "Ecchi", color: Colors.deepOrangeAccent),
GenreAndColor(text: "Family", color:Color(0xFFF8FFA5)),
GenreAndColor(text: "Fantasy", color: Color(0xffff9aff)),
GenreAndColor(text: "Game", color: Color(0xffccbd66)),
GenreAndColor(text: "Harem", color: Colors.pinkAccent),
GenreAndColor(text: "Historical", color: Colors.blueGrey),
GenreAndColor(text: "Horror", color: Color(0xFFBC975F)),
GenreAndColor(text: "Josei", color: Color(0xFFEE7191)),
GenreAndColor(text: "Kids", color: Color(0xFFFFF91B)),
GenreAndColor(text: "Magic", color: Colors.cyanAccent),
GenreAndColor(text: "Martial Arts", color: Color(0xFFFFA25F)),
GenreAndColor(text: "Mecha", color: Color(0xFFC751FF)),
GenreAndColor(text: "Military", color: Color(0xff55AA44)),
GenreAndColor(text: "Music", color: Colors.lightBlueAccent),
GenreAndColor(text: "Mystery", color: Colors.purple),
GenreAndColor(text: "Parody", color: Colors.brown),
GenreAndColor(text: "Police", color: Color(0xFF5A96FF)),
GenreAndColor(text: "Psychological", color: Color(0xFFA8AEE5)),
GenreAndColor(text: "Romance", color: Color(0xFFFFACF2)),
GenreAndColor(text: "Samurai", color: Colors.orange),
GenreAndColor(text: "School", color: Colors.lightGreen),
GenreAndColor(text: "Sci-Fi", color: Color(0xFF8162D7)),
GenreAndColor(text: "Seinen", color: Color(0xff7700aa)),
GenreAndColor(text: "Shoujo", color: Colors.pinkAccent),
GenreAndColor(text: "Shoujo Ai", color: Color(0xff994444)),
GenreAndColor(text: "Shounen", color: Color(0xFF7886FF)),
GenreAndColor(text: "Shounen Ai", color: Color(0xFFaa86FF)),
GenreAndColor(text: "Slice of Life", color: Color(0xFF57D98B)),
GenreAndColor(text: "Space", color: Color(0xFFE1E1E1)),
GenreAndColor(text: "Sports", color: Color(0xFFBEFF6C)),
GenreAndColor(text: "Super Power", color: Color(0xffcacb77)),
GenreAndColor(text: "Supernatural", color: Colors.teal),
GenreAndColor(text: "Thriller", color: Color(0xFFbB5454)),
GenreAndColor(text: "Vampire", color: Color(0xFFDB6464)),
GenreAndColor(text: "Yaoi", color:  Color(0xFFffaabb)),
GenreAndColor(text: "Yuri", color: Color(0xFFA7D9AB))
];

class GenreAndColor {
  String text;
  Color color;
  GenreAndColor({
    required this.text,
    required this.color,
  });

  String returnGenreId() {
    var parsedGenreName = this.text;
    parsedGenreName = parsedGenreName.replaceAll(" ", "-").toLowerCase();
    return parsedGenreName;
  }
}


