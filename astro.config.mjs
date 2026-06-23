import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import vercel from '@astrojs/vercel';

export default defineConfig({
    site: 'https://limpiezastorrenueva.com',
    output: 'static',
    adapter: vercel(),
    integrations: [
        sitemap({
            filter: (page) => !page.includes('/admin') && !page.includes('/api'),
            changefreq: 'weekly',
            priority: 0.7,
            lastmod: new Date(),
        }),
    ],
    srcDir: './src',
    publicDir: './public',
    outDir: './dist',
    server: {
        host: true
    }
});
