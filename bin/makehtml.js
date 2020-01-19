const fs = require('fs');
const handlebars = require('handlebars');

const args = process.argv.slice(2);
const pageSource = fs.readFileSync(args[0]).toString();
const body = fs.readFileSync(args[1]).toString();

const pageTemplate = handlebars.compile(pageSource);

const output = pageTemplate({
    body: body
});

console.log(output);