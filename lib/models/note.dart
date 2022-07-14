import 'package:my_notes/data/local/database_helper.dart';

class Note {
  int _id;
  String? title;
  String content;
  int? isTrash;
  int? isFav;
  int? isHidden;

  Note({
    this.title,
    this.content = '',
    this.isFav = 0,
    this.isHidden = 0,
    this.isTrash = 0,
    int id = -1,
  }) : _id = id;

  Note.fromMap(Map<String, dynamic> map, [this._id = -1, this.content = '']) {
    _id = map[DatabaseHelper.clId] as int;
    title = '${map[DatabaseHelper.clTitle]}';
    content = '${map[DatabaseHelper.clContent]}';
    isTrash = map[DatabaseHelper.clIsTrash] as int;
    isFav = map[DatabaseHelper.clIsFavourites] as int;
    isHidden = map[DatabaseHelper.clIsHidden] as int;
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        DatabaseHelper.clId: id,
        DatabaseHelper.clTitle: title,
        DatabaseHelper.clContent: content,
        DatabaseHelper.clIsTrash: isTrash,
        DatabaseHelper.clIsHidden: isHidden,
        DatabaseHelper.clIsFavourites: isFav
      };

  int get id => _id;
}
