/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        classic: {
          primary: '#2c3e50',
          secondary: '#c0a375',
          background: '#f8f5f0',
          paper: '#ffffff',
          border: '#e2d9c9',
        },
      },
      typography: {
        DEFAULT: {
          css: {
            maxWidth: 'none',
            color: '#2c3e50',
            p: {
              marginBottom: '1.5em',
              lineHeight: '1.8',
            },
            'ul > li': {
              marginTop: '0.5em',
              marginBottom: '0.5em',
            },
            h1: {
              fontFamily: "'Noto Serif', Georgia, 'Times New Roman', serif",
              color: '#2c3e50',
            },
            h2: {
              fontFamily: "'Noto Serif', Georgia, 'Times New Roman', serif",
              color: '#2c3e50',
            },
            h3: {
              fontFamily: "'Noto Serif', Georgia, 'Times New Roman', serif",
              color: '#2c3e50',
            },
          },
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}