import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napt_sklad/controller/blocs/bottom_selection/selector_blo_c_bloc.dart';
import 'package:napt_sklad/controller/blocs/top_selection/top_selection_bloc.dart';
import 'package:napt_sklad/controller/cubits/search_cubit/search_cubit_cubit.dart';
import 'package:napt_sklad/controller/provider/focus_nodes.dart';
import 'package:provider/provider.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);

    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (value) {
        if (value.logicalKey == LogicalKeyboardKey.arrowDown) {
          context
              .read<FocusNodesProvider>()
              .focusNodeBottomPanel
              .requestFocus();
          context.read<FocusNodesProvider>().focusNodeTopPanel.unfocus();
          context
              .read<SelectorBloC>()
              .add(const SelectorKeyDownEvent(currentIndex: 0));
        } else if (value.logicalKey == LogicalKeyboardKey.arrowUp) {
          context.read<FocusNodesProvider>().focusNodeBottomPanel.unfocus();
          context.read<FocusNodesProvider>().focusNodeTopPanel.requestFocus();
          context
              .read<TopSelectionBloc>()
              .add(const TopSelectionUp(currentIndex: 0));
        }
      },
      child: TextField(
        focusNode: context.read<FocusNodesProvider>().focusNodeSearchBox,
        autofocus:
            context.read<FocusNodesProvider>().focusNodeSearchBox.hasFocus,
        onChanged: (value) {
          searchCubit.getData(value);
          context
              .read<SelectorBloC>()
              .add(const SelectorClickEvent(currentIndex: 0));
        },
        decoration: InputDecoration(
          hintText: "Поиск",
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}
