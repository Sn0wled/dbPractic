const eqTBody = document.getElementById('eq-tbody')
const eqNote = document.getElementById('eq-note')
const deleteButton = document.getElementById('delete-button')

let selectedEqRow = null

deleteButton.onclick = () => {
    fetch("/eq?eqId="+selectedEqRow.id, {method: 'DELETE'})
    .then(r => location.reload())
}

for (row of eqTBody.children){
    row.onclick=(e) => onRowClick(e.target.parentElement)
}

function selectEqRow(row){
    if (selectedEqRow != null) selectedEqRow.classList.remove('selected');
    if (row != null) row.classList.add('selected');
    selectedEqRow = row
    updateNote()
}

function updateNote(){
    if (selectedEqRow == null){
        eqNote.textContent = ""
    } else {
        eqNote.textContent = selectedEqRow.lastElementChild.textContent
    }
}

function checkEqButtons(){
    if (selectedEqRow == null){
        deleteButton.disabled = true
    } else {
        deleteButton.disabled = false
    }
}

function onRowClick(row){
    if (selectedEqRow == row) selectEqRow(null)
        else selectEqRow(row)
}