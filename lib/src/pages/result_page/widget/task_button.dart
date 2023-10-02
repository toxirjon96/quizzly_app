import 'package:quizzy_app/quzzy_app_library.dart';

class TaskButton extends StatelessWidget {
  const TaskButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 15,
        ),
        side: BorderSide(
          width: 3.0,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: 4,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),
      ),
    );
  }
}
