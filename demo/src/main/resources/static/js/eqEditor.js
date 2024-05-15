const pageName = document.getElementById('page-title')
const typeTBody = document.getElementById('type-tbody')
const invNum = document.getElementById('inv-num')
const note = document.getElementById('note')
const saveButton = document.getElementById('save-button')
const cancelButton = document.getElementById('cancel-button')
const editForm = document.getElementById('add-eq-form')
const typeId = document.getElementById('type-id')
const urlParams = new URLSearchParams(document.location.search)
const eqId = urlParams.get('eqId')
const form = document.getElementById('add-eq-form')

let selectedTypeRow= null

if (eqId != null){
    form.onsubmit = (e) => {
        e.preventDefault();
        const data = new FormData(form)
        data.append('id', eqId)
        fetch('/eq/editor', {method: 'PUT', body: data})
        .then((r) => {
            if (r.ok) {
                location.assign('/eq?eqId='+eqId)
            } else {
                alert('Ошибка изменения')
            }
        })
    }

    fetch('/eq/by-id?id='+eqId)
    .then(r => r.json())
    .then(eq => {
        invNum.value = eq.invNum
        note.value = eq.note
        for (let row of typeTBody.children){
            if (row.id == eq.typeId) {
                onRowClick(row)
                break
            }
        }
    })
} else {
    form.onsubmit = (e) => {
        e.preventDefault();
        const data = new FormData(form)
        fetch('/eq/editor', {method: 'POST', body: data})
        .then((r) => {
            if (r.ok) {
                r.json()
                .then(j => location.assign('/eq?eqId='+j))
            } else {
                alert('Ошибка сохранения')
            }
        })
    }
}


for (let row of typeTBody.children){
    row.onclick=()=>onRowClick(row)
}

invNum.oninput = checkSaveButton
cancelButton.onclick = () => {
    location.assign('/eq' + (eqId == null ? '' : ('?eqId=' + eqId)))
}

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