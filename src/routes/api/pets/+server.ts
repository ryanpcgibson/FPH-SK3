import { sql } from '@vercel/postgres';

export async function GET() {
    const user_id = "user1"; // TMP until auth is implemented
    try {
        const result = await sql`SELECT * FROM pets p 
                                 JOIN viewable_pets ON p.pet_id = viewable_pets.pet_id
                                 AND viewable_pets.user_id = ${user_id};`
        return new Response(JSON.stringify(result, null, 2), { status: 200 });
    } catch (error: any) {
        return new Response(error.toString(), { status: 500 });
    }
}