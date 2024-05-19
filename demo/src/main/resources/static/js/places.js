const classSelect = document.querySelector(".class-selector select")
const placeTableTBody = document.getElementById('place-tbody')
const eqTableTBody = document.getElementById('eq-tbody')
const placeNote = document.getElementById('place-note')

const addButton = document.getElementById('add-button')
const editButton = document.getElementById('edit-button')
const delButton = document.getElementById('del-button')



const urlParams = new URLSearchParams(document.location.search)
const searchClassId = urlParams.get('classId')

let selectedPlaceRow = null


classSelect.onchange = async () => {
    fillPlaceTable()
    selectPlaceRow(null)
}

addButton.onclick = () => {
    location.assign('/place/editor?classId='+classSelect.value)
}

editButton.onclick = () => {
    location.assign('/place/editor?classId='+classSelect.value+'&placeId='+selectedPlaceRow.id)
}

init()


function init(){
    if (classSelect.value == '')  return
    addButton.disabled = false
    if (searchClassId != null) selectClass(searchClassId)
    fillPlaceTable()
}

function selectClass(classId){
    if (classId == null) return
    for (let classOpt of classSelect.children){
        if (classOpt.value == classId){
            classOpt.selected = true
            return
        }
    }
}

async function fillPlaceTable(){
    if (classSelect.value != ""){
        const resp = await fetch("http://localhost:8080/place/by-class?classId=" + classSelect.value)
        placeTableTBody.innerHTML= await resp.text()
        for (let row of placeTableTBody.children){
            row.onclick = () => {
                if (selectedPlaceRow === row) {
                    selectPlaceRow(null)
                } else {
                    selectPlaceRow(row)
                }
            }
        }
    } else {
        placeTableTBody.innerHTML = ''
    }
}

function selectPlaceRow(row){
    if (selectedPlaceRow != null) selectedPlaceRow.classList.remove('selected');
    if (row != null) row.classList.add('selected');
    selectedPlaceRow = row
    updateEqTable()
    checkButtons()
    updatePlaceNote()
}

async function updateEqTable(){
    if (selectedPlaceRow == null){
        eqTableTBody.innerHTML = ""
    } else {
        const resp = await fetch("http://localhost:8080/eq/byPlace?placeId="+selectedPlaceRow.id)
        eqTableTBody.innerHTML= await resp.text()
    }
}

function checkButtons(){
    if (selectedPlaceRow == null) {
        editButton.disabled = true
        delButton.disabled = true
    } else {
        editButton.disabled = false
        delButton.disabled = false
    }
}

function updatePlaceNote(){
    if (selectedPlaceRow == null) {
        placeNote.textContent = ''
    } else {
        placeNote.textContent = selectedPlaceRow.lastElementChild.textContent
    }
}

delButton.onclick = async () => {
    if (!confirm('Подтвердите удаление')) return
    const resp = await fetch('/place?placeId='+selectedPlaceRow.id, {method:'DELETE'})
    if (resp.ok){
        alert('Учебное место удалено')
        location.assign('/place?classId='+classSelect.value)
    } else {
        alert('Ошибка удаления')
    }
}