var quizModel = require("../models/quizModel");

function salvarTentativa(req, res){

    var fkUsuario = req.body.fkUsuario;
    var fkQuiz = req.body.fkQuiz;
    var pontuacao = req.body.pontuacao;

    quizModel.salvarTentativa(fkUsuario, fkQuiz, pontuacao)
    .then(function(resultado){
        res.status(200).json(resultado);
    })
    .catch(function(erro){
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });

}


function buscarMediaQuiz(req, res){

    var idUsuario = req.params.idUsuario;

    quizModel.buscarMediaQuiz(idUsuario)
    .then(function(resultado){
        res.json(resultado);
    });
}

function buscarGraficoRedondo(req, res){

    var idUsuario = req.params.idUsuario;

    quizModel.buscarGraficoRedondo(idUsuario)
    .then(function(resultado){
        res.json(resultado);
    });
}

function buscarKPIs(req, res){

    var idUsuario = req.params.idUsuario;

    quizModel.buscarKPIs(idUsuario)
    .then(function(resultado){
        res.json(resultado);
    });

}

module.exports = {
    salvarTentativa,
    buscarMediaQuiz,
    buscarGraficoRedondo,
    buscarKPIs
}