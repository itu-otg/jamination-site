const applyButton = document.querySelector(".nav-buttons .growing-button");
const applicationDeadline = "2025-10-13T00:00:00.000+03:00";

if (new Date() > new Date(applicationDeadline)) {
    applyButton.removeAttribute("href");
    applyButton.textContent = "Başvuru süresi doldu!";
}