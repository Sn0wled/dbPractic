const pageName = document.getElementById('page-title')
const typeTBody = document.getElementById('type-tbody')
const invNum = document.getElementById('inv-num')
const note = document.getElementById('note')
const saveButton = document.getElementById('save-button')
const cancelButton = document.getElementById('cancel-button')
const editForm = document.getElementById('add-eq-form')
const typeId = document.getElementById('type-id')

let selectedTypeRow= null

for (let row of typeTBody.children){
    row.onclick=()=>onRowClick(row)
}

invNum.oninput = checkSaveButton

// думаем про таблицу

// функция для обработки кликов
function onRowClick(row){
    if (row == selectedTypeRow) selectTypeRow(null);
    else selectTypeRow(row)
    writeTypeId();
    checkSaveButton()
}

// в первую очередь при клике должна выбираться строка и записываться ее ид

function selectTypeRow(row){
    if (selectedTypeRow != null) selectedTypeRow.classList.remove('selected');
    if (row != null) row.classList.add('selected');
    selectedTypeRow = row
}

function writeTypeId(){
    if (selectedTypeRow== null) typeId.value = '';
    else typeId.value = selectedTypeRow.id
}

function checkSaveButton(){
    if (invNum.value == '' || typeId.value == '') {
        saveButton.disabled = true 
    } else {
        saveButton.disabled = false 
    }
}

checkSaveButton()