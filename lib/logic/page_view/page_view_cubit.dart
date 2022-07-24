import 'package:bloc/bloc.dart';
import "package:bonkbonk/imports.dart";
import 'package:equatable/equatable.dart';

part 'page_view_state.dart';

class PageViewCubit extends Cubit<PageViewState> {
  int currentPageIndex;
  PageViewCubit({required this.currentPageIndex})
      : super(PageViewState(currentPageIndex: currentPageIndex));

  changeCurrentIndex(newPageIndex) {
    emit(PageViewState(currentPageIndex: newPageIndex));
  }
}
