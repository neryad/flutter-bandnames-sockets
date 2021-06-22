import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
//import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  Function get emit => this._socket.emit;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;
  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    //TODO : Borrar ==> ip 192.168.0.117:3000

    this._socket = IO.io('http://localhost:3000/',
        IO.OptionBuilder().setTransports(['websocket']).build());

    this._socket.onConnect((_) {
      notifyListeners();

      this._serverStatus = ServerStatus.Online;
    });

    this._socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
  }
}
