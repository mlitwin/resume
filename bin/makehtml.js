const fs = require('fs');
const handlebars = require('handlebars');

const args = process.argv.slice(2);
const body = fs.readFileSync(args[0]);

const pageSource =
`
<!DOCTYPE html>
<html>
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