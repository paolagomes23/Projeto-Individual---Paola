var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.post("/salvarTentativa", function(req, res){
    quizController.salvarTentativa(req, res);
});

router.get("/buscarMediaQuiz/:idUsuario", function(req, res){
    quizController.buscarMediaQuiz(req, res);
});

router.get("/buscarGraficoRedondo/:idUsuario", function(req, res){
    quizController.buscarGraficoRedondo(req, res);
});

router.get("/buscarKPIs/:idUsuario", function(req, res){
    quizController.buscarKPIs(req, res);
});

module.exports = router;


