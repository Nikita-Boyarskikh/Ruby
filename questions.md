Я не согласен с rubocop по нескольким пунктам:

1) Читал, что `alias` - ключевое слово, и поэтому его действие ограничено скоупом
   (не может быть переопределено в дочернем классе). А `alias_method` - метод, определённый в Module,
   поэтому может быть переопределен в дочернем классе.
   Источник: http://blog.bigbinary.com/2012/01/08/alias-vs-alias-method.html
   `LW7/part2/number_string.rb:15:3: C: [Corrected] Use alias instead of alias_method in a class body.`

2) Мне совершенно не нравится его замена `f = File.open(...) or raise ...` на (f = File.open(...)) || raise(...)`
   ```
   LW7/part1/main.rb:23:40: C: Use || instead of or.
   out = File.open(@in_filename, 'w') or raise IOError, PERMISSION_ERROR
   ```
3) Кажется слишком строгим и бессмысленным ограничение длины функции до 10 строк.
   Я считаю разумным ограничение в 60 строк.

4) Как бороться с ограничением длины строк в 80 символов, если там строка или комментарий?

5) W: (...) interpreted as grouped expression.

6) Redundant return detected.
