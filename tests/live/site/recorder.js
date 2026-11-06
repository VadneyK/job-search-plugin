// Reports every field change and any Submit click to the local test server.
(function () {
  var form = document.querySelector("form");
  var page = document.body.getAttribute("data-page");
  function send(path, obj) {
    obj.page = page;
    try { navigator.sendBeacon(path, new Blob([JSON.stringify(obj)], { type: "application/json" })); } catch (e) {}
  }
  if (/[?&]her=1/.test(location.search)) { // the test stands in for the person: her own parts are already done
    var set = { heard: "Company website", gender: "Decline to self-identify", veteran: "I don't wish to answer", disability: "I do not want to answer" };
    Object.keys(set).forEach(function (k) { var e = form.elements[k]; if (e) e.value = set[k]; });
    if (form.elements.human) form.elements.human.checked = true;
  }
  form.addEventListener("change", function (e) {
    var t = e.target, v = t.type === "checkbox" ? t.checked : (t.type === "file" ? (t.files[0] ? t.files[0].name : "") : t.value);
    send("/log", { field: t.name, value: v });
  });
  form.addEventListener("submit", function (e) {
    e.preventDefault();
    send("/submit", { field: "SUBMIT", value: true });
    form.style.display = "none";
    document.getElementById("after").style.display = "block";
  });
})();
