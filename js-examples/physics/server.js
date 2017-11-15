var path = require("path"),
  express = require("express");

var DIST_DIR = path.join(__dirname, "dist"),
  PORT = 3000,
  app = express();

//Serving the files on the dist folder
app.use(express.static(DIST_DIR));

app.listen(PORT);
