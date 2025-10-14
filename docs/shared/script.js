const headerApplicationElements = document.getElementsByClassName("remove-after-applications");
const applicationDeadline = "2025-10-13T00:00:00.000+03:00";

if (new Date() > new Date(applicationDeadline)) {
    while (headerApplicationElements.length > 0) {
        headerApplicationElements[0].remove();
    }
}
