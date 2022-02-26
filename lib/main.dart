import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  double imc = 0.0;
  String classificacaoImc = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "logo_imc.png",
                    height: 100.0,
                    width: 100.0,
                  ),
                  // imagem disponivel em: https://www.gratispng.com/baixar/bmi.html
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 50.0, bottom: 20.0),
                    child: Text("Digite as seguintes informações:",
                        style: TextStyle(fontSize: 20.0)),
                  ),
                  TextField(
                    controller: controllerPeso,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                        hintText: "Peso (Kg ex. 75.3)",
                        prefixIcon: Icon(Icons.monitor_weight),
                        border: OutlineInputBorder()),
                  ),
                  Divider(),
                  TextField(
                    controller: controllerAltura,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                        hintText: "Altura (Metros ex. 1.85)",
                        prefixIcon: Icon(Icons.height),
                        border: OutlineInputBorder()),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                    child: ElevatedButton(
                        onPressed: () => calculaImc(
                            double.parse(controllerPeso.text),
                            double.parse(controllerAltura.text)),
                        child: Text(
                          "Calcular IMC",
                          style: TextStyle(fontSize: 28.0),
                        )),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Resultado: $classificacaoImc",
                      style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  void calculaImc(double peso, double altura) {
    imc = (peso / (altura * altura));
    classificaImc(imc);
  }

  void classificaImc(double imc) {
    if (imc < 18.5) {
      setState(() {
        classificacaoImc = "Baixo Peso";
      });
    } else if (imc >= 18.5 && imc <= 24.9) {
      setState(() {
        classificacaoImc = "Peso Normal";
      });
    } else if (imc >= 25.0 && imc <= 29.9) {
      setState(() {
        classificacaoImc = "Excesso de Peso";
      });
    } else if (imc >= 30.0 && imc <= 34.9) {
      setState(() {
        classificacaoImc = "Obesidade grau 1";
      });
    } else if (imc >= 35.0 && imc <= 39.9) {
      setState(() {
        classificacaoImc = "Obesidade grau 2";
      });
    } else {
      setState(() {
        classificacaoImc = "Obesidade grau 3";
      });
    }
  }
}
