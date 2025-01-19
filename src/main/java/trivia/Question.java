package trivia;

public class Question {
	private String category;
	private String question;
	public String[] options;
	private String correctAnswer;
	
	public Question(String category, String question, String[] options, String correctAnswer) {
		this.category = category;
		this.question = question;
		this.options = options;
		this.correctAnswer = correctAnswer;
	}
	
	public String getCategory() {
		return category;
	}
	
	public String getQuestionText() {
		return question;
	}
	
	public String[] getOptionsText() {
		return options;
	}
	
	public String getCorrectAnswerText() {
		return correctAnswer;
	}
	
}