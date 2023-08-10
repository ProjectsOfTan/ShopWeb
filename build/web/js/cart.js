/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function stepper(btn, p, idp, size) {
    let myInput = document.getElementById(idp);
    let id = btn.getAttribute("id");
    let min = myInput.getAttribute("min");
    let max = myInput.getAttribute("max");
    let step = myInput.getAttribute("step");
    let val = document.getElementById(idp).value;
    let calcStep = (id === "incre") ? (step * 1) : (step * -1);
    if (id === "incre" || id === "decre")
        val = parseInt(val) + calcStep;
    if (parseInt(val) >= parseInt(min) && parseInt(val) <= parseInt(max)) {
        document.getElementById(idp).value = val;
    }
    if (parseInt(val) < parseInt(min)) {
        document.getElementById(idp).value = min;
    }
    if (parseInt(val) > parseInt(max)) {
        document.getElementById(idp).value = max;
    }
    buy(btn, p, idp, size);
    price(idp);
}

function price(idp) {
    let priperitem_raw = document.getElementById('s' + idp).innerHTML;
    let priperitem = priperitem_raw.replaceAll(".", "");
    let pr = parseInt(priperitem) * parseInt(document.getElementById(idp).value);
    var fomat = pr.toLocaleString('en-US');
    let str = fomat.replaceAll(",", ".");
    document.getElementById('p' + idp).innerHTML = str;
}

function tp(to) {
    var fomat = to.toLocaleString('en-US');
    let str = fomat.replaceAll(",", ".");
    document.getElementById('to_tal').innerHTML = str;
}


function buy(btn, p, idp, si) {
    let txt = "";
    let myInput = document.getElementById(idp);
//    let min = myInput.getAttribute("min");
//    let max = myInput.getAttribute("max");
//    let ipb = btn.getAttribute("id");
//    let step = myInput.getAttribute("step");
//    let calcStep = (ipb === "incre") ? (step * 1) : (step * -1);
    if (Cookies.get('cart') !== null && Cookies.get('cart') !== undefined) {
        txt += Cookies.get('cart');
        Cookies.remove('cart');
    }
    var id = [];
    var sl = [];
    var size = [];
    let j = 0;
    let pro = txt.split(":");
    for (var i in pro) {
        let str = pro[i].split("-");
        id[j] = str[0];
        sl[j] = str[1];
        size[j] = str[2];
        j++;
    }
    for (var i = 0; i < id.length; i++) {
        if (parseInt(id[i]) === parseInt(p) && size[i] === si) {
            sl[i] = document.getElementById(idp).value;
        }
    }
    let total = 0;
    for (var i = 0; i < id.length; i++) {
        let priperitem_raw = document.getElementById('s' + id[i] + size[i]).innerHTML;
        let priperitem = priperitem_raw.replace(".", "");
        total += parseInt(priperitem) * parseInt(sl[i]);
    }
    let temp = '';
    for (var i = 0; i < id.length; i++) {
        if (temp === '') {
            temp += id[i] + '-' + sl[i] + '-' + size[i];
        } else {
            temp = temp + ':' + id[i] + '-' + sl[i] + '-' + size[i];
        }
    }
    tp(total);
    Cookies.set('cart', temp, {expires: 7, path: '/Tan_Shop'});
}



function del(idp, si) {
    let txt = "";
    if (Cookies.get('cart') !== undefined) {
        txt += Cookies.get('cart');
        Cookies.remove('cart');
    }
    let id = [];
    let sl = [];
    let size = [];
    let j = 0;
    if (txt.includes(":")) {
        let pro = txt.split(":");
        for (var i in pro) {
            let str = pro[i].split("-");
            id[j] = str[0];
            sl[j] = str[1];
            size[j] = str[2];
            j++;
        }
        let total = document.getElementById('to_tal').innerHTML;
        let pr = total.replaceAll(".", "");
        for (var i = 0; i < id.length; i++) {
            if (parseInt(id[i]) === parseInt(idp) && size[i] === si) {
                document.getElementById('pr_' + id[i] + '_' + size[i]).style.display = "none";
                let prperi_raw = document.getElementById('p' + id[i] + size[i]).innerHTML;
                let prperi = prperi_raw.replaceAll(".", "");
                total = parseInt(pr) - parseInt(prperi);
                id.splice(i, 1);
                sl.splice(i, 1);
                size.splice(i, 1);
            }
        }
        tp(total);
        let temp = '';
        for (var i = 0; i < id.length; i++) {
            if (temp === '') {
                temp += id[i] + '-' + sl[i] + '-' + size[i];
            } else {
                temp = temp + ':' + id[i] + '-' + sl[i] + '-' + size[i];
            }
        }
        Cookies.set('cart', temp, {expires: 7, path: '/Tan_Shop'});
    } else {
        let str = txt.split("-");
        id[j] = str[0];
        sl[j] = str[1];
        size[j] = str[2];
        document.getElementById('pr_' + id[j] + '_' + size[j]).style.display = "none";
        Cookies.set('cart', txt, {expires: 0, path: '/Tan_Shop'});
        document.querySelector('.container').style.display = "none";
        document.querySelector('.empty').style.display = "block";
    }
}