part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {
  final CreateNoteService service;

  NoteEvent(this.service);
}

class GetHeightEvent extends NoteEvent {
  GetHeightEvent(super.service);
}

class UpdateNoteEvent extends NoteEvent {
  final double height;

  UpdateNoteEvent(super.service, this.height);
}
