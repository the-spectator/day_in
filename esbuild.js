#!/usr/bin/env node
const { execSync } = require("child_process");

const pagyPath = execSync("echo $(bundle show 'pagy')/lib/javascripts")
  .toString()
  .replace(/\n$/, "");

require("esbuild")
  .build({
    entryPoints: ["./app/javascript/application.js"],
    bundle: true,
    outdir: "./app/assets/builds",
    sourcemap: true,
    // watch: true,
    nodePaths: [pagyPath],
    minify: true,
    target: "es2015",
  })
  .catch(() => process.exit(1));

// "build": "NODE_PATH=\"$(bundle show 'pagy')/lib/javascripts\" esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds",
