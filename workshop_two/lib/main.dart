import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Two',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Workshop Two'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //RESOLUTION : Créer une scène avec des champs et une checkbox
              TextField(decoration: InputDecoration(hintText: 'Username')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              SizedBox(height: 16),
              Row(
                children: [
                  // Ce container nous permet de construire une checkbox from scratch
                  // sans utiliser le composant natif
                  // RESOLUTION: Transformer ce container en un StatefulWidget nommé MyCheckBox
                  MyCheckbox(
                    checked: _checked,
                    onCheckBoxChanged: (checked) {
                      setState(() {
                        _checked = checked;
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  Text('Remember Me'),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Nothing To Do for the moment'),
        child: Icon(Icons.check),
      ),
    );
  }
}

class MyCheckbox extends StatefulWidget {
  final bool checked;
  final void Function(bool checked) onCheckBoxChanged;

  const MyCheckbox({
    Key key,
    @required this.checked,
    @required this.onCheckBoxChanged,
  }) : super(key: key);

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    //RESOLUTION: Interagir avec la checkbox via l'API GestureDetector
    return GestureDetector(
      onTap: () {
        //RESOLUTION: le bool checked est maintenant géré par le noeud parent, comment gérer le OnTap ?
        widget.onCheckBoxChanged(!widget.checked);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(4),
        ),
        child: widget.checked
            ? Icon(Icons.check)
            : SizedBox(width: 24, height: 24),
      ),
    );
  }
}