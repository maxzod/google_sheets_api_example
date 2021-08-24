import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sheets_api_example/src/modules/sheet_rows/cubit/sheet_rows_cubit.dart';
import 'package:google_sheets_api_example/src/modules/sheet_rows/widgets/row_item_card.dart';

class SheetRowsPage extends StatelessWidget {
  const SheetRowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sheet rows'),
        centerTitle: true,
      ),
      body: BlocBuilder<SheetRowsCubit, SheetRowsState>(
        bloc: SheetRowsCubit(),
        builder: (context, state) {
          if (state is SheetRowsLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is SheetRowsFailure) {
            return Center(child: Text(state.msg));
          } else if (state is SheetRowsLoaded) {
            return ListView.builder(
              itemCount: state.rows.length,
              itemBuilder: (context, index) {
                return RowItemCard(state.rows[index]);
              },
            );
          }
          throw state;
        },
      ),
    );
  }
}
