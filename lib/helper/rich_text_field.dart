import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'colors.dart';

class MyQuillToolBar extends StatelessWidget {
  const MyQuillToolBar({super.key, required this.controller});
  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuillToolbar(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              QuillToolbarToggleStyleButton(
                options: const QuillToolbarToggleStyleButtonOptions(),
                controller: controller,
                attribute: Attribute.bold,
              ),
              QuillToolbarToggleStyleButton(
                options: const QuillToolbarToggleStyleButtonOptions(),
                controller: controller,
                attribute: Attribute.italic,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.underline,
              ),
              QuillToolbarColorButton(
                controller: controller,
                isBackground: false,
              ),
              QuillToolbarColorButton(
                controller: controller,
                isBackground: true,
              ),
              QuillToolbarToggleCheckListButton(
                controller: controller,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.ol,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.ul,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.blockQuote,
              ),
              const VerticalDivider(),
            ],
          ),
        ),
        Divider(color: MyColorHelper.black.withOpacity(0.10)),
      ],
    );
  }
}

class MyQuillEditor extends StatelessWidget {
  const MyQuillEditor(
      {super.key,
      required this.controller,
      this.focusNode,
      this.readOnly = false,
      this.hints,
      this.textStyles});
  final QuillController controller;
  final FocusNode? focusNode;
  final bool readOnly;
  final String? hints;
  final DefaultStyles? textStyles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: !readOnly ? const EdgeInsets.all(16.0) : null,
      decoration: !readOnly
          ? BoxDecoration(
              color: MyColorHelper.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: MyColorHelper.black.withOpacity(0.10),
              ))
          : null,
      child: QuillEditor.basic(
        focusNode: focusNode,
        configurations: QuillEditorConfigurations(
          scrollPhysics: const NeverScrollableScrollPhysics(),
          placeholder: hints,
          controller: controller,
          readOnly: readOnly,
          showCursor: !readOnly,
          sharedConfigurations: const QuillSharedConfigurations(
            locale: Locale('de'),
          ),
          customStyles: textStyles,
        ),
      ),
    );
  }
}
