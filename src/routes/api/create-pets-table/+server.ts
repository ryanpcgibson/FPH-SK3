import { sql } from '@vercel/postgres';

export async function GET() {
    try {
        const result = await sql`CREATE TABLE Pets (Name varchar(255), Owner varchar(255));`;
        return new Response(JSON.stringify(result), { status: 200 });
    } catch (error: any) {
        return new Response(error.toString(), { status: 500 });
    }
}



// import type { RequestHandler } from '@sveltejs/kit';

// export const post: RequestHandler = async ({ request }) => {
//     try {
//         const result = await sql`CREATE TABLE Pets (Name varchar(255), Owner varchar(255));`;
//         return {
//             status: 200,
//             body: { result },
//         };
//     } catch (error) {
//         return {
//             status: 500,
//             body: { error },
//         };
//     }
// };
