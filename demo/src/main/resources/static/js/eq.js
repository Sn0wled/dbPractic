const eqTBody = document.getElementById('eq-tbody')
const eqNote = document.getElementById('eq-note')
const deleteButton = document.getElementById('delete-button')
const addButton = document.getElementById('add-button')

let selectedEq = null
init()

deleteButton.onclick = () => {
    fetch("/eq?eqId="+selectedEq.id, {method: 'DELETE'})
    .then(r => location.reload())
}

addButton.onclick = () => {
    location.assign('/eq/editor')
}


function selectEqRow(row){
    if (selectedEq != null) selectedEq.classList.remove('selected');
    if (row != null) row.classList.add('selected');
    selectedEq = row
    updateNote()
}

function updateNote(){
    if (selectedEq == null){
        eqNote.textContent = ""
    } else {
        eqNote.textContent = selectedEq.lastElementChild.textContent
    }
}

function checkEqButtons(){
    if (selectedEq == null){
        deleteButton.disabled = true
    } else {
        deleteButton.disabled = false
    }
}

function onRowClick(row){
    if (selectedEq == row) selectEqRow(null)
    else selectEqRow(row)
    checkEqButtons()
}

function init(){
    for (let row of eqTBody.children){
        row.onclick=() => onRowClick(row)
        if (row.classList.contains('selected')) selectEqRow(row);
    }
    checkEqButtons()
}