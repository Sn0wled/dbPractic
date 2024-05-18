const classSelect = document.getElementById('class-select')
const placeSelect = document.getElementById('place-select')
const wsNameValue = document.getElementById('ws-name-value')
const ipValue = document.getElementById('ip-value')
const eqTBody = document.getElementById('place-tbody')
const installButton = document.getElementById('install-button')
const uninstallButton = document.getElementById('uninstall-button')
const changeOkButton = document.getElementById('change-is-ok')
const toJournalButton = document.getElementById('toJournal')
const uninstalledEqs = document.getElementById('uninstalled-eqs')
const toInstallTbody = document.querySelector('#toInstallTable tbody')

const urlParams = new URLSearchParams(document.location.search)

const searchClassId = urlParams.get('classId')
const searchPlaceId = searchClassId == null ? null : urlParams.get('placeId')
const searchEqId = searchPlaceId == null ? null : urlParams.get('eqId')

let selectedEqRow = null
let selectedEqRowToInstall = null

init()

classSelect.onchange = () =>  {
    selectEq(null)
    fillPlaces(classSelect.value)
    .then(() => {
        fillPlaceChars(placeSelect.value)
        if (placeSelect.value != '') uninstalledEqs.hidden = false;
        else {
            uninstalledEqs.hidden = true
            selectEqToInstall(null)
        }
        loadEqTable(placeSelect.value)
        checkPlaceButton()
    })
}

placeSelect.onchange = () => {
    selectEq(null)
    fillPlaceChars(placeSelect.value)
    loadEqTable(placeSelect.value)
    checkPlaceButton()
}

toJournalButton.onclick = () => {
    if (classSelect.value == '' || placeSelect.value == '') return
    location.assign('/serv?classId='+classSelect.value+'&placeId='+placeSelect.value)
}

uninstallButton.onclick = () => {
    const data = new FormData()
    data.append('eqId', selectedEqRow.id)
    fetch('/eq/uninstall', {method:'PUT', body:data})
    .then(r => {
        if (r.ok){
            alert('Оборудование снято')
            location.assign('/eq/lp-eq?classId='+classSelect.value+'&placeId='+placeSelect.value)
        } else {
            alert('Ошибка')
        }
    })
}

installButton.onclick = () => {
    const data = new FormData()
    data.append('placeId', placeSelect.value)
    data.append('eqId', selectedEqRowToInstall.id)
    fetch('/eq/install', {method:'PUT', body:data})
    .then(r => {
        if (r.ok){
            alert('Оборудование установлено')
            location.assign('/eq/lp-eq?classId='+classSelect.value+'&placeId='+placeSelect.value+'&eqId='+selectedEqRowToInstall.id)
        } else {
            alert('Ошибка')
        }
    })
}

function init(){
    for (let row of toInstallTbody.children){
        row.onclick = () => {
            selectEqToInstall(row)
        }
    }

    if (searchClassId != null) selectClass(searchClassId)
    fillPlaces(classSelect.value)
    .then(() => {
        if (searchPlaceId != null) selectPlace(searchPlaceId)
        fillPlaceChars(placeSelect.value)
        if (placeSelect.value != '') {
            uninstalledEqs.hidden = false
        }
        loadEqTable(placeSelect.value)
        .then(() => {
            if (searchEqId != null) {
                for (let row of eqTBody.children){
                    if (row.id == searchEqId){
                        selectEq(row)
                        return
                    }
                }
            }
        })
        checkPlaceButton()
    })
}

async function fillPlaces(classId){
    if (classId == '') {
        placeSelect.innerHTML = ''
    } else {
        const resp = await fetch('/place/opts/by-class?classId='+classId)
        const text = await resp.text()
        placeSelect.innerHTML = text
    }
}

function selectClass(classId) {
    for (let classOpt of classSelect.children){
        if (classOpt.value == classId) {
            classOpt.selected = true
            return
        }
    }
}

function selectPlace(placeId){
    for (let placeOpt of placeSelect.children){
        if (placeOpt.value == placeId){
            placeOpt.selected = true
            return
        }
    }
}

function fillPlaceChars(placeId){
    if(placeId == '') {
        wsNameValue.textContent = ""
        ipValue.textContent = ""
    } else {
        fetch("/place/by-id/json?id="+placeId)
        .then(r => r.json())
        .then(json => {
            wsNameValue.textContent = json.name
            ipValue.textContent = json.ip
        })
    }
}

async function loadEqTable(placeId){
    if (placeId == '') {
        eqTBody.innerHTML = ''
    } else {
        const resp = await fetch('/eq/byPlace?placeId='+placeId)
        eqTBody.innerHTML= await resp.text()
        for (let row of eqTBody.children){
            row.onclick = () => {
                selectEq(row)
            }
        }
    }
}

function selectEq(row){ // row может быть null
    if (selectedEqRow === row){
        if (selectedEqRow == null);
        else {
            selectedEqRow.classList.remove('selected')
            selectedEqRow = null
        }
    } else {
        if (selectedEqRow != null) selectedEqRow.classList.remove('selected')
        selectedEqRow = row
        if (row != null) row.classList.add('selected')
    }
    checkEqButtons()
}

//

function checkPlaceButton(){
    if (placeSelect.value == "") {
        toJournalButton.disabled = true
    } else {
        toJournalButton.disabled = false
    }
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

function selectEqToInstall(row){
    if (selectedEqRowToInstall === row){
        if (selectedEqRowToInstall == null);
        else {
            selectedEqRowToInstall.classList.remove('selected')
            selectedEqRowToInstall = null
        }
    } else {
        if (selectedEqRowToInstall != null) selectedEqRowToInstall.classList.remove('selected')
            selectedEqRowToInstall = row
        if (row != null) row.classList.add('selected')
    }
    checkEqToInstallButton()
}

function checkEqToInstallButton(){
    if (selectedEqRowToInstall == null) {
        installButton.disabled = true
    } else {
        installButton.disabled = false
    }
}