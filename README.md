# 🎓 Barpeta Polytechnic Students Feedback System

## Overview

A comprehensive web-based feedback management system for Barpeta Polytechnic that allows students to provide subject-wise feedback on their instructors. The system features automatic teacher name population based on subject selection, admin panel for managing questions and teachers, and faculty access to view feedback.

## ✨ Key Features

### 👨‍🎓 Student Module
- **Subject-wise Feedback Submission**: Students select a subject and the teacher name automatically appears
- **Structured Questions**: Rating-based and text-based feedback questions
- **Dashboard**: View submission status and feedback history
- **Secure Login**: Enrollment number-based authentication

### ⚙️ Admin Module
- **Manage Subjects**: Add, edit, and delete subjects
- **Manage Teachers**: Add teacher names and link them to subjects
- **Feedback Questions**: Add various question types (Rating, Text, Multiple Choice)
- **View All Feedbacks**: 
  - Filter by subject, teacher, and date
  - Export feedbacks to Excel
  - View detailed feedback information
- **Student Management**: Add and manage student records

### 👨‍🏫 Faculty Module
- **Dashboard Overview**: View feedback statistics
- **My Feedbacks**: Access all feedbacks received from students
- **Analytics**: View performance metrics and insights
- **Export Reports**: Download feedback data

## 📁 Project Structure

```
feedback-portal/
├── admin/
│   ├── login.html
│   └── dashboard.html
├── student/
│   ├── login.html
│   └── dashboard.html
├── faculty/
│   ├── login.html
│   └── dashboard.html
├── config/
│   └── db.php
├── database/
│   └── schema.sql
└── README.md
```

## 🚀 Installation

### Prerequisites
- PHP 7.0+
- MySQL 5.7+
- Web Server (Apache/Nginx)
- Modern Web Browser

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/librarybp/barpetapoly-feedback.git
   cd barpetapoly-feedback
   ```

2. **Create Database**
   - Import `database/schema.sql` to your MySQL server
   ```bash
   mysql -u root -p < database/schema.sql
   ```

3. **Configure Database Connection**
   - Edit `config/db.php`
   - Update `DB_HOST`, `DB_USER`, `DB_PASSWORD`

4. **Access the Portal**
   - Admin: `http://localhost/feedback-portal/admin/login.html`
   - Student: `http://localhost/feedback-portal/student/login.html`
   - Faculty: `http://localhost/feedback-portal/faculty/login.html`

## 🔐 Default Credentials

### Admin
- **Username**: `admin`
- **Password**: `admin123`

### Faculty
- **Email**: `faculty@barpetapoly.edu`
- **Password**: `faculty123`

### Students
- Use enrollment number as username
- First time login: use enrollment number as password

## 💻 Usage

### For Students
1. Login with enrollment number
2. Go to "Submit Feedback" section
3. Select a subject - teacher name auto-populates
4. Rate and provide feedback
5. Submit feedback

### For Admin
1. Login to admin panel
2. Add subjects and link teachers
3. Create feedback questions
4. View all submitted feedbacks
5. Filter and export reports

### For Faculty
1. Login with credentials
2. View feedback statistics
3. Check individual feedbacks
4. Download feedback reports
5. View analytics and insights

## 📊 Database Schema

- **subjects**: Subject information
- **teachers**: Teacher details and subject assignments
- **students**: Student enrollment and credentials
- **feedback_questions**: Customizable feedback questions
- **feedbacks**: Feedback submission records
- **feedback_answers**: Individual question responses
- **admin_users**: Admin credentials
- **faculty_users**: Faculty credentials

## 🎨 Technologies Used

- **Frontend**: HTML5, CSS3, Bootstrap 5, JavaScript
- **Backend**: PHP 7+
- **Database**: MySQL
- **Icons**: Bootstrap Icons
- **Responsive Design**: Mobile-friendly UI

## 🔄 Workflow

1. **Admin Setup**
   - Add subjects
   - Add teachers and link to subjects
   - Create feedback questions
   - Manage students

2. **Student Feedback**
   - Student login
   - Select subject (teacher auto-populates)
   - Fill feedback form
   - Submit feedback

3. **Faculty Review**
   - Faculty login
   - View feedbacks on dashboard
   - Check detailed feedback
   - Download reports

4. **Admin Monitoring**
   - View all feedbacks
   - Filter and search
   - Export data
   - Monitor statistics

## 🔒 Security Features

- Password hashing (MD5/BCrypt)
- Session management
- Input validation
- Secure database queries
- User authentication
- Role-based access control

## 📱 Responsive Design

- Mobile-friendly interface
- Tablet compatible
- Desktop optimized
- Works on all modern browsers

## 🐛 Known Issues

- Current implementation uses client-side validation
- Demo credentials are for testing only
- Backend API endpoints need to be implemented

## 🚦 Future Enhancements

- Real-time notifications
- Email notifications
- Advanced analytics with charts
- Mobile app
- Two-factor authentication
- Multilingual support
- Feedback trends over time

## 📝 License

CC0 1.0 Universal - Public Domain

## 👥 Contributors

- Barpeta Polytechnic Development Team

## 📧 Support

For support, contact: admin@barpetapoly.edu

## 📄 Version

**Version 1.0** - Initial Release (May 2026)

---

**Note**: This is a demo version. For production use, implement proper backend API, secure authentication, and comprehensive error handling.