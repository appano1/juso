import 'package:flutter/material.dart';
import 'package:juso/juso.dart';

Future<void> main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Juso demo app',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Juso? juso;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Juso Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (juso != null) Text('주소: ${juso!.address}'),
          TextButton(
            onPressed: () async {
              final juso = await Navigator.push<Juso?>(
                context,
                MaterialPageRoute(builder: (context) => const JusoScreen()),
              );

              setState(() {
                this.juso = juso;
              });
            },
            child: const Text("Let's find Korean address 🚀"),
          ),
          Container(),
        ],
      ),
    );
  }
}

class JusoScreen extends StatelessWidget {
  const JusoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('주소 검색')),
      body: JusoWebView(),
    );
  }
}
