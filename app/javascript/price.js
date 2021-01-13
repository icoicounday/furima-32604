const pay = () => {
  Payjp.setPublicKey("pk_test_958b5eb6f25617a39bde50d0"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[card_number]"),
      cvc: formData.get("order_address[card_cvc]"),
      exp_month: formData.get("order_address[card_exp_month]"),
      exp_year: `20${formData.get("order_address[card_exp_year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      console.log("OK")
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

// window.addEventListener('load', () => {

//   const priceInput = document.getElementById("item-price");
//   // priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;

//     const addTaxDom = document.getElementById("add-tax-price")
//     addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    
//     const profitNumber = document.getElementById("profit")
//     const value_result = inputValue * 0.9
//     profitNumber.innerHTML = (Math.floor(value_result));
//   });
// });

window.addEventListener("load", pay);