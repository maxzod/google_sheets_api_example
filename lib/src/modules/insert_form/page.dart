import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';

import 'cubit/insert_one_cubit_cubit.dart';

class InsertFormPage extends StatelessWidget {
  const InsertFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = InsertOneCubitCubit();
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('instert one'),
        centerTitle: true,
      ),
      body: Form(
        key: cubit.formKey,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child:
              BlocConsumer<InsertOneCubitCubit, InsertOneCubitState>(
            bloc: cubit,
            listener: (context, state) {
              if (state is InsertOneFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.msg)));
              }
              if (state is InsertOneSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('success')));
              }
            },
            builder: (context, state) {
              if (state is InsertOneLoading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              return ListView(
                children: [
                  TextFormField(
                    controller: cubit.nameController,
                    decoration:
                        const InputDecoration(labelText: 'Name'),
                    validator: qValidator(
                      [
                        const IsRequired(),
                        const MinLength(5),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: cubit.emailController,
                    decoration:
                        const InputDecoration(labelText: 'Email'),
                    validator: qValidator(
                      [
                        const IsRequired(),
                        const IsEmail(),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: cubit.mobileController,
                    keyboardType: TextInputType.phone,
                    decoration:
                        const InputDecoration(labelText: 'Mobile'),
                    validator: qValidator(
                      [const IsRequired(), const MinLength(9)],
                    ),
                  ),
                  TextFormField(
                    controller: cubit.modelNumberController,
                    decoration: const InputDecoration(
                        labelText: 'Model Number'),
                    validator: qValidator(
                      [
                        const IsRequired(),
                        const MinLength(5),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextButton.icon(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000, 1, 1),
                        lastDate: DateTime.now()
                            .add(const Duration(days: 365 * 20)),
                      );
                      if (date != null) {
                        cubit.purchaseDate = date;
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: Text(
                      cubit.purchaseDate == null
                          ? 'click to chose date'
                          : '${cubit.purchaseDate!.year}-${cubit.purchaseDate!.month}-${cubit.purchaseDate!.day}',
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  MaterialButton(
                    onPressed: cubit.createOne,
                    color: theme.primaryColor,
                    child: Text(
                      'Submit',
                      style: theme.textTheme.headline6!
                          .apply(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
