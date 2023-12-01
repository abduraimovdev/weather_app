import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/common/router/routes.dart';
import 'package:weather_app/src/common/theme/theme.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';
import 'package:weather_app/src/features/main/screens/card/screens/card_screen.dart';

import '../../../common/dependecies/dependency_injection.dart';
import '../bloc/main_bloc.dart';
import '../widgets/w_custom_button_bar.dart';
import 'card/bloc/card_bloc.dart';
import 'home/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _listener(BuildContext context, MainState state) {
    if (state.status == MainStatus.changeScreen) {
      pageController.jumpToPage(state.page);
    }
  }

  @override
  Widget build(BuildContext context) => BlocListener<MainBloc, MainState>(
        listener: _listener,
        child: Scaffold(
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomeScreen(),
              BlocProvider(
                create: (context) => $sl<CardBloc>()..add(const GetCardEvent()),
                child: const CardScreen(),
              ),
            ],
          ),
          bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) => CustomBottomBar(
              currentIndex: state.page,
              onTap: (page) =>
                  context.read<MainBloc>().add(MainChangeEvent(page: page)),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: context.color.white,
            onPressed: () {
              context.pushNamed(AppRouteNames.addCard);
            },
            shape: RoundedRectangleBorder(
              borderRadius: AppSize.radiusAll40,
            ),
            child: Icon(
              Icons.add_card,
              color: context.color.lightBlue,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      );
}
