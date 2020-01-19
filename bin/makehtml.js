const fs = require('fs');
const handlebars = require('handlebars');

const args = process.argv.slice(2);
const body = fs.readFileSync(args[0]);

const pageSource =
`
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>Résumé – Matthew Litwin</title>

<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/main.css">

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<body>
{{{body}}}
</body>
</html>
`;

const pageTemplate = handlebars.compile(pageSource);

const output = pageTemplate({
    body: body
});

console.log(output);