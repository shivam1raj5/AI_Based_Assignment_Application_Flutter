import 'package:ai_driven_essay_application_flutter/api/chat_api.dart';
import 'package:ai_driven_essay_application_flutter/models/chat_message.dart';
import 'package:ai_driven_essay_application_flutter/widgets/message_bubble.dart';
import 'package:ai_driven_essay_application_flutter/widgets/message_composer.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    required this.chatApi,
    required this.finalQuestion,
    required this.title,
    super.key,
  });

  final ChatApi chatApi;
  final String finalQuestion;
  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    _onSubmitted(widget.finalQuestion);
  }

  final _messages = <ChatMessage>[];
  var _awaitingResponse = false;
  final _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Row(
          children: [
            Column(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                      tileMode: TileMode.clamp,
                    ).createShader(bounds);
                  },
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color.fromRGBO(11, 240, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 82,
                  child: Text(
                    'Shivam Raj,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
                right: 20.0, left: 8.0, top: 8.0, bottom: 8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile not created yet.')),
                );
                Scaffold.of(context).openDrawer();
              },
              color: const Color.fromRGBO(11, 240, 255, 1),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  content: _messages[index].content,
                  isUserMessage: _messages[index].isUserMessage,
                );
              },
            )),
            MessageComposer(
              onSubmitted: _onSubmitted,
              finalQuestion: widget.finalQuestion,
              awaitingResponse: _awaitingResponse,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSubmitted(String message) async {
    setState(() {
      _messages.add(ChatMessage(message, true));
      _awaitingResponse = true;
    });
    try {
      final response = await widget.chatApi.completeChat(_messages);
      setState(() {
        _messages.add(ChatMessage(response, false));
        _awaitingResponse = false;
      });
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } catch (err) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
      setState(() {
        _awaitingResponse = false;
      });
    }
  }
}
