import "package:bonkbonk/imports.dart";
import 'package:bonkbonk/screens/matches.dart';
import 'package:bonkbonk/screens/profile.dart';
import 'package:bonkbonk/widgets/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController homePageController =
      PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageViewCubit, PageViewState>(builder: (context, state) {
      return Scaffold(
        body: PageView(
          onPageChanged: (value) {
            context.read<PageViewCubit>().changeCurrentIndex(value);
          },
          controller: homePageController,
          children: [
            MatchesScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
            index: state.currentPageIndex, pageController: homePageController),
      );
    });
  }
}
