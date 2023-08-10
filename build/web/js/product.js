/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function show(i) {
    let temp = document.getElementsByClassName("arrow");
    temp[i].style.transform = "rotate(45deg)";
    document.getElementsByClassName("ht")[i].style.display = "block";
}

function hide(i) {
    let temp = document.getElementsByClassName("arrow");
    temp[i].style.transform = "rotate(-45deg)";
    document.getElementsByClassName("ht")[i].style.display = "none";
}

let menu_button = document.getElementsByClassName('menu_button')[0];
menu_button.addEventListener('click', () => {
    menu.classList.remove('active');
});

const menu = document.querySelector(".menu");
function Remove() {
    menu.classList.add("active");
}

function Del(id, i, key, entryperpage,size) {
    if (confirm("Are you sure to delete product with id = " + id)) {
        window.location = "deleteproduct?id=" 
                + id + "&page=" + i + "&key=" + key + "&entryperpage=" + entryperpage
                + "&data="+size;
    }
}

function submitNumber() {
    document.getElementById('setpage').submit();
}

const fileUpload = document.querySelector("#inputimage");
let img = "";
fileUpload.addEventListener("change", (e) => {
    const files = e.target.files;
    
    for (const file of files) {
        const name = file;
        // Làm gì đó với các thông tin trên
        img = name.name;
    }
    console.log(img);
});
function addimg() {
    if(img !== "")
        document.getElementById('hide_img').value = img.toString();
}
$(".form_upload").on("change", "#inputimage", function () {
    $(this).parent(".image_upload").attr("data-text", $(this).val().replace(/.*(\/|\\)/, ''));
});
const list = document.getElementsByClassName('size_product');
function checkrequired() {
    let check = false;
    for (var i = 0; i < list.length; i++) {
        if (list[i].checked) {
            check = true;
            break;
        }
    }
    if (check) {
        for (var i = 0; i < list.length; i++) {
            list[i].required = false;
        }
    }else{
        for (var i = 0; i < list.length; i++) {
            list[i].required = true;
        }
    }
    
}