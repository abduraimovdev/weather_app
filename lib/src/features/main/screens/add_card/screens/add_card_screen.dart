import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/snack_bar.dart';
import 'package:weather_app/src/features/widget/custom_button.dart';

import '../bloc/add_card_bloc.dart';
import '../widgets/custom_text_field.dart';
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
        print(state.status);
        if (state.status == AddCardStatus.successAdd) {
          context.pop();
        }
        if (state.status == AddCardStatus.errorAdd) {
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
            AppSize.sizeH10,
            CustomTextField(
              label: 'Card Number',
              onChange: (String value) {
                context
                    .read<AddCardBloc>()
                    .add(AddCardChangeEvent(cardNumber: value));
              },
              formatter: MaskTextInputFormatter(
                mask: '#### #### #### ####',
                filter: {"#": RegExp('[0-9]')},
                type: MaskAutoCompletionType.lazy,
              ),
            ),
            AppSize.sizeH10,
            CustomTextField(
              label: 'Expiry Date',
              onChange: (String value) {
                context
                    .read<AddCardBloc>()
                    .add(AddCardChangeEvent(expiryDate: value));
              },
              formatter: MaskTextInputFormatter(
                mask: '##/##',
                filter: {"#": RegExp('[0-9]')},
                type: MaskAutoCompletionType.lazy,
              ),
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
