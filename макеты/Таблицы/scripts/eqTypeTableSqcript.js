function toConsole(row){
    console.clear()
    console.log('id', row.id)
    console.log('Категория', row.cells[0].innerText)
    console.log('Наименование', row.cells[1].innerText)
    console.log('Характеристика', row.cells[2].innerText)
}

const addButton = document.querySelector('.buttons .addButton')

addButton.onclick = () => {
    if (lastSelected != null) {
        toConsole(lastSelected)
    }
}