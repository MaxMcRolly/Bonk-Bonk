import "package:bonkbonk/imports.dart";

late int selectedIndex;
// ignore_for_file: prefer_const_literals_to_create_immutables
GlobalKey navBarGlobalKey = GlobalKey(debugLabel: "navBarKey");

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
    required this.pageController,
  }) : super(key: key);
  final int index;
  final PageController pageController;
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.read<PageViewCubit>().state.currentPageIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.sports_tennis,
          ),
          label: 'Матчи',
          tooltip: 'Матчи',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.leaderboard_outlined,
          ),
          label: 'Статистика',
          tooltip: 'Статистика',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Профиль',
          tooltip: 'Профиль',
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    // widget.pageController.jumpToPage(index);
    widget.pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    context.read<PageViewCubit>().changeCurrentIndex(index);
  }
}
