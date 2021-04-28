import 'package:blog_flutter/services/article_service.dart';
import 'package:flutter/material.dart';

class AddWidget extends StatefulWidget {
  @override
  AddWidgetState createState() => new AddWidgetState();
}

class AddWidgetState extends State<AddWidget> {
  String _title = '新增文章';
  GlobalKey _globalKey = new GlobalKey();
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _contentController = new TextEditingController();
  TextEditingController _authorController = new TextEditingController();

  void _handleSave(BuildContext context) {
    if (!(_globalKey.currentState as FormState).validate()) return;
    ArticleService.save(_titleController.text, _contentController.text,
            _authorController.text)
        .then((value) {
      Navigator.of(context).pop(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
              key: _globalKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: '文章标题',
                      icon: Icon(Icons.title),
                      hintText: '请输入文章标题',
                    ),
                    validator: (value) {
                      if (value.trim().length == 0) return '请输入文章标题';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _contentController,
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: '文章内容',
                      icon: Icon(Icons.border_color),
                      hintText: '请输入文章内容',
                    ),
                    validator: (value) {
                      if (value.trim().length == 0) return '请输入文章内容';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _authorController,
                    decoration: InputDecoration(
                      labelText: '文章作者',
                      icon: Icon(Icons.person),
                      hintText: '请输入文章作者',
                    ),
                    validator: (value) {
                      if (value.trim().length == 0) return '请输入文章作者';
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              child: Text('保存'),
                              onPressed: () => _handleSave(context)),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            child: Text('重置'),
                            style: ButtonStyle(
                                backgroundColor: ElevatedBtnBgColor()),
                            onPressed: () =>
                                (_globalKey.currentState as FormState).reset()),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class ElevatedBtnBgColor extends MaterialStateColor {
  static const int _defaultColor = 0xdddddddd;
  static const int _pressedColor = 0xcccccccc;

  ElevatedBtnBgColor() : super(_defaultColor);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return new Color(_pressedColor);
    }
    return new Color(_defaultColor);
  }
}
