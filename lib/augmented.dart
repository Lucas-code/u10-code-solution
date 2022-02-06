import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'main.dart';

class ARScreen extends StatefulWidget {
  const ARScreen({Key? key}) : super(key: key);
  @override
  _ARScreenState createState() => _ARScreenState();
}

class _ARScreenState extends State<ARScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[];
  late ArCoreController arCoreController;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/nhm_logo.png",
          width: 100,
          height: 100,
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
        actions: (_selectedIndex != 2)
            ? <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  tooltip: "Next Section",
                  onPressed: () {
                    setState(() {
                      _selectedIndex = _selectedIndex + 1;
                    });
                  },
                )
              ]
            : <Widget>[
                IconButton(
                  icon: const Icon(Icons.check_circle_outline_outlined),
                  tooltip: "End Session",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ExhibitEndPage()));
                  },
                )
              ],
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
        enablePlaneRenderer: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up_alt), label: "Section 1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up_alt), label: "Section 2"),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up_alt), label: "Section 3")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    // arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onPlaneTap = _onPlaneTap;

    // _addSphere(arCoreController);
    // _addCylindre(arCoreController);
    // _addCube(arCoreController);
  }

  _onPlaneTap(List<ArCoreHitTestResult> hits) => _onHitDetected(hits.first);

  _onHitDetected(ArCoreHitTestResult plane) {
    arCoreController.addArCoreNodeWithAnchor(
      ArCoreReferenceNode(
        name: "WhaleModel",
        object3DFileName: "WhaleModel.sfb",
        position: plane.pose.translation,
        rotation: plane.pose.rotation,
      ),
    );
  }

  void onTapHandler(String name) {}

  void _addWhaleModel(ArCoreController controller) {}

  void _addSphere(ArCoreController controller) {
    final material =
        ArCoreMaterial(color: const Color.fromARGB(120, 66, 134, 244));
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.1,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  void _addCylindre(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: const Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }

  // void _stageOneScreen() {
  //   return
  // }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
