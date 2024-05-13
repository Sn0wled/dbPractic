const classTBody = document.querySelector('.table tbody')
const select = document.querySelector('.resp-selector select')
const note = document.querySelector('.note')

let selectedClass = null
loadSelector()
select.onchange=loadTable



function loadSelector(){
    fetch("http://localhost:8080/classes/cafs")
    .then(r => r.text())
    .then(text => select.innerHTML = text)
    .then(() => loadTable())
}

function loadTable(){
    if (select.value != ''){
        fetch("http://localhost:8080/classes/byCaf?cafId=" + select.value)
        .then(r => r.text())
        .then(text => classTBody.innerHTML=text)
        .then(setOnClickForRows)
    }
}

function setOnClickForRows(){
    for (let row of classTBody.children){
        row.onclick = () => onClickClassRow(row)
    }
}

function onClickClassRow(row){
    if (selectedClass === row){
        selectedClass = null
        row.classList.remove('selected')
    } else {
        selectedClass = row
        row.classList.add('selected')
    }
    updateNote()
}

function updateNote(){
    if (selectedClass == null){
        note.textContent = ""
    } else {
        note.textContent = selectedClass.lastElementChild.textContent
    }
}