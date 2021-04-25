import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String title;

  FormWidget({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Form(
        child: FormField(builder: (context) {
          return Text('sasas');
        }),
      ),
    );
  }
}
