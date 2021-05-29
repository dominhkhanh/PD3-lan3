class Info_Score {
  Info_Score({
    this.subject_name,
    this.process_score,
    this.medium_score,
    this.rank
  });

  String subject_name;
  String process_score;
  String medium_score;
  String rank;

  factory Info_Score.fromJson(Map<String, dynamic> json) => Info_Score(
    subject_name: json['subject_name'],
    process_score: json['process_score'],
    medium_score: json['medium_score'],
    rank: json['rank']
  );

  Map<String, dynamic> toJson() => {
    'subject_name': subject_name, 
    'process_score': process_score,
    'medium_score': medium_score,
    'rank': rank
  };
}