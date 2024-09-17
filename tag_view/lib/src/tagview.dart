import 'package:flutter/material.dart';

class TagView extends StatefulWidget {
  List<String> tags = [];
  bool isEnableDelete;
  Color tagBackgroundColor;
  ValueChanged? onDelete;
  ValueChanged? onClick;
  final double spacing;
  final double runSpacing;

  int deletePos = -1;

  TagView(
    this.tags, {
    super.key,
    this.isEnableDelete = false,
    this.tagBackgroundColor = Colors.blueAccent,
    this.onDelete,
    this.onClick,
    this.spacing = 0,
    this.runSpacing = 0,
  }) {}

  @override
  State<StatefulWidget> createState() {
    return _TagView();
  }
}

class _TagView extends State<TagView> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.spacing,
      runSpacing: widget.runSpacing,
      children: widget.tags
          .map(
            (i) => MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: widget.tagBackgroundColor,
              onPressed: () => widget.onClick?.call(widget.tags.indexOf(i)),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    i,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Visibility(
                    visible: widget.isEnableDelete,
                    child: InkWell(
                      onTap: () =>
                          widget.onDelete?.call(widget.tags.indexOf(i)),
                      child: const Icon(
                        Icons.close_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
