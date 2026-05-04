<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us — Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css">
</head>
<body>

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
        <a href="#" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="User"></a>
        <a href="#" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<!-- ═══════════════════════════════════════════════════════════════════════════
     HERO
════════════════════════════════════════════════════════════════════════════ -->
<section class="hero">
    <div class="hero-text">
        <p class="eyebrow">Our Story</p>
        <h1 class="hero-title">Not Just<br>A Store.<br><span class="accent">A Movement.</span></h1>
        <p class="hero-body">
            We started Thrift&amp;Drift with a simple belief — fashion shouldn't cost the earth.
            Every piece we carry has a past life and deserves a second chapter. We're the bridge
            between stories worn and stories yet to begin.
        </p>
    </div>
    <div class="hero-image-area">
        <div class="hero-img-box">
            <svg class="hero-img-svg" viewBox="0 0 200 220" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect x="40" y="60" width="120" height="140" rx="4" fill="#3a2a1a" opacity="0.5"/>
                <rect x="60" y="40" width="80" height="22" rx="3" fill="#b91c1c" opacity="0.7"/>
                <line x1="100" y1="40" x2="100" y2="18" stroke="#b91c1c" stroke-width="2"/>
                <circle cx="100" cy="13" r="7" fill="#b91c1c" opacity="0.6"/>
                <rect x="58" y="78" width="84" height="106" rx="2" fill="#5a3a20" opacity="0.35"/>
                <line x1="58" y1="110" x2="142" y2="110" stroke="#b91c1c" stroke-width="0.8" opacity="0.4"/>
                <line x1="58" y1="130" x2="142" y2="130" stroke="#b91c1c" stroke-width="0.8" opacity="0.4"/>
                <text x="100" y="165" text-anchor="middle" font-family="Arial" font-size="9"
                      fill="#c4a070" letter-spacing="2">CIRCA 2019</text>
            </svg>
            <p class="hero-img-caption">The first 40 pieces</p>
        </div>
    </div>
</section>

<div class="stats-bar">
    <div class="stat-item">
        <span class="stat-num">12K+</span>
        <span class="stat-label">Items Rehomed</span>
    </div>
    <div class="stat-item">
        <span class="stat-num">4,800</span>
        <span class="stat-label">Happy Drifters</span>
    </div>
    <div class="stat-item">
        <span class="stat-num">97%</span>
        <span class="stat-label">Verified Pre-Loved</span>
    </div>
    <div class="stat-item">
        <span class="stat-num">38T</span>
        <span class="stat-label">Litres Water Saved</span>
    </div>
</div>

<section class="section section-white">
    <div class="two-col">
        <div class="story-text">
            <p class="eyebrow">How it began</p>
            <h2 class="section-title">Born from a cluttered<br>wardrobe &amp; a clear<br>conscience.</h2>
            <p class="section-body">
                In 2019, founder Adwaita Joshi found herself standing in front of a wardrobe stuffed
                with clothes she never wore. Each piece representing a trend chased, an impulse
                bought, a guilt accumulated. She took everything to a flea market, sold out in four
                hours, and had an idea.
            </p>
            <p class="section-body" style="margin-top:18px;">
                What if there was a curated, trustworthy space, not a chaotic flea market, not an
                algorithm-driven app where beautiful pre-loved pieces could find new owners who'd
                actually treasure them?
            </p>
            <p class="section-body" style="margin-top:18px;">
                Thrift&amp;Drift launched from a spare bedroom in 2020. Today, we operate a
                full-service sustainable fashion platform with a team of authenticators, stylists,
                and drifters who share one obsession: giving great clothes a great second life.
            </p>
        </div>
        <div class="story-image">
            <div class="img-block img-warm">
                <svg viewBox="0 0 240 320" fill="none" xmlns="http://www.w3.org/2000/svg" class="story-svg">
                    <rect x="30" y="40" width="180" height="250" rx="6" fill="#c4a882" opacity="0.25"/>
                    <rect x="50" y="20" width="140" height="30" rx="4" fill="#b91c1c" opacity="0.55"/>
                    <line x1="120" y1="20" x2="120" y2="0" stroke="#b91c1c" stroke-width="2.5"/>
                    <circle cx="120" cy="0" r="9" fill="#b91c1c" opacity="0.5" transform="translate(0,8)"/>
                    <rect x="55" y="72" width="130" height="200" rx="3" fill="#a88060" opacity="0.2"/>
                    <line x1="55" y1="120" x2="185" y2="120" stroke="#c4a070" stroke-width="0.8" opacity="0.5"/>
                    <line x1="55" y1="155" x2="185" y2="155" stroke="#c4a070" stroke-width="0.8" opacity="0.5"/>
                    <line x1="55" y1="190" x2="185" y2="190" stroke="#c4a070" stroke-width="0.8" opacity="0.5"/>
                    <line x1="55" y1="225" x2="185" y2="225" stroke="#c4a070" stroke-width="0.8" opacity="0.5"/>
                    <text x="120" y="262" text-anchor="middle" font-family="Arial" font-size="10"
                          fill="#8a6840" letter-spacing="3">THE FIRST 40 PIECES</text>
                </svg>
            </div>
        </div>
    </div>
