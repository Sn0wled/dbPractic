const tbody = document.querySelector('.table tbody')
const characteristic = document.querySelector('.text p')
const delButton = document.querySelector('.deleteButton')
const addButton = document.querySelector('.addButton')
const editButton = document.querySelector('.editButton')
let lastSelected = null

fetch('http://localhost:8080/EqTypes/all')
.then(r => r.text())
.then(text => tbody.innerHTML=text)
.then(() => {
    const rows = tbody.children
    for (let row of rows){
        row.onclick = () => {selectPlaceRow(row); updateText(); checkButtons()}
    }
})

checkButtons()

delButton.onclick = delSelected


function selectPlaceRow(row){
    if (lastSelected === row){
        lastSelected.classList.remove("selected")
        lastSelected = null
        return
    }
    if (lastSelected != null){
        lastSelected.classList.remove("selected")
    }
    row.classList.add('selected')
    lastSelected = row
}

function updateText(){
    if (lastSelected !== null){
        characteristic.textContent = lastSelected.querySelector('.char').textContent
    } else {
        characteristic.textContent = ""
    }
}

function delSelected(){
    location.reload()
}

function checkButtons(){
    if (lastSelected == null){
        delButton.setAttribute('disabled', true)
        editButton.setAttribute('disabled', true)
    }else {
        delButton.removeAttribute('disabled')
        editButton.removeAttribute('disabled')
    }
}

