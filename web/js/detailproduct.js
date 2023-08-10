/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
var temp;
function choseSize(size, i, n) {
    var show_size = document.querySelector('.show_size');
    var size_div = document.querySelectorAll('.size');
    show_size.innerHTML = "";
    show_size.innerHTML = size;
    console.log(show_size.innerHTML);
    temp = i;
    for (var j = 0; j < n; j++) {
        size_div[j].style.background = "#e8e8e8";
        size_div[j].style.color = "black";
    }
    size_div[i].style.background = "#EF036C";
    size_div[i].style.color = "white";
}

function setColor(i) {
    if (temp !== i) {
        var size_div = document.querySelectorAll('.size');
        size_div[i].style.background = "#ffc0cb";
        size_div[i].style.color = "#EF036C";
    }
}

function remove(i) {
    if (temp !== i) {
        var size_div = document.querySelectorAll('.size');
        size_div[i].style.background = "#e8e8e8";
        size_div[i].style.color = "black";
    }
}

function stepper(btn) {
    let myInput = document.getElementById('my_input');
    let id = btn.getAttribute("id");
    let min = myInput.getAttribute("min");
    let max = myInput.getAttribute("max");
    let step = myInput.getAttribute("step");
    let val = document.getElementById('my_input').value;
    let calcStep = (id === "incre") ? (step * 1) : (step * -1);
    if (id === "incre" || id === "decre")
        val = parseInt(val) + calcStep;
    if (parseInt(val) >= parseInt(min) && parseInt(val) <= parseInt(max)) {
        document.getElementById('my_input').value = val;
    }
    if (parseInt(val) > parseInt(max)) {
        document.getElementById('my_input').value = max;
    }
    if (parseInt(val) < parseInt(min)) {
        document.getElementById('my_input').value = min;
    }
}

function exec(idp) {
    if (check()) {
        document.querySelector(".notice").innerHTML = "";
        let myInput = document.getElementById('my_input');
        let max = myInput.getAttribute("max");
        buy(idp);
        if (max > 0) {
            if (document.querySelector(".si_co").innerHTML !== 0) {
                document.querySelector(".si_co").innerHTML =
                        parseInt(document.querySelector(".si_co").innerHTML) +
                        parseInt(document.getElementById('my_input').value);
                document.querySelector('.si_co').style.display = "block";
            } else {
                document.querySelector(".si_co").innerHTML =
                        parseInt(document.getElementById('my_input').value);
                if (parseInt(document.querySelector('.si_co').innerHTML) === 0) {
                    document.querySelector('.si_co').style.display = "none";
                } else {
                    document.querySelector('.si_co').style.display = "block";
                }
            }
        }
    } else {
        document.querySelector(".notice").innerHTML = "Vui lòng chọn kích thước";
    }
}

function check() {
    console.log(document.querySelector('.show_size').value === undefined);
    if (document.querySelector('.show_size').innerHTML === "") {
        return false;
    }
    return true;
}

function buy(idp) {
    let myInput = document.getElementById('my_input');
    let max = myInput.getAttribute("max");
    let min = myInput.getAttribute("min");
    let txt = "";
    let temp = '';
    if (parseInt(max) > 0) {
        document.querySelector(".notice").innerHTML = "";
        if (Cookies.get('cart') !== undefined) {
            txt += Cookies.get('cart');
            Cookies.remove('cart');
        }
        let id = [];
        let sl = [];
        let size = [];
        let j = 0;
        if (txt !== '') {
            if (txt.includes(":")) {
                let pro = txt.split(":");
                for (var i in pro) {
                    let str = pro[i].split("-");
                    id[j] = str[0];
                    sl[j] = str[1];
                    size[j] = str[2];
                    j++;
                }
            } else {
                let str = txt.split("-");
                id[j] = str[0];
                sl[j] = str[1];
                size[j] = str[2];
            }
            let check = true;
            for (var i = 0; i < id.length; i++) {
                if (parseInt(id[i]) === parseInt(idp) && size[i] === document.querySelector('.show_size').innerHTML) {
                    sl[i] = parseInt(sl[i]) + parseInt(document.getElementById('my_input').value);
                    myInput.setAttribute("max", parseInt(max) - parseInt(document.getElementById('my_input').value));
                    if (parseInt(max) - parseInt(document.getElementById('my_input').value) === 0) {
                        myInput.setAttribute("min", 0);
                    }
                    size[i] = document.querySelector('.show_size').innerHTML;
                    check = false;
                }
            }
            if (check) {
                txt = txt + ":" + idp + '-' + document.getElementById('my_input').value + '-'
                        + document.querySelector('.show_size').innerHTML;
                myInput.setAttribute("max", parseInt(max) - parseInt(document.getElementById('my_input').value));
                if (parseInt(max) - parseInt(document.getElementById('my_input').value) === 0) {
                    myInput.setAttribute("min", 0);
                }
                Cookies.set('cart', txt, {expires: 7, path: '/Tan_Shop'});
                return;
            }
            for (var i = 0; i < id.length; i++) {
                if (temp === '') {
                    temp += id[i] + '-' + sl[i] + '-' + size[i];
                } else {
                    temp = temp + ':' + id[i] + '-' + sl[i] + '-' + size[i];
                }
            }
        } else {
            temp = txt + idp + '-' + document.getElementById('my_input').value + '-'
                    + document.querySelector('.show_size').innerHTML;
            myInput.setAttribute("max", parseInt(max) - parseInt(document.getElementById('my_input').value));
            if (parseInt(max) - parseInt(document.getElementById('my_input').value) === 0) {
                myInput.setAttribute("min", 0);
            }
        }
        Cookies.set('cart', temp, {expires: 7, path: '/Tan_Shop'});
    } else {
        document.querySelector(".notice").innerHTML = "Số lượng bạn đặt đã đạt mức tối đa của sản phẩm này";
    }
}



if (parseInt(document.querySelector('.si_co').innerHTML) === 0) {
    document.querySelector('.si_co').style.display = "none";
} else {
    document.querySelector('.si_co').style.display = "block";
}
