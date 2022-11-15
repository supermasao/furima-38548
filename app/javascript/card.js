// const pay = () => {
//   Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
//   Payjp.setPublicKey("pk_test_70bae3c573126b46e61af410"); // PAY.JPテスト公開鍵
//   const submit = document.getElementById("button");
//   submit.addEventListener("click", (e) => {
//     e.preventDefault();
// // ↑デフォルトではコントローラのクリエイトアクションが動くのを止めて これより下の処理を挟む↓↓。
//     const formResult = document.getElementById("charge-form");
//     const formData = new FormData(formResult);

//     const card = {
//       number: formData.get("order[number]"),
//       cvc: formData.get("order[cvc]"),
//       exp_month: formData.get("order[exp_month]"),
//       exp_year: `20${formData.get("order[exp_year]")}`,
//     };
//     // データの箱を表してる↑
// // ステータスが200ならトークンが正常に作成される
// Payjp.createToken(card, (status, response) => {
//   if (status == 200) {
//     const token = response.id;
//     const renderDom = document.getElementById("charge-form");
//     const tokenObj = `<input value=${token} name='token' type="hidden"> `;
//     renderDom.insertAdjacentHTML("beforeend", tokenObj);
//     debugger;
//       }

//       document.getElementById("order_number").removeAttribute("name");
//       document.getElementById("order_cvc").removeAttribute("name");
//       document.getElementById("order_exp_month").removeAttribute("name");
//       document.getElementById("order_exp_year").removeAttribute("name");
//      // 上記の記述で、フォームに存在するクレジットカードの各情報を削除することができます。
//     //  クレジットカード情報を消さないとトークンを作る意味がない

//       document.getElementById("charge-form").submit();
//       //フォーム情報をサーバーサイドへ送信している

//     });
//   });
// };

// window.addEventListener("load", pay);