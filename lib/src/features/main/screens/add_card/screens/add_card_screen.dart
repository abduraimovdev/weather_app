import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/theme/app_img.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';
import 'package:weather_app/src/features/widget/custom_button.dart';

import '../bloc/add_card_bloc.dart';
import '../widgets/w_card.dart';
import '../widgets/w_selector_color.dart';
import '../widgets/w_selector_image.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Card"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSize.sizeH20,
          WCard(),
          AppSize.sizeH10,
          WSelectorColor(),
          AppSize.sizeH10,
          WSelectorImage(),
          AppSize.sizeH10,
          CustomTextField(
            label: 'Card Holder Name',
            onChange: (String value) {
              context
                  .read<AddCardBloc>()
                  .add(AddCardChangeEvent(cardHolderName: value));
            },
          ),
          CustomTextField(
            label: 'Card Number',
            onChange: (String value) {
              context
                  .read<AddCardBloc>()
                  .add(AddCardChangeEvent(cardNumber: value));
            },
          ),
          CustomTextField(
            label: 'Expiry Date',
            onChange: (String value) {
              context
                  .read<AddCardBloc>()
                  .add(AddCardChangeEvent(expiryDate: value));
            },
          ),
        ],
      ),
      floatingActionButton: CustomButton(
        content: "Add",
        onPressed: () {
          context.read<AddCardBloc>().add(const CardAddEvent());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String value) onChange;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          AppSize.sizeH10,
          TextField(
            onChanged: onChange,
            controller: controller,
            decoration: InputDecoration(
              constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 50,
                  maxHeight: 50,
                  maxWidth: double.infinity),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
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
