
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../common/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final MaskTextInputFormatter? formatter;
  final TextEditingController? controller;
  final void Function(String value) onChange;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    required this.onChange,
    this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.paddingH16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          AppSize.sizeH10,
          TextField(
            inputFormatters: [
              if(formatter != null) formatter!,
            ],
            onChanged: onChange,
            controller: controller,
            decoration: InputDecoration(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50,
                maxHeight: 50,
                maxWidth: double.infinity,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: AppSize.radiusAll12,
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: AppSize.radiusAll12,
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
