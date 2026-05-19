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
        <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/pages/user/shop.jsp">Shop</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
    </ul>

    <div class="nav-right">
        <a href="#" class="nav-icon" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></a>
        <a href="${pageContext.request.contextPath}/WishlistServlet" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Wishlist"></a>
        <a href="${pageContext.request.contextPath}/BagServlet" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="#" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="User"></a>
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
            <div class="filter-item"><span>Dresses</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Accessories</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Others</span><span>&#8250;</span></div>
        </div>

        <!-- Price -->
               <div class="filter-section">
            <div class="filter-section-title"><span>Price</span><span>&#8743;</span></div>
            <div class="price-range">
                <input type="range" min="99" max="10000" value="10000">
                <div class="price-labels"><span>Rs 99</span><span>Rs 10000</span></div>
            </div>
        </div>
        
        <!-- Size -->
         <div class="filter-section">
            <div class="filter-section-title"><span>Size</span><span>&#8743;</span></div>
            <div class="size-grid">
                <button class="size-btn">S</button>
                <button class="size-btn">M</button>
                <button class="size-btn active">L</button>
                <button class="size-btn">XL</button>
            </div>
        </div>

        <!-- Condition -->
  <div class="filter-section">
            <div class="filter-section-title"><span>Condition</span><span>&#8743;</span></div>
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
    
        <div class="category-block">
            <div class="category-label-wrap">
                <span class="category-tag">Skirts</span>
                <div class="category-divider"></div>
            </div>
            <div class="product-area-header">
                <h2>Skirts</h2>
                <div class="product-meta">
                    <span>Showing 1-4 of 4 &nbsp;&nbsp; Sort by: <strong>Newest First &#8964;</strong></span>
                </div>
            </div>
            <div class="product-grid">

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-new">New-in</span>
                        <img src="${pageContext.request.contextPath}/images/c4.jfif" alt="Brown Midi Skirt">
                        <button class="wishlist-btn" title="Add to Wishlist">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Brown Midi Skirt</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9734; Good</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 450</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="1">
                                <input type="hidden" name="productName" value="Brown Midi Skirt">
                                <input type="hidden" name="productPrice" value="450">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-new">New-in</span>
                        <img src="${pageContext.request.contextPath}/images/c3.jfif" alt="Short Jean Skirt">
                        <button class="wishlist-btn" title="Add to Wishlist">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Short Jean Skirt</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9734;&#9734; Fair</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 290</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="2">
                                <input type="hidden" name="productName" value="Short Jean Skirt">
                                <input type="hidden" name="productPrice" value="290">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-vintage">Vintage</span>
                        <img src="${pageContext.request.contextPath}/images/skirt3.jfif" alt="Floral Wrap Skirt">
                        <button class="wishlist-btn" title="Add to Wishlist">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Floral Wrap Skirt</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9733; Like New</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 520</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="3">
                                <input type="hidden" name="productName" value="Floral Wrap Skirt">
                                <input type="hidden" name="productPrice" value="520">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-vintage">Vintage</span>
                        <img src="${pageContext.request.contextPath}/images/skirt4.jfif" alt="Pleated Plaid Skirt">
                        <button class="wishlist-btn" title="Add to Wishlist">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Pleated Plaid Skirt</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9734; Good</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 380</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="4">
                                <input type="hidden" name="productName" value="Pleated Plaid Skirt">
                                <input type="hidden" name="productPrice" value="380">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>

 <div class="category-block">
            <div class="category-label-wrap">
                <span class="category-tag">Tops</span>
                <div class="category-divider"></div>
            </div>
            <div class="product-area-header">
                <h2>Tops</h2>
                <div class="product-meta">
                    <span>Showing 1-4 of 4 &nbsp;&nbsp; Sort by: <strong>Newest First &#8964;</strong></span>
                </div>
            </div>
            <div class="product-grid">

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-vintage">Vintage</span>
                        <img src="${pageContext.request.contextPath}/images/top1.jfif" alt="Lace Crochet Top">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Lace Crochet Top</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9733; Like New</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 340</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="5">
                                <input type="hidden" name="productName" value="Lace Crochet Top">
                                <input type="hidden" name="productPrice" value="340">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-new">New-in</span>
                        <img src="${pageContext.request.contextPath}/images/top2.jfif" alt="Striped Peasant Blouse">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Striped Peasant Blouse</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9734;&#9734; Fair</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 270</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="6">
                                <input type="hidden" name="productName" value="Striped Peasant Blouse">
                                <input type="hidden" name="productPrice" value="270">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-vintage">Vintage</span>
                        <img src="${pageContext.request.contextPath}/images/top3.jfif" alt="Puff Sleeve Corset Top">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Puff Sleeve Corset Top</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9734; Good</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 490</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="7">
                                <input type="hidden" name="productName" value="Puff Sleeve Corset Top">
                                <input type="hidden" name="productPrice" value="490">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-new">New-in</span>
                        <img src="${pageContext.request.contextPath}/images/top4.jfif" alt="Embroidered Boho Top">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Embroidered Boho Top</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9733; Like New</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 415</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="8">
                                <input type="hidden" name="productName" value="Embroidered Boho Top">
                                <input type="hidden" name="productPrice" value="415">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        
        <div class="category-block">
            <div class="category-label-wrap">
                <span class="category-tag">Outerwear</span>
                <div class="category-divider"></div>
            </div>
            <div class="product-area-header">
                <h2>Outerwear</h2>
                <div class="product-meta">
                    <span>Showing 1-4 of 4 &nbsp;&nbsp; Sort by: <strong>Newest First &#8964;</strong></span>
                </div>
            </div>
            <div class="product-grid">

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-vintage">Vintage</span>
                        <img src="${pageContext.request.contextPath}/images/coat1.jfif" alt="Camel Wool Trench Coat">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Camel Wool Trench Coat</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9734; Good</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 1,850</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="9">
                                <input type="hidden" name="productName" value="Camel Wool Trench Coat">
                                <input type="hidden" name="productPrice" value="1850">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-new">New-in</span>
                        <img src="${pageContext.request.contextPath}/images/coat2.jfif" alt="Denim Oversized Jacket">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Denim Oversized Jacket</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9733; Like New</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 990</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="10">
                                <input type="hidden" name="productName" value="Denim Oversized Jacket">
                                <input type="hidden" name="productPrice" value="990">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-vintage">Vintage</span>
                        <img src="${pageContext.request.contextPath}/images/coat3.jfif" alt="Corduroy Blazer">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Corduroy Blazer</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9734;&#9734; Fair</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 1,200</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="11">
                                <input type="hidden" name="productName" value="Corduroy Blazer">
                                <input type="hidden" name="productPrice" value="1200">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-vintage">Vintage</span>
                        <img src="${pageContext.request.contextPath}/images/coat4.jfif" alt="Knit Cardigan Coat">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Knit Cardigan Coat</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9734; Good</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 760</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="12">
                                <input type="hidden" name="productName" value="Knit Cardigan Coat">
                                <input type="hidden" name="productPrice" value="760">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        
        
        <div class="category-block">
            <div class="category-label-wrap">
                <span class="category-tag">Dresses</span>
                <div class="category-divider"></div>
            </div>
            <div class="product-area-header">
                <h2>Dresses</h2>
                <div class="product-meta">
                    <span>Showing 1-3 of 3 &nbsp;&nbsp; Sort by: <strong>Newest First &#8964;</strong></span>
                </div>
            </div>
            <div class="product-grid">

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-vintage">Vintage</span>
                        <img src="${pageContext.request.contextPath}/images/dress1.jfif" alt="Ditsy Floral Sundress">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Ditsy Floral Sundress</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9733; Like New</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 680</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="13">
                                <input type="hidden" name="productName" value="Ditsy Floral Sundress">
                                <input type="hidden" name="productPrice" value="680">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-new">New-in</span>
                        <img src="${pageContext.request.contextPath}/images/dress2.jfif" alt="Slip Satin Maxi Dress">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Slip Satin Maxi Dress</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9734; Good</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 890</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="14">
                                <input type="hidden" name="productName" value="Slip Satin Maxi Dress">
                                <input type="hidden" name="productPrice" value="890">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-vintage">Vintage</span>
                        <img src="${pageContext.request.contextPath}/images/dress3.jfif" alt="Smocked Prairie Dress">
                        <button class="wishlist-btn">&#9734;</button>
                    </div>
                    <div class="product-info">
                        <p class="product-name">Smocked Prairie Dress</p>
                        <p class="product-condition">&#9733;&#9733;&#9733;&#9733;&#9733; Like New</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs 750</span>
                            <form method="post" action="cart">
                                <input type="hidden" name="productId" value="15">
                                <input type="hidden" name="productName" value="Smocked Prairie Dress">
                                <input type="hidden" name="productPrice" value="750">
                                <button type="submit" class="btn-add-bag">&#128717; Add to Bag</button>
                            </form>
                        </div>
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
                <button class="page-btn">4</button>
                <button class="page-btn">5</button>
             
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
        <form method="post" action="${pageContext.request.contextPath}/NewsletterServlet">
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
            <a href="${pageContext.request.contextPath}/HomeServlet" class="site-link">thrift&amp;drift.com</a>
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
