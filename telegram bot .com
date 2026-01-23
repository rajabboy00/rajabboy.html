<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Telegram Bot Do'koni | Maxsus Botlar Yaratamiz</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        /* Barcha CSS kodni saqlab qolamiz */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        :root {
            --primary: #0088cc;
            --secondary: #006699;
            --dark: #1a1a2e;
            --light: #f8f9fa;
            --accent: #ff6b6b;
            --success: #28a745;
            --gray: #6c757d;
            --light-gray: #e9ecef;
            --border: #dee2e6;
        }
        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: var(--light);
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        header {
            background-color: white;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
        }
        .logo {
            display: flex;
            align-items: center;
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary);
        }
        .logo i {
            margin-right: 10px;
            font-size: 2rem;
        }
        .nav-links {
            display: flex;
            list-style: none;
        }
        .nav-links li {
            margin-left: 30px;
        }
        .nav-links a {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            transition: color 0.3s;
            font-size: 1.1rem;
        }
        .nav-links a:hover {
            color: var(--primary);
        }
        .cta-button {
            background-color: var(--primary);
            color: white;
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
            border: 2px solid var(--primary);
            display: inline-block;
            font-size: 1.1rem;
        }
        .cta-button:hover {
            background-color: transparent;
            color: var(--primary);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 136, 204, 0.2);
        }
        .hero {
            padding: 100px 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            text-align: center;
        }
        .hero h1 {
            font-size: 3.2rem;
            margin-bottom: 20px;
            color: var(--dark);
        }
        .hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 30px;
            color: var(--gray);
        }
        .highlight {
            color: var(--primary);
            font-weight: 700;
        }
        .section-title {
            text-align: center;
            margin-bottom: 60px;
        }
        .section-title h2 {
            font-size: 2.5rem;
            color: var(--dark);
            margin-bottom: 15px;
        }
        .section-title p {
            color: var(--gray);
            max-width: 600px;
            margin: 0 auto;
            font-size: 1.1rem;
        }
        section {
            padding: 80px 0;
        }
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        .service-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        .service-img {
            height: 200px;
            width: 100%;
            background-color: var(--light-gray);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 4rem;
            color: var(--primary);
        }
        .service-content {
            padding: 25px;
        }
        .service-content h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: var(--dark);
        }
        .service-content p {
            color: var(--gray);
            margin-bottom: 20px;
        }
        .pricing {
            background-color: #f8f9fa;
        }
        .pricing-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        .pricing-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            padding-bottom: 30px;
            position: relative;
            transition: transform 0.3s;
        }
        .pricing-card.featured {
            border: 2px solid var(--primary);
            transform: scale(1.05);
        }
        .pricing-card.featured .pricing-header {
            background: var(--primary);
            color: white;
        }
        .pricing-header {
            padding: 25px;
            background: var(--dark);
            color: white;
            margin-bottom: 25px;
        }
        .pricing-header h3 {
            font-size: 1.8rem;
            margin-bottom: 10px;
        }
        .price {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        .price span {
            font-size: 1rem;
            font-weight: normal;
        }
        .pricing-features {
            list-style: none;
            margin-bottom: 30px;
            padding: 0 25px;
        }
        .pricing-features li {
            padding: 10px 0;
            border-bottom: 1px solid var(--light-gray);
            color: var(--gray);
            text-align: left;
            display: flex;
            align-items: center;
        }
        .pricing-features li i {
            margin-right: 10px;
            color: var(--success);
            font-size: 1.2rem;
        }
        .customizer {
            background-color: white;
        }
        .customizer-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
        }
        .customizer-preview {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            height: 100%;
        }
        .bot-avatar {
            width: 150px;
            height: 150px;
            background: var(--primary);
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 4rem;
            box-shadow: 0 5px 15px rgba(0, 136, 204, 0.3);
        }
        .bot-name {
            font-size: 1.8rem;
            margin-bottom: 10px;
            color: var(--dark);
        }
        .bot-description {
            color: var(--gray);
            margin-bottom: 30px;
            font-size: 1.1rem;
        }
        .features-list {
            text-align: left;
            list-style: none;
        }
        .features-list li {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
        }
        .features-list li i {
            margin-right: 10px;
            color: var(--primary);
            font-size: 1.2rem;
        }
        .customizer-controls {
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        .control-group {
            margin-bottom: 25px;
        }
        .control-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: var(--dark);
            font-size: 1.1rem;
        }
        .control-group select, .control-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: 'Poppins', sans-serif;
            font-size: 1rem;
        }
        .features-checklist {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }
        .features-checklist label {
            display: flex;
            align-items: center;
            font-weight: normal;
            cursor: pointer;
            background: white;
            padding: 12px;
            border-radius: 5px;
            border: 1px solid #ddd;
            transition: all 0.3s;
        }
        .features-checklist label:hover {
            border-color: var(--primary);
            background-color: rgba(0, 136, 204, 0.05);
        }
        .features-checklist input {
            width: auto;
            margin-right: 10px;
            transform: scale(1.2);
        }
        .total-price {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-top: 30px;
            text-align: center;
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary);
            border: 2px solid var(--primary);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 2000;
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background: white;
            padding: 40px;
            border-radius: 10px;
            width: 90%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
        }
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        .modal-header h3 {
            font-size: 1.8rem;
            color: var(--dark);
        }
        .close-modal {
            background: none;
            border: none;
            font-size: 2rem;
            color: var(--gray);
            cursor: pointer;
            line-height: 1;
        }
        .order-summary {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .order-summary h4 {
            margin-bottom: 15px;
            color: var(--dark);
        }
        .order-details p {
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
        }
        .order-total {
            font-weight: 700;
            font-size: 1.2rem;
            color: var(--primary);
            border-top: 2px solid #ddd;
            padding-top: 10px;
            margin-top: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--dark);
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: 'Poppins', sans-serif;
        }
        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }
        footer {
            background-color: var(--dark);
            color: white;
            padding: 60px 0 30px;
        }
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            margin-bottom: 40px;
        }
        .footer-column h3 {
            font-size: 1.3rem;
            margin-bottom: 25px;
            position: relative;
        }
        .footer-column h3:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -10px;
            width: 50px;
            height: 3px;
            background-color: var(--primary);
        }
        .footer-column p {
            color: #aaa;
            margin-bottom: 20px;
        }
        .footer-links {
            list-style: none;
        }
        .footer-links li {
            margin-bottom: 12px;
        }
        .footer-links a {
            color: #aaa;
            text-decoration: none;
            transition: color 0.3s;
            display: flex;
            align-items: center;
        }
        .footer-links a i {
            margin-right: 10px;
        }
        .footer-links a:hover {
            color: var(--primary);
        }
        .copyright {
            text-align: center;
            padding-top: 30px;
            border-top: 1px solid #333;
            color: #aaa;
            font-size: 0.9rem;
        }
        @media (max-width: 992px) {
            .customizer-container { grid-template-columns: 1fr; }
            .hero h1 { font-size: 2.5rem; }
            .pricing-card.featured { transform: none; }
        }
        @media (max-width: 768px) {
            .nav-links { display: none; }
            .hero h1 { font-size: 2rem; }
            .features-checklist { grid-template-columns: 1fr; }
            .section-title h2 { font-size: 2rem; }
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .fade-in {
            animation: fadeIn 0.6s ease-out;
        }
        .notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: var(--success);
            color: white;
            padding: 15px 25px;
            border-radius: 5px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            z-index: 3000;
            display: none;
            animation: fadeIn 0.3s ease-out;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <div class="logo">
                    <i class="fab fa-telegram"></i>
                    <span>Telegram Bot Do'koni</span>
                </div>
                <ul class="nav-links">
                    <li><a href="#home">Bosh sahifa</a></li>
                    <li><a href="#services">Xizmatlar</a></li>
                    <li><a href="#pricing">Narxlar</a></li>
                    <li><a href="#customizer">Bot Yaratish</a></li>
                    <li><a href="#contact">Bog'lanish</a></li>
                </ul>
                <a href="#customizer" class="cta-button">Bot Buyurtma</a>
            </nav>
        </div>
    </header>

    <section class="hero" id="home">
        <div class="container">
            <h1>Professional <span class="highlight">Telegram Bot</span> Yaratamiz</h1>
            <p>Biznesingiz, jamoangiz yoki shaxsiy ehtiyojlaringiz uchun kuchli Telegram botlarni yaratamiz. Soddadan tortib, AI integratsiyaligacha.</p>
            <a href="#customizer" class="cta-button">Bot Yaratishni Boshlash <i class="fas fa-arrow-right"></i></a>
        </div>
    </section>

    <section id="services">
        <div class="container">
            <div class="section-title">
                <h2>Bizning Xizmatlarimiz</h2>
                <p>Har xil turdagi Telegram botlarini yaratamiz, sizning ehtiyojlaringizga moslashtirilgan</p>
            </div>
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-img"><i class="fas fa-shopping-cart"></i></div>
                    <div class="service-content">
                        <h3>Sotuv Botlari</h3>
                        <p>Telegram ichida to'liq savdo tajribasi. Mahsulot katalogi, savat, to'lov tizimi.</p>
                        <a href="#customizer" class="cta-button">Tanlash</a>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-img"><i class="fas fa-comments"></i></div>
                    <div class="service-content">
                        <h3>Mijoz Qo'llab-quvvatlash</h3>
                        <p>Kunduzi-kechasi avtomatik mijoz xizmati. Sun'iy intellekt bilan javob berish.</p>
                        <a href="#customizer" class="cta-button">Tanlash</a>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-img"><i class="fas fa-chart-line"></i></div>
                    <div class="service-content">
                        <h3>Xabarnoma Botlari</h3>
                        <p>Vebsayt yangiliklari, narx o'zgarishlari, yangiliklar uchun real vaqtda ogohlantirishlar.</p>
                        <a href="#customizer" class="cta-button">Tanlash</a>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-img"><i class="fas fa-gamepad"></i></div>
                    <div class="service-content">
                        <h3>O'yin Botlari</h3>
                        <p>Interaktiv o'yinlar, viktorinalar, so'rovnomalar va media botlari.</p>
                        <a href="#customizer" class="cta-button">Tanlash</a>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-img"><i class="fas fa-tasks"></i></div>
                    <div class="service-content">
                        <h3>Avtomatlashtirish</h3>
                        <p>Takrorlanuvchi vazifalarni avtomatlashtirish, guruhlarni boshqarish, moderatorlik.</p>
                        <a href="#customizer" class="cta-button">Tanlash</a>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-img"><i class="fas fa-robot"></i></div>
                    <div class="service-content">
                        <h3>AI Botlar</h3>
                        <p>Sun'iy intellekt integratsiyasi (GPT, Claude) tabiiy suhbat, kontent yaratish.</p>
                        <a href="#customizer" class="cta-button">Tanlash</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="pricing" id="pricing">
        <div class="container">
            <div class="section-title">
                <h2>Narxlar</h2>
                <p>Tayyor paketlardan tanlang yoki o'zingiz moslashtiring</p>
            </div>
            <div class="pricing-grid">
                <div class="pricing-card">
                    <div class="pricing-header">
                        <h3>Boshlang'ich Bot</h3>
                        <div class="price">$199<span>/bir martalik</span></div>
                        <p>Shaxsiy foydalanish uchun</p>
                    </div>
                    <ul class="pricing-features">
                        <li><i class="fas fa-check"></i> Asosiy buyruqlar & javoblar</li>
                        <li><i class="fas fa-check"></i> Soddalashtirilgan avtomatlashtirish</li>
                        <li><i class="fas fa-check"></i> 1000 foydalanuvchigacha</li>
                        <li><i class="fas fa-check"></i> 1 oy qo'llab-quvvatlash</li>
                        <li><i class="fas fa-check"></i> Asosiy hujjatlar</li>
                    </ul>
                    <a href="#customizer" class="cta-button">Buyurtma Berish</a>
                </div>
                <div class="pricing-card featured">
                    <div class="pricing-header">
                        <h3>Biznes Bot</h3>
                        <div class="price">$499<span>/bir martalik</span></div>
                        <p>Bizneslar uchun eng mashhur</p>
                    </div>
                    <ul class="pricing-features">
                        <li><i class="fas fa-check"></i> Barcha boshlang'ich xususiyatlar</li>
                        <li><i class="fas fa-check"></i> Ma'lumotlar bazasi integratsiyasi</li>
                        <li><i class="fas fa-check"></i> To'lov tizimi</li>
                        <li><i class="fas fa-check"></i> Admin paneli</li>
                        <li><i class="fas fa-check"></i> 3 oy qo'llab-quvvatlash</li>
                        <li><i class="fas fa-check"></i> API integratsiyasi</li>
                    </ul>
                    <a href="#customizer" class="cta-button">Buyurtma Berish</a>
                </div>
                <div class="pricing-card">
                    <div class="pricing-header">
                        <h3>Korporativ Bot</h3>
                        <div class="price">$999<span>/bir martalik</span></div>
                        <p>Rivojlangan talablar uchun</p>
                    </div>
                    <ul class="pricing-features">
                        <li><i class="fas fa-check"></i> Barcha biznes xususiyatlar</li>
                        <li><i class="fas fa-check"></i> AI/ML integratsiyasi</li>
                        <li><i class="fas fa-check"></i> Maxsus analitika</li>
                        <li><i class="fas fa-check"></i> Ko'p tilli qo'llab-quvvatlash</li>
                        <li><i class="fas fa-check"></i> 6 oy qo'llab-quvvatlash</li>
                        <li><i class="fas fa-check"></i> Birinchi navbatdagi rivojlantirish</li>
                    </ul>
                    <a href="#customizer" class="cta-button">Buyurtma Berish</a>
                </div>
            </div>
        </div>
    </section>

    <section class="customizer" id="customizer">
        <div class="container">
            <div class="section-title">
                <h2>Telegram Botingizni Moslashtiring</h2>
                <p>Kerakli xususiyatlarni tanlang va narxni real vaqtda ko'ring</p>
            </div>
            <div class="customizer-container">
                <div class="customizer-preview">
                    <div class="bot-avatar"><i class="fas fa-robot"></i></div>
                    <h3 class="bot-name" id="bot-name-preview">Mening Maxsus Botim</h3>
                    <p class="bot-description" id="bot-desc-preview">Tanlangan xususiyatlar bilan maxsus Telegram bot.</p>
                    <ul class="features-list" id="features-preview">
                        <li><i class="fas fa-check"></i> Asosiy buyruqlar</li>
                        <li><i class="fas fa-check"></i> Foydalanuvchi boshqaruvi</li>
                    </ul>
                </div>
                <div class="customizer-controls">
                    <div class="control-group">
                        <label for="bot-name">Bot Nomi</label>
                        <input type="text" id="bot-name" placeholder="Bot nomini kiriting" value="Mening Maxsus Botim">
                    </div>
                    <div class="control-group">
                        <label for="bot-type">Bot Turi</label>
                        <select id="bot-type">
                            <option value="starter">Boshlang'ich Bot</option>
                            <option value="business" selected>Biznes Bot</option>
                            <option value="enterprise">Korporativ Bot</option>
                            <option value="custom">To'liq Maxsus</option>
                        </select>
                    </div>
                    <div class="control-group">
                        <label>Qo'shimcha Xususiyatlar</label>
                        <div class="features-checklist">
                            <label><input type="checkbox" name="features" value="payment" data-price="50"> To'lov Tizimi (+$50)</label>
                            <label><input type="checkbox" name="features" value="ai" data-price="150"> AI Suhbat (+$150)</label>
                            <label><input type="checkbox" name="features" value="multilingual" data-price="80"> Ko'p Tillik (+$80)</label>
                            <label><input type="checkbox" name="features" value="analytics" data-price="60"> Analitika (+$60)</label>
                            <label><input type="checkbox" name="features" value="database" data-price="40"> Ma'lumotlar Bazasi (+$40)</label>
                            <label><input type="checkbox" name="features" value="api" data-price="70"> API Ulanishi (+$70)</label>
                            <label><input type="checkbox" name="features" value="notifications" data-price="30"> Xabarnomalar (+$30)</label>
                            <label><input type="checkbox" name="features" value="admin" data-price="50"> Admin Panel (+$50)</label>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="support-period">Qo'llab-quvvatlash Davri</label>
                        <select id="support-period">
                            <option value="1" data-price="0">1 oy (kiritilgan)</option>
                            <option value="3" data-price="50" selected>3 oy (+$50)</option>
                            <option value="6" data-price="100">6 oy (+$100)</option>
                            <option value="12" data-price="200">12 oy (+$200)</option>
                        </select>
                    </div>
                    <div class="total-price">
                        Umumiy Narx: <span id="total-price">$549</span>
                    </div>
                    <button id="order-button" class="cta-button" style="width: 100%; text-align: center; margin-top: 20px; font-size: 1.2rem;">Buyurtma Berish</button>
                </div>
            </div>
        </div>
    </section>

    <div class="modal-overlay" id="order-modal">
        <div class="modal-content fade-in">
            <div class="modal-header">
                <h3>Buyurtma Ma'lumotlari</h3>
                <button class="close-modal">&times;</button>
            </div>
            <div class="order-summary">
                <h4>Sizning Botingiz:</h4>
                <div class="order-details" id="order-details"></div>
            </div>
            <form id="order-form">
                <div class="form-group">
                    <label for="customer-name">Ismingiz *</label>
                    <input type="text" id="customer-name" required>
                </div>
                <div class="form-group">
                    <label for="customer-email">Email Manzilingiz *</label>
                    <input type="email" id="customer-email" required>
                </div>
                <div class="form-group">
                    <label for="customer-phone">Telefon Raqamingiz *</label>
                    <input type="tel" id="customer-phone" required>
                </div>
                <div class="form-group">
                    <label for="customer-telegram">Telegram Username</label>
                    <input type="text" id="customer-telegram" placeholder="@username">
                </div>
                <div class="form-group">
                    <label for="bot-requirements">Qo'shimcha Talablar (ixtiyoriy)</label>
                    <textarea id="bot-requirements" placeholder="Bot uchun qo'shimcha talablaringiz, g'oyalaringiz..."></textarea>
                </div>
                <button type="submit" class="cta-button" style="width: 100%; font-size: 1.2rem;">Buyurtmani Tasdiqlash</button>
            </form>
        </div>
    </div>

    <div class="notification" id="notification">
        <span id="notification-text"></span>
    </div>

    <footer id="contact">
        <div class="container">
            <div class="footer-content">
                <div class="footer-column">
                    <h3>Telegram Bot Do'koni</h3>
                    <p>Biznesingiz va shaxsiy ehtiyojlaringiz uchun maxsus Telegram botlar yaratamiz. Bot g'oyangizni hayotga olib chiqing!</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-telegram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-github"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="footer-column">
                    <h3>Tez Havolalar</h3>
                    <ul class="footer-links">
                        <li><a href="#home"><i class="fas fa-home"></i> Bosh sahifa</a></li>
                        <li><a href="#services"><i class="fas fa-cogs"></i> Xizmatlar</a></li>
                        <li><a href="#pricing"><i class="fas fa-tag"></i> Narxlar</a></li>
                        <li><a href="#customizer"><i class="fas fa-robot"></i> Bot Yaratish</a></li>
                        <li><a href="#contact"><i class="fas fa-envelope"></i> Bog'lanish</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Xizmatlarimiz</h3>
                    <ul class="footer-links">
                        <li><a href="#"><i class="fas fa-shopping-cart"></i> Sotuv Botlari</a></li>
                        <li><a href="#"><i class="fas fa-comments"></i> Mijoz Qo'llab-quvvatlash</a></li>
                        <li><a href="#"><i class="fas fa-robot"></i> AI Botlar</a></li>
                        <li><a href="#"><i class="fas fa-tasks"></i> Avtomatlashtirish</a></li>
                        <li><a href="#"><i class="fas fa-wrench"></i> Bot Texnik Xizmati</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Bog'lanish</h3>
                    <ul class="footer-links">
                        <li><a href="mailto:contact@telegrambotdokoni.com"><i class="fas fa-envelope"></i> contact@telegrambotdokoni.com</a></li>
                        <li><a href="tel:+998901234567"><i class="fas fa-phone"></i> +998 90 123 45 67</a></li>
                        <li><a href="#"><i class="fas fa-map-marker-alt"></i> Toshkent, O'zbekiston</a></li>
                        <li><a href="https://t.me/botdokoni"><i class="fab fa-telegram"></i> @botdokoni</a></li>
                    </ul>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; 2026 Telegram Bot Do'koni. Barcha huquqlar himoyalangan.</p>
            </div>
        </div>
    </footer>

    <!-- JavaScript -->
    <script>
        const botNameInput = document.getElementById('bot-name');
        const botNamePreview = document.getElementById('bot-name-preview');
        const botDescPreview = document.getElementById('bot-desc-preview');
        const featuresChecklist = document.querySelectorAll('input[name="features"]');
        const supportPeriodSelect = document.getElementById('support-period');
        const totalPriceElement = document.getElementById('total-price');
        const featuresPreview = document.getElementById('features-preview');
        const orderButton = document.getElementById('order-button');
        const orderModal = document.getElementById('order-modal');
        const closeModal = document.querySelector('.close-modal');
        const orderForm = document.getElementById('order-form');
        const orderDetails = document.getElementById('order-details');
        const notification = document.getElementById('notification');
        const notificationText = document.getElementById('notification-text');

        const basePrices = {
            starter: 199,
            business: 499,
            enterprise: 999,
            custom: 0
        };

        let total = 549;

        botNameInput.addEventListener('input', () => {
            const name = botNameInput.value.trim() || 'Mening Maxsus Botim';
            botNamePreview.textContent = name;
        });

        function updateBotPreviewAndPrice() {
            const selectedType = document.getElementById('bot-type').value;
            let basePrice = basePrices[selectedType] || 0;

            let featuresPrice = 0;
            const selectedFeatures = [];
            featuresChecklist.forEach(checkbox => {
                if (checkbox.checked) {
                    featuresPrice += parseInt(checkbox.dataset.price);
                    selectedFeatures.push(checkbox.nextElementSibling.textContent.split(' (+')[0]);
                }
            });

            const supportPrice = parseInt(supportPeriodSelect.options[supportPeriodSelect.selectedIndex].dataset.price) || 0;
            total = basePrice + featuresPrice + supportPrice;
            totalPriceElement.textContent = `$${total}`;

            botDescPreview.textContent = selectedFeatures.length > 0 
                ? `Tanlangan xususiyatlar: ${selectedFeatures.join(', ')}.`
                : 'Tanlangan xususiyatlar bilan maxsus Telegram bot.';

            featuresPreview.innerHTML = '';
            if (selectedFeatures.length === 0) {
                featuresPreview.innerHTML = '<li><i class="fas fa-check"></i> Asosiy buyruqlar</li><li><i class="fas fa-check"></i> Foydalanuvchi boshqaruvi</li>';
            } else {
                selectedFeatures.forEach(feature => {
                    const li = document.createElement('li');
                    li.innerHTML = `<i class="fas fa-check"></i> ${feature}`;
                    featuresPreview.appendChild(li);
                });
            }
        }

        document.getElementById('bot-type').addEventListener('change', updateBotPreviewAndPrice);
        supportPeriodSelect.addEventListener('change', updateBotPreviewAndPrice);
        featuresChecklist.forEach(checkbox => {
            checkbox.addEventListener('change', updateBotPreviewAndPrice);
        });

        orderButton.addEventListener('click', () => {
            let detailsHTML = `<p><strong>Bot turi:</strong> ${document.getElementById('bot-type').options[document.getElementById('bot-type').selectedIndex].text}</p>`;
            document.querySelectorAll('input[name="features"]:checked').forEach(cb => {
                detailsHTML += `<p>${cb.nextElementSibling.textContent}</p>`;
            });
            detailsHTML += `<p><strong>Qo'llab-quvvatlash:</strong> ${supportPeriodSelect.options[supportPeriodSelect.selectedIndex].text}</p>`;
            detailsHTML += `<p class="order-total"><strong>Jami:</strong> $${total}</p>`;
            orderDetails.innerHTML = detailsHTML;
            orderModal.style.display = 'flex';
        });

        closeModal.addEventListener('click', () => {
            orderModal.style.display = 'none';
        });

        window.addEventListener('click', (e) => {
            if (e.target === orderModal) {
                orderModal.style.display = 'none';
            }
        });

        orderForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const formData = {
                bot_name: botNameInput.value.trim() || 'Mening Maxsus Botim',
                bot_type: document.getElementById('bot-type').value,
                features: Array.from(document.querySelectorAll('input[name="features"]:checked')).map(cb => cb.value),
                support_period: supportPeriodSelect.value,
                total_price: total,
                customer_name: document.getElementById('customer-name').value,
                customer_email: document.getElementById('customer-email').value,
                customer_phone: document.getElementById('customer-phone').value,
                customer_telegram: document.getElementById('customer-telegram').value,
                bot_requirements: document.getElementById('bot-requirements').value
            };

            try {
                const response = await fetch('/submit_order', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(formData)
                });
                const result = await response.json();
                if (result.success) {
                    notificationText.textContent = '✅ Buyurtmangiz muvaffaqiyatli yuborildi! Tez orada siz bilan bog\'lanamiz.';
                } else {
                    notificationText.textContent = '❌ Xatolik yuz berdi. Iltimos, keyinroq qayta urinib ko\'ring.';
                }
            } catch (err) {
                notificationText.textContent = '🌐 Tarmoqda xatolik. Serverga ulanib bo\'lmadi.';
            }
            notification.style.display = 'block';
            setTimeout(() => {
                notification.style.display = 'none';
                orderModal.style.display = 'none';
                orderForm.reset();
            }, 4000);
        });

        updateBotPreviewAndPrice();
    </script>
</body>
</html>
