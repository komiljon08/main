// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'slider_cubit_cubit.dart';

abstract class SliderCubitState {}

class SliderCubitData extends SliderCubitState {
  int contentLength;
  int pageIndex;
  PageController pageController;

  SliderCubitData(
    this.contentLength,
    this.pageIndex,
    this.pageController,
  );
}
