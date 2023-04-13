<%@page import="project.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
		request.setAttribute("auth", auth);
	} else {
		response.sendRedirect("login.jsp");
	}

	//cart badge	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>Page</title>
  <script>
    function generate_year() {
      for (var i = new Date().getFullYear(); i <= 2104; i++) {
        var x = document.getElementById("expiry_year");
        var option = document.createElement("option");
        option.text = i;
        option.value = i
        x.add(option);
      }

    }
  </script>
</head>

<body>

  <div class="container">
    <div class="card w-50 mx-auto my-5">
      <div class="card-header text-center">Payment</div>
      <div class="card-body">
        <form action="payment-now" method="post">

          <div class="form-group">
            <label>Name</label> <input type="text" name="name" class="form-control" placeholder="Name" required>
          </div>

          <div class="form-group">
            <label>Address</label>
            <textarea type="text" name="address" class="form-control" placeholder="Address" required></textarea>

          </div>

          <div class="form-group">
            <label>phone</label> <input type="number" id="phone" name="phone" class="form-control" placeholder="Phone"
              required pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==10) return false;"
              onblur="validatePhone()">
            <p id="phone-error" style="color: red;"></p>
          </div>

          <div class="form-group" id="card_label" style="display: none;">
            <label>Card Number</label> <input type="number" id="card" name="card" class="form-control"
              placeholder="Card" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==16) return false;"
              onblur="validateCard()">
            <p id="card-error" style="color: red;"></p>
          </div>


          <div class="form-group" id="expiry_label" style="display: none;">
            <tr>
              <td><label for="expiry">Expiry date(MM/YYYY):<span id="imp">*</span></label></td>
              <td>
                <select id="expiry_month" tabindex="4">
                  <optgroup label="Month">
                    <option value="01">January</option>
                    <option value="02">February</option>
                    <option value="03">March</option>
                    <option value="04" selected>April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                  </optgroup>
                </select>

                <select id="expiry_year" tabindex="5">
                  <optgroup label="Year">
                    <script>generate_year();</script>
                  </optgroup>
                </select>
              </td>
            </tr>
          </div>


          <div class=" form-group" id="cvv_label" style="display: none;">
            <label>CVV</label> <input type="number" id="cvv" name="cvv" class="form-control" placeholder="CVV"
              pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==3) return false;" onblur="validateCvv()">
            <p id="cvv-error" style="color: red;"></p>
          </div>

          <div class="form-group">
            <fieldset>
              <legend>Select Payment Method:</legend>
              <label>
                <input type="radio" name="paymentMethod" value="COD" checked>
                COD
              </label>
              <label>
                <input type="radio" name="paymentMethod" value="Debit/Credit">
                Debit/Credit
              </label>
            </fieldset>
          </div>


          <div class="text-center">
            <button type="submit" class="btn btn-primary" onclick="validateCardExpiry()">Pay</button>
          </div>

        </form>


        <script>
          const paymentMethod = document.getElementsByName('paymentMethod');
          const cardLabel = document.getElementById('card_label');
          const expiryLabel = document.getElementById('expiry_label');
          const cvvLabel = document.getElementById('cvv_label');

          paymentMethod.forEach(radio => {
            radio.addEventListener('change', () => {
              if (radio.value === 'COD') {
                cardLabel.style.display = 'none';
                expiryLabel.style.display = 'none';
                cvvLabel.style.display = 'none';
                document.getElementsByName('card')[0].required = false;
                document.getElementsByName('cvv')[0].required = false;
              } else {
                cardLabel.style.display = 'block';
                expiryLabel.style.display = 'block';
                cvvLabel.style.display = 'block';
                document.getElementsByName('card')[0].required = true;
                document.getElementsByName('cvv')[0].required = true;
              }
            });
          });

        </script>

        <script>
          function validateCardExpiry() {
            var expiry_month = document.getElementById("expiry_month").value;
            var expiry_year = document.getElementById("expiry_year").value;
            var date = new Date();
            var expiry_date = date.setFullYear(expiry_year, expiry_month - 1);
            var today = new Date();

            if (today.getTime() > date.getTime()) {
              alert("\u2022Expiry month and year cannot be blank/Expiry month and year is before today month and year.");
            }

            return false;
          }
        </script>

        <script>
          function validatePhone() {
            var phoneInput = document.getElementById("phone");
            var phoneError = document.getElementById("phone-error");
            var phone = phoneInput.value;

            if (phone.length === 0) {
              phoneError.textContent = "Please enter a phone number";
            } else if (phone.length < 10) {
              phoneError.textContent = "Phone number must be 10 digits";
            } else {
              phoneError.textContent = "";
            }
          }
        </script>

        <script>
          function validateCard() {
            var cardInput = document.getElementById("card");
            var cardError = document.getElementById("card-error");
            var card = cardInput.value;

            if (card.length === 0) {
              cardError.textContent = "Please enter Card number";
            } else if (card.length < 16) {
              cardError.textContent = "Card number must be 16 digits";
            } else {
              cardError.textContent = "";
            }
          }
        </script>

        <script>
          function validateCvv() {
            var cvvInput = document.getElementById("cvv");
            var cvvError = document.getElementById("cvv-error");
            var cvv = cvvInput.value;

            if (cvv.length === 0) {
              cvvError.textContent = "Please enter CVV";
            } else if (cvv.length < 3) {
              cvvError.textContent = "CVV must be 3 digits";
            } else {
              cvvError.textContent = "";
            }
          }
        </script>

      </div>
    </div>
  </div>

</body>

</html>