</section>

<!-- ═══════════════════════════════════════════════════════════════════════════
     FOUNDER QUOTE
════════════════════════════════════════════════════════════════════════════ -->
<section class="quote-section">
    <div class="quote-mark">&ldquo;</div>
    <blockquote class="quote-text">Fashion is the second most polluting industry on the planet. We're not here to add to that. We're here to be the antidote.</blockquote>
    <p class="quote-author">— Adwaita Joshi, Founder &amp; Creative Director</p>
</section>

<!-- ═══════════════════════════════════════════════════════════════════════════
     VALUES
════════════════════════════════════════════════════════════════════════════ -->
<section class="section section-cream">
    <div class="section-header-center">
        <p class="eyebrow">What we stand for</p>
        <h2 class="section-title">Three pillars.<br>One purpose.</h2>
    </div>
    <div class="values-grid">
        <!-- Sustainability First -->
        <div class="value-card">
            <div class="value-icon" id="icon-sustainability">
                <svg viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="20" cy="20" r="17" stroke="#b91c1c" stroke-width="1.6"/>
                    <path d="M13 20 C13 13 27 13 27 20 C27 27 13 27 13 20Z" stroke="#b91c1c" stroke-width="1.4" fill="none"/>
                    <line x1="20" y1="9" x2="20" y2="31" stroke="#b91c1c" stroke-width="1"/>
                    <line x1="9" y1="20" x2="31" y2="20" stroke="#b91c1c" stroke-width="1"/>
                </svg>
            </div>
            <h3 class="value-title">Sustainability First</h3>
            <p class="value-body">Every decision we make is filtered through one question: is this good for the planet? From our packaging to our logistics, we choose the lower-impact path — always.</p>
        </div>
        <!-- Radical Authenticity -->
        <div class="value-card">
            <div class="value-icon" id="icon-authenticity">
                <svg viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20 4 L24 15 L37 15 L27 22 L31 34 L20 27 L9 34 L13 22 L3 15 L16 15Z"
                          stroke="#b91c1c" stroke-width="1.6" fill="none"/>
                </svg>
            </div>
            <h3 class="value-title">Radical Authenticity</h3>
            <p class="value-body">No fakes. No exaggerated conditions. No hidden flaws. Every item is hand-assessed by our team and described with blunt honesty. You know exactly what you're getting.</p>
        </div>
        <!-- Community Over Commerce -->
        <div class="value-card">
            <div class="value-icon" id="icon-community">
                <svg viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="15" cy="13" r="6" stroke="#b91c1c" stroke-width="1.5" fill="none"/>
                    <circle cx="27" cy="13" r="6" stroke="#b91c1c" stroke-width="1.5" fill="none"/>
                    <path d="M7 34 C7 26 23 26 23 34" stroke="#b91c1c" stroke-width="1.5" fill="none"/>
                    <path d="M23 34 C23 26 37 26 37 34" stroke="#b91c1c" stroke-width="1.5" fill="none"/>
                </svg>
            </div>
            <h3 class="value-title">Community Over Commerce</h3>
            <p class="value-body">We're building a community of conscious drifters — people who believe style is personal, not disposable. Our sellers are not vendors. They're storytellers passing on pieces they loved.</p>
        </div>
    </div>
