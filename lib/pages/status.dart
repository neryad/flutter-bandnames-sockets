import 'package:brand_name_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Server status : ${socketService.serverStatus}')],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketService.emit('emitir-mensaje',
              {'nombre': 'Flutter', 'mensaje': 'Hola desde fluter'});
        },
      ),
    );
  }
}