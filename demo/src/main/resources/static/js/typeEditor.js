const searchParams = new URLSearchParams(location.search)
const searchTypeId = searchParams.get('typeId')

const pageTitle = document.getElementById('page-title')
const typeForm = document.getElementById('eq-type-form')
const categorySelect = document.getElementById('category-select')
const typeNameInput = document.getElementById('type-name')
const typeCharacteristicInput = document.getElementById('type-characteristic')

const cancelButton = document.getElementById('cancel-button')

cancelButton.onclick = () => {
    let url = '/eqTypes'
    if (searchTypeId != null) {
        url += '?typeId='+searchTypeId
    }
    location.assign(url)
}

window.onload = init

async function init() {
    typeForm.onsubmit = async (e) => {
        e.preventDefault()
        const data = new FormData(e.target)
        const resp = await fetch('/eqTypes/editor', {method:'POST', body:data})
        if (resp.ok) {
            alert('Новый тип добавлен')
            location.assign('/eqTypes?typeId='+await resp.json())
        } else {
            alert('Ошибка сохранения\n'+(await resp.json()).message)
        }
    }

    if (searchTypeId != null) {
        const resp = await fetch('/eqTypes/json/by-id?typeId='+searchTypeId)
        if (resp.ok) {
            pageTitle.textContent = 'Редактирование типа оборудования'
            const type = await resp.json()
            selectCategory(type.category)
            typeNameInput.value = type.name
            typeCharacteristicInput.value = type.characteristic

            typeForm.onsubmit = async (e) => {
                e.preventDefault()
                const data = new FormData(e.target)
                data.append('id', searchTypeId)
                const resp = await fetch('/eqTypes/editor', {method:'PUT', body:data})
                if (resp.ok) {
                    alert('Изменения сохранены')
                    location.assign('/eqTypes?typeId='+searchTypeId)
                } else {
                    alert('Ошибка сохранения\n'+(await resp.json()).message)
                }
            }
        } else {
            alert('Ошибка загрузки данных о типе\n'+(await resp.json()).message)
        }
    }
}


function selectCategory(category) {
    for (let opt of categorySelect.children){
        if (opt.value == category) {
            opt.selected = true
            return
        }
    }
}