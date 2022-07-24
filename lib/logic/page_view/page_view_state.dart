part of 'page_view_cubit.dart';

class PageViewState extends Equatable {
  int currentPageIndex;
  PageViewState({required this.currentPageIndex});

  @override
  List<Object> get props => [currentPageIndex];
}
