const tbody = document.getElementById('type-tbody')
const characteristic = document.getElementById('note')
const delButton = document.getElementById('deleteButton')
const addButton = document.getElementById('addButton')
const editButton = document.getElementById('editButton')
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
        alert('Ошибка\n Сперва снимите данное оборудование с учебного места')
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

