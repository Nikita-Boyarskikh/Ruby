function findLetters(letters, sentence) {
    const result = [];
    sentence.split(/[^\w]/).filter(s => s).forEach((str, i) => {
        if (i % 2 === 1)
    {
        letters.split('').forEach(letter => {
            if(~str.toLowerCase().indexOf(letter)) {
        result.push(letter);
    }
    });
    }
});

    return result.filter((v, i, a) => a.indexOf(v) === i);
}

function script() {
    const result = document.getElementById('result');
    const data = document.getElementById('data').value;
    const letters = findLetters("aeijouy", data);
    let output = '';
    if (letters.length === 0) {
        output = 'Not found latin voice letters';
    } else {
        output = letters.join();
    }
    result.innerText = 'Результат: ' + output;
}

window.onload = function () {
    document.getElementById('start').onclick = script;
};
