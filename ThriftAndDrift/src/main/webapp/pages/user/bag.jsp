<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Bag - Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bag.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>

<nav class="navbar">
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/ShopServlet">Shop</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
    </ul>

    <div class="nav-right">
        <a href="#" class="nav-icon" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></a>
        <a href="${pageContext.request.contextPath}/WishlistServlet" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Wishlist"></a>
        <a href="${pageContext.request.contextPath}/BagServlet" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="#" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="Account"></a>
        <a href="${pageContext.request.contextPath}/SellerServlet" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<main class="bag-page">
    <section class="bag-layout">
        <div class="bag-main">
            <div class="bag-heading">
                <h1>Your Bag</h1>
                <span>2 Items</span>
            </div>

            <div class="bag-items">
                <article class="bag-item">
                    <img src="${pageContext.request.contextPath}/images/denim.jpg" alt="Vintage Levi's 501 Original">
                    <div class="item-details">
                        <h2>Vintage Levi's 501 Original</h2>
                        <p>W32 L30 <span>Good</span></p>
                        <div class="item-note">Seller: <strong>@vintage_finds</strong></div>
                        <div class="item-note">Meetup: <strong>North Campus</strong></div>
                    </div>
                    <strong class="item-price">Rs 2,499</strong>
                    <button type="button" class="remove-link">Remove</button>
                </article>

                <article class="bag-item">
                    <img src="${pageContext.request.contextPath}/images/gucci.jpg" alt="Y2K leather shoulder bag">
                    <div class="item-details">
                        <h2>Y2K Leather Shoulder Bag</h2>
                        <p>One Size <span>Fair</span></p>
                        <div class="item-note">Seller: <strong>@thrift_queen</strong></div>
                        <div class="item-note">Meetup: <strong>South Block</strong></div>
                    </div>
                    <strong class="item-price">Rs 1,899</strong>
                    <button type="button" class="remove-link">Remove</button>
                </article>
            </div>

            <div class="safety-box">
                <div class="safety-icon">S</div>
                <div>
                    <h3>Meetup Safety First</h3>
                    <p>Always meet in public campus areas during daylight hours. Do not share personal banking details over WhatsApp.</p>
                    <a href="#">Contact Support on WhatsApp</a>
                </div>
            </div>
        </div>

        <aside class="bag-side">
            <div class="summary-box">
                <h2>Order Summary</h2>

                <div class="summary-row">
                    <span>Subtotal</span>
                    <strong>Rs 4,398</strong>
                </div>

                <div class="summary-row">
                    <span>Platform Fee</span>
                    <strong>Rs 50</strong>
                </div>

                <label for="promoCode">Promo Code</label>
                <div class="promo-row">
                    <input type="text" id="promoCode" name="promoCode" placeholder="Enter code">
                    <button type="button">Apply</button>
                </div>

                <div class="total-row">
                    <span>Total</span>
                    <strong>Rs 4,448</strong>
                </div>

                <button type="button" class="checkout-button">
                    <span>Checkout</span>
                    <span>&rarr;</span>
                </button>
            </div>

            <div class="sell-box">
                <div class="sell-icon">◇</div>
                <h2>Clear Your Closet</h2>
                <p>Turn your pre-loved pieces into cash. List an item in under 2 minutes and join our community of sustainable fashion.</p>
                <a href="${pageContext.request.contextPath}/SellerServlet">Sell Now</a>
            </div>
        </aside>
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
