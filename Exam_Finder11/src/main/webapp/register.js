adminBtn = document.querySelector(".admin");
userBtn = document.querySelector(".user");
adminBtn2 = document.querySelector(".admin2");
userBtn2 = document.querySelector(".user2");
userPage = document.querySelector(".userPage");
adminPage = document.querySelector(".adminPage");
text1 = document.querySelector(".text1");
text2 = document.querySelector(".text2");
text3 = document.querySelector(".text3");
text4 = document.querySelector(".text4");

text1.textContent = ""

adminBtn.onclick = () => {
  adminPage.style.display = "block";
  userPage.style.display = "none";
  text1.textContent = " ADMIN";
  adminBtn.style.display = "none";
  userBtn.style.display = "none";
  text3.textContent = "Welcome Admin!!!";
};

userBtn.onclick = () => {
  userPage.style.display = "block";
  adminPage.style.display = "none";
  text2.textContent = "USER";
  userBtn2.style.display = "none";
  adminBtn2.style.display = "none";
  text4.textContent = "Welcome User!!!";
};

function popup() {
    alert("Registration successful!!!!");
  }