import 'package:counter_7/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.onEdit,
      required this.label,
      required this.validator,
      this.onTap});

  final String label;
  final void Function(String? value) onEdit;
  final String? Function(String? validator) validator;
  final void Function()? onTap;

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
      onTap: onTap,
    );
  }
}

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudgetPage> {
  List<String> listJenis = ["Pengeluaran", "Pemasukan"];
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int nonimal = 0;
  String? jenis;
  DateTime? tanggal;

  void submitForm(BuildContext ctx) {
    if (!_formKey.currentState!.validate() || tanggal == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Harap melengkapi data!")));
      return;
    }

    final newBudget = Budget(judul, nonimal, jenis!, tanggal!);
    Provider.of<BudgetModel>(context, listen: false).add(newBudget);

    const snackBar = SnackBar(
      content: Text('Data disimpan!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                    nonimal = int.tryParse(value!) ?? nonimal;
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
              DropdownButtonFormField(
                value: jenis,
                icon: const Icon(Icons.keyboard_arrow_down),
                hint: const Text("Pilih jenis"),
                items: listJenis.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    jenis = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harap memilih jenis!";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(tanggal != null
                      ? "${tanggal!.day}-${tanggal!.month}-${tanggal!.year}"
                      : "Tanggal belum ditentukan"),
                  const Spacer(),
                  TextButton(
                    onPressed: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2030))
                        .then((value) => setState(() {
                              tanggal = value;
                            })),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Pilih Tanggal"),
                    ),
                  )
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () => submitForm(context),
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
