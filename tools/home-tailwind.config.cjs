module.exports = {
  "theme": {
    "extend": {
      "fontFamily": {
        "sans": [
          "\"Be Vietnam Pro\"",
          "sans-serif"
        ],
        "heading": [
          "\"Be Vietnam Pro\"",
          "sans-serif"
        ]
      },
      "colors": {
        "medical": {
          "50": "#f4f8fb",
          "100": "#e6eff6",
          "200": "#cddfec",
          "300": "#7cc8fb",
          "400": "#36aaf5",
          "500": "#0c8ee6",
          "600": "#1760a5",
          "700": "#0056b3",
          "800": "#0d3f82",
          "900": "#092652"
        },
        "sapphire": {
          "50": "#f0f7ff",
          "100": "#e0effe",
          "200": "#bae0fd",
          "DEFAULT": "#1760a5",
          "dark": "#0c3b6e",
          "light": "#297bc8"
        },
        "cyber": {
          "DEFAULT": "#0284c7",
          "light": "#38bdf8",
          "glow": "#0ea5e9"
        },
        "accent": {
          "DEFAULT": "#e36928",
          "light": "#f97316",
          "soft": "#fff7ed"
        },
        "pearl": {
          "50": "#f8fafc",
          "100": "#f1f5f9",
          "200": "#e2e8f0",
          "DEFAULT": "#fbfcfd",
          "soft": "#f4f8fb",
          "card": "#ffffff"
        }
      },
      "boxShadow": {
        "pearl": "0 1px 0 rgba(255,255,255,.95) inset, 0 14px 34px -14px rgba(15, 60, 110, 0.12), 0 2px 6px rgba(15, 60, 110, 0.04)",
        "pearl-hover": "0 1px 0 rgba(255,255,255,.95) inset, 0 26px 48px -16px rgba(0, 86, 179, 0.22), 0 6px 14px -4px rgba(23, 96, 165, 0.08)",
        "floating": "0 18px 40px rgba(9, 38, 82, 0.14)"
      }
    }
  },
  "content": [
    "./template/frontend/index.php",
    "./template/frontend/home-equipment.php",
    "./template/frontend/home-footer.php",
    "./template/frontend/assets/js/home.js"
  ],
  "important": "#home-design",
  "corePlugins": {
    "preflight": false
  }
}