import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 2;

  Widget get page1 {
    return Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 72),
      ),
    );
  }

  Widget get page2 {
    return GridView.count(crossAxisCount: 2, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(image1),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(image2),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(image3),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(image4),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(image5),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(image6),
      ),
    ]);
  }

  Widget get page3 {
    return Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 72),
      ),
    );
  }

 

  final image1 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQzxBxGEQuJaM5SRubqBJljLAgmIsoENEs3bdWaOyrBQ&s';
  final image2 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAGbmfJrY_o6UxbZ5HCxGYMWpfY42KlIfVsNdT2xJxUg&s';
  final image3 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAGbmfJrY_o6UxbZ5HCxGYMWpfY42KlIfVsNdT2xJxUg&s';
  final image4 = 'https://img.lovepik.com/element/45007/9556.png_860.png';
  final image5 =
      'https://clipart-library.com/images_k/t-shirt-transparent/t-shirt-transparent-25.jpg';
  final image6 =
      'https://m.media-amazon.com/images/I/61sqPYyp-AL._AC_UY1100_.jpg';

  @override
  Widget build(BuildContext context) {
     final List<Widget> screen = [
      page1,
      page2,
      page3,
    ];
    
    return Scaffold(
        body: screen[index],
        bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                indicatorColor: Colors.blue,
                labelTextStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w400))),
            child: NavigationBar(
              backgroundColor: Colors.lightBlue,
              selectedIndex: index,
              animationDuration: Duration(seconds: 3),
              onDestinationSelected: (index) => setState(
                () => this.index = index,
              ),
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.window), label: 'Images'),
                NavigationDestination(icon: Icon(Icons.man), label: 'Profile'),
              ],
            )),
      );
  }
}
