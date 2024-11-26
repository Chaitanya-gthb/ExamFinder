loginBox = document.querySelector(".login_box");
forgotPass = document.querySelector(".forgot-pass");
forgot = document.querySelector(".forgotBlock");
forBtn = document.querySelector(".forSub");
loginBox2 = document.querySelector(".login_box2");
forgotPass2 = document.querySelector(".forgot-pass2");
forgot2 = document.querySelector(".forgotBlock2");
forBtn2 = document.querySelector(".forSub2");
text1 = document.querySelector(".text1");
text2 = document.querySelector(".text2");
text3 = document.querySelector(".text3");
text4 = document.querySelector(".text4");
adminPage = document.querySelector(".adminPage");
userPage = document.querySelector(".userPage");
adBtn1 = document.querySelector(".admin1");
adBtn2 = document.querySelector(".admin2");
usBtn1 = document.querySelector(".user1");
usBtn2 = document.querySelector(".user2");

forgotPass.onclick = () => {
  loginBox.style.display = "none";
  forgot.style.display = "block";
};

forBtn.onclick = () => {
  forgot.style.display = "none";
  loginBox.style.display = "block";
};

forgotPass2.onclick = () => {
  loginBox2.style.display = "none";
  forgot2.style.display = "block";
};

forBtn2.onclick = () => {
  forgot2.style.display = "none";
  loginBox2.style.display = "block";
};

function popup() {
  alert("Login Successful!!!!!");
}

adBtn1.onclick = () => {
  adBtn1.style.display = "none";
  usBtn1.style.display = "none";
  text1.textContent = "ADMIN";
  text3.textContent = "Welcome Admin!!!";
  adminPage.style.display = "block";
  userPage.style.display = "none";
};

usBtn1.onclick = () => {
  userPage.style.display = "block";
  adminPage.style.display = "none";
  usBtn2.style.display = "none";
  adBtn2.style.display = "none";
  text2.textContent = "USER";
  text4.textContent = "Welcome User!!!";
};
