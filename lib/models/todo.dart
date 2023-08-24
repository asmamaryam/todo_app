class todo {
  String? id;
  String? text;
  bool isDone;

  todo({
    required this.id,
    required this.text,
    this.isDone = false,
  });

  static List<todo> todoList() {
    return [
      todo(id: '01', text: 'Morning Exercise', isDone: true),
      todo(
        id: '02',
        text: 'Buy Grociers',
      ),
      todo(
        id: '03',
        text: 'check Emails',
      ),
      todo(id: '04', text: 'Team Meeting', isDone: true),
      todo(
        id: '05',
        text: 'Work Out',
      ),
      todo(id: '06', text: 'Learning', isDone: true),
      todo(
        id: '07',
        text: 'Luuch',
      ),
      todo(id: '08', text: 'Dinner', isDone: true),
    ];
  }
}
