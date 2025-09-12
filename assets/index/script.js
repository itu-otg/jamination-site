function updateCountdown() {
    const targetDate = new Date("October 17, " + new Date().getFullYear() + " 00:00:00").getTime();
    const now = new Date().getTime();
    let diff = targetDate - now;

    // If October 17 has passed this year, count until next year
    if (diff < 0) {
        const nextYear = new Date().getFullYear() + 1;
        diff = new Date("October 17, " + nextYear + " 00:00:00").getTime() - now;
    }

    const days = Math.floor(diff / (1000 * 60 * 60 * 24));
    const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((diff % (1000 * 60)) / 1000);

    document.querySelector(".countdown").textContent =
        `${days}d ${hours}h ${minutes}m ${seconds}s`;
}

// Run immediately and then update every second
updateCountdown();
setInterval(updateCountdown, 1000);