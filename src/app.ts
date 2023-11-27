import { QueryResult } from 'pg';
import pool from './db';
import * as readline from 'readline';

// Leitura input usuario
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

function prompt(question: string): Promise<string> {
    return new Promise((resolve) => {
        rl.question(question, resolve);
    });
}

// Funcao generica printar tuplas de tabela
async function printTable(tableName: string): Promise<void> {
    const query = `SELECT * FROM ${tableName}`;
    const result: QueryResult = await pool.query(query);

    console.log(`\nTuplas da tabela ${tableName}:`);
    console.table(result.rows);
}

// Insere novo ouvinte, que é um usuario
async function inserirOuvinte(): Promise<void> {
    const nomeUsuario: string = await prompt('Digite o nome do usuário: ');
    const email: string = await prompt('Digite o e-mail do usuário: ');

    const queryUsuario = {
        text: 'INSERT INTO usuarios (nome_usuario, email) VALUES ($1, $2) RETURNING id_usuario',
        values: [nomeUsuario, email],
    };

    const resultUsuario = await pool.query(queryUsuario);
    const idUsuario = resultUsuario.rows[0].id_usuario;

    const queryOuvinte = {
        text: 'INSERT INTO ouvintes (id_usuario) VALUES ($1)',
        values: [idUsuario],
    };

    const client = await pool.connect();
    try {
        await client.query(queryOuvinte);
        console.log('Usuário (ouvinte) inserido com sucesso.');
    } finally {
        client.release();
    }
}

// Insere nova playlist
async function inserirPlaylist(): Promise<void> {
    const nome: string = await prompt('Digite o nome da playlist: ');
    const descricao: string = await prompt('Digite a descrição da playlist: ');

    const query = {
        text: 'INSERT INTO playlists (nome, descricao) VALUES ($1, $2)',
        values: [nome, descricao],
    };

    const client = await pool.connect();
    try {
        await client.query(query);
        console.log('Playlist inserida com sucesso.');
    } finally {
        client.release();
    }
}

// Insere biblioteca
async function inserirBiblioteca(): Promise<void> {
    await printTable('usuarios');
    const idOuvinte: string = await prompt('Digite o ID do ouvinte: ');

    await printTable('playlists');
    const idPlaylist: string = await prompt('Digite o ID da playlist: ');

    const query = {
        text: 'INSERT INTO bibliotecas (id_ouvinte, id_playlist) VALUES ($1, $2)',
        values: [idOuvinte, idPlaylist],
    };

    const client = await pool.connect();
    try {
        await client.query(query);
        console.log('Biblioteca inserida com sucesso.');
    } finally {
        client.release();
    }
}

// Insere nova musica
async function inserirMusica(): Promise<void> {
    const titulo: string = await prompt('Digite o título da música:');
    const duracaoMinutos: string = await prompt('Digite a duração da música (MM:SS):');

    // Adapta duracao para modelo Postgres Interval
    const duracao = `00:${duracaoMinutos}`

    const query = {
        text: 'INSERT INTO musicas (titulo, duracao) VALUES ($1, $2)',
        values: [titulo, duracao],
    };

    const client = await pool.connect();
    try {
        await client.query(query);
        console.log('Música inserida com sucesso.');
    } finally {
        client.release();
    }
}

// Insere historico
async function inserirHistorico(): Promise<void> {

    // const dataAdicao: string = await prompt('Digite a data de adição (AAAA-MM-DD): ');
    const dataAdicao = new Date().toISOString().split('T')[0];

    await printTable('playlists');
    const idPlaylist: string = await prompt('Digite o ID da playlist: ');

    await printTable('musicas');
    const idMusica: string = await prompt('Digite o ID da música: ');

    await printTable('usuarios')
    const idOuvinte: string = await prompt('Digite o ID do ouvinte: ');

    const query = {
        text: 'INSERT INTO historicos (data_adicao, id_playlist, id_musica, id_ouvinte) VALUES ($1, $2, $3, $4)',
        values: [dataAdicao, idPlaylist, idMusica, idOuvinte],
    };

    const client = await pool.connect();
    try {
        await client.query(query);
        console.log('Histórico inserido com sucesso.');
    } finally {
        client.release();
    }
}

// Mostra todas musicas de uma playlist por id_playlist
async function musicasPlaylist(): Promise<void> {
    await printTable('playlists');
    const idPlaylist: string = await prompt('Digite o ID da playlist:');

    const query = {
        text: `
            SELECT m.*
            FROM musicas m
            JOIN historicos h ON m.id_musica = h.id_musica
            WHERE h.id_playlist = $1;
            `,
        values: [idPlaylist]
    };

    const client = await pool.connect();
    try {
        const result = await client.query(query);
        console.log('\nTodas musicas da playlist com ID ${idPlaylist}');
        console.table(result.rows);
    } finally {
        client.release();
    }
}

// Mostra a duracao total de uma playlist por id_playlist
async function duracaoPlaylist(): Promise<void> {
    await printTable('playlists');
    const idPlaylist: string = await prompt('Digite o ID da playlist:');

    const query = {
        text: `
          SELECT
            id_playlist,
            TO_CHAR(INTERVAL '1 second' * SUM(EXTRACT(EPOCH FROM m.duracao)), 'MI:SS') AS duracao_total
          FROM historicos h
          JOIN musicas m ON h.id_musica = m.id_musica
          WHERE h.id_playlist = $1
          GROUP BY id_playlist;
        `,
        values: [idPlaylist],
    };

    const client = await pool.connect();
    try {
        const result: QueryResult = await client.query(query);
        console.table(result.rows);
    } finally {
        client.release();
    }
}

async function menu(): Promise<void> {
    console.log();
    console.log('Informe o número da opção que deseja executar: ');
    console.log('1 - Inserir um novo usuário (ouvinte)');
    console.log('2 - Inserir uma nova playlist');
    console.log('3 - Inserir na biblioteca');
    console.log('4 - Inserir uma nova música');
    console.log('5 - Inserir no histórico');
    console.log();
    console.log('6 - Exibir todos os usuários');
    console.log('7 - Exibir todas as playlists');
    console.log('8 - Exibir todas as bibliotecas');
    console.log('9 - Exibir todas as músicas');
    console.log('10 - Exibir todos os históricos');
    console.log();
    console.log('11 - Exibir musicas de uma playlist');
    console.log('12 - Duracao total de uma playlist');
    console.log('\nDigite qualquer outro valor para sair');

    const optionString = await prompt('Sua opção: ');
    const option = parseInt(optionString);

    switch (option) {
        case 1:
            await inserirOuvinte();
            break;
        case 2:
            await inserirPlaylist();
            break;
        case 3:
            await inserirBiblioteca();
            break;
        case 4:
            await inserirMusica();
            break;
        case 5:
            await inserirHistorico();
            break;
        case 6:
            await printTable('usuarios');
            break;
        case 7:
            await printTable('playlists');
            break;
        case 8:
            await printTable('bibliotecas');
            break;
        case 9:
            await printTable('musicas');
            break;
        case 10:
            await printTable('historicos');
            break;
        case 11:
            await musicasPlaylist();
            break;
        case 12:
            await duracaoPlaylist();
            break;
        default:
            console.log('Saindo do programa.');
            process.exit(0);
    }

    await menu();
}

menu();

