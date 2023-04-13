package project.model;

public class User {
	private int id;
	private String name;
	private String email;
	private String securityQuestion;
	private String answer;
	private String password;
	
	public User() {
	}

	public User(int id,String name, String email, String securityQuestion, String answer, String password) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.securityQuestion = securityQuestion;
		this.answer = answer;
		this.password = password;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", securityQuestion=" + securityQuestion + ", answer="
				+ answer + ", password=" + password + "]";
	}

	
}
