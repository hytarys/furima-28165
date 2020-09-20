function calcCommission(){
  const itemPrice = document.getElementById("price")
  const commission = document.getElementById("add-tax-price")
  itemPrice.addEventListener("input", () => {
    realPrice = itemPrice.value
    commission.innerHTML = `${realPrice * 0.1}`
  });
}
window.addEventListener("load", calcCommission)