import 'package:flutter/material.dart';

class MessageComposer extends StatefulWidget {
  const MessageComposer({
    required this.onSubmitted,
    required this.finalQuestion,
    required this.awaitingResponse,
    super.key,
  });

  final void Function(String) onSubmitted;
  final String finalQuestion;
  final bool awaitingResponse;

  @override
  State<MessageComposer> createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  String resBtn = 'Click to Generate';

  void _changeText() {
    setState(() {
      resBtn = 'Re-Generate';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.05),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: !widget.awaitingResponse
                  ? SizedBox(
                      width: 60,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: !widget.awaitingResponse
                              ? () {
                                  _changeText();
                                  widget.onSubmitted(widget.finalQuestion);
                                }
                              : null,
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 210, 187, 255), // Background color
                          ),
                          child: Text(
                            resBtn,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 128, 255)),
                          )))
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Fetching response...'),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
