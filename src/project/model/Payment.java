package project.model;

public class Payment {
	private int paymentId;
	private String name;
	private String address;
	private String phone;
	private String paymentMethod;

	public Payment() {
	}

	public Payment(int paymentId, String name, String address, String phone, String paymentMethod) {
		this.paymentId = paymentId;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.paymentMethod = paymentMethod;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", name=" + name + ", address=" + address + ", phone=" + phone
				+ ", paymentMethod=" + paymentMethod + "]";
	}

}
