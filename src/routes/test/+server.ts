import { sql } from '@vercel/postgres';

// src/routes/test.js
export async function GET() {
    return new Response(JSON.stringify({ "TEST": process.env.TEST }), { status: 200 });
}
