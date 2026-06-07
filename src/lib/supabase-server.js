import { createServerClient, parseCookieHeader } from '@supabase/ssr';

export function createSupabaseServerClient(request, cookies) {
    return createServerClient(
        import.meta.env.PUBLIC_SUPABASE_URL,
        import.meta.env.PUBLIC_SUPABASE_ANON_KEY,
        {
            cookies: {
                getAll() {
                    return parseCookieHeader(request.headers.get('Cookie') ?? '');
                },
                setAll(cookiesToSet) {
                    cookiesToSet.forEach(({ name, value, options }) => {
                        cookies.set(name, value, options);
                    });
                },
            },
        }
    );
}
