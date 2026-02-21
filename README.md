# Store Rating Platform

A PRODUCTION-READY full-stack web application for role-based store ratings.

## Tech Stack
- **Backend:** Node.js, Express.js, MySQL, Sequelize ORM, JWT, Bcrypt
- **Frontend:** React.js, React Router DOM, Axios, Bootstrap, Lucide React
- **Database:** MySQL (XAMPP compatible)

## Prerequisites
- Node.js (v16.x or higher recommended)
- XAMPP (for MySQL)
- npm

## Setup Instructions

### 1. Database Setup (phpMyAdmin)
1. Open XAMPP Control Panel and start **Apache** and **MySQL**.
2. Go to [http://localhost/phpmyadmin](http://localhost/phpmyadmin).
3. Click on the **Import** tab.
4. Choose the `database.sql` file from the project root.
5. Click **Go**. This will create the `store_rating_app` database and necessary tables.

### 2. Backend Setup
1. Navigate to the `backend` folder:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Ensure the `.env` file has the correct MySQL credentials (default is root with no password).
4. Run the backend server:
   ```bash
   npm start
   ```
   (Alternatively, use `node server.js` if npm start is not configured, but I have included a common setup).

### 3. Frontend Setup
1. Open a new terminal and navigate to the `frontend` folder:
   ```bash
   cd frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Run the frontend development server:
   ```bash
   npm run dev
   ```
4. Access the application at [http://localhost:5173](http://localhost:5173).

## Default Credentials
- **Admin Email:** `admin@example.com`
- **Admin Password:** `Admin@123`

## Environment Variables (.env)
```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASS=
DB_NAME=store_rating_app
JWT_SECRET=supersecretkey123
```

## Features
- **Admin Dashboard:** Manage users, stores, and view global stats.
- **User Dashboard:** Search stores, view ratings, and submit/edit your own rating.
- **Store Owner Dashboard:** View ratings for your store and average score.
- **Role-based Security:** Protected routes and API endpoints.
- **Strict Validations:** Name, email, password, and rating constraints as per requirements.
