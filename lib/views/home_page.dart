import 'package:boku_gg/widgets/anime_thumbnail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Column(
        children: [
          SizedBox(
            child: Text(
              "Popular Right Now",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              children: [
                AnimeThumbnail(
                  title: "Your Lie in April",
                  imageLink:
                      "https://gogocdn.net/cover/isekai-meikyuu-de-harem-wo.png",
                  onPressed: () {
                    print("oog");
                  },
                  id: "",
                ),
                AnimeThumbnail(
                  title: "Your Lie in April",
                  imageLink:
                      "https://gogocdn.net/cover/isekai-meikyuu-de-harem-wo.png",
                  onPressed: () {
                    print("aaaa");
                  },
                  id: "",
                ),
                AnimeThumbnail(
                  title: "Your Lie in April",
                  imageLink:
                      "https://gogocdn.net/cover/isekai-meikyuu-de-harem-wo.png",
                  onPressed: () {
                    print("booga");
                  },
                  id: "",
                ),
                Container(color: Colors.yellowAccent),
                Container(color: Colors.yellowAccent),
                Container(color: Colors.yellowAccent),
                Container(color: Colors.yellowAccent),
                Container(color: Colors.yellowAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}