import 'package:fl_complements/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variable key para tener el estado del form
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    // Mapa con los valores del formulario
    final Map<String, String> formValues = {
      // formPropertty:
      'first_name': 'Deborah',
      'last_name': 'Mizrahi',
      'email': 'deborah@gmail.com',
      'password': '123456',
      'role': 'Admin'
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Inputs y Forms')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputFieldWidget(
                  hintText: 'Nombre de usuario',
                  labelText: 'Nombre',
                  // Y el mapa completo
                  fromValues: formValues,
                  // Pasamos el key del mapa
                  fromPropertty: 'first_name',
                ),
                const SizedBox(height: 30),
                CustomInputFieldWidget(
                  hintText: 'Apellido del usuario',
                  labelText: 'Apellido',
                  fromValues: formValues,
                  fromPropertty: 'last_name',
                ),
                const SizedBox(height: 30),
                CustomInputFieldWidget(
                  hintText: 'Correo del usuario',
                  labelText: 'Correo',
                  keyboardType: TextInputType.emailAddress,
                  fromValues: formValues,
                  fromPropertty: 'email',
                ),
                const SizedBox(height: 30),
                CustomInputFieldWidget(
                  hintText: 'Contraseña del usuario',
                  labelText: 'Contraseña',
                  obscureText: true,
                  fromValues: formValues,
                  fromPropertty: 'password',
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(
                        value: 'Superuser', child: Text('Superuser')),
                    DropdownMenuItem(
                        value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem(
                        value: 'Jr. Developer', child: Text('Jr. Developer')),
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Guardar'),
                    ),
                  ),
                  onPressed: () {
                    if (!myFormKey.currentState!.validate()) {
                      print('Formulario no válido');
                      return;
                    }

                    //* imprimir valores del fomulario
                    print(formValues);

                    //Esto es para ocultar el teclado al apretar el boton
                    //FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
