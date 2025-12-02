


abstract class LearningPageState {}


class LearningLoading extends LearningPageState{}

class LearningLoaded extends LearningPageState{
  final List<Map<String , dynamic>> items;
  
  final isLoading;
  
  LearningLoaded(this.items, this.isLoading,);
  
}

class LearningError extends LearningPageState{
  final String msg;
  LearningError(this.msg);
}

