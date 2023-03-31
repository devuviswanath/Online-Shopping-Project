package project.model;
//                                                Data Access Object 
public class User {
	private int name;
	private String email;
	private String securityQuestion;
	private String answer;
	private String password;
	
	public User() {
	}

	public User(int name, String email, String securityQuestion, String answer, String password) {
		this.name = name;
		this.email = email;
		this.securityQuestion = securityQuestion;
		this.answer = answer;
		this.password = password;
	}

	public int getName() {
		return name;
	}

	public void setName(int name) {
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
		return "User [name=" + name + ", email=" + email + ", securityQuestion=" + securityQuestion + ", answer="
				+ answer + ", password=" + password + "]";
	}

	
}
