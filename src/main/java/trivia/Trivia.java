package trivia;

import java.util.List;

public class Trivia {
    private int score;
    private int currentQuestionIndex;
    private List<Question> questions;
    private boolean isGameOver;

    public Trivia(List<Question> questions) {
        this.questions = questions;
        this.score = 0;
        this.currentQuestionIndex = 0;
        this.isGameOver = false;
    }

    public Question getCurrentQuestion() {
        return questions.get(currentQuestionIndex);
    }

    public void answerQuestion(String answer) {
        if (answer.equals(getCurrentQuestion().getCorrectAnswerText())) {
            score++;
        }
        currentQuestionIndex++;
        if (currentQuestionIndex >= questions.size()) {
            isGameOver = true;
        }
    }

    public int getScore() {
        return score;
    }

    public boolean isGameOver() {
        return isGameOver;
    }

    public void resetGame() {
        score = 0;
        currentQuestionIndex = 0;
        isGameOver = false;
    }
}
