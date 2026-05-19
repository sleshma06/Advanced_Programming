<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
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

<main class="checkout-page">
    <h1>Checkout</h1>
    <form class="checkout-layout" action="${pageContext.request.contextPath}/CheckoutServlet" method="post">
        <section class="checkout-card">
            <h2>Delivery Details</h2>
            <div class="toggle-row">
                <label><input type="radio" name="fulfillment" checked> Delivery</label>
                <label><input type="radio" name="fulfillment"> In-store Pickup</label>
            </div>

            <div class="field-grid">
                <input type="text" name="name" placeholder="Full Name">
                <input type="tel" name="phone" placeholder="Phone">
                <input type="text" name="address" placeholder="Full Address" class="wide">
                <input type="text" name="city" placeholder="City">
                <input type="text" name="postalCode" placeholder="Postal Code">
            </div>

            <div class="pickup-box">
                <strong>Pickup Store</strong>
                <p>Thrift&amp;Drift Store, Islington College, Kamalpokhari, Kathmandu</p>
                <select name="pickupSlot">
                    <option>Select pickup time slot</option>
                    <option>10:00 AM - 12:00 PM</option>
                    <option>2:00 PM - 4:00 PM</option>
                    <option>4:00 PM - 6:00 PM</option>
                </select>
            </div>

            <h2>Payment Method</h2>
            <div class="payment-options">
                <label><input type="radio" name="payment" checked> eSewa</label>
                <label><input type="radio" name="payment"> Khalti</label>
                <label><input type="radio" name="payment"> Cash on Delivery</label>
                <label><input type="radio" name="payment"> Bank Transfer</label>
            </div>
        </section>

        <aside class="summary-card">
            <h2>Order Summary</h2>
            <div class="summary-row"><span>Subtotal</span><strong>Rs. 4,398</strong></div>
            <div class="summary-row"><span>Platform Fee</span><strong>Rs. 50</strong></div>
            <div class="summary-row total"><span>Total</span><strong>Rs. 4,448</strong></div>
            <button type="submit">Place Order</button>
        </aside>
    </form>
</main>

<footer class="footer">
    <div class="footer-top">
        <div class="footer-brand">
            <p>Islington College</p>
            <p>Kamalpokhari, Dhobidhara</p>
            <p class="phone">+977 9810349297</p>
            <p>01 4335544</p>
            <a href="#" class="site-link">thrift&amp;drift.com</a>
        </div>
        <div class="footer-col"><h4>Quick Links</h4><ul><li><a href="${pageContext.request.contextPath}/SellerServlet">Sell</a></li><li><a href="#">About Us</a></li><li><a href="${pageContext.request.contextPath}/ShopServlet">Explore products</a></li></ul></div>
        <div class="footer-col"><h4>Services</h4><ul><li><a href="#">FAQ</a></li><li><a href="#">Privacy Policy</a></li><li><a href="#">Shipping &amp; Returns</a></li></ul></div>
    </div>
    <div class="footer-brand-name">THRIFT&amp;DRIFT</div>
    <div class="footer-copy">&copy; 2024 Thrift&amp;Drift. All rights reserved.</div>
</footer>

</body>
</html>
