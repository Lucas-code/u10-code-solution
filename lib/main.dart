import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'qr_scan.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart'
    show ArCoreController;
import 'package:flutter/services.dart';

double normalTextFontSize = 10;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('ARCORE IS AVAILABLE?');
  print(await ArCoreController.checkArCoreAvailability());
  print('\nAR SERVICES INSTALLED?');
  print(await ArCoreController.checkIsArCoreInstalled());
  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return const MaterialApp(
      title: 'NHM AR App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _biggerFont = const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
          // title: Image.asset(
          //   "assets/nhm_logo.png",
          //   width: 100,
          //   height: 100,
          //   alignment: FractionalOffset.center,
          // ),
          centerTitle: true,
          backgroundColor: Colors.black54,
        ),
        drawer: const MainMenu(),
        body: Column(
          children: [
            Image.asset(
              "assets/nhm_logo.png",
              width: 125,
              height: 125,
            ),
            const Text(
              "Augmented Reality App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/homepage_image1.png"),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/homepage_image2.png"),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/homepage_image3.png"),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/homepage_image4.png"),
                        fit: BoxFit.cover,
                      )),
                ),
              ],
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                // autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 20),
                        minimumSize: const Size(200, 70)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const QRCodeScannerPage()));
                    },
                    child: const Text('Start'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

//   @override
//   _MainMenuState createState() => _MainMenuState();
// }

// class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(fontSize: normalTextFontSize),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()));
            },
          ),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontSize: normalTextFontSize),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SettingsPage()));
            },
          ),
          ListTile(
            title: Text(
              "Instructions",
              style: TextStyle(fontSize: normalTextFontSize),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const InstructionsPage()));
            },
          )
        ],
      ),
    );
  }
}

class StandardAppBar extends StatelessWidget with PreferredSizeWidget {
  const StandardAppBar({
    Key? key,
  }) : super(key: key);

//   @override
//   _StandardAppBarState createState() => _StandardAppBarState();
// }

// class _StandardAppBarState extends State<StandardAppBar> {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        "assets/nhm_logo.png",
        width: 100,
        height: 100,
      ),
      centerTitle: true,
      backgroundColor: Colors.black54,
    );
  }
}

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({Key? key}) : super(key: key);

  @override
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return const QRCodeScannerView();
  }
}

class ExhibitEndPage extends StatefulWidget {
  const ExhibitEndPage({Key? key}) : super(key: key);

  @override
  _ExhibitEndPageState createState() => _ExhibitEndPageState();
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const StandardAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
              Text(
                "Text Size:",
                style: TextStyle(fontSize: normalTextFontSize),
              ),
              DropdownButton(
                hint: Text(
                  normalTextFontSize.toString(),
                  style: const TextStyle(color: Colors.blue),
                ),
                isExpanded: true,
                iconSize: 30.0,
                style: const TextStyle(color: Colors.blue),
                items: <double>[10, 12, 14, 16, 18, 20].map(
                  (val) {
                    return DropdownMenuItem<double>(
                      value: val,
                      child: Text(val.toString()),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      normalTextFontSize = val as double;
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class InstructionsPage extends StatefulWidget {
  const InstructionsPage({Key? key}) : super(key: key);

  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Instructions",
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/instruction_image.png"),
            Text(
              "Found something you want to learn about? click the image to get more information.",
              style: TextStyle(fontSize: normalTextFontSize),
            ),
            SizedBox(
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 20),
                          minimumSize: const Size(200, 70)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ExhibitEndPageState extends State<ExhibitEndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Thank you for visiting the",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Text(
              "Wildlife Garden",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Text("Exhibit",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            const Divider(
              thickness: 5,
            ),
            const Text(
              "Further Reading",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Text(
                "https://www.nhm.ac.uk/visit/galleries-and-museum-map/wildlife-garden.html"),
            const Divider(
              thickness: 5,
            ),
            const Text(
              "Exhibits you may like",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Text(
              "Our broken planet",
            ),
            SizedBox(
                height: 60,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            color: Colors.yellow,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.black,
                              textStyle: const TextStyle(fontSize: 20),
                              minimumSize: const Size(200, 70)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomePage()));
                          },
                          child: const Text('Home'),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
