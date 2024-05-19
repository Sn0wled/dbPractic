const cafSelect = document.getElementById('caf-select')
const classTBody = document.getElementById('class-table')
const classNote = document.getElementById('class-note')
const addButton = document.getElementById('add-button')
const editButton = document.getElementById('edit-button')
const toPlacesButton = document.getElementById('to-places-button')

let selectedClass = null
loadTable()
cafSelect.onchange = () => {
    loadTable()
    checkCafButtons()
}

addButton.onclick = () => {
    location.assign('/classes/editor?cafId='+cafSelect.value)
}

editButton.onclick = () => {
    location.assign('/classes/editor?classId='+selectedClass.id+'&cafId='+cafSelect.value)
}

toPlacesButton.onclick = () => {
    location.assign('/place?classId='+selectedClass.id)
}


function loadTable(){
    if (cafSelect.value != ''){
        fetch("http://localhost:8080/classes/byCaf?cafId=" + cafSelect.value)
        .then(r => r.text())
        .then(text => classTBody.innerHTML=text)
        .then(setOnClickForRows)
    }
    selectClassRow(null)
}

function setOnClickForRows(){
    for (let row of classTBody.children){
        row.onclick = () => {
            if (selectedClass == row) selectClassRow(null)
            else selectClassRow(row)
        }
    }
}


function updateNote(){
    if (selectedClass == null){
        classNote.textContent = ""
    } else {
        classNote.textContent = selectedClass.lastElementChild.textContent
    }
}

function selectClassRow(row){
    if (selectedClass != null) selectedClass.classList.remove('selected');
    if (row != null) row.classList.add('selected');
    selectedClass = row
    updateNote()
    checkClassButtons()
}

function checkCafButtons(){
    if (cafSelect.value == ""){
        addButton.disabled = true
    } else {
        addButton.disabled = false
    }
}

function checkClassButtons(){
    if (selectedClass == null){
        toPlacesButton.disabled = true
        editButton.disabled = true
    } else {
        toPlacesButton.disabled = false
        editButton.disabled = false
    }
}