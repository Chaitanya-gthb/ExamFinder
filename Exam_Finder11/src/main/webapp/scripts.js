document.addEventListener('DOMContentLoaded', () => {
    const sections = document.querySelectorAll('.content-section');
    const links = document.querySelectorAll('.sidebar ul li a');

    links.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            sections.forEach(section => section.classList.remove('active'));
            const target = document.querySelector(link.getAttribute('href'));
            target.classList.add('active');
        });
    });

    // Activate the dashboard by default
    document.querySelector('#dashboard').classList.add('active');

    // Example: Adding dynamic content to the table
    const examTable = document.getElementById('exam-table');
    const userTable = document.getElementById('user-table');

    const exams = [
        { id: 1, name: 'Math Exam', date: '2024-09-01' },
        { id: 2, name: 'Science Exam', date: '2024-09-15' },
    ];

    const users = [
        { id: 1, name: 'John Doe', email: 'john@example.com' },
        { id: 2, name: 'Jane Smith', email: 'jane@example.com' },
    ];

    exams.forEach(exam => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${exam.id}</td>
            <td>${exam.name}</td>
            <td>${exam.date}</td>
            <td><button>Edit</button> <button>Delete</button></td>
        `;
        examTable.appendChild(row);
    });

    users.forEach(user => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td><button>Edit</button> <button>Delete</button></td>
        `;
        userTable.appendChild(row);
    });
});

function logout(){
    alert("LOGOUT SUCCESSFULLY!!!")
}
