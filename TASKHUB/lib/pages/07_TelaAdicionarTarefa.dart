import 'package:flutter/material.dart';
import 'package:atividade_igor/class/tarefa.dart';

class TelaAdicionarTarefa extends StatefulWidget {
  final Function(Tarefa) onSalvar;

  TelaAdicionarTarefa({required this.onSalvar});

  @override
  _TelaAdicionarTarefaState createState() => _TelaAdicionarTarefaState();
}

class _TelaAdicionarTarefaState extends State<TelaAdicionarTarefa> {
  final _nomeController = TextEditingController();
  DateTime? _data;
  TimeOfDay? _horaInicio;
  TimeOfDay? _horaFim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff5614c0),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome da Tarefa'),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(_data == null ? 'Selecionar Data' : 'Data: ${_data!.day}/${_data!.month}/${_data!.year}'),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? dataSelecionada = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (dataSelecionada != null) {
                  setState(() {
                    _data = dataSelecionada;
                  });
                }
              },
            ),
            ListTile(
              title: Text(_horaInicio == null ? 'Selecionar Hora de Início' : 'Hora de Início: ${_horaInicio!.hour}:${_horaInicio!.minute}'),
              trailing: Icon(Icons.access_time),
              onTap: () async {
                TimeOfDay? horaSelecionada = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (horaSelecionada != null) {
                  setState(() {
                    _horaInicio = horaSelecionada;
                  });
                }
              },
            ),
            ListTile(
              title: Text(_horaFim == null ? 'Selecionar Hora de Fim' : 'Hora de Fim: ${_horaFim!.hour}:${_horaFim!.minute}'),
              trailing: Icon(Icons.access_time),
              onTap: () async {
                TimeOfDay? horaSelecionada = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (horaSelecionada != null) {
                  setState(() {
                    _horaFim = horaSelecionada;
                  });
                }
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final nome = _nomeController.text;
                if (nome.isNotEmpty) {
                  final novaTarefa = Tarefa(
                    nome: nome,
                    data: _data,
                    horaInicio: _horaInicio,
                    horaFim: _horaFim,
                  );
                  widget.onSalvar(novaTarefa);
                  Navigator.pop(context); 
                  // Fechar a tela após salvar
                }
              },style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color(0xff5614c0), // Cor do texto
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Espaçamento
                 shape: RoundedRectangleBorder( 
                  // Formato do botão
                    borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Text('Salvar', style: TextStyle(fontSize: 15)), // Estilo do texto
),
          ],
        ),
      ),
    );
  }
}
