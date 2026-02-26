# Stock Analyzer Web Application

A production-ready full-stack Stock Analysis platform with Spring Boot backend and React (Vite) frontend.

## 🚀 Tech Stack

**Backend:**
- Java 21, Spring Boot 3+
- MySQL, JPA/Hibernate
- JWT Authentication / Spring Security
- Lombok
- Swagger UI

**Frontend:**
- React 18, Vite
- Tailwind CSS (Dark Mode, Fintech Theme)
- Recharts for Visualization
- Axios, Framer Motion

## 📂 Project Structure

```
/backend          # Spring Boot Application
/frontend         # React Vite Application
schema.sql        # Database Schema
```

## 🛠️ Setup & Run

### Prerequisites
Before running the application, ensure you have the following installed:
- **Java JDK 21+**: [Download Here](https://www.oracle.com/java/technologies/downloads/)
- **Node.js (LTS)**: [Download Here](https://nodejs.org/)
- **Maven**: [Download Here](https://maven.apache.org/download.cgi) (or use your IDE's embedded Maven)
- **MySQL Server**: [Download Here](https://dev.mysql.com/downloads/installer/)

### 1. Database Setup
- Install MySQL 8.0+
- Create database `stock_analyzer_db`
- The application will automatically update the schema.
- Or run `schema.sql` manually.

### 2. Backend Setup
```bash
cd backend
# Update src/main/resources/application.yml with your MySQL username/password
./mvnw spring-boot:run
```
- Server runs on: `http://localhost:8080`
- Swagger Docs: `http://localhost:8080/swagger-ui/index.html`

**Default Users:**
- Admin: `admin` / `admin123`
- User: `user` / `user123`

### 3. Frontend Setup
```bash
cd frontend
npm install
npm run dev
```
- Client runs on: `http://localhost:3000`

## 🔑 Key Features

1.  **Authentication**: Secure JWT Login/Register.
2.  **Dashboard**: Real-time exposure stats, top movers, and charts.
3.  **Stock Analysis (DSA)**:
    -   Moving Average (Sliding Window)
    -   Max Profit Calculation (Kadane's Algorithm)
    -   Volatilty Analysis (Standard Deviation)
    -   Trend Detection (Prefix Sum/Slope)
    -   Stock Span (Stack)
4.  **Portfolio Management**: Buy/Sell stocks, track P&L.

## 🧪 API Endpoints

- `POST /api/auth/login` - Authenticate user
- `GET /api/stocks` - List all stocks
- `GET /api/analyze/{symbol}` - Run algorithms on stock data
- `GET /api/portfolio` - Get user portfolio
- `POST /api/portfolio/buy` - Buy stock
- `POST /api/portfolio/sell` - Sell stock

## 🎨 UI Theme
Dark Bloomberg-style aesthetic with neon green/purple accents for a professional fintech feel.
