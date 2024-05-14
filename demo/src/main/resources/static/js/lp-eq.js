const classSelect = document.getElementById('class-select')
const placeSelect = document.getElementById('place-select')
const wsNameValue = document.getElementById('ws-name-value')
const ipValue = document.getElementById('ip-value')
const placeTBody = document.getElementById('place-tbody')
const installButton = document.getElementById('install-button')
const uninstallButton = document.getElementById('uninstall-button')
const changeOkButton = document.getElementById('change-is-ok')
const toJournalButton = document.getElementById('toJournal')


let selectedEqRow = null
classSelect.onchange = loadPlaces
placeSelect.onchange = onPlaceSelect
toJournalButton.onclick=onClickToJournal

onPageLoad()

function loadPlaces() {
    if (classSelect.value == "") {
        placeSelect.innerHTML = ""
        return
    }
    fetch('/place/opts/by-class?classId='+classSelect.value)
    .then(r => r.text())
    .then(text => placeSelect.innerHTML = text)
    .then(onPlaceSelect)
}

function fillPlaceChars(){
    if(placeSelect.value == '') {
        wsNameValue.textContent = ""
        ipValue.textContent = ""
        return
    }
    fetch("/place/by-id/json?id="+placeSelect.value)
    .then(r => r.json())
    .then(json => {
        wsNameValue.textContent = json.name
        ipValue.textContent = json.ip
    })
}

function fillPlaceTable(){
    if (placeSelect.value == '') {
        placeTBody.innerHTML = ''
        return
    }
    fetch('/eq/byPlace?placeId='+placeSelect.value)
    .then(r => r.text())
    .then(text => placeTBody.innerHTML=text)
    .then(() => {
        for (let row of placeTBody.children){
            row.onclick = () => {
                selectEq(row)
            }
        }
    })
}

function onPageLoad(){
    loadPlaces()
}

function onPlaceSelect(){
    fillPlaceChars()
    fillPlaceTable()
    selectEq(null)
    checkPlaceButton()
}

function selectEq(row){ // row может быть null
    if (selectedEqRow === row){
        if (selectedEqRow == null) return
        selectedEqRow.classList.remove('selected')
        selectedEqRow = null
    } else {
        if (selectedEqRow != null) selectedEqRow.classList.remove('selected')
        selectedEqRow = row
        if (row != null) row.classList.add('selected')
    }
    onEqSelect()
}

function onEqSelect(){
    checkButtons()
}

function checkEqButtons(){
    if (selectedEqRow == null){
        uninstallButton.disabled = true
        changeOkButton.disabled = true
    } else {
        uninstallButton.disabled = false
        changeOkButton.disabled = false
    }
}

function checkPlaceButton(){
    if (placeSelect.value == "") {
        toJournalButton.disabled = true
    } else {
        toJournalButton.disabled = false
    }
}

function onClickToJournal(){
    if (classSelect.value == '' || placeSelect.value == '') return
    document.location.href = '/serv?classId='+classSelect.value+'&placeId='+placeSelect.value
}