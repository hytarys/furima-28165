function calc(){
  const itemPrice = document.getElementById("price")
  const benefit = document.getElementById("profit")
  itemPrice.addEventListener("input", () => {
     realPrice = itemPrice.value
     benefit.innerHTML = `${realPrice * 0.9}`
  });
}
window.addEventListener("load", calc)