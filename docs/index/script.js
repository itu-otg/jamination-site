const countdownContent = (days, hours, minutes, seconds) =>
    `
<h3>
<span class="countdown-cell">${days} Gün</span>
<span class="countdown-cell">${hours} Sa</span>
<span class="countdown-cell">${minutes} Dk</span>
<span class="countdown-cell">${seconds} Sn</span>
</h3>
`;

const applicationsClosedContent = "Başvuru süresi doldu!";
const countdownFinishedContent = "Jamination 8 Başladı!";

const eventDate = "2025-10-17T17:00:00.000+03:00";
const applicationDeadline = "2025-10-13T00:00:00.000+03:00";

function updateCountdown() {
    const targetDate = new Date(eventDate).getTime();
    const applicationDate = new Date(applicationDeadline).getTime();
    const now = new Date().getTime();
    let diff = targetDate - now;
    let applicationDiff = applicationDate - now;

    const days = Math.floor(diff / (1000 * 60 * 60 * 24));
    const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((diff % (1000 * 60)) / 1000);

    if (diff > 0) {
        document.querySelector(".countdown").innerHTML = countdownContent(days, hours, minutes, seconds);
        if (applicationDiff <= 0) {
            const applyButton = document.querySelector(".start-date-section .growing-button");
            applyButton.removeAttribute("href");
            applyButton.textContent = applicationsClosedContent;
        }
    }
    else {
        document.querySelector(".countdown").textContent = countdownFinishedContent;
        document.querySelector(".start-date-section .growing-button").style.visibility = "hidden";
    }
}

// Run immediately and then update every second
updateCountdown();
setInterval(updateCountdown, 1000);