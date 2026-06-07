import { defineMiddleware } from 'astro:middleware';
import { createSupabaseServerClient } from './lib/supabase-server';

export const onRequest = defineMiddleware(async (context, next) => {
    const { pathname } = context.url;

    if (!pathname.startsWith('/admin')) {
        return next();
    }

    if (pathname === '/admin/login') {
        return next();
    }

    const supabase = createSupabaseServerClient(context.request, context.cookies);
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) {
        return context.redirect('/admin/login');
    }

    return next();
});
