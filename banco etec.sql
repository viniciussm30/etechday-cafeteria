-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.24 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para etec
CREATE DATABASE IF NOT EXISTS `etec` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `etec`;

-- Copiando estrutura para tabela etec.alunos
CREATE TABLE IF NOT EXISTS `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `rm` varchar(10) NOT NULL,
  `data_nascimento` date NOT NULL,
  `rg` varchar(30) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `idCidade` int(11) NOT NULL,
  `status_matricula` varchar(50) NOT NULL DEFAULT 'M' COMMENT 'MT = matricula trancada; M = matriculado',
  PRIMARY KEY (`id`),
  KEY `FK_alunos_curso` (`idCurso`),
  KEY `FK_alunos_cidade` (`idCidade`),
  CONSTRAINT `FK_alunos_cidade` FOREIGN KEY (`idCidade`) REFERENCES `cidade` (`id`),
  CONSTRAINT `FK_alunos_curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela etec.alunos: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` (`id`, `nome`, `rm`, `data_nascimento`, `rg`, `idCurso`, `idCidade`, `status_matricula`) VALUES
	(16, 'Vinícius ', '12980', '2003-06-30', '9009812378', 1, 5, 'M'),
	(18, 'Bruna', '90781', '2000-08-15', '8709845678', 1, 7, 'M'),
	(26, 'Pedro', '89276', '2000-03-20', '7865423412', 1, 5, 'MT'),
	(29, 'Rafaela', '72829', '2000-07-06', '8962541562', 4, 4, 'M'),
	(31, 'Malu', '82712', '1999-12-06', '7856142573', 1, 5, 'MT');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;

-- Copiando estrutura para tabela etec.cidade
CREATE TABLE IF NOT EXISTS `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `idUF` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cidade_estado` (`idUF`),
  CONSTRAINT `FK_cidade_estado` FOREIGN KEY (`idUF`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela etec.cidade: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` (`id`, `nome`, `idUF`) VALUES
	(1, 'Cafelândia', 1),
	(4, 'Promissão', 1),
	(5, 'Bauru', 1),
	(6, 'Rio de Janeito', 2),
	(7, 'Lins', 1);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;

-- Copiando estrutura para tabela etec.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(90) NOT NULL,
  `etec` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela etec.curso: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` (`id`, `nome`, `etec`) VALUES
	(1, 'Téc. em Informática', 'Cafelândia'),
	(2, 'Téc. em Recursos Humano', 'Cafelândia'),
	(3, 'Téc. em Administração', 'Cafelândia'),
	(4, 'Téc. em Marketing', 'Lins');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;

-- Copiando estrutura para tabela etec.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela etec.estado: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`id`, `nome`) VALUES
	(1, 'São Paulo'),
	(2, 'Rio de Janeiro'),
	(3, 'Amazonas'),
	(4, 'Ceará');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

-- Copiando estrutura para tabela etec.materia
CREATE TABLE IF NOT EXISTS `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` longtext NOT NULL,
  `idCurso` int(11) NOT NULL,
  `idProfessor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_materia_curso` (`idCurso`),
  KEY `FK_materia_professor` (`idProfessor`),
  CONSTRAINT `FK_materia_curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`id`),
  CONSTRAINT `FK_materia_professor` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela etec.materia: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` (`id`, `nome`, `descricao`, `idCurso`, `idProfessor`) VALUES
	(6, 'Banco de Dados III', 'Finalizar o conceito de Banco de Dados', 1, 5),
	(11, 'Inglês Instrumental', 'Apresentar conceitos da área de trabalho', 3, 12),
	(12, 'Programação WEB III', 'Apresentar o PWA', 1, 13);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;

-- Copiando estrutura para tabela etec.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(90) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `idCidade` int(11) NOT NULL,
  `dataNascimento` date NOT NULL,
  `coordernador` bit(1) NOT NULL COMMENT '0 -> Não é | 1 -> É',
  PRIMARY KEY (`id`),
  KEY `FK_professor_curso` (`idCurso`),
  KEY `FK_professor_cidade` (`idCidade`),
  CONSTRAINT `FK_professor_cidade` FOREIGN KEY (`idCidade`) REFERENCES `cidade` (`id`),
  CONSTRAINT `FK_professor_curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela etec.professor: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` (`id`, `nome`, `idCurso`, `idCidade`, `dataNascimento`, `coordernador`) VALUES
	(5, 'Guilherme Lobo', 1, 4, '1982-06-20', b'0'),
	(8, 'Diego', 1, 1, '1989-02-20', b'1'),
	(11, 'Rafael', 1, 5, '1980-04-20', b'0'),
	(12, 'Mariana', 3, 7, '1992-08-18', b'0'),
	(13, 'Adriano', 1, 7, '1990-04-20', b'0'),
	(16, 'Everton', 1, 1, '1992-09-20', b'0'),
	(17, 'Denis', 3, 1, '1896-12-02', b'1'),
	(21, 'Luis Gustavo', 4, 7, '2020-07-06', b'1'),
	(30, 'Giovana', 3, 4, '1990-08-06', b'1');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
