 


 import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  static final WebSocketService _instance = WebSocketService._internal();
  factory WebSocketService() => _instance;

  WebSocketService._internal();

  WebSocketChannel? _channel;

  final StreamController<dynamic> _controller =
      StreamController<dynamic>.broadcast();

  Stream get stream => _controller.stream;

  void connect() {
    final url = 'ws://192.168.4.1:81';

    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));

      print("🔌 Connected");

      _channel!.stream.listen(
        (data) {
          print("📩 Incoming: $data");

          if (!_controller.isClosed) {
            _controller.add(data);
          }
        },
        onError: (error) {
          print("💥 Error: $error");
        },
        onDone: () {
          print("❌ Disconnected");
        },
           
      );
    } catch (e) {
      print("❌ Connection failed: $e");
    }
  }

  void dispose() {
    _channel?.sink.close();
    _controller.close();
  }
}

//  import 'dart:async';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class WebSocketService {
//   static final WebSocketService _instance = WebSocketService._internal();
//   factory WebSocketService() => _instance;

//   WebSocketService._internal();

//   WebSocketChannel? _channel;

//   final StreamController<dynamic> _controller =
//       StreamController<dynamic>.broadcast();

//   Stream get stream => _controller.stream;

//   Timer? _reconnectTimer;
//   bool _isConnecting = false;
//   bool isConnected = false;

//   final String url = 'ws://192.168.4.1:81';

//   Future<void> connect() async {
//   if (_isConnecting) return;

//   _isConnecting = true;

//   try {
//     print("🔄 Trying to connect...");

//     _channel = WebSocketChannel.connect(Uri.parse(url));

//     bool gotResponse = false;

//     _channel!.stream.listen(
//       (data) {
//         gotResponse = true;

//         if (!_controller.isClosed) {
//           _controller.add(data);
//         }
//       },
//       onError: (_) => _handleDisconnect(),
//       onDone: () => _handleDisconnect(),
//       cancelOnError: true,
//     );

//     // 👇 أهم جزء: timeout حقيقي
//     await Future.delayed(const Duration(seconds: 3));

//     if (!gotResponse) {
//       throw Exception("ESP not responding");
//     }

//     isConnected = true;
//     print("✅ REAL Connected");

//   } catch (e) {
//     print("❌ Failed connect: $e");
//     _handleDisconnect();
//   }

//   _isConnecting = false;
// }
//   void _handleDisconnect() {
//     isConnected = false;
//     _isConnecting = false;

//     print("📴 ESP Offline");

//     _scheduleReconnect();
//   }

//   void _scheduleReconnect() {
//     _reconnectTimer?.cancel();

//     _reconnectTimer = Timer(const Duration(seconds: 15), () {
//       connect();
//     });
//   }

//   void send(String message) {
//     if (!isConnected) return;
//     _channel?.sink.add(message);
//   }

//   void dispose() {
//     _reconnectTimer?.cancel();
//     _channel?.sink.close();
//     _controller.close();
//   }
// }