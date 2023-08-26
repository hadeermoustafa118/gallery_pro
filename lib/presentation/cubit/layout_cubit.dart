import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery_pro/presentation/screens/photos_screen.dart';
import 'package:gallery_pro/presentation/screens/search_screen.dart';

import '../screens/videos_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);
int selectedIndex = 0;
  List<BottomNavigationBarItem> items = const[
    BottomNavigationBarItem(icon:Icon(Icons.photo_size_select_actual) ,label: 'Photos'),
    BottomNavigationBarItem(icon:Icon(Icons.video_collection) ,label: 'Videos'),
    BottomNavigationBarItem(icon:Icon(Icons.search) ,label: 'Search'),
  ];
  List<Widget> pages = const [
    PhotosScreen(),
    VideosScreen(),
    SearchScreen(),
  ];
  void tap(index){
    selectedIndex = index;
    emit(LayoutState());
  }
}
