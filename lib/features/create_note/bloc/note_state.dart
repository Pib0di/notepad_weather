part of 'note_bloc.dart';

@immutable
abstract class NoteState {
  final double height;
  final CreateNoteService service;

  const NoteState(this.height, this.service);
}

class NoteInitial extends NoteState {
  const NoteInitial(super.height, super.service);
}

final class GetHeightState extends NoteState {
  const GetHeightState(super.height, super.service);
}

class UpdatedNoteState extends NoteState {
  const UpdatedNoteState(super.height, super.service);
}
