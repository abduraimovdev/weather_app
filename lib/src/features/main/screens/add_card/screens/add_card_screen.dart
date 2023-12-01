import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/common/theme/app_img.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';
import 'package:weather_app/src/common/util/snack_bar.dart';
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
    return BlocListener<AddCardBloc, AddCardState>(
      listener: (context, state) {
        if(state.status == AddCardStatus.successAdd) {
          context.pop();
        }
        if(state.status == AddCardStatus.errorAdd) {
          showSnackBar(context, "Malumot To'liq kiriting");
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Add Card"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSize.sizeH20,
            const WCard(),
            AppSize.sizeH10,
            const WSelectorColor(),
            AppSize.sizeH10,
            const WSelectorImage(),
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
      ),
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
              focusedBorder: OutlineInputBorder(
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
