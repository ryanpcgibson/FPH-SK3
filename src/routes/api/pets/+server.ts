import { sql } from '@vercel/postgres';

export async function GET() {
    try {
        const result = await sql`SELECT * FROM pets;`;
        return new Response(JSON.stringify(result, null, 2), { status: 200 });
    } catch (error: any) {
        return new Response(error.toString(), { status: 500 });
    }
}