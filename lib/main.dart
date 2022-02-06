import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'qr_scan.dart';
import 'augmented.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart'
    show ArCoreController;

int normalTextFontSize = 10;

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
    fontSize: 30,
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
            Text(
              "Augmented Reality App",
              style: _biggerFont,
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
            title: const Text("Home"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()));
            },
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SettingsPage()));
            },
          ),
          ListTile(
            title: const Text("Instructions"),
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
  const StandardAppBar({Key? key}) : super(key: key);

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
    return Scaffold(
        appBar: const StandardAppBar(),
        drawer: const MainMenu(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Scan QR Code",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Divider(
                thickness: 5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 200,
                width: 200,
                child: QRCodeScannerView(),
              ),
              const Divider(
                thickness: 5,
                color: Colors.black,
              ),
              _buildContinueButton()
            ],
          ),
        ));
  }

  Widget _buildContinueButton() {
    print((result != null) && describeEnum(result!.format) == "qrcode");
    return (result != null) && describeEnum(result!.format) == "qrcode"
        ? SizedBox(
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
                                  const ARScreen()));
                    },
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ),
          )
        : Container();
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
      body: Column(
        children: [
          const Text("Text Size:"),
          DropdownButton(
            hint: Text(
              normalTextFontSize.toString(),
              style: const TextStyle(color: Colors.blue),
            ),
            isExpanded: true,
            iconSize: 30.0,
            style: const TextStyle(color: Colors.blue),
            items: [10, 12, 14, 16, 18, 20].map(
              (val) {
                return DropdownMenuItem<int>(
                  value: val,
                  child: Text(val.toString()),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  normalTextFontSize = val as int;
                },
              );
            },
          ),
        ],
      ),
    );
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
          children: [
            const Text("Instructions"),
            Image.asset("assets/instruction_image.png"),
            const Text(
                "Found something you want to learn about? click the image to get more information."),
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
        body: ListView(
          children: const [
            Text("Thank you for visiting the"),
            Text("Wildlife Garden"),
            Text("Exhibit"),
            Divider(
              thickness: 5,
            ),
            Text("Further Reading"),
            Text(
                "https://www.nhm.ac.uk/visit/galleries-and-museum-map/wildlife-garden.html"),
          ],
        )
        // Column(children: [
        //   Row(children: const [
        //     Text("Thank you for visiting the"),
        //     Text("Wildlife Garden"),
        //     Text("Exhibit"),
        //   ]),
        //   const Divider(
        //     thickness: 5,
        //   ),
        //   Row(
        //     children: const [
        //       Text("Further Reading"),
        //       Text(
        //           "https://www.nhm.ac.uk/visit/galleries-and-museum-map/wildlife-garden.html")
        //     ],
        //   )
        // ]),
        );
  }
}
