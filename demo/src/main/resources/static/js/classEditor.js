const searchParams = new URLSearchParams(location.search)
const classId = searchParams.get('classId')
const cafId = searchParams.get('cafId')

const pageTitle = document.getElementById('page-title')

const classForm = document.getElementById('class-form')

const cafIdInput = document.getElementById('resp-caf-id-input')
const maxPlacesInput = document.getElementById('max-places-input')
const noteInput = document.getElementById('note-input')

const prefSelect = document.getElementById('pref-select')
const streetInput = document.getElementById('street-input')
const houseInput = document.getElementById('house-input')
const placeInput = document.getElementById('place-input')
const phoneNumInput = document.getElementById('phone-number-input')

const cancelButton = document.getElementById('cancel-button')


window.onload = init

cancelButton.onclick = () => {
    let url = '/classes'
    if (cafId != null) {
        url += '?cafId='+cafId
        if (classId != null) url+= '&classId='+classId
    }
    location.assign(url)
}

async function init(){

    classForm.onsubmit = async (e) => {
        e.preventDefault()
        const data = new FormData(e.target)
        const resp = await fetch('/classes/editor', {method:'POST', body:data})
        if (resp.ok) {
            alert('Сохранено')
            location.assign('/classes')
        } else {
            alert('Ошибка сохранения\n'+(await resp.json()).message)
        }
    }

    if (classId != null){
        const resp = await fetch('/classes/json?id='+classId)
        if (resp.ok){
            pageTitle.textContent = 'Редактирование класса'
            const clas = await resp.json()
            cafIdInput.value = clas.cafId
            maxPlacesInput.value = clas.maxPlaces
            noteInput.value = clas.note
            setPref(clas.pref)
            streetInput.value = clas.street
            houseInput.value = clas.house
            placeInput.value = clas.place

            classForm.onsubmit = async (e) => {
                e.preventDefault()
                const data = new FormData(e.target)
                data.append('id', classId)
                const resp = await fetch('/classes/editor', {method:'PUT', body:data})
                if (resp.ok) {
                    alert('Сохранено')
                    location.assign('/classes?classId='+classId)
                } else {
                    alert('Ошибка сохранения\n'+(await resp.json()).message)
                }
            }
        } else {
            alert('Ошибка загрузки данных о классе')
        }
    } else {
        if (cafId != null){
            cafIdInput.value = cafId
        }
    }
}

function setPref(pref) {
    for (let opt of prefSelect){
        if (opt.value == pref){
            opt.selected = true
            return
        }
    }
}