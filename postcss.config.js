module.exports = {
  plugins: [
    require("postcss-import"),
    // Required to use @apply & @screen directives. https://tailwindcss.com/docs/using-with-preprocessors#nesting
    require("tailwindcss/nesting")(require("postcss-nesting")),
    require("autoprefixer"),
    require("tailwindcss"),
  ],
};
