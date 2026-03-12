<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to the Learning Management System</title>
    <style>
        :root {
            --primary: #0d6efd;
            --primary-dark: #0b5ed7;
            --text-light: #f8f9fa;
            --text-dark: #212529;
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        body, html {
            height: 100%;
            margin: 0;
            font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            -webkit-font-smoothing: antialiased;
        }

        .hero-container {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: var(--text-light);
            
            /* Background Image */
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=2070&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .hero-content {
            max-width: 600px;
            padding: 20px;
            background: rgba(0,0,0,0.1);
            border-radius: 15px;
            backdrop-filter: blur(5px);
        }

        h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-top: 0;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            font-weight: 300;
        }

        .cta-button {
            background-color: var(--primary);
            color: var(--text-light);
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1rem;
            text-decoration: none;
            display: inline-block;
            box-shadow: var(--shadow);
            transition: transform .15s ease, background-color .15s ease;
        }

        .cta-button:hover {
            background-color: var(--primary-dark);
            transform: translateY(-3px);
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }
            p {
                font-size: 1rem;
            }
            .cta-button {
                padding: 12px 24px;
            }
        }
    </style>
</head>
<body>

    <div class="hero-container">
        <div class="hero-content">
            <h1>Learning Management System</h1>
            <p>Your central hub for managing instructors and courses.</p>
            <a href="instructors" class="cta-button">Manage Instructors</a>
        </div>
    </div>

</body>
</html>
