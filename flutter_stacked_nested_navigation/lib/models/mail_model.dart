class Mail {
  final String id;
  final String subject;
  final String body;
  final String sender;
  final DateTime date;

  Mail({
    required this.id,
    required this.subject,
    required this.body,
    required this.sender,
    required this.date,
  });
}

List<Mail> demoMailData = [
  Mail(
    id: "1",
    sender: "Dave",
    subject: "Check this out!",
    body: "Reflection.app is truly the first guided journaling app.",
    date: DateTime(2023, 10, 13, 10, 0),
  ),
  Mail(
    id: "2",
    sender: "Sundar Pichai",
    subject: "Important Update",
    body: "Please read this important update.",
    date: DateTime(2023, 10, 12, 15, 30),
  ),
  Mail(
    id: "3",
    sender: "Tim Cook",
    subject: "Invitation",
    body: "You're invited to our event.",
    date: DateTime(2023, 10, 11, 17, 15),
  ),
  Mail(
    id: "4",
    sender: "Jeff Bezos",
    subject: "Reminder",
    body: "Don't forget about our meeting tomorrow.",
    date: DateTime(2023, 10, 10, 9, 0),
  ),
];
