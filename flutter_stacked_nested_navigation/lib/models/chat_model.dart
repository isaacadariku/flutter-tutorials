class Chat {
  final String id;
  final String title;
  final String lastMessage;
  final DateTime lastMessageTime;
  final List<ChatMessage> messages;

  Chat({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.messages,
  });
}

class ChatMessage {
  final String sender;
  final String message;
  final DateTime time;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.time,
  });
}

List<Chat> demoChats = [
  Chat(
    id: "chat1",
    title: "Queen",
    lastMessage: "🙈🤩!",
    lastMessageTime: DateTime(2023, 10, 13, 10, 0),
    messages: [
      ChatMessage(
        sender: "Queen",
        message: "🙈🤩!",
        time: DateTime(2023, 10, 13, 10, 0),
      ),
      ChatMessage(
        sender: "You",
        message: "Happy Birthday in Advance!",
        time: DateTime(2023, 10, 13, 10, 5),
      ),
    ],
  ),
  Chat(
    id: "chat2",
    title: "Sundar Pichai",
    lastMessage: "Hey!",
    lastMessageTime: DateTime(2023, 10, 12, 15, 30),
    messages: [
      ChatMessage(
        sender: "Sundar Pichai",
        message: "Hey!",
        time: DateTime(2023, 10, 12, 15, 30),
      ),
      ChatMessage(
        sender: "You",
        message: "Hi Sundar, what's up?",
        time: DateTime(2023, 10, 12, 15, 35),
      ),
      ChatMessage(
        sender: "Sundar Pichai",
        message: "Not much, just working on the next Google project.",
        time: DateTime(2023, 10, 12, 15, 40),
      ),
    ],
  ),
];
