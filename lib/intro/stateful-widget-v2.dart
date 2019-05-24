import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome()
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null
          ),
          title: Text('Example title'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: null
            )
          ],
        ),
        body: Center(
          child: Counter(),
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add',
            child: Icon(Icons.add),
            onPressed: null
        )
    );
  }

}

class CounterDisplay extends StatelessWidget{
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment')
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CounterIncrementor(onPressed: _increment),
        CounterDisplay(count: _counter)
      ],
    );
  }

}