</section>

<!-- ═══════════════════════════════════════════════════════════════════════════
     TIMELINE
════════════════════════════════════════════════════════════════════════════ -->
<section class="section section-dark">
    <p class="eyebrow eyebrow-red">Our journey</p>
    <h2 class="section-title section-title-light">Five years of drifting<br>in the right direction.</h2>

    <div class="timeline-grid">
        <div class="timeline">
            <div class="tl-item">
                <span class="tl-dot"></span>
                <p class="tl-year">2019</p>
                <h3 class="tl-title">The Flea Market Epiphany</h3>
                <p class="tl-text">Aria sells 40 pieces of her wardrobe at a local flea market and makes Rs.&nbsp;18,000 in a single afternoon. The idea for Thrift&amp;Drift is born on the drive home.</p>
            </div>
            <div class="tl-item">
                <span class="tl-dot"></span>
                <p class="tl-year">2020</p>
                <h3 class="tl-title">Doors Open (Digitally)</h3>
                <p class="tl-text">Website goes live with 120 curated listings. First 100 orders fulfilled from a spare bedroom in South Delhi. Waitlist hits 500 people in week two.</p>
            </div>
            <div class="tl-item">
                <span class="tl-dot"></span>
                <p class="tl-year">2021</p>
                <h3 class="tl-title">The Designer Vault Launches</h3>
                <p class="tl-text">We introduce an authenticated designer segment — pre-loved Zara, Mango, H&amp;M Premium, and international labels — with our signature condition grading system.</p>
            </div>
        </div>
        <div class="timeline timeline-offset">
            <div class="tl-item">
                <span class="tl-dot"></span>
                <p class="tl-year">2022</p>
                <h3 class="tl-title">Community Drops Begin</h3>
                <p class="tl-text">We launch monthly "Drifter Drops" — curated batches from community sellers. Over 400 individual sellers join in the first year.</p>
            </div>
            <div class="tl-item">
                <span class="tl-dot"></span>
                <p class="tl-year">2023</p>
                <h3 class="tl-title">10,000 Items Rehomed</h3>
                <p class="tl-text">We cross a major milestone and publish our first sustainability impact report. Every item rehomed = an average of 3,200 litres of water saved versus buying new.</p>
            </div>
            <div class="tl-item">
                <span class="tl-dot"></span>
                <p class="tl-year">2024–25</p>
                <h3 class="tl-title">Growing the Drift</h3>
                <p class="tl-text">Expanded to pan-India shipping, launched same-city express, and introduced the Thrift&amp;Drift Repair Collective — partnering with local tailors to breathe new life into damaged pieces.</p>
            </div>
        </div>
    </div>
</section>

<!-- ═══════════════════════════════════════════════════════════════════════════
     ENVIRONMENTAL IMPACT
════════════════════════════════════════════════════════════════════════════ -->
<section class="section section-white">
    <div class="section-header-center">
        <p class="eyebrow">Our environmental impact</p>
        <h2 class="section-title">Every purchase is<br>a vote for the planet.</h2>
    </div>
    <div class="impact-grid">
        <div class="impact-card">
            <p class="impact-num">38M+</p>
            <p class="impact-desc">Litres of water saved vs. buying new garments</p>
        </div>
        <div class="impact-card">
            <p class="impact-num">12K</p>
            <p class="impact-desc">Items diverted from landfill</p>
        </div>
        <div class="impact-card">
            <p class="impact-num">96T</p>
            <p class="impact-desc">Kg of CO&#8322; emissions avoided collectively</p>
        </div>
        <div class="impact-card">
            <p class="impact-num">Zero</p>
            <p class="impact-desc">Plastic in our packaging. 100% recycled materials only.</p>
        </div>
    </div>
</section>

<!-- ═══════════════════════════════════════════════════════════════════════════
     TEAM
