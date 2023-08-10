/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


if (parseInt(document.querySelector('.si_co').innerHTML) === 0) {
    document.querySelector('.si_co').style.display = "none";
} else {
    document.querySelector('.si_co').style.display = "block";
}
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
function Delete(email, i, key, entryperpage,size) {
    if (confirm("Are you sure to delete user with email = " + email)) {
        window.location = "deleteuser?email=" + email
                + "&page=" + i + "&key=" + key + "&entryperpage=" + entryperpage
                + "&data="+size;
    }
}
const menu = document.querySelector(".menu");
function Remove() {
    menu.classList.add("active");
}
let menu_button = document.getElementsByClassName('menu_button')[0];
menu_button.addEventListener('click', () => {
    menu.classList.remove('active');
});

let page = document.querySelectorAll('.pageofuser');
for (var i = 0; i < page.length; i++) {
    console.log('i=' + document.getElementById('pagechecked').value);
    console.log('page=' + page[i].value);
    if (page[i].value === document.getElementById('pagechecked').value)
        page[i].classList.add('marked');
    ;
}
;

function getImgPreview(event){
    console.log(event.target.files[0]);
    var img = URL.createObjectURL(event.target.files[0]);
    var imgpre = document.getElementById('display_img');
    var newimg = document.createElement('img');
    newimg.src = img;
    imgpre.innerHTML = '';
    imgpre.classList.add('checked');
    document.getElementsByClassName('default_img')[0].classList.add('checked');
    imgpre.appendChild(newimg);
}
const fileUpload = document.querySelector("#input_img");
let img = "";
fileUpload.addEventListener("change", (e) => {
    const files = e.target.files;
        const name = file;
        img = name.name;
});
function addimg() {
    document.getElementById('hide_img').value = img.toString();
}
function submitNumber(){
    document.getElementById('setpage').submit();
}
