const tbody = document.querySelector('.table tbody')
const characteristic = document.querySelector('.text p')
const delButton = document.querySelector('.deleteButton')
const addButton = document.querySelector('.addButton')
const editButton = document.querySelector('.editButton')
const urlParams = new URLSearchParams(document.location.search)
const typeId = urlParams.get('typeId')

let lastSelected = null

for (let row of tbody.children){
    row.onclick = () => {selectPlaceRow(row)}
}

if (typeId != null){
    for (let row of tbody.children){
        if (row.id == typeId) {
            selectPlaceRow(row)
            break
        }
    }
}

addButton.onclick = () => {
    location.assign('/eqTypes/editor')
}

editButton.onclick = () => {
    location.assign('/eqTypes/editor?typeId='+lastSelected.id)
}

checkButtons()

delButton.onclick = async () => {
    const resp = await fetch('/eqTypes?eqTypeId='+lastSelected.id, {method:'DELETE'})
    if (resp.ok) {
        alert('Тип удален')
        location.reload()
    } else {
        alert('Ошибка\n'+(await resp.json()).message)
    }
}


function selectPlaceRow(row){
    if (lastSelected === row){
        lastSelected.classList.remove("selected")
        lastSelected = null
        updateText()
        checkButtons()
        return
    }
    if (lastSelected != null){
        lastSelected.classList.remove("selected")
    }
    row.classList.add('selected')
    lastSelected = row
    updateText()
    checkButtons()
}

function updateText(){
    if (lastSelected !== null){
        characteristic.textContent = lastSelected.lastElementChild.textContent
    } else {
        characteristic.textContent = ""
    }
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

