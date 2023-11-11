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
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8),
      color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.05),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Align(
                child: !widget.awaitingResponse
                    ? SizedBox(
                        width: screenWidth * 0.9,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: !widget.awaitingResponse
                                ? () {
                                    widget.onSubmitted(widget.finalQuestion);
                                  }
                                : null,
                            style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(0, 255, 194, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: const Text('Re-Generate',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                ))))
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(11, 240, 255, 1),),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Fetching response...', style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
