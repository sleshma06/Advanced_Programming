<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<nav class="navbar">
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/ShopServlet">Shop</a></li>
        <li><a href="${pageContext.request.contextPath}/AboutServlet">About</a></li>
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

<main class="profile-page">
    <aside class="profile-menu">
        <h1>My Account</h1>
        <a href="#profile">My Profile</a>
        <a href="${pageContext.request.contextPath}/LogoutServlet">Log Out</a>
    </aside>

    <section class="profile-content">
        <div class="panel" id="submissions">
            <h2>My Submissions</h2>
            <p>Denim Jacket <span>Under Review</span></p>
            <p>Floral Midi Skirt <span>Listed</span></p>
            <p>Leather Bag <span>Sold</span></p>
        </div>

        <div class="panel" id="orders">
            <h2>My Orders</h2>
            <p>Vintage Levi's 501 <span>Processing</span></p>
            <p>Y2K Leather Shoulder Bag <span>Ready for Pickup</span></p>
            <p>Graphic Sweatshirt <span>Delivered</span></p>
        </div>

        <div class="panel" id="payouts">
            <h2>Payouts</h2>
            <div class="payout-grid">
                <strong>Rs. 3,200 <small>Pending payout</small></strong>
                <strong>Rs. 8,900 <small>Received</small></strong>
            </div>
        </div>

        <div class="panel" id="profile">
            <h2>Edit Profile</h2>
            <form class="profile-form">
                <input type="file" name="photo">
                <input type="text" name="name" placeholder="Full name">
                <input type="email" name="email" placeholder="Email">
                <input type="tel" name="phone" placeholder="Phone">
                <input type="text" name="location" placeholder="Location">
                <button type="button">Save Profile</button>
            </form>
        </div>
    </section>
</main>
</body>
</html>
