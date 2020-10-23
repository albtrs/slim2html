const fs = require('fs')
const exec = require('child_process').exec;

const args = process.argv.slice(2);
const command = 'ruby generate_html.rb -o html slim/*.slim'

args.forEach((path) => {
  fs.watch(path, (e, f) => {
    exec(command, (error, stdout, stderr) => {
      console.log(stderr);
      return;
    });
    console.log(`convert ${f} to html`)
  })
});
