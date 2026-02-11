<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trending Services</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Page CSS -->
<link rel="stylesheet" href="CSS/TrendingSample.css">
</head>

<body>

<!-- ================= HEADER ================= -->+
<div class="header">
    <div class="logo">Beauty Hub</div>
    <div class="nav">
        <a href="UserDashboard.jsp">Home</a>
        <a href="#">My Salons</a>
        <a href="#">Chat with Expert</a>
        <a href="#" class="active">Trending Style</a>
        <a href="#">Notifications</a>
        <a href="userProfile.jsp">Profile</a>
    </div>
</div>

<div class="container  main-container">

<!-- 🔥 TRENDING STYLES SLIDER -->
<h2 class="section-title text-center my-4">👑 Elite Beauty & Grooming</h2>
<div id="trendingCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000">
    <div class="carousel-inner">

		<!-- -Slide 1 -->
        <div class="carousel-item active">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">HOT</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Hair Fade.jpg">
                        </div>
                        <div class="card-body">
                            <h5>Modern Hair Fade</h5>
                            <p>Sharp & bold styling.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">TRENDING</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Bridal Glow.jpeg">
                        </div>
                        <div class="card-body">
                            <h5>Bridal Glow Makeup</h5>
                            <p>Celebrity inspired looks.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Luxury Spa.jpg">
                        </div>
                        <div class="card-body">
                            <h5>Luxury Spa Styling</h5>
                            <p>Relaxing premium feel.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<!-- -Slide 2 -->
		
        <div class="carousel-item">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">NEW</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Natural Makeup.jpg">
                        </div>
                        <div class="card-body">
                            <h5>Natural Makeup Look</h5>
                            <p>Minimal & elegant.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Textured Hair.jpeg">
                        </div>
                        <div class="card-body">
                            <h5>Textured Hair Waves</h5>
                            <p>Soft curls & volume.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">POPULAR</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Luxury Beard.jpeg">
                        </div>
                        <div class="card-body">
                            <h5>Luxury Beard Styling</h5>
                            <p>Sharp modern grooming.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- 💖 Refined Hair & Radiance-->
<h2 class="section-title text-center my-4">💖 Refined Hair & Radiance</h2>
<div id="hairRadianceCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000">
    <div class="carousel-inner">

		<!-- -Slide 1 -->
		
        <div class="carousel-item active">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="service-card">
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Hair Coloring.jpeg">
                        </div>
                        <div class="card-body">
                            <h5>Hair Coloring</h5>
                            <p>Balayage, highlights & fashion shades.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">HOT</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Keratin Treatment.jpeg">
                        </div>
                        <div class="card-body">
                            <h5>Keratin Treatment</h5>
                            <p>Smooth, shiny & frizz-free hair.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">TRENDING</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Facial Therapy.jpeg">
                        </div>
                        <div class="card-body">
                            <h5>Facial Therapy</h5>
                            <p>Advanced skin rejuvenation.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- -Slide 2 -->
        
<div class="carousel-item">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="service-card">
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Hair Spa.jpeg">
                </div>
                <div class="card-body">
                    <h5>Hair Spa</h5>
                    <p>Deep nourishment & scalp care.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card">
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Scalp Treatment.jpeg">
                </div>
                <div class="card-body">
                    <h5>Scalp Treatment</h5>
                    <p>Deep cleansing & nourishing.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card">
                <span class="badge-top">NEW</span>
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Hair Styling.jpeg">
                </div>
                <div class="card-body">
                    <h5>Hair Styling</h5>
                    <p>Curls, braids, or trendy styles.</p>
                </div>
            </div>
        </div>
    </div>
</div>



    </div>
</div>


<!--🔥 Viral Beauty Trends -->
<h2 class="section-title text-center my-4">🔥 Viral Beauty Trends</h2>
<div id="viralTrendsCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000">
    <div class="carousel-inner">
    
    		<!-- -Slide 1 -->

        <div class="carousel-item active">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="service-card">
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/French Ombre Nails.png">
                        </div>
                        <div class="card-body">
                            <h5>French Ombre Nails</h5>
                            <p>Elegant gradient nail design.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">HOT</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Eyelash Extensions.jpg">
                        </div>
                        <div class="card-body">
                            <h5>Eyelash Extensions</h5>
                            <p>Long & voluminous lashes.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">TRENDING</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Eyebrow Lamination.jpg">
                        </div>
                        <div class="card-body">
                            <h5>Eyebrow Lamination</h5>
                            <p>Perfect lifted brows.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<!-- -Slide 2 -->

