let users = document.querySelector('.users');
let btn1 = document.querySelector('.btnn1');
let btn2 = document.querySelector('.btnn2');
let btn3 = document.querySelector('.btnn3');
let feeds = document.querySelector('.feeds');
let exams = document.querySelector('.exams');

btn1.onclick = ()=> {
    users.style.display = "block";
    btn1.style.display = "none";
}

btn2.onclick = ()=> {
    exams.style.display = "block";
    btn2.style.display = "none";
}

btn3.onclick = ()=> {
    feeds.style.display = "block";
    btn3.style.display = "none";
}