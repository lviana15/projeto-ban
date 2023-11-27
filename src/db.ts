import { Pool } from 'pg'

// Cria conexão com banco
const pool: Pool = new Pool({
    user: '',
    host: '',
    database: '',
    password: '',
    port: 5432,
})

export default pool
