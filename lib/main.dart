// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'qr_scan.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'NHM AR App',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final _biggerFont = const TextStyle(
//     fontSize: 30,
//     fontWeight: FontWeight.bold,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(""),
//           // title: Image.asset(
//           //   "assets/nhm_logo.png",
//           //   width: 100,
//           //   height: 100,
//           //   alignment: FractionalOffset.center,
//           // ),
//           centerTitle: true,
//           backgroundColor: Colors.black54,
//         ),
//         drawer: const MainMenu(),
//         body: Column(
//           children: [
//             Image.asset(
//               "assets/nhm_logo.png",
//               width: 125,
//               height: 125,
//             ),
//             Text(
//               "Augmented Reality App",
//               style: _biggerFont,
//             ),
//             CarouselSlider(
//               items: [
//                 Container(
//                   margin: const EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0),
//                       image: const DecorationImage(
//                         image: AssetImage("assets/homepage_image1.png"),
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0),
//                       image: const DecorationImage(
//                         image: AssetImage("assets/homepage_image2.png"),
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0),
//                       image: const DecorationImage(
//                         image: AssetImage("assets/homepage_image3.png"),
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0),
//                       image: const DecorationImage(
//                         image: AssetImage("assets/homepage_image4.png"),
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//               ],
//               options: CarouselOptions(
//                 height: 300.0,
//                 enlargeCenterPage: true,
//                 autoPlay: true,
//                 aspectRatio: 16 / 9,
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enableInfiniteScroll: false,
//                 // autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                 viewportFraction: 0.8,
//               ),
//             ),
//             const SizedBox(height: 30),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(4),
//               child: Stack(
//                 children: <Widget>[
//                   Positioned.fill(
//                     child: Container(
//                       // decoration: const BoxDecoration(
//                       //   gradient: LinearGradient(
//                       //     colors: <Color>[
//                       //       Color(0xFF0D47A1),
//                       //       Color(0xFF1976D2),
//                       //       Color(0xFF42A5F5),
//                       //     ],
//                       //   ),
//                       // ),
//                       color: Colors.yellow,
//                     ),
//                   ),
//                   TextButton(
//                     style: TextButton.styleFrom(
//                         padding: const EdgeInsets.all(16.0),
//                         primary: Colors.black,
//                         textStyle: const TextStyle(fontSize: 20),
//                         minimumSize: const Size(200, 70)),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   const QRCodeScannerPage()));
//                     },
//                     child: const Text('Start'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }

// class MainMenu extends StatelessWidget {
//   const MainMenu({Key? key}) : super(key: key);

// //   @override
// //   _MainMenuState createState() => _MainMenuState();
// // }

// // class _MainMenuState extends State<MainMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: <Widget>[
//           ListTile(
//             title: const Text("Home"),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (BuildContext context) => const HomePage()));
//             },
//           ),
//           const ListTile(
//             title: Text("Settings"),
//           ),
//           const ListTile(
//             title: Text("Instructions"),
//           )
//         ],
//       ),
//     );
//   }
// }

// class StandardAppBar extends StatelessWidget with PreferredSizeWidget {
//   const StandardAppBar({Key? key}) : super(key: key);

// //   @override
// //   _StandardAppBarState createState() => _StandardAppBarState();
// // }

// // class _StandardAppBarState extends State<StandardAppBar> {
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Image.asset(
//         "assets/nhm_logo.png",
//         width: 100,
//         height: 100,
//       ),
//       centerTitle: true,
//       backgroundColor: Colors.black54,
//     );
//   }
// }

// class QRCodeScannerPage extends StatefulWidget {
//   const QRCodeScannerPage({Key? key}) : super(key: key);

//   @override
//   _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
// }

// class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const StandardAppBar(),
//       drawer: const MainMenu(),
//       body: Column(
//         children: [
//           const Text(
//             "Scan QR Code",
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//           const Divider(
//             thickness: 5,
//             color: Colors.black,
//           ),
//           const Center(
//             child: SizedBox(
//               height: 200,
//               width: 200,
//               child: QRCodeScannerView(),
//             ),
//           ),
//           const Divider(
//             thickness: 5,
//             color: Colors.black,
//           ),
//           _buildContinueButton()
//           // const SizedBox(height: 30),
//           // ClipRRect(
//           //   borderRadius: BorderRadius.circular(4),
//           //   child: Stack(
//           //     children: <Widget>[
//           //       Positioned.fill(
//           //         child: Container(
//           //           // decoration: const BoxDecoration(
//           //           //   gradient: LinearGradient(
//           //           //     colors: <Color>[
//           //           //       Color(0xFF0D47A1),
//           //           //       Color(0xFF1976D2),
//           //           //       Color(0xFF42A5F5),
//           //           //     ],
//           //           //   ),
//           //           // ),
//           //           color: Colors.yellow,
//           //         ),
//           //       ),
//           //       TextButton(
//           //         style: TextButton.styleFrom(
//           //             padding: const EdgeInsets.all(16.0),
//           //             primary: Colors.black,
//           //             textStyle: const TextStyle(fontSize: 20),
//           //             minimumSize: const Size(200, 70)),
//           //         onPressed: () {
//           //           Navigator.push(
//           //               context,
//           //               MaterialPageRoute(
//           //                   builder: (BuildContext context) =>
//           //                       const QRCodeScannerPage()));
//           //         },
//           //         child: const Text('Continue'),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContinueButton() {
//     // print(result == null);
//     return (result != null) //&& describeEnum(result!.format) == "qrcode")
//         ? SizedBox(
//             height: 50,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(4),
//               child: Stack(
//                 children: <Widget>[
//                   Positioned.fill(
//                     child: Container(
//                       color: Colors.yellow,
//                     ),
//                   ),
//                   TextButton(
//                     style: TextButton.styleFrom(
//                         padding: const EdgeInsets.all(16.0),
//                         primary: Colors.black,
//                         textStyle: const TextStyle(fontSize: 20),
//                         minimumSize: const Size(200, 70)),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   const QRCodeScannerPage()));
//                     },
//                     child: const Text('Continue'),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         : Container();
//   }
// }

import 'augmented.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart'
    show ArCoreController;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('ARCORE IS AVAILABLE?');
  print(await ArCoreController.checkArCoreAvailability());
  print('\nAR SERVICES INSTALLED?');
  print(await ArCoreController.checkIsArCoreInstalled());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   title: 'NHM AR App',
    //   home: HelloWorld(),
    // );
    return const HelloWorld();
  }
}
