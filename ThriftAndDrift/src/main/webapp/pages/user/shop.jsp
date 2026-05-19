<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">

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
        <a href="${pageContext.request.contextPath}/WishlistServlet" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Wishlist"></a>
        <a href="${pageContext.request.contextPath}/BagServlet" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="${pageContext.request.contextPath}/ProfileServlet" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="User"></a>
        <a href="${pageContext.request.contextPath}/SellerServlet" class="btn-seller">Be a Seller</a>
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
                                <span>&#128717;</span> Add to Cart
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
                                <span>&#128717;</span> Add to Cart
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
