import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagView extends StatefulWidget {
  List<String> tags = [];
  bool isEnableDelete;
  Color tagBackgroundColor;

  TagView(this.tags, {this.isEnableDelete = false, this.tagBackgroundColor = Colors.blueAccent}) {}

  @override
  State<StatefulWidget> createState() {
    return _TagView();
  }
}

class _TagView extends State<TagView> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.tags
          .map((i) => Container(
              margin: EdgeInsets.all(5),
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 10, right: 5),
              decoration: BoxDecoration(
                  color: widget.tagBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    i,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Visibility(
                    visible: widget.isEnableDelete,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.tags.remove(i);
                        });
                      },
                      child: Icon(
                        Icons.close_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              )))
          .toList(),
    );
  }
}