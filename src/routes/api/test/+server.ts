import { json } from '@sveltejs/kit'

export async function GET(event) {
    const options: ResponseInit = {
      status: 418,
      headers: {
        X: 'Gon give it to ya',
      }
    }
  
    return new Response('Hello', options)
  }