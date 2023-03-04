/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{js,ts,svelte,jsx,tsx}'],

  theme: {
    extend: {
      // aspectRatio: {
      //   '4/3': '4 / 3',
      // },
      colors: {
        skin: {
          dark: 'var(--color-bg-dark)',
          white: 'var(--color-white)',
          lightDark: 'var(--color-light-dark)',
          green: 'var(--color-green)',
          muted: 'var(--color-muted)',
        },
      },
      fontFamily: {
        varela: ["'Varela Round', sans-serif"],
        poppins: ["'Poppins', sans-serif"],
        manrope: ["'Manrope', sans-serif"],
      },
      fontSize: {
        xs: [
          '1em',
          {
            lineHeight: '[148%]',
            letterSpacing: '0.03em',
            fontWeight: '400',
          },
        ],
        sm: [
          '1.25em',
          {
            lineHeight: '1.875em',
            letterSpacing: '0.03em',
            fontWeight: '400',
          },
        ],
        base: [
          '1em',
          {
            lineHeight: '1.75em',
            letterSpacing: '0.01em',
            fontWeight: '400',
          },
        ],
        lg: [
          '1.675em',
          {
            lineHeight: '[148.4%]',
            letterSpacing: '0.05em',
            fontWeight: '400',
          },
        ],
        xl: [
          '1.3em',
          {
            lineHeight: '.50em',
            letterSpacing: '0.05em',
            fontWeight: '400',
          },
        ],
        '2xl': [
          '1.85em',
          {
            lineHeight: '[149%]',
            letterSpacing: '0.05em',
            fontWeight: '700',
          },
        ],
        '4xl': [
          '2.200em',
          {
            lineHeight: '2.500em',
            letterSpacing: '0.05em',
            fontWeight: '400',
          },
        ],
        '5xl': [
          '2.375em',
          {
            lineHeight: '1.375em',
            letterSpacing: '0.05em',
            fontWeight: '500',
          },
        ],
        '6xl': [
          '3.125em',
          {
            lineHeight: '0.8em',
            letterSpacing: '0.05em',
            fontWeight: '700',
          },
        ],
        '7xl': [
          '4.375em',
          {
            lineHeight: '0.8em',
            letterSpacing: '0.05em',
            fontWeight: '700',
          },
        ],
      },
    },
  },
  
  plugins: [],
  
};
