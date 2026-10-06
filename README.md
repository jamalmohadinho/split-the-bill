# 💸 Split the Bill

A full-stack expense-sharing web application built with **Ruby on Rails** that helps groups organize trips and keep track of shared expenses.

Users can create an account, start a trip, add participants, record expenses, and keep all shared spending organized in one place.

---

## ✨ Features

- 🔐 User signup and login
- 🔒 Secure password authentication with bcrypt
- ✈️ Create and manage trips
- 👥 Add multiple participants to a trip
- 💰 Add shared expenses
- 🧾 Record expense descriptions, amounts, dates, and categories
- 🙋 Track who paid for each expense
- 👨‍👩‍👧 Select which trip members participated in each expense
- 🗑️ Delete expenses
- ✏️ Edit trip information
- 📅 Track trip start and end dates
- ✅ Form validation for trip information
- 🗃️ Relational database using Active Record

---

## 🛠️ Technologies Used

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/Ruby_on_Rails-D30001?style=for-the-badge&logo=rubyonrails&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

### Backend
- Ruby
- Ruby on Rails 7.2
- Active Record

### Database
- SQLite
- Rails migrations
- Relational database design

### Authentication
- bcrypt
- Rails sessions

### Frontend
- HTML
- CSS
- ERB templates
- Hotwire / Turbo
- Stimulus

---

## 🎯 Purpose

Splitting expenses during trips can become confusing when different people pay for different things.

**Split the Bill** provides one place where a group can organize a trip and record shared expenses.

For example:

```text
Trip: Spring Break

Hotel       - $600
Dinner      - $120
Uber        - $45
Groceries   - $80
```

Each expense can store:

- Who paid
- How much they paid
- What the expense was for
- When it happened
- The expense category
- Which trip members participated

This makes it easier to keep shared spending organized throughout a trip.

---

## 🚀 Core Functionality

### 👤 User Accounts

Users can create their own account and log into the application.

Each user has:

```text
Name
Email
Password
```

Passwords are securely stored using **bcrypt** rather than saving plain-text passwords.

---

### ✈️ Create Trips

Logged-in users can create trips containing:

```text
Trip Name
Start Date
End Date
Participants
```

The creator of the trip is automatically added as a participant.

Additional registered users can also be added to the trip.

---

### 👥 Trip Participants

Trips can contain multiple users.

For example:

```text
Miami Trip
│
├── Jamal
├── Alex
├── Sarah
└── Michael
```

This relationship allows multiple users to participate in the same trip while also allowing one user to participate in multiple trips.

---

### 💰 Add Expenses

Users can add expenses directly to a trip.

Each expense includes:

```text
Description
Amount
Date
Category
Paid By
Participants
```

Example:

```text
Description: Dinner
Amount: $120
Category: Food
Paid By: Jamal

Participants:
✓ Jamal
✓ Alex
✓ Sarah
✓ Michael
```

The application links the expense to both the trip and the users who participated in that expense.

---

## 🗄️ Database Design

The application uses a relational database built with Rails Active Record.

### Main Tables

| Table | Purpose |
|---|---|
| `users` | Stores user accounts |
| `trips` | Stores trip information |
| `trip_participants` | Connects users to trips |
| `expenses` | Stores expenses belonging to trips |
| `expense_participants` | Connects users to individual expenses |

---

## 🔗 Database Relationships

```text
USER
 │
 │ creates
 ▼
TRIP
 │
 ├───────────────┐
 │               │
 ▼               ▼
TRIP           EXPENSE
PARTICIPANTS     │
 │               │
 ▼               ▼
USER      EXPENSE PARTICIPANTS
                   │
                   ▼
                  USER
```

A user can participate in multiple trips, and each trip can contain multiple users.

Similarly, an expense can involve multiple users through the `expense_participants` join table.

---

## 🧠 Rails Model Relationships

Conceptually, the application uses relationships similar to:

```ruby
Trip
├── belongs_to :creator
├── has_many :participants
└── has_many :expenses
```

and:

```ruby
Expense
├── belongs_to :trip
├── belongs_to :paid_by
└── has_many :participants
```

Join tables allow Rails to model the many-to-many relationships between users, trips, and expenses.

---

## 🧱 Application Structure

