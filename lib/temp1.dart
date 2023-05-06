// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:http/http.dart' as http;
// import 'package:technician_seller_side/const.dart';
//
// import 'Models/Message.dart';
//
// class ChatScreen extends StatefulWidget {
//   final String myUserId;
//   final String otherUserId;
//
//   ChatScreen({required this.myUserId, required this.otherUserId,});
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController _messageController = TextEditingController();
//   List<Message> _messages = [];
//   bool isConnected = false;
//   String roomId=" ";
//   int _page = 1;
//   bool _isLoading = false;
//
//   late IO.Socket socket;
//   void connectToServer() {
//     try {
//       // Configure socket transports must be specified
//       socket = IO.io('http://localhost:3000/',IO.OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());
//     } catch (e) {
//       print(e.toString());
//     }
//
//
//   }
//   @override
//   void initState() {
//     print(widget.myUserId);
//     print(widget.otherUserId);
//     super.initState();
//     connectToServer();
//     if (widget.myUserId.compareTo(widget.otherUserId) < 0) {
//       roomId = '${widget.myUserId}${widget.otherUserId}';
//     } else {
//       roomId = '${widget.otherUserId}${widget.myUserId}';
//     }
//     socket.emit('join', roomId );
//     socket.onConnect((data) {
//       print('Connected to socket');
//       isConnected = true;
//     });
//     socket.onDisconnect((data) {
//       print('Disconnected from socket');
//       isConnected = false;
//     });
//     socket.connect();
//     socket.on('message', _handleIncomingMessage);
//   }
//
//   Future<void> _loadMessages() async {
//     if (!_isLoading) {
//       setState(() {
//         _isLoading = true;
//       });
//       final response = await http.get(
//           Uri.parse('${baseUrl}messages/${widget.myUserId}/${widget.otherUserId}/$_page'));
//       final data = jsonDecode(response.body);
//       final messages = List<Message>.from(
//           data['messages'].map((messageJson) => Message.fromJson(messageJson)));
//       setState(() {
//         _messages.addAll(messages);
//         _isLoading = false;
//         _page++;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     socket.off('message', _handleIncomingMessage);
//     super.dispose();
//   }
//
//   void _handleIncomingMessage(data) {
//     setState(() {
//       Message message = Message(
//         senderId: widget.myUserId,
//         receiverId: widget.otherUserId,
//         text: data['text'].toString(),
//       );
//       _messages.add(message);
//     });
//   }
//
//   void _sendMessage() {
//     print(1);
//     String text = _messageController.text.trim();
//     if (text.isNotEmpty&&isConnected==true) {
//       Map<String, String> message = {
//         'senderId': widget.myUserId,
//         'receiverId': widget.otherUserId,
//         'text': text,
//         'roomId':roomId
//       };
//       socket.emit('message', message);
//
//       _messageController.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.otherUserId}'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length + 1,
//               itemBuilder: (BuildContext context, int index) {
//                 if (index == _messages.length) {
//                   return _isLoading
//                       ? Center(child: CircularProgressIndicator())
//                       : SizedBox();
//                 } else {
//                   final message = _messages[index];
//                   final isMyMessage = message.senderId == widget.myUserId;
//                   final alignment = isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start;
//                   final messageColor = isMyMessage ? Colors.blue : Colors.grey;
//                   return Row(
//                     mainAxisAlignment: alignment,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                         margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                         decoration: BoxDecoration(
//                           color: messageColor,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           message.text.toString(),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 ElevatedButton(
//                   onPressed: _sendMessage,
//                   child: Icon(Icons.send),
//                   style: ElevatedButton.styleFrom(
//                     shape: CircleBorder(),
//                     padding: EdgeInsets.all(16),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
