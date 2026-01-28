import gsap from 'gsap';
import ScrollTrigger from 'gsap/ScrollTrigger';

// Register ScrollTrigger
gsap.registerPlugin(ScrollTrigger);

// Custom Cursor
const cursorDot = document.querySelector('.cursor-dot');
const cursorOutline = document.querySelector('.cursor-outline');

if (window.matchMedia("(hover: hover)").matches) {
    window.addEventListener("mousemove", (e) => {
        const posX = e.clientX;
        const posY = e.clientY;

        // Dot follows instantly
        cursorDot.style.left = `${posX}px`;
        cursorDot.style.top = `${posY}px`;

        // Outline follows with slight delay (GSAP)
        gsap.to(cursorOutline, {
            x: posX,
            y: posY,
            duration: 0.15,
            ease: "power2.out",
            css: { left: 0, top: 0 } // Reset CSS positioning to rely on transform
        });
    });
}

// Register ScrollTrigger
gsap.registerPlugin(ScrollTrigger);

// Hero Animations
const heroSection = document.querySelector('.hero');
if (heroSection) {
    const tl = gsap.timeline();

    tl.to(".hero__overlay", {
        duration: 1.5,
        ease: "power2.inOut"
    })
        .to(".hero__img", {
            scale: 1,
            duration: 2,
            ease: "power2.out"
        }, "-=1.5")
        .to(".reveal-text", {
            y: "0%",
            duration: 1,
            stagger: 0.2,
            ease: "power4.out"
        }, "-=1")
        .to(".hero__subtitle", {
            opacity: 1,
            y: 0,
            duration: 1,
            ease: "power2.out"
        }, "-=0.5")
        .to(".hero__actions", {
            opacity: 1,
            y: 0,
            duration: 1,
            ease: "power2.out"
        }, "-=0.8");
}

// Active Link Highlight
const currentPath = window.location.pathname; // Astro paths are like /servicios or /
const navLinks = document.querySelectorAll('.nav__link');

navLinks.forEach(link => {
    const linkPath = link.getAttribute('href');
    // Normalize paths: remove trailing slash for comparison if needed, handle root
    // Simple check:
    if (linkPath === currentPath || (linkPath !== '/' && currentPath.startsWith(linkPath))) {
        link.classList.add('active');
    }
    // Specific fix for Home
    if (linkPath === '/' && currentPath === '/') {
        link.classList.add('active');
    }
});

// Navbar Scroll Effect
ScrollTrigger.create({
    start: 'top -80',
    end: 99999,
    toggleClass: { className: 'scrolled', targets: '.header' }
});

// Reveal Sections on Scroll
const sections = document.querySelectorAll('.section-padding');

sections.forEach(section => {
    gsap.fromTo(section.children,
        { y: 50, opacity: 0 },
        {
            y: 0,
            opacity: 1,
            duration: 1,
            stagger: 0.2,
            ease: "power3.out",
            scrollTrigger: {
                trigger: section,
                start: "top 80%",
            }
        }
    );
});

// Stats Counter Animation
const statsSection = document.querySelector('.stats');
if (statsSection) {
    ScrollTrigger.create({
        trigger: ".stats",
        start: "top 80%",
        once: true,
        onEnter: () => {
            document.querySelectorAll(".stat-number").forEach(stat => {
                const target = +stat.getAttribute("data-target");
                gsap.to(stat, {
                    innerHTML: target,
                    duration: 2,
                    snap: { innerHTML: 1 },
                    ease: "power2.out"
                });
            });
        }
    });
}

// Service Cards Hover Effect
const cards = document.querySelectorAll('.service-card');
cards.forEach(card => {
    card.addEventListener('mouseenter', () => {
        gsap.to(card, { y: -10, duration: 0.3, ease: "power2.out" });
    });
    card.addEventListener('mouseleave', () => {
        gsap.to(card, { y: 0, duration: 0.3, ease: "power2.out" });
    });
});

// Mobile Menu
const menuToggle = document.querySelector('.menu-toggle');
const nav = document.querySelector('.nav');
let isMenuOpen = false;

menuToggle.addEventListener('click', () => {
    isMenuOpen = !isMenuOpen;
    nav.classList.toggle('nav--active');

    if (isMenuOpen) {
        // Animate lines to X
        gsap.to(".menu-toggle__line:first-child", { rotate: 45, y: 6 });
        gsap.to(".menu-toggle__line:last-child", { rotate: -45, y: -6 });
        // Darken header or ensure it's visible against nav
        gsap.to(".header", { color: "white" });
    } else {
        // Animate lines back
        gsap.to(".menu-toggle__line:first-child", { rotate: 0, y: 0 });
        gsap.to(".menu-toggle__line:last-child", { rotate: 0, y: 0 });
        gsap.to(".header", { clearProps: "color" });
    }
});