════════════════════════════════════════════════════════════════════════════ -->
<section class="section section-cream">
    <p class="eyebrow">The people behind the pieces</p>
    <h2 class="section-title">Meet the drifters<br>who run the drift.</h2>
    <div class="team-grid">
        <div class="team-card">
            <div class="team-avatar avatar-warm">
                <svg viewBox="0 0 100 120" fill="none" xmlns="http://www.w3.org/2000/svg" class="avatar-svg">
                    <circle cx="50" cy="38" r="26" class="avatar-head"/>
                    <path d="M10 120 C10 82 90 82 90 120" class="avatar-body"/>
                </svg>
            </div>
            <h3 class="team-name">Adwaita Joshi</h3>
            <p class="team-role">Founder &amp; Creative Director</p>
            <p class="team-bio">Former fashion journalist turned circular economy advocate. Believes every jacket has at least two great eras.</p>
        </div>
        <div class="team-card">
            <div class="team-avatar avatar-cool">
                <svg viewBox="0 0 100 120" fill="none" xmlns="http://www.w3.org/2000/svg" class="avatar-svg">
                    <circle cx="50" cy="38" r="26" class="avatar-head"/>
                    <path d="M10 120 C10 82 90 82 90 120" class="avatar-body"/>
                </svg>
            </div>
            <h3 class="team-name">Sleshma Maharjan</h3>
            <p class="team-role">Head of Authentication</p>
            <p class="team-bio">Trained in textile science. Has assessed over 8,000 garments and can spot a fake label in under 30 seconds.</p>
        </div>
        <div class="team-card">
            <div class="team-avatar avatar-green">
                <svg viewBox="0 0 100 120" fill="none" xmlns="http://www.w3.org/2000/svg" class="avatar-svg">
                    <circle cx="50" cy="38" r="26" class="avatar-head"/>
                    <path d="M10 120 C10 82 90 82 90 120" class="avatar-body"/>
                </svg>
            </div>
            <h3 class="team-name">Aarshi Shah</h3>
            <p class="team-role">Community &amp; Styling Lead</p>
            <p class="team-bio">The person behind every perfectly styled flat-lay. Manages our community of 400+ sellers with warmth and rigor.</p>
        </div>
        <div class="team-card">
            <div class="team-avatar avatar-red">
                <svg viewBox="0 0 100 120" fill="none" xmlns="http://www.w3.org/2000/svg" class="avatar-svg">
                    <circle cx="50" cy="38" r="26" class="avatar-head"/>
                    <path d="M10 120 C10 82 90 82 90 120" class="avatar-body"/>
                </svg>
            </div>
            <h3 class="team-name">Aashika Shrestha</h3>
            <p class="team-role">Community &amp; Styling Lead</p>
            <p class="team-bio">Brings a keen eye for emerging trends and a deep love for slow fashion. Keeps our community vibrant and inspired.</p>
        </div>
        <div class="team-card">
            <div class="team-avatar avatar-warm">
                <svg viewBox="0 0 100 120" fill="none" xmlns="http://www.w3.org/2000/svg" class="avatar-svg">
                    <circle cx="50" cy="38" r="26" class="avatar-head"/>
                    <path d="M10 120 C10 82 90 82 90 120" class="avatar-body"/>
                </svg>
            </div>
            <h3 class="team-name">Shreejan Shrestha</h3>
            <p class="team-role">Sustainability &amp; Ops</p>
            <p class="team-bio">Measures everything: emissions, packaging waste, water offsets. If it's not tracked, it can't be improved.</p>
        </div>
    </div>
</section>

<!-- ═══════════════════════════════════════════════════════════════════════════
     CALL TO ACTION
════════════════════════════════════════════════════════════════════════════ -->
<section class="cta-section">
    <div class="cta-text">
        <p class="eyebrow">Join the movement</p>
        <h2 class="section-title">Ready to start<br>your drift?</h2>
    </div>
    <div class="cta-btns">
        <a href="shop.html?filter=new" class="btn-dark">Shop New Arrivals</a>
        <a href="sell.html"            class="btn-outline">Sell With Us</a>
    </div>
</section>

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
    </div>

    <div class="footer-brand-name">THRIFT&amp;DRIFT</div>
    <div class="footer-copy">&copy; 2024 Thrift&amp;Drift. All rights reserved.</div>
</footer>

</body>
</html>
