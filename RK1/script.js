function script() {
  const result = document.getElementById('result');

  result.innerText = "Clicked!";
}

window.onload = function () {
  document.getElementById('start').onclick = script;
};
