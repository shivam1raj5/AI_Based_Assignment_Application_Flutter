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
      color: Colors.black,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Align(
                child: !widget.awaitingResponse
                    ? Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                right: 20, left: 20, top: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 120,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(11, 240, 255, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Edit function not available.')),
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    child: const Text(
                                      'Edit',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(11, 240, 255, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Plagiarism function not available.')),
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    child: const Text(
                                      'Plagiarism',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              width: screenWidth * 0.9,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: !widget.awaitingResponse
                                      ? () {
                                          widget.onSubmitted(
                                              widget.finalQuestion);
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
                                      )))),
                        ],
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(11, 240, 255, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Fetching response...',
                              style: TextStyle(color: Colors.white),
                            ),
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
