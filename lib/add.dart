import 'package:counter_7/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.onEdit,
      required this.label,
      required this.validator});

  final String label;
  final void Function(String? value) onEdit;
  final String? Function(String? validator) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: onEdit,
      onSaved: onEdit,
      validator: validator,
    );
  }
}

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudgetPage> {
  List<String> listJenis = [
    "Makanan",
    "Minuman",
    "Akademis",
    "Jalan-jalan",
    "Misc",
  ];
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int nonimal = 0;
  String jenis = "default";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const LabDrawer(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextInput(
                label: "Judul",
                onEdit: (value) {
                  setState(() {
                    judul = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama lengkap tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextInput(
                label: "Nominal",
                onEdit: (value) {
                  setState(() {
                    nonimal = int.parse(value!);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nominal tidak boleh kosong!';
                  }

                  int? valueNum = int.tryParse(value);
                  if (valueNum == null) {
                    return "Nominal tidak valid";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButton(
                value: jenis,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: [
                  const DropdownMenuItem(
                    value: "default",
                    enabled: false,
                    child: Text("Pilih Jenis"),
                  ),
                  ...listJenis.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList()
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    jenis = newValue!;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  final newBudget = Budget(judul, nonimal, jenis);
                  Provider.of<BudgetModel>(context, listen: false)
                      .add(newBudget);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Simpan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
