import 'package:firebase/src/Presentation/Pages/Home/home_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeBottombar extends StatelessWidget {

  HomeViewModel vm;
  BuildContext context;

  HomeBottombar(this.context, this.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Post'),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: 'My Post'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
      ],
      currentIndex: vm.currentIndex,
      onTap: (index){
          vm.currentIndex = index;
      },);
  }
}