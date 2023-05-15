import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napt_sklad/controller/blocs/bottom_selection/selector_blo_c_bloc.dart';
import 'package:napt_sklad/controller/data/model/search/search_data.dart';
import 'package:napt_sklad/controller/provider/focus_nodes.dart';

class BottomGridRow extends StatelessWidget {
  final Data dataModel;
  final int index;
  const BottomGridRow(
      {super.key, required this.dataModel, required this.index});

  @override
  Widget build(BuildContext context) {
    final selectorCubit = BlocProvider.of<SelectorBloC>(context);
    return BlocBuilder<SelectorBloC, SelectorBloCState>(
      bloc: selectorCubit,
      builder: (context, state) {
        SelectorBloCIndexState selector =
            selectorCubit.state as SelectorBloCIndexState;

        state as SelectorBloCIndexState;

        return RawKeyboardListener(
          focusNode: context.read<FocusNodesProvider>().focusNodeBottomPanel,
          autofocus:
              context.read<FocusNodesProvider>().focusNodeBottomPanel.hasFocus,
          onKey: (value) {
            if (value.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
              selectorCubit
                  .add(SelectorKeyDownEvent(currentIndex: state.currentIndex));
            } else if (value.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
              selectorCubit
                  .add(SelectorKeyUpEvent(currentIndex: state.currentIndex));
            }
          },
          child: GestureDetector(
            onTap: () {
              selectorCubit.add(SelectorClickEvent(currentIndex: index));
              context
                  .read<FocusNodesProvider>()
                  .focusNodeBottomPanel
                  .requestFocus();
            },
            child: ColoredBox(
              color: state.currentIndex == index
                  ? Colors.blue
                  : Colors.transparent,
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Flexible(
                      flex: 18,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          dataModel.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          dataModel.manufacturer,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: const Text(
                          "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: const Text(
                          "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: const Text(
                          "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: const Text(
                          "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: const Text(
                          "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: const Text(
                          "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: const Text(
                          "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    ;
  }
}
