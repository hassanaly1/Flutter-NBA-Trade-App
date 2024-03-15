import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:nba_trade/helper/rich_text_field.dart';

class MyPostDialog extends StatefulWidget {
  const MyPostDialog({super.key, required this.onPost});
  final Function onPost;

  @override
  State<MyPostDialog> createState() => _MyPostDialogState();
}

class _MyPostDialogState extends State<MyPostDialog> {
  final _title = QuillController.basic();
  final _description = QuillController.basic();
  final _focusIndex = 0.obs;
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  void initState() {
    _titleFocusNode.addListener(_onFocusChange);
    _descriptionFocusNode.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    print('rizwan object');
    if (_titleFocusNode.hasFocus) {
      _focusIndex.value = 0;
    } else if (_descriptionFocusNode.hasFocus) {
      _focusIndex.value = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text('Post', textAlign: TextAlign.center),
      content: SizedBox(
        width: 500,
        child: Column(
          children: [
            Obx(() => MyQuillToolBar(
                  controller: _focusIndex.value == 0
                      ? _title
                      : _focusIndex.value == 1
                          ? _description
                          : QuillController.basic(),
                )),
            MyQuillEditor(
              hints: 'Title',
              controller: _title,
              focusNode: _titleFocusNode,
            ),
            const SizedBox(height: 8.0),
            MyQuillEditor(
              hints: 'Description',
              controller: _description,
              focusNode: _descriptionFocusNode,
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        InkWell(
          onTap: () => Get.back(),
          child: const Text('Cancel'),
        ),
        InkWell(
          onTap: () {
            widget.onPost(_title.document.toDelta().toJson(),
                _description.document.toDelta().toJson());
          },
          child: const Text('Post'),
        ),
      ],
    );
  }
}
