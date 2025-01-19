package trivia;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;


public class TriviaServlet extends HttpServlet {
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Initialize the game session
        HttpSession session = request.getSession(true);
        Trivia trivia = (Trivia) session.getAttribute("Trivia");

        if (trivia == null) {
        
        	
        	MongoClient mongoClient =  MongoClients.create(
            		System.getProperty("mongodb+srv://jazmynrh12:qqTiLr6iYoVT3pTm@flashcards.pkwzb.mongodb.net/?retryWrites=true&w=majority&appName=flashcards"));

            MongoDatabase questions = mongoClient.getDatabase("glam");
            
            MongoCollection<Document> triviaCollections = questions.getCollection("trivia");
            
            List<Question> questionsList = new ArrayList<>();
            for (Document doc : triviaCollections.find()) {
            	System.out.println(doc.toJson());
                String category = doc.getString("Category");
                String q = doc.getString("Question");
                
                String correctAnswer = doc.getString("Correct Answer");
                List<String> yearList = (List<String>) doc.get("Wrong Answers");
    
                questionsList.add(new Question(category, q, yearList.toArray(new String[0]), correctAnswer));
            }
        	
            trivia = new Trivia(questionsList);
            session.setAttribute("Trivia", trivia);
        }
        
        
        // Display current question
        request.setAttribute("question", trivia.getCurrentQuestion());

        // Forward to trivia.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/trivia/trivia.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the answer from the player
        String answer = request.getParameter("answer");
        HttpSession session = request.getSession();
        Trivia trivia = (Trivia) session.getAttribute("Trivia");

        if (trivia != null) {
            // Answer the current question and move to the next one
            trivia.answerQuestion(answer);

            // If the game is over, show the score
            if (trivia.isGameOver()) {
                request.setAttribute("score", trivia.getScore());
                RequestDispatcher dispatcher = request.getRequestDispatcher("/trivia/gameOver.jsp");
                dispatcher.forward(request, response);
            } else {
                // Continue to the next question
                doGet(request, response);
            }
        }
    }
  
}


