import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/service_locator.dart';
import '../cubit/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LayoutCubit>(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            body: cubit.pages[cubit.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.orange,
              showUnselectedLabels: false,
              items: cubit.items,
              currentIndex: cubit.selectedIndex,
              onTap: cubit.tap,
            ),
          );
        },
      ),
    );
  }
}
