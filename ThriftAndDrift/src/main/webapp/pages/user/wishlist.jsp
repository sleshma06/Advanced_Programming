<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wishlist - Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>

<nav class="navbar">
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/ShopServlet">Shop</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
    </ul>

    <div class="nav-right">
        <form class="nav-search" action="${pageContext.request.contextPath}/ShopServlet" method="get">
            <input class="nav-search-input" type="search" name="q" placeholder="Search products">
            <button class="nav-search-button" type="submit" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></button>
        </form>
        <a href="${pageContext.request.contextPath}/WishlistServlet" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Wishlist"></a>
        <a href="${pageContext.request.contextPath}/BagServlet" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="${pageContext.request.contextPath}/ProfileServlet" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="Account"></a>
        <a href="${pageContext.request.contextPath}/SellerServlet" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<main class="wishlist-page">
    <div class="wishlist-alert">
        <span>○</span>
        <p>Heads up! Some items in your wishlist have recently sold.</p>
    </div>

    <section class="wishlist-header">
        <div>
            <h1>Your Wishlist</h1>
            <p>6 items saved</p>
        </div>

        <button class="filter-button" type="button">
            <span>☷</span>
            Filter
        </button>
    </section>

    <section class="wishlist-grid">
        <article class="wishlist-card">
            <div class="image-wrap">
                <span class="status-pill">Good</span>
                <button class="heart-button" type="button">☆</button>
                <img src="${pageContext.request.contextPath}/images/denim.jpg" alt="Vintage Levi's 501 Original">
            </div>
            <div class="item-row">
                <h2>Vintage Levi's 501 Original</h2>
                <strong>Rs. 2,499</strong>
            </div>
            <p class="item-meta">W32 L30 · Bottoms</p>
            <button class="add-button" type="button">Add to Cart</button>
            <button class="remove-button" type="button">♧ Remove</button>
        </article>

        <article class="wishlist-card">
            <div class="image-wrap">
                <span class="status-pill">Like New</span>
                <button class="heart-button" type="button">☆</button>
                <img src="${pageContext.request.contextPath}/images/c2.jfif" alt="Oversized college sweatshirt">
            </div>
            <div class="item-row">
                <h2>Oversized Graphic College Sweatshirt</h2>
                <strong>Rs. 1,299</strong>
            </div>
            <p class="item-meta">One · Tops</p>
            <button class="add-button" type="button">Add to Cart</button>
            <button class="remove-button" type="button">♧ Remove</button>
        </article>

        <article class="wishlist-card sold-card">
            <div class="image-wrap">
                <span class="status-pill sold-pill">Sold</span>
                <button class="heart-button" type="button">☆</button>
                <img src="${pageContext.request.contextPath}/images/gucci.jpg" alt="Leather shoulder bag">
            </div>
            <div class="item-row">
                <h2>Y2K Leather Shoulder Bag</h2>
                <strong><span>Rs. 1,899</span></strong>
            </div>
            <p class="item-meta">One Size · Accessories</p>
            <button class="add-button unavailable" type="button">Unavailable</button>
            <button class="remove-button" type="button">♧ Remove</button>
        </article>

        <article class="wishlist-card">
            <div class="image-wrap">
                <span class="status-pill">Good</span>
                <button class="heart-button" type="button">☆</button>
                <img src="${pageContext.request.contextPath}/images/c1.jfif" alt="Black boots">
            </div>
            <div class="item-row">
                <h2>Doc Martens 1460 Boots</h2>
                <strong>Rs. 4,500</strong>
            </div>
            <p class="item-meta">UK 8 · Shoes</p>
            <button class="add-button" type="button">Add to Cart</button>
            <button class="remove-button" type="button">♧ Remove</button>
        </article>

        <article class="wishlist-card sold-card">
            <div class="image-wrap">
                <span class="status-pill sold-pill">Sold</span>
                <button class="heart-button" type="button">☆</button>
                <img src="${pageContext.request.contextPath}/images/PradaCoat.jpg" alt="Detroit jacket">
            </div>
            <div class="item-row">
                <h2>Carhartt Detroit Jacket</h2>
                <strong><span>Rs. 5,999</span></strong>
            </div>
            <p class="item-meta">L · Outerwear</p>
            <button class="add-button unavailable" type="button">Unavailable</button>
            <button class="remove-button" type="button">♧ Remove</button>
        </article>

        <article class="wishlist-card">
            <div class="image-wrap">
                <span class="status-pill">Like New</span>
                <button class="heart-button" type="button">☆</button>
                <img src="${pageContext.request.contextPath}/images/polkadot.jpg" alt="Floral midi skirt">
            </div>
            <div class="item-row">
                <h2>90s Floral Midi Skirt</h2>
                <strong>Rs. 899</strong>
            </div>
            <p class="item-meta">M · Bottoms</p>
            <button class="add-button" type="button">Add to Cart</button>
            <button class="remove-button" type="button">♧ Remove</button>
        </article>
    </section>
</main>

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
                <li><a href="${pageContext.request.contextPath}/SellerServlet">Sell</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Collections</a></li>
                <li><a href="${pageContext.request.contextPath}/ShopServlet">Explore products</a></li>
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