```text
split-the-bill/
│
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   ├── users_controller.rb
│   │   ├── sessions_controller.rb
│   │   ├── trips_controller.rb
│   │   └── expenses_controller.rb
│   │
│   ├── models/
│   │   ├── user.rb
│   │   ├── trip.rb
│   │   ├── trip_participant.rb
│   │   ├── expense.rb
│   │   └── expense_participant.rb
│   │
│   └── views/
│
├── config/
│   └── routes.rb
│
├── db/
│   ├── migrate/
│   └── schema.rb
│
├── test/
│
├── Gemfile
├── Gemfile.lock
└── README.md
```

---

## 🔄 Application Flow

```text
Create Account
      ↓
Log In
      ↓
View Trips
      ↓
Create Trip
      ↓
Add Participants
      ↓
Add Expenses
      ↓
Select Who Participated
      ↓
Track Shared Spending
```

---

## 🛣️ Routes

The application includes routes for:

### Users

```text
/users
/users/new
/users/:id
/users/:id/edit
```

### Authentication

```text
/login
/logout
/signup
```

### Trips

```text
/trips
/trips/new
/trips/:id
/trips/:id/edit
```

### Expenses

Expenses are nested under trips:

```text
/trips/:trip_id/expenses/new
/trips/:trip_id/expenses
/trips/:trip_id/expenses/:id
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have installed:

- Ruby
- Ruby on Rails
- SQLite3
- Bundler
- Git

---

### 1. Clone the Repository

```bash
git clone https://github.com/jamalmohadinho/split-the-bill.git
```

Move into the project:

```bash
cd split-the-bill
```

---

### 2. Install Dependencies

```bash
bundle install
```

---

### 3. Set Up the Database

Create the database:

```bash
bin/rails db:create
```

Run the migrations:

```bash
bin/rails db:migrate
```

You can also prepare the database using:

```bash
bin/rails db:prepare
```

---

### 4. Start the Rails Server

```bash
bin/rails server
```

or:

```bash
rails server
```

Then open:

```text
http://localhost:3000
```

in your browser.

---

## 🔐 Authentication

The application uses session-based authentication.

When a user logs in:

```text
Email + Password
       ↓
User Authentication
       ↓
Session Created
       ↓
Access Trips & Expenses
```

Protected areas of the application require the user to be logged in.

Passwords are stored using bcrypt through Rails' secure password functionality.

---

## ✅ Validation

Trips include validation to ensure important information is entered correctly.

For example:

- Trip name is required
- Start date is required
- End date is required
- End date cannot be before the start date

This helps prevent invalid trip data from being saved.

---

## 🧪 Running Tests

Run the Rails test suite with:

```bash
bin/rails test
```

For system tests:

```bash
bin/rails test:system
```

---

## 🐳 Docker

The project also includes a `Dockerfile`, allowing the application to be containerized.

A Docker-based workflow can be added for easier deployment and environment consistency.

---

## 📚 What I Learned

Building this project helped me gain experience with:

- Ruby on Rails
- MVC architecture
- Active Record
- Relational database design
- One-to-many relationships
- Many-to-many relationships
- Join tables
- Rails routing
- Nested routes
- CRUD operations
- User authentication
- Password hashing with bcrypt
- Sessions
- Form handling
- Model validations
- Database migrations
- Building a complete database-backed web application

The project also gave me experience designing relationships between users, trips, and expenses instead of treating each feature independently.

---

## 🔮 Future Improvements

Future features could include:

- 💵 Automatically calculate how much each person owes
- 🔄 Generate simplified settlements between users
- ✅ Mark debts as paid
- 📊 Expense summaries and analytics
- 📈 Spending charts
- 💳 Payment integration
- 📧 Trip invitations by email
- 🔔 Payment reminders
- 🧾 Receipt uploads
- 📸 Profile pictures
- 🔍 Search and filter expenses
- 📱 Improved mobile responsiveness
- 🌎 Multi-currency support
- 🌓 Dark mode
- 🔗 Shareable trip invitation links

---

## 🎯 Example Use Case

Imagine four friends go on a weekend trip.

```text
Jamal paid $200 for the hotel
Alex paid $80 for dinner
Sarah paid $50 for groceries
Michael paid $40 for transportation
```

Instead of trying to remember who paid for what, every expense can be added to the same trip.

The application keeps the trip participants and expenses organized in one central place.

---

## 👨‍💻 Author

**Jamal Apicha**

Computer Science & Engineering  
The Ohio State University

[![GitHub](https://img.shields.io/badge/GitHub-jamalmohadinho-181717?style=for-the-badge&logo=github)](https://github.com/jamalmohadinho)

---

⭐ If you like the project, feel free to explore the repository and give it a star!
