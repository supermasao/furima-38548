const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // Payjp.setPublicKey("pk_test_70bae3c573126b46e61af410"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
// ↑デフォルトではコントローラのクリエイトアクションが動くのを止めて これより下の処理を挟む↓↓。
// 購入機能画面と繋げるためには、idが重要。検証画面を開き左上の矢印ボタンで、それぞれを見ていく
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_destination[cardnumber]"),
      cvc: formData.get("order_destination[cardcvc]"),
      exp_month: formData.get("order_destination[cardmonth]"),
      exp_year: `20${formData.get("order_destination[cardyear]")}`,
    };
     // データの箱を表してる↑
     // ステータスが200ならトークンが正常に作成される
     // ↑ネーム属性を入力。今のところhoge.ビューファイルで見つけろ
Payjp.createToken(card, (status, response) => {
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
     // 上記の記述で、フォームに存在するクレジットカードの各情報を削除することができます。
    //  クレジットカード情報を消さないとトークンを作る意味がない

      document.getElementById("charge-form").submit();
      //フォーム情報をサーバーサイドへ送信している

    });
  });
};

window.addEventListener("load", pay);
// 画面の更新の度にpayというメソッどを呼び出してる.payは一番上に記載
