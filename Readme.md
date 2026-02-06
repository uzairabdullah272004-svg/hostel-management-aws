# 🏨 Hostel Management System

A comprehensive Flask-based web application for efficient hostel management. This system streamlines student enrollment, room allocation, fee collection, expense tracking, and issue management with a user-friendly interface.

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue.svg)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-3.0-green.svg)](https://flask.palletsprojects.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

## ✨ Features

### 🎓 Student Management
- **Enroll Students**: Add students with personal details, photos, and room assignments
- **View Students**: Browse all enrolled students with search and filter options
- **Edit/Delete**: Update student information or remove records
- **Excel Import/Export**: Bulk upload/download student data using Excel files
- **Fee Collection**: Track and manage monthly fee payments with detailed records

### 🏠 Room Management
- **Room Allocation**: Assign students to available rooms (8 rooms supported)
- **Occupancy Tracking**: Monitor room capacity and availability
- **Room Overview**: Visual representation of room assignments

### 💰 Financial Management
- **Expense Tracking**: Record and categorize monthly expenses
- **Fee Records**: Maintain comprehensive fee payment history
- **Monthly Reports**: Generate expense summaries by month
- **PDF Export**: Download fee receipts and financial reports

### 🔐 Admin Features
- **Secure Authentication**: Admin registration and login with password hashing
- **Role-Based Access**: Protected routes for administrative functions
- **Session Management**: Auto-logout after 30 minutes of inactivity
- **CSRF Protection**: Enhanced security for form submissions

### 🐛 Issue Tracking
- **Report Issues**: Students can report maintenance or facility issues
- **Issue Management**: Admins can track and resolve reported problems
- **Status Updates**: Monitor issue resolution progress

### 🎨 User Interface
- **Responsive Design**: Bootstrap-powered UI works on all devices
- **Smooth Animations**: Enhanced UX with CSS animations and transitions
- **Intuitive Navigation**: Easy-to-use interface for admins and students

## 🛠️ Technologies Used

| Category | Technologies |
|----------|-------------|
| **Backend** | Python 3.8+, Flask 3.0 |
| **Database** | SQLite, SQLAlchemy ORM |
| **Authentication** | Flask-Login, Flask-Bcrypt |
| **Forms** | Flask-WTF, WTForms |
| **Frontend** | HTML5, CSS3, JavaScript, Bootstrap 5 |
| **Reports** | ReportLab (PDF), Pandas, OpenPyXL (Excel) |
| **Deployment** | Docker, Heroku-ready |
| **Migration** | Flask-Migrate, Alembic |

## 📋 Prerequisites

- Python 3.8 or higher
- pip (Python package manager)
- Git

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/Hostel-Management-System.git
cd Hostel-Management-System
```

### 2. Set Up Virtual Environment

**For Windows:**
```bash
python -m venv .venv
.venv\Scripts\activate
```

**For Linux/macOS:**
```bash
python3 -m venv .venv
source .venv/bin/activate
```

### 3. Install Dependencies

**Option A: Using pip (Recommended)**
```bash
pip install -r requirements.txt
```

**Option B: Using Pipenv**
```bash
pip install pipenv
pipenv install
pipenv shell
```

### 4. Set Environment Variables (Optional)

Create a `.env` file in the root directory:

```env
SECRET_KEY=your_secret_key_here
WTF_CSRF_SECRET_KEY=your_csrf_secret_key_here
FLASK_ENV=development
```

### 5. Initialize Database

```bash
flask db upgrade
```

Or if starting fresh:
```bash
python
>>> from app import app, db
>>> with app.app_context():
...     db.create_all()
>>> exit()
```

### 6. Run the Application

```bash
flask run
```

Or:
```bash
python app.py
```

Visit `http://127.0.0.1:5000` in your browser.

## 🐳 Docker Deployment

Build and run using Docker:

```bash
# Build the image
docker build -t hostel-management .

# Run the container
docker run -p 5000:5000 hostel-management
```

## 📁 Project Structure

```
Hostel-Management-System/
├── app.py                  # Main application file with routes
├── models.py               # Database models (Student, Room, Expense, etc.)
├── forms.py                # WTForms for data validation
├── requirements.txt        # Python dependencies
├── Dockerfile             # Docker configuration
├── Procfile               # Heroku deployment config
├── runtime.txt            # Python version specification
├── .gitignore            # Git ignore rules
├── migrations/           # Database migration scripts
│   ├── versions/
│   └── alembic.ini
├── static/               # Static files
│   ├── style.css        # Main stylesheet
│   ├── expenses.css     # Expense page styles
│   ├── animations.js    # JavaScript animations
│   ├── navbar.js        # Navigation functionality
│   └── images/          # UI images and icons
├── templates/            # HTML templates
│   ├── base.html        # Base template
│   ├── admin_login.html
│   ├── admin_dashboard.html
│   ├── enroll.html
│   ├── students.html
│   ├── rooms.html
│   ├── expenses.html
│   ├── collect_fee.html
│   ├── issues.html
│   └── ...
└── instance/             # Instance-specific files (gitignored)
    └── hostel.db        # SQLite database
```

## 🔑 Key Routes

| Route | Method | Description | Authentication |
|-------|--------|-------------|----------------|
| `/` | GET | Home page | Public |
| `/admin/register` | GET, POST | Admin registration | Public |
| `/admin/login` | GET, POST | Admin login | Public |
| `/admin/dashboard` | GET | Admin dashboard | Required |
| `/admin/logout` | GET | Logout | Required |
| `/enroll` | GET, POST | Enroll new student | Required |
| `/students` | GET | View all students | Required |
| `/edit-student/<id>` | GET, POST | Edit student details | Required |
| `/delete-student/<id>` | POST | Delete student | Required |
| `/rooms` | GET | View room allocations | Required |
| `/expenses` | GET, POST | Manage expenses | Required |
| `/collect-fee` | GET, POST | Collect student fees | Required |
| `/view-fee-records` | GET | View all fee records | Required |
| `/issues` | GET, POST | Report/view issues | Required |

## 💡 Usage Guide

### First Time Setup

1. **Register an Admin Account**
   - Navigate to `/admin/register`
   - Create your admin credentials
   - Login at `/admin/login`

2. **Enroll Students**
   - Go to the enrollment page
   - Fill in student details and upload photo
   - Assign to available room
   - Submit the form

3. **Manage Fees**
   - Use the fee collection page to record payments
   - View fee records for all transactions
   - Download PDF receipts

4. **Track Expenses**
   - Add monthly expenses with descriptions
   - View expense summaries by month
   - Monitor hostel operating costs

## 📊 Database Models

- **Student**: ID, name, father name, age, fee, date, room number, picture, fee payment details
- **Room**: Room number, capacity, assigned students
- **Expense**: ID, item description, price, date, month, status
- **Admin**: ID, username, email, password (hashed)
- **FeeRecord**: ID, student ID, amount, payment date, month, year
- **Issue**: ID, description, status, date reported

## 🔒 Security Features

- Password hashing with Bcrypt
- CSRF protection on all forms
- Session management with automatic timeout
- Secure file uploads with validation
- SQL injection prevention via SQLAlchemy ORM
- Environment variable support for sensitive data

## 🎨 Customization

### Change Number of Rooms

Edit the `create_tables()` function in [app.py](app.py):

```python
for i in range(1, 9):  # Change 9 to your desired number + 1
    if not Room.query.filter_by(room_number=i).first():
        room = Room(room_number=i)
        db.session.add(room)
```

### Modify UI Theme

Edit [static/style.css](static/style.css) to change colors, fonts, and layout.

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines

- Follow PEP 8 style guide for Python code
- Use meaningful commit messages
- Test your changes thoroughly
- Update documentation as needed

## 🐛 Known Issues & Troubleshooting

**Issue: Database not found**
- Solution: Run `flask db upgrade` or create tables manually

**Issue: Upload folder error**
- Solution: Ensure `static/uploads/` directory exists

**Issue: Session timeout too short**
- Solution: Modify `PERMANENT_SESSION_LIFETIME` in [app.py](app.py)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Najam Abbas**
- Email: [najamabass2020@gmail.com](mailto:najamabass2020@gmail.com)
- GitHub: [@yourusername](https://github.com/yourusername)

## 🙏 Acknowledgments

- Flask documentation and community
- Bootstrap for responsive UI components
- All contributors who help improve this project

## 📞 Support

For questions, issues, or suggestions:
- Open an issue on GitHub
- Email: najamabass2020@gmail.com

---

⭐ **If you find this project helpful, please consider giving it a star!**
