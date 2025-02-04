﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="webFormProject.sally.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
        href="https://cdn.jsdelivr.net/npm/remixicon@4.0.0/fonts/remixicon.css"
        rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styles.css" />
    <title>Web Design Mastery </title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");

        :root {
            --primary-color: #22333B;
            --primary-color-dark: #C6AD8F;
            --text-dark: #0c0a09;
            --text-light: #78716c;
            --white: #ffffff;
            --max-width: 1200px;
        }

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #EAE0D6;
        }

        .section__container {
            max-width: var(--max-width);
            margin: auto;
            padding: 5rem 1rem;
        }

        .section__subheader {
            margin-bottom: 0.5rem;
            position: relative;
            font-weight: 500;
            letter-spacing: 2px;
            color: var(--text-dark);
        }

            .section__subheader::after {
                position: absolute;
                content: "";
                top: 50%;
                transform: translate(1rem, -50%);
                height: 2px;
                width: 4rem;
                background-color: var(--primary-color);
            }

        .section__header {
            max-width: 600px;
            margin-bottom: 1rem;
            font-size: 2.5rem;
            font-weight: 600;
            line-height: 3rem;
            color: var(--text-dark);
        }

        .section__description {
            max-width: 600px;
            margin-bottom: 1rem;
            color: var(--text-light);
        }

        .btn {
            padding: 0.75rem 1.5rem;
            outline: none;
            border: none;
            font-size: 1rem;
            font-weight: 500;
            color: var(--white);
            background-color: var(--primary-color);
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

            .btn:hover {
                background-color: var(--primary-color-dark);
            }

        img {
            width: 100%;
            display: flex;
        }

        a {
            text-decoration: none;
        }

        .logo {
            max-width: 120px;
        }

        html,
        body {
            scroll-behavior: smooth;
        }

        body {
            font-family: "Poppins", sans-serif;
        }

        .header {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("imgs/aboutHeader.jpg");
            background-blend-mode: multiply;
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .bg-umber {
            background-color: #22333B;
        }

        .imglogo {
            width: 20%;
        }

        .btn-green {
            --bs-btn-color: #22333B !important;
            --bs-btn-bg: #EAE0D6 !important;
            --bs-btn-border-color: #EAE0D6;
            --bs-btn-hover-color: #22333B;
            --bs-btn-hover-bg: #C6AD8F;
            --bs-btn-hover-border-color: #C6AD8F !important;
            --bs-btn-focus-shadow-rgb: 49, 132, 253;
            --bs-btn-active-color: #22333B;
            --bs-btn-active-bg: #EAE0D6;
            --bs-btn-active-border-color: #EAE0D6;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #22333B;
            --bs-btn-disabled-bg: #EAE0D6;
            --bs-btn-disabled-border-color: #EAE0D6;
            border-radius: 20px !important;
            margin-right: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1),inset 3px 3px 6px rgba(0, 0, 0, 0.3);
            border: none;
        }

        .btn-green1 {
            --bs-btn-color: #EAE0D6 !important;
            --bs-btn-bg: #22333B !important;
            --bs-btn-border-color: #22333B;
            --bs-btn-hover-color: #22333B;
            --bs-btn-hover-bg: #EAE0D6;
            --bs-btn-hover-border-color: #22333B !important;
            --bs-btn-focus-shadow-rgb: 49, 132, 253;
            --bs-btn-active-color: #EAE0D6;
            --bs-btn-active-bg: #22333B;
            --bs-btn-active-border-color: #22333B;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #EAE0D6;
            --bs-btn-disabled-bg: #22333B;
            --bs-btn-disabled-border-color: #22333B;
            border-radius: 170px !important;
            margin-right: 5px;
            width: 10% !important;
        }


        .header__container {
            padding-block: 10rem 15rem;
        }

            .header__container p {
                margin-bottom: 1rem;
                font-size: 1.2rem;
                color: var(--white);
                text-align: center;
                opacity: 0.6;
            }

            .header__container h1 {
                font-size: 4rem;
                font-weight: 500;
                line-height: 4.5rem;
                color: var(--white);
                text-align: center;
            }

                .header__container h1 span {
                    color: var(--primary-color);
                    color:whitesmoke;
                }

        .booking__container {
            padding-block: 0;
        }

        .booking__form {
            padding: 2rem;
            display: flex;
            gap: 1rem;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
            background-color: var(--white);
            border-radius: 10px;
            transform: translateY(-50%);
            box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.1);
        }

        .input__group {
            flex: 1 1 220px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
        }

            .input__group span {
                font-size: 1.75rem;
                color: var(--primary-color);
            }

            .input__group label {
                font-weight: 500;
                color: var(--text-dark);
            }

            .input__group input {
                display: block;
                width: 100%;
                max-width: 150px;
                padding-block: 5px;
                color: var(--text-dark);
                font-size: 0.9rem;
                outline: none;
                border: none;
            }

                .input__group input::placeholder {
                    color: var(--text-light);
                }

        .about__container {
            overflow: hidden;
            display: grid;
            gap: 2rem;
        }

        .about__image img {
            max-width: 450px;
            margin: auto;
            border-radius: 5px;
        }

        .room__grid {
            margin-top: 4rem;
            display: grid;
            gap: 1rem;
        }

        .team__grid {
            margin-top: 4rem;
            display: flex;
            flex-wrap:wrap;
            gap: 1rem;
            justify-content: space-around;
        }

        .room__card {
            background-color: white;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
        }



        .room__card__image {
            position: relative;
            isolation: isolate;
        }

        .room__card__icons {
            position: absolute;
            right: 1rem;
            bottom: 1rem;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            flex-wrap: wrap;
            gap: 1rem;
            z-index: 1;
        }

            .room__card__icons span {
                display: inline-block;
                padding: 2px 8px;
                font-size: 1.5rem;
                background-color: var(--white);
                border-radius: 100%;
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
                cursor: pointer;
            }

                .room__card__icons span:nth-child(1) {
                    color: #f472b6;
                }

                .room__card__icons span:nth-child(2) {
                    color: #c084fc;
                }


        .room__card__details {
            padding: 1rem;
        }

        .room__card h4 {
            margin-bottom: 0.5rem;
            font-size: 1.2rem;
            font-weight: 500;
            color: var(--text-dark);
        }

        .room__card p {
            margin-bottom: 0.5rem;
            color: var(--text-light);
        }

        .room__card h5 {
            margin-bottom: 1rem;
            font-size: 1rem;
            font-weight: 500;
            color: var(--text-light);
        }

            .room__card h5 span {
                font-size: 1.1rem;
                color: var(--text-dark);
            }

        .service {
            background-image: url("assets/service.jpg");
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .service__container {
            padding-block: 0;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
        }

        .service__content {
            grid-column: 1/3;
            padding: 2rem 4rem;
            background-color: var(--white);
        }

        .service__list {
            list-style: none;
            margin-top: 2rem;
            display: grid;
            gap: 2rem;
        }

            .service__list li {
                display: flex;
                align-items: center;
                gap: 1rem;
                font-size: 1.2rem;
                font-weight: 500;
                color: var(--text-dark);
            }

            .service__list span {
                padding: 5px 12px;
                font-size: 1.75rem;
                color: var(--text-dark);
                background-color: var(--text-light);
                border-radius: 100%;
            }

            .service__list li:nth-child(1) span {
                color: #60a5fa;
                background-color: #dbeafe;
            }

            .service__list li:nth-child(2) span {
                color: #f472b6;
                background-color: #fce7f3;
            }

            .service__list li:nth-child(3) span {
                color: #c084fc;
                background-color: #f3e8ff;
            }

            .service__list li:nth-child(4) span {
                color: #fb7185;
                background-color: #ffe4e6;
            }

        .banner__content {
            padding: 2rem;
            background-color: white;
            display: flex;
            gap: 2rem;
            align-items: center;
            justify-content: space-evenly;
            flex-wrap: wrap;
            border-radius: 10px;
            box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.1);
        }

        .banner__card {
            text-align: center;
            flex: 1 1 180px;
        }

            .banner__card h4 {
                font-size: 2rem;
                font-weight: 600;
                color: var(--text-dark);
            }

            .banner__card p {
                color: var(--text-light);
            }

        .explore :is(.section__subheader, .section__header) {
            text-align: center;
            margin-inline: auto;
        }

        .explore__bg {
            margin-top: 4rem;
            padding-block: 3rem;
            display: grid;
            grid-template-columns: minmax(1rem, 1fr) minmax(0, var(--max-width)) minmax(1rem, 1fr);
            background-image: url("assets/explore.jpg");
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .explore__content {
            grid-column: 2/3;
            max-width: 400px;
            padding: 2rem;
            background-color: var(--white);
            border-radius: 5px;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
        }

            .explore__content p {
                margin-bottom: 0.5rem;
            }

            .explore__content h4 {
                margin-bottom: 1rem;
                font-size: 1.2rem;
                font-weight: 600;
                line-height: 1.5rem;
                color: var(--text-dark);
            }

            .explore__content .btn {
                color: var(--primary-color);
                background-color: var(--white);
                border: 1px solid var(--primary-color);
            }

                .explore__content .btn:hover {
                    color: var(--white);
                    background-color: var(--primary-color);
                }

        .footer {
            background-color: var(--text-dark);
        }

        .footer__container {
            display: grid;
            gap: 4rem 2rem;
        }

        .footer__col .section__description {
            margin-block: 2rem;
        }

        .footer__col h4 {
            margin-bottom: 2rem;
            font-size: 1.2rem;
            font-weight: 500;
            color: var(--white);
        }

        .footer__links {
            list-style: none;
            display: grid;
            gap: 1rem;
        }

            .footer__links a {
                color: var(--text-light);
                transition: 0.3s;
            }

                .footer__links a:hover {
                    color: var(--white);
                }

        .footer__socials {
            margin-top: 2rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            flex-wrap: wrap;
        }

            .footer__socials img {
                max-width: 25px;
                opacity: 0.8;
                transition: 0.3s;
            }

                .footer__socials img:hover {
                    opacity: 1;
                }

        .footer__bar {
            padding: 1rem;
            font-size: 0.9rem;
            color: var(--text-light);
            text-align: center;
        }

        @media (width > 576px) {
            .room__grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .footer__container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (width > 768px) {
            nav {
                padding: 2rem 1rem;
                position: static;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .nav__bar {
                padding: 0;
                background-color: transparent;
            }

            .nav__menu__btn {
                display: none;
            }

            .nav__links {
                padding: 0;
                width: unset;
                position: static;
                transform: none;
                flex-direction: row;
                background-color: transparent;
            }

            .RIGTH {
                DISPLAY: flex;
                JUSTIFY-CONTENT: right;
                FLEX-DIRECTION: column;
                ALIGN-ITEMS: end;
                TEXT-ALIGN: right;
            }

            .team__card {
                width: 20%;
            }

                .team__card img {
                    min-height: 350px;
                    margin-bottom: 5px;
                }

            .nav__btn {
                display: block;
            }

            .nav__links a::after {
                position: absolute;
                content: "";
                left: 0;
                bottom: 0;
                height: 2px;
                width: 0;
                background-color: var(--primary-color);
                transition: 0.3s;
                transform-origin: left;
            }

            .nav__links a:hover::after {
                width: 100%;
            }

            .about__container {
                grid-template-columns: repeat(2, 1fr);
                align-items: center;
            }



            .service__content {
                grid-column: 2/3;
            }

            .footer__container {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        @media (width > 1024px) {
            .room__grid {
                gap: 2rem;
            }
        }
    </style>
</head>
<body>


    <form id="form1" runat="server">
        <div>





            <header class="header">

                <nav class="navbar navbar-expand-lg navbar-light  bg-umber pb-0 pt-0">
                    <a class="navbar-brand ps-3 text-white  pb-0 pt-0" href="#">
                        <img class="imglogo" src="../jana/Lumina-removebg-preview1.png" /></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ">
                            <li class="nav-item ">

                                <a class="nav-link active text-white" id="homeTab" href="../jana/index.aspx">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" id="aboutTab" href="../jana/about.aspx">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link  text-white" runat="server" id="books" href="../nada/show_books.aspx">Books</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link  text-white" runat="server" id="rooms" href="../jana/ViewRooms.aspx">Rooms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link  text-white" id="contact" href="../suleiman/contactUs.aspx">Contact Us</a>

                            </li>
                        </ul>
                    </div>
                    <div runat="server" id="buttons" visible="true">
     <asp:Button ID="login" runat="server" Text="login" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4" OnClick="login_Click"></asp:Button>
     <asp:Button ID="rigester" runat="server" Text="rigester" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4" OnClick="rigester_Click"></asp:Button>
 </div>

    <div runat="server" id="buttons2" visible="false">
    <asp:Button ID="logout" runat="server" Text="logout" class="btn btn-green my-2 my-sm-0 me-2 ps-4 pe-4" OnClick="logout_Click"></asp:Button>
    <asp:Button ID="prof" runat="server" Text="Profile" class="btn btn-green my-2 my-sm-0 me-3 ps-4 pe-4" OnClick="prof_Click"></asp:Button>
</div>
                </nav>
                <div class="section__container header__container" id="home">
                    <p>UNIVARSITY LIBRARY</p>
                    <h1>what is <span>LUMINA!</span>.</h1>
                </div>
            </header>



            <section class="section__container about__container" id="about">
                <div class="about__image">
                    <img src="imgs/books.jpg" alt="about" />
                </div>
                <div class="about__content">
                    <p class="section__subheader">ABOUT LUMINA</p>
                    <h2 class="section__header" style="color: white;">Empowering Knowledge, Illuminating Minds!</h2>
                    <p class="section__description">
                        Welcome to <strong>Lumina</strong> — your gateway to endless learning opportunities. As the official online platform for the university library, Lumina is designed to provide students, faculty, and researchers with seamless access to an extensive collection of books, academic journals, and multimedia resources.  
                    Whether you're looking for the latest research materials or need to reserve a study room for collaborative work, Lumina is here to support your academic journey.
                    </p>
                    <p class="section__description">
                        Discover, learn, and achieve more with Lumina — where knowledge lights the way!
                    </p>
                    <div class="about__btn">
                        <button class="btn">Explore Now</button>
                    </div>
                </div>

            </section>

            <section class="section__container room__container">
                <p class="section__subheader">OUR ROOMS</p>
                <h2 class="section__header">The Perfect Space for Focused Learning & Productive Meetings!</h2>
                <div class="room__grid">
                    <div class="room__card">
                        <div class="room__card__image">
                            <img src="imgs/meetingRoom1.jpg" alt="Meeting Room" />
                        </div>
                        <br>
                        <div class="room__card__details">
                            <h4>Collaborative Meeting Rooms</h4>
                            <p>
                                Designed for group discussions and brainstorming sessions, our meeting rooms are equipped with modern amenities to foster productivity and teamwork.
                            </p>
                        </div>
                    </div>

                    <div class="room__card">
                        <div class="room__card__image">
                            <img src="imgs/privateRoom1.jpg" alt="Reading Room" />

                        </div>
                        <br>
                        <div class="room__card__details">
                            <h4>Individual Study Spaces</h4>
                            <p>
                                Enjoy a quiet, distraction-free environment perfect for focused study sessions or deep reading experiences.
                            </p>
                        </div>
                    </div>
                </div>
            </section>



            <section class="section__container team__container " id="team">
                <p class="section__subheader">MEET OUR TEAM</p>
                <h2 class="section__header">A Dedicated Team Ready to Assist You</h2>
                <div class="team__grid">
                    <div class="team__card">
                        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="Librarian" />
                        <h4>Adnan ALghzawi</h4>
                        <p>Scrum master</p>
                    </div>
                    <div class="team__card">
                        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="Assistant" />
                        <h4>Nada Qdesat</h4>
                        <p>Product owner</p>
                    </div>
                    <div class="team__card">
                        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="Assistant" />
                        <h4>Sally Alzoubi</h4>
                        <p>Developer</p>
                    </div>
                    <div class="team__card">
                        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="Assistant" />
                        <h4>Hazem alfrehat</h4>
                        <p>Developer</p>
                    </div>
                    <div class="team__card">
                        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="Assistant" />
                        <h4>Jana abd alsalam</h4>
                        <p>Developer</p>
                    </div>
                    <div class="team__card">
                        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="Assistant" />
                        <h4>Suleiman Khashashneh</h4>
                        <p>Developer</p>
                    </div>
                </div>
        </div>
        </section>


            <section class="section__container testimonials__container" id="testimonials">
                <p class="section__subheader">WHAT OUR USERS SAY</p>
                <h2 class="section__header">Your Success Stories Inspire Us!</h2>
                <div class="testimonials__grid">
                    <div class="testimonial__card">
                        <p>"Lumina is a game-changer for academic research. I found everything I needed in one place!"</p>
                        <h4>- Layla Hasan</h4>
                    </div>
                    <div class="testimonial__card">
                        <p>"The room reservation system is seamless and makes group projects so much easier."</p>
                        <h4>- Omar Zaid</h4>
                    </div>
                </div>
            </section>

        <!-- Footer -->
        <footer class="text-center text-lg-start bg-umber text-white">
            <!-- Section: Social media -->
            <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
                <!-- Left -->
                <div class="me-5 d-none d-lg-block">
                    <span>Get connected with us on social networks:</span>
                </div>
                <!-- Left -->

                <!-- Right -->
                <div>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-linkedin"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-github"></i>
                    </a>
                </div>
                <!-- Right -->
            </section>
            <!-- Section: Social media -->

            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Content -->
                            <img src="imgs/Lumina__1_-removebg-preview.png" style="width: 70%" />
                            <p>
                                University Library System
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Services
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Books</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Meeting rooms</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Private rooms</a>
                            </p>

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Useful links
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Home</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">About us</a>
                            </p>
                            <p>
                                <a href="../suleiman/contactUs.aspx" class="text-reset">Contact Us</a>
                            </p>

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                            <p><i class="fas fa-home me-3"></i>New York, NY 10012, US</p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                LUMINA@gmail.com
         
                            </p>
                            <p><i class="fas fa-phone me-3"></i>+ 01 234 567 88</p>
                            <p><i class="fas fa-print me-3"></i>+ 01 234 567 89</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2025 Copyright:
   
                    <a class="text-reset fw-bold" href="https://mdbootstrap.com/">LUMINA.com</a>
            </div>
            <!-- Copyright -->
        </footer>
        <script src="https://kit.fontawesome.com/4c8957d542.js" crossorigin="anonymous"></script>

        <script src="https://unpkg.com/scrollreveal"></script>
        <script src="main.js"></script>
        <script>
            const menuBtn = document.getElementById("menu-btn");
            const navLinks = document.getElementById("nav-links");
            const menuBtnIcon = menuBtn.querySelector("i");

            menuBtn.addEventListener("click", () => {
                navLinks.classList.toggle("open");

                const isOpen = navLinks.classList.contains("open");
                menuBtnIcon.setAttribute("class", isOpen ? "ri-close-line" : "ri-menu-line");
            });

            navLinks.addEventListener("click", () => {
                navLinks.classList.remove("open");
                menuBtnIcon.setAttribute("class", "ri-menu-line");
            });

            const scrollRevealOption = {
                distance: "50px",
                origin: "bottom",
                duration: 1000,
            };

            // header container
            ScrollReveal().reveal(".header__container p", {
                ...scrollRevealOption,
            });

            ScrollReveal().reveal(".header__container h1", {
                ...scrollRevealOption,
                delay: 500,
            });

            // about container
            ScrollReveal().reveal(".about__image img", {
                ...scrollRevealOption,
                origin: "left",
            });

            ScrollReveal().reveal(".about__content .section__subheader", {
                ...scrollRevealOption,
                delay: 500,
            });

            ScrollReveal().reveal(".about__content .section__header", {
                ...scrollRevealOption,
                delay: 1000,
            });

            ScrollReveal().reveal(".about__content .section__description", {
                ...scrollRevealOption,
                delay: 1500,
            });

            ScrollReveal().reveal(".about__btn", {
                ...scrollRevealOption,
                delay: 2000,
            });

            // room container
            ScrollReveal().reveal(".room__card", {
                ...scrollRevealOption,
                interval: 500,
            });

            // service container
            ScrollReveal().reveal(".service__list li", {
                ...scrollRevealOption,
                interval: 500,
                origin: "right",
            });

        </script>
        </div>
    </form>
</body>
</html>

