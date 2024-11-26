function sendemail(){
    let params = {
        name : document.getElementById('name').value,
        email : document.getElementById('email').value,
        subject : document.getElementById('subject').value,
        message : document.getElementById('msgg').value
    }

    let ser = "service_sujxfxh";
    let temp ="template_rlf93ug";

    emailjs.send(ser, temp, params).then(alert("EMAIL SETTT!!!!"))

}