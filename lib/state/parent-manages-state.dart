import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() =>  _ParentWidgetState();
}

// ParentWidget manages the state for TapboxB.

//------------------------ ParentWidget --------------------------------

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged
      )
    );
  }
}

//------------------------- TapboxB ----------------------------------

// When creating API, consider using the @required annotation for any
// parameters that your code relies on.
class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
        child: Center(
          child: Text(
              active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white)
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Parent manages state'),
            ),
            body: Center(
                child: ParentWidget()
            )
        )
    );
  }
}

void main() => runApp(MyApp());