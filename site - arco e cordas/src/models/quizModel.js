var database = require("../database/config");

function salvarTentativa(fkUsuario, fkQuiz, pontuacao) {

    var instrucaoSql = `
        INSERT INTO tentativa (fk_usuario, fk_quiz, pontuacao)
        VALUES (${fkUsuario}, ${fkQuiz}, ${pontuacao});
    `;

    console.log("Executando SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

function buscarMediaQuiz(idUsuario) {

    var instrucaoSql = `
    
        SELECT q.titulo,
            ROUND(AVG((t.pontuacao * 100.0) / 20), 1) AS media,
            COUNT(t.id) AS tentativas
        FROM tentativa t
        JOIN quiz q ON t.fk_quiz = q.id
        WHERE t.fk_usuario = ${idUsuario}
        GROUP BY q.id;
    `;

    console.log("Executando SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

function buscarGraficoRedondo(idUsuario) {

    var instrucaoSql = `
        SELECT 
            SUM(t.pontuacao) AS acertos,
            SUM(20 - t.pontuacao) AS erros
        FROM tentativa t
        WHERE t.fk_usuario = ${idUsuario};
    `;

    console.log("Executando SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

function buscarKPIs(idUsuario) {

    var instrucaoSql = `
    
        SELECT 
            COUNT(id) AS tentativas,
            COUNT(DISTINCT fk_quiz) AS quizzesFeitos,
            ROUND((SUM(pontuacao) / (COUNT(*) * 20)) * 100, 1) AS percentualAcertos,
            COUNT(*) * 20 AS perguntasRespondidas
        FROM tentativa
        WHERE fk_usuario = ${idUsuario};
    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    salvarTentativa,
    buscarMediaQuiz,
    buscarGraficoRedondo,
    buscarKPIs
};