<div class="carousel-item">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="service-card">
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Gradient Lip Tint Style.png">
                </div>
                <div class="card-body">
                    <h5>Gradient Lip Tint Style</h5>
                    <p>Signature K-beauty lip trend.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card">
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Russian Manicure.png">
                </div>
                <div class="card-body">
                    <h5>Russian Manicure</h5>
                    <p>Precision cuticle detailing & flawless finish.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card">
                <span class="badge-top">NEW</span>
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Crystal Spa Pedicure.jpg">
                </div>
                <div class="card-body">
                    <h5>Crystal Spa Pedicure</h5>
                    <p>Exfoliation & radiant glow finish.</p>
                </div>
            </div>
        </div>
    </div>
</div>

    </div>
</div>


<!-- 🌸 Glow Up & Wind Down -->
<h2 class="section-title text-center my-4">🌸 Glow Up & Wind Down</h2>
<div id="glowCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000">
    <div class="carousel-inner">

		<!-- -Slide 1 -->

        <div class="carousel-item active">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="service-card">
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/LED Light Therapy Facial.png">
                        </div>
                        <div class="card-body">
                            <h5>LED Light Therapy Facial</h5>
                            <p>Skin rejuvenation with light technology.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">POPULAR</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Collagen Boost Treatment.jpg">
                        </div>
                        <div class="card-body">
                            <h5>Collagen Boost Treatment</h5>
                            <p>Firm & youthful skin enhancement.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">TRENDING</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Vampire Facial.png">
                        </div>
                        <div class="card-body">
                            <h5>Vampire Facial (PRP Therapy)</h5>
                            <p>Advanced collagen stimulation treatment.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- -Slide 2 -->

<div class="carousel-item">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="service-card">
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Hot Stone Massage.jpg">
                </div>
                <div class="card-body">
                    <h5>Hot Stone Massage</h5>
                    <p>Deep muscle relaxation therapy.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card">
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Thai Massage Therapy.jpg">
                </div>
                <div class="card-body">
                    <h5>Thai Massage Therapy</h5>
                    <p>Stretching & energy balancing.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card">
                <span class="badge-top">NEW</span>
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Aromatherapy Massage.png">
                </div>
                <div class="card-body">
                    <h5>Aromatherapy Massage</h5>
                    <p>Essential oils relaxation.</p>
                </div>
            </div>
        </div>
    </div>
</div>

    </div>
</div>


<!-- 🧠 THERAPIST SERVICES -->
<h2 class="section-title mt-5">🌿 Your Safe Space to Heal</h2>
<div id="therapistCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000">
    <div class="carousel-inner">
    
    		<!-- -Slide 1 -->

        <div class="carousel-item active">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="service-card">
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Mental Wellness.jpg">
                        </div>
                        <div class="card-body">
                            <h5>Mental Wellness Therapy</h5>
                            <p>Professional emotional support.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">POPULAR</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Anxiety Management.jpg">
                        </div>
                        <div class="card-body">
                            <h5>Anxiety Management</h5>
                            <p>Reduce stress & anxiety.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <span class="badge-top">TRENDING</span>
                        <div class="img-box">
                            <img src="<%=request.getContextPath()%>/StyleImages/Sleep Therapy.jpg">
                        </div>
                        <div class="card-body">
                            <h5>Sleep Therapy</h5>
                            <p>Improve sleep quality.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
       <!-- -Slide 2 -->
        
        <div class="carousel-item">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="service-card">
            <span class="badge-top">POPULAR</span>
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Mindfulness Therapy.jpg">
                </div>
                <div class="card-body">
                    <h5>Mindfulness Therapy</h5>
                    <p>Guided relaxation.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card">
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Stress Relief.jpg">
                </div>
                <div class="card-body">
                    <h5>Stress Relief Therapy</h5>
                    <p>Reduce tension & anxiety.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="service-card">
                <div class="img-box">
                    <img src="<%=request.getContextPath()%>/StyleImages/Meditation.jpg">
                </div>
                <div class="card-body">
                    <h5>Meditation Session</h5>
                    <p>Improve focus & clarity.</p>
                </div>
            </div>
        </div>
    </div>
</div>
        

    </div>
</div>
</div>

<!-- ================= FOOTER ================= -->
<footer class="footer">
    <div class="container-fluid text-center">
         <p class="footer-text">© 2026 Salon Management System. All Rights Reserved.</p>
    <p class="footer-subtext">Crafted with ❤️ for Beauty & Wellness Professionals</p>
    </div>
</footer>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {

    const carousels = document.querySelectorAll('.carousel');

    carousels.forEach(carouselEl => {

        const carousel = new bootstrap.Carousel(carouselEl, {
            interval: 3000,
            ride: false,
            pause: false,
            wrap: true
        });

        const observer = new IntersectionObserver(entries => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    carousel.cycle();   // Start sliding when visible
                } else {
                    carousel.pause();   // Pause when not visible
                }
            });
        }, {
            threshold: 0.6   // 60% visible before starting
        });

        observer.observe(carouselEl);
    });

});
</script>

</body>
</html>