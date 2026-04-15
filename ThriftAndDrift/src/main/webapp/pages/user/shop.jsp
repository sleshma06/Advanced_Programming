<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop page</title>
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0ebe3;
            color: #1a1a1a;
        }

        /* ── NAVBAR ── */
        .navbar {
            background-color: #f0ebe3;
            padding: 14px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #ddd;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .nav-links {
            display: flex;
            gap: 32px;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: #1a1a1a;
            font-size: 13px;
            font-weight: 500;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .nav-links a:hover {
            color: #8b1a1a;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .nav-icon {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            color: #1a1a1a;
            padding: 4px;
            text-decoration: none;
        }
        
        .nav-icon img {
   			 width: 20px;
   			 height: 20px;
    		object-fit: contain;
		}

        .btn-seller {
            background-color: #8b1a1a;
            color: #fff;
            border: none;
            padding: 11px 24px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-seller:hover {
            background-color: #6e1414;
        }

        /* ── PAGE TITLE ── */
        .page-title {
            text-align: center;
            padding: 40px 20px 20px;
        }

        .page-title h1 {
            font-size: 48px;
            font-weight: 900;
            color: #8b1a1a;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        /* ── MAIN LAYOUT ── */
        .main-layout {
            display: flex;
            gap: 24px;
            padding: 0 40px 40px;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* ── SIDEBAR FILTERS ── */
        .sidebar {
            width: 270px;
            background: #fff;
            border-radius: 8px;
            padding: 16px;
            border: 1px solid #e0dbd3;
            height: fit-content;
        }

        .sidebar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .sidebar-header span {
            font-size: 14px;
            font-weight: 700;
        }

        .filter-icon {
            font-size: 16px;
            color: #888;
        }

        .filter-section {
            border-top: 1px solid #eee;
            padding: 12px 0;
        }

        .filter-section-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .filter-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 5px 0;
            font-size: 12px;
            color: #444;
            cursor: pointer;
        }

        .filter-item:hover {
            color: #8b1a1a;
        }

        /* Price Slider */
        .price-range input[type="range"] {
            width: 100%;
            accent-color: #8b1a1a;
            height: 4px;
        }

        .price-labels {
            display: flex;
            justify-content: space-between;
            font-size: 11px;
            color: #666;
            margin-top: 4px;
        }

        /* Size Grid */
        .size-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 6px;
            margin-top: 8px;
        }

        .size-btn {
            border: 1px solid #ccc;
            background: #fff;
            border-radius: 4px;
            padding: 5px 4px;
            font-size: 11px;
            cursor: pointer;
            text-align: center;
            color: #444;
        }

        .size-btn:hover {
            border-color: #8b1a1a;
            color: #8b1a1a;
        }

        .size-btn.active {
            background-color: #8b1a1a;
            color: #fff;
            border-color: #8b1a1a;
        }

        /* Condition Stars */
        .stars {
            display: flex;
            gap: 4px;
            margin-top: 6px;
        }

        .star {
            color: #e0b040;
            font-size: 16px;
        }

        .star.empty {
            color: #ddd;
        }

        .condition-label {
            font-size: 11px;
            color: #888;
            margin-left: 4px;
        }

        /* Apply Filter Button */
        .btn-apply {
            width: 100%;
            background-color: #8b1a1a;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 16px;
        }

        .btn-apply:hover {
            background-color: #6e1414;
        }

        /* ── PRODUCT AREA ── */
        .product-area {
            flex: 1;
        }

        .product-area-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .product-area-header h2 {
            font-size: 20px;
            font-weight: 700;
        }

        .product-meta {
            font-size: 12px;
            color: #666;
        }

        /* Product Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
        }

        .product-card {
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #e8e3db;
        }

        .product-img-wrap {
            position: relative;
            background: #f5f0ea;
            height: 280px;
            overflow: hidden;
        }

        .product-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .badge-new {
            position: absolute;
            top: 10px;
            left: 10px;
            border: 1px solid #8b1a1a;
            color: #8b1a1a;
            font-size: 10px;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 2px;
            background: #fff;
        }

        .wishlist-btn {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
            color: #888;
        }

        .wishlist-btn:hover {
            color: #8b1a1a;
        }

        .product-info {
            padding: 10px 12px 12px;
        }

        .product-name {
            font-size: 13px;
            font-weight: 500;
            color: #1a1a1a;
            margin-bottom: 8px;
        }

        .product-bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .product-price {
            font-size: 15px;
            font-weight: 700;
            color: #1a1a1a;
        }

        .btn-add-bag {
            display: flex;
            align-items: center;
            gap: 5px;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 5px 9px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            color: #1a1a1a;
        }

        .btn-add-bag:hover {
            background: #8b1a1a;
            color: #fff;
            border-color: #8b1a1a;
        }

        /* ── PAGINATION ── */
        .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 28px;
            padding-top: 16px;
            border-top: 1px solid #e0dbd3;
        }

        .page-numbers {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .page-btn {
            border: none;
            background: none;
            padding: 6px 10px;
            font-size: 13px;
            cursor: pointer;
            border-radius: 4px;
            color: #444;
        }

        .page-btn.active {
            background: #1a1a1a;
            color: #fff;
        }

        .page-btn:hover {
            background: #eee;
        }

        .btn-prev,
        .btn-next {
            display: flex;
            align-items: center;
            gap: 4px;
            border: 1px solid #ccc;
            background: #fff;
            padding: 6px 14px;
            border-radius: 4px;
            font-size: 13px;
            cursor: pointer;
            color: #1a1a1a;
        }

        .btn-prev:hover,
        .btn-next:hover {
            border-color: #8b1a1a;
            color: #8b1a1a;
        }

       .newsletter-banner {
    background: linear-gradient(135deg, #7a1212, #a11c1c);
    border-radius: 16px;
    margin: 40px;
    padding: 50px 60px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 40px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.newsletter-text {
    color: #fff;
    font-size: 28px;
    font-weight: 800;
    max-width: 420px;
    line-height: 1.4;
}

.newsletter-form {
    display: flex;
    flex-direction: column;
    gap: 18px;
    min-width: 300px;
}

.newsletter-input-wrap {
    display: flex;
    align-items: center;
    background: #fff;
    border-radius: 30px;
    padding: 12px 18px;
    gap: 10px;
    box-shadow: inset 0 2px 4px rgba(0,0,0,0.08);
}

.newsletter-input-wrap input {
    border: none;
    outline: none;
    font-size: 14px;
    width: 100%;
    background: transparent;
}

.btn-subscribe {
    background: #fff;
    color: #7a1212;
    border: none;
    border-radius: 30px;
    padding: 12px 24px;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s;
    align-self: flex-start;
}

.btn-subscribe:hover {
    background: #f0ebe3;
    transform: translateY(-2px);
}

        /* ── FOOTER ── */
        .footer {
            background: #fff;
            padding: 48px 40px 0;
        }

        .footer-top {
            display: grid;
            grid-template-columns: 1.5fr 1fr 1fr 0.8fr;
            gap: 40px;
            padding-bottom: 32px;
            border-bottom: 1px solid #eee;
        }

        .footer-brand p {
            font-size: 13px;
            color: #555;
            margin-bottom: 4px;
            line-height: 1.6;
        }

        .footer-brand .phone {
            margin-top: 12px;
            font-size: 13px;
            color: #555;
        }

        .footer-brand .site-link {
            display: block;
            margin-top: 10px;
            font-size: 12px;
            color: #8b1a1a;
            text-decoration: underline;
        }

        .footer-social {
            display: flex;
            gap: 12px;
            margin-top: 14px;
        }

        .footer-social a {
            font-size: 18px;
            color: #1a1a1a;
            text-decoration: none;
        }
        .footer-social a img {
    			width: 22px;
    			height: 22px;
    			object-fit: contain;
    			display: block;
			}

        .footer-col h4 {
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 14px;
            color: #1a1a1a;
        }

        .footer-col ul {
            list-style: none;
        }

        .footer-col ul li {
            margin-bottom: 10px;
        }

        .footer-col ul li a {
            font-size: 13px;
            color: #555;
            text-decoration: none;
        }

        .footer-col ul li a:hover {
            color: #8b1a1a;
        }

        .footer-logos {
            display: flex;
            gap: 10px;
        }

        .footer-logo-box {
            width: 60px;
            height: 40px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background: #f5f5f5;
        }

        .footer-brand-name {
            font-size: 72px;
            font-weight: 900;
            color: #1a1a1a;
            letter-spacing: -1px;
            text-align: center;
            padding: 20px 0 8px;
            text-transform: uppercase;
        }

		
        .footer-copy {
            text-align: center;
            font-size: 12px;
            color: #888;
            padding: 12px 0 20px;
            border-top: 1px solid #eee;
        }


        /* ── RESPONSIVE (mobile) ── */
        @media (max-width: 640px) {
            .navbar {
                padding: 12px 20px;
            }

            .nav-links {
                flex-wrap: wrap;
                gap: 12px;
            }

            .main-layout {
                flex-direction: column;
                padding: 0 16px 24px;
            }

            .sidebar {
                width: 100%;
            }

            .size-grid {
                grid-template-columns: repeat(4, 1fr);
            }

            .product-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 12px;
            }

            .newsletter-banner {
                margin: 24px 16px;
                padding: 24px 20px;
                flex-direction: column;
                align-items: flex-start;
            }

            .newsletter-form {
                width: 100%;
            }

            .footer {
                padding: 32px 16px 0;
            }

            .footer-top {
                grid-template-columns: 1fr;
                gap: 24px;
            }

            .footer-brand-name {
                font-size: 40px;
            }
            
        }
    </style>
</head>
<body>

<!-- ── NAVBAR ── -->
<nav class="navbar">
    <ul class="nav-links">
        <li><a href="#">Home</a></li>
        <li><a href="#">Shop</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
    </ul>

    <div class="nav-right">
        <a href="#" class="nav-icon" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></a>
        <a href="#" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Star"></a>
        <a href="#" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="#" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="Instagram"></a>
        <a href="#" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<!-- ── PAGE TITLE ── -->
<div class="page-title">
    <h1>Explore Products</h1>
</div>

<!-- ── MAIN LAYOUT ── -->
<div class="main-layout">

    <!-- SIDEBAR FILTERS -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <span>Filters</span>
            <span class="filter-icon">&#9776;</span>
        </div>

        <!-- Categories -->
        <div class="filter-section">
            <div class="filter-item"><span>Tops</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Skirts</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Outerwears</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Pants</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Others</span><span>&#8250;</span></div>
        </div>

        <!-- Price -->
        <div class="filter-section">
            <div class="filter-section-title">
                <span>Price</span>
                <span>&#8743;</span>
            </div>
            <div class="price-range">
                <input type="range" min="99" max="10000" value="10000">
                <div class="price-labels">
                    <span>Rs 99</span>
                    <span>Rs 10000</span>
                </div>
            </div>
        </div>

        <!-- Size -->
        <div class="filter-section">
            <div class="filter-section-title">
                <span>Size</span>
                <span>&#8743;</span>
            </div>
            
            <div class="size-grid">
            
                <button class="size-btn">S</button>
                <button class="size-btn">M</button>
                <button class="size-btn active">L</button>
                <button class="size-btn">XL</button>
                
            </div>
        </div>

        <!-- Condition -->
        <div class="filter-section">
            <div class="filter-section-title">
                <span>Condition</span>
                <span>&#8743;</span>
            </div>
            <div style="display:flex; align-items:center;">
                <div class="stars">
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star empty">&#9733;</span>
                    <span class="star empty">&#9733;</span>
                    <span class="star empty">&#9733;</span>
                </div>
                <span class="condition-label">/5</span>
            </div>
        </div>

        <!-- Style -->
        <div class="filter-section">
            <div class="filter-section-title">
                <span>Style</span>
                <span>&#8743;</span>
            </div>
            <div class="filter-item"><span>Casual</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Formal</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Party</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Traditional</span><span>&#8250;</span></div>
            <div class="filter-item"><span>New In</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Designer</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Others</span><span>&#8250;</span></div>
        </div>

        <button class="btn-apply">Apply Filter</button>
    </aside>

    <!-- PRODUCT AREA -->
    <main class="product-area">
        <div class="product-area-header">
            <h2>Skirts</h2>
            <div class="product-meta">
                <span>Showing 1-2 of 2 Products &nbsp;&nbsp; Sort by: <strong>Newest First &#8964;</strong></span>
            </div>
        </div>

        <div class="product-grid">

            <!-- Product 1 -->
            <div class="product-card">
                <div class="product-img-wrap">
                    <span class="badge-new">New-in</span>
                    <img src="${pageContext.request.contextPath}/images/c4.jfif" alt="brown skirt">
                    <button class="wishlist-btn" title="Add to Wishlist">&#9734;</button>
                </div>
                <div class="product-info">
                    <p class="product-name">brown skirt</p>
                    <div class="product-bottom">
                        <span class="product-price">Rs 450</span>
                        <form method="post" action="cart">
                            <input type="hidden" name="productId" value="1">
                            <input type="hidden" name="productName" value="brown skirt">
                            <input type="hidden" name="productPrice" value="450">
                            <button type="submit" class="btn-add-bag">
                                <span>&#128717;</span> Add to Bag
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Product 2 -->
            <div class="product-card">
                <div class="product-img-wrap">
                    <span class="badge-new">New-in</span>
                    <img src="${pageContext.request.contextPath}/images/c3.jfif" alt="Short jean skirt">
                    <button class="wishlist-btn" title="Add to Wishlist">&#9734;</button>
                </div>
                <div class="product-info">
                    <p class="product-name">Short jean skirt</p>
                    <div class="product-bottom">
                        <span class="product-price">Rs 290</span>
                        <form method="post" action="cart">
                            <input type="hidden" name="productId" value="2">
                            <input type="hidden" name="productName" value="Short jean skirt">
                            <input type="hidden" name="productPrice" value="290">
                            <button type="submit" class="btn-add-bag">
                                <span>&#128717;</span> Add to Bag
                            </button>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <!-- PAGINATION -->
        <div class="pagination">
            <button class="btn-prev">&#8592; Previous</button>
            <div class="page-numbers">
                <button class="page-btn active">1</button>
                <button class="page-btn">2</button>
                <button class="page-btn">3</button>
                <span style="font-size:13px; color:#888;">...</span>
                <button class="page-btn">8</button>
                <button class="page-btn">9</button>
                <button class="page-btn">10</button>
            </div>
            <button class="btn-next">Next &#8594;</button>
        </div>
    </main>
</div>

<!-- ── NEWSLETTER BANNER ── -->
<div class="newsletter-banner">
    <div class="newsletter-text">
    Not only sell, but share the memories<br>
    behind your wardrobe.
</div>
    <div class="newsletter-form">
        <form method="post" action="newsletter">
            <div class="newsletter-input-wrap">
                <span>&#9993;</span>
                <input type="email" name="email" placeholder="Enter your email address" required>
            </div>
            <button type="submit" class="btn-subscribe">Subscribe to Newsletter</button>
        </form>
    </div>
</div>

<!-- ── FOOTER ── -->
<footer class="footer">
    <div class="footer-top">
        <div class="footer-brand">
            <p>Islington College</p>
            <p>Kamalpokhari, Dhobidhara</p>
            <p class="phone">+977 9810349297</p>
            <p>01 4335544</p>
            <a href="#" class="site-link">thrift&amp;drift.com</a>
            <div class="footer-social">
                <a href="https://www.instagram.com" target="_blank" title="Instagram"><img src="${pageContext.request.contextPath}/images/social.png" alt="Instagram"></a>
				<a href="https://www.tiktok.com" target="_blank" title="TikTok"><img src="${pageContext.request.contextPath}/images/tik-tok.png" alt="TikTok"></a>
				<a href="https://www.twitter.com" target="_blank" title="Twitter"><img src="${pageContext.request.contextPath}/images/twitter.png" alt="Twitter"></a>
				<a href="https://www.whatsapp.com" target="_blank" title="WhatsApp"><img src="${pageContext.request.contextPath}/images/whatsapp (1).png" alt="WhatsApp"></a>
				<a href="https://www.youtube.com" target="_blank" title="YouTube"><img src="${pageContext.request.contextPath}/images/youtube.png" alt="YouTube"></a>
            </div>
        </div>

        <div class="footer-col">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="#">Sell</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Collections</a></li>
                <li><a href="#">Explore products</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Services</h4>
            <ul>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms &amp; Conditions</a></li>
                <li><a href="#">Shipping &amp; Returns</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <div class="footer-logos">
                <div class="footer-logo-box"></div>
                <div class="footer-logo-box"></div>
            </div>
        </div>
    </div>

    <div class="footer-brand-name">THRIFT&amp;DRIFT</div>
    <div class="footer-copy">&copy; 2024 Thrift&amp;Drift. All rights reserved.</div>
</footer>

</body>
</html>
