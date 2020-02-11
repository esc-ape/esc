#!/usr/bin/env node --icu-data-dir=node_modules/full-icu 

// Initialise ESM and run the entry point file 
let esmRequire = require("esm")(module)
module.exports = esmRequire("./src/")