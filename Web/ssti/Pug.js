const express = require('express');
const pug = require('pug');

const app = express();

const template = `
h1 Hello %NAME%
form(method='GET' action='/')
  div
    label(for='nickname') Name:
    input#nickname(type='text', placeholder='Nickname' name='name')
    button(type='submit') Submit 
  a(href='/source') Source Code
`;

app.get('/', (req, res) => {
    const name = (req.query.name ?? 'Anonymous').toString();
    console.log(name)
    if (name.includes('{')) return res.send('Nice try');
    let html = pug.render(template.replace('%NAME%', name));
    res.set('Content-Type', 'text/html');
    res.send(html);
});

app.get("/source", (_, res) => {
    res.sendFile(__filename);
});

app.listen(3000, () => console.log(':3000'));