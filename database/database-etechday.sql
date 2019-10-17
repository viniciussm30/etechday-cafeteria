-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para etechday
CREATE DATABASE IF NOT EXISTS `etechday` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `etechday`;

-- Copiando estrutura para tabela etechday.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATAHORA_CRIACAO` datetime DEFAULT NULL,
  `TOTAL` decimal(15,2) DEFAULT NULL,
  `REALIZADO_POR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_REALIZADO_POR_USUARIO` (`REALIZADO_POR`),
  CONSTRAINT `FK_REALIZADO_POR_USUARIO` FOREIGN KEY (`REALIZADO_POR`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='registrar os pedidos';

-- Copiando dados para a tabela etechday.pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT IGNORE INTO `pedido` (`ID`, `DATAHORA_CRIACAO`, `TOTAL`, `REALIZADO_POR`) VALUES
	(2, '2019-10-16 00:00:00', NULL, 1),
	(3, '2019-10-16 00:00:00', NULL, 1),
	(4, '2019-10-16 00:00:00', NULL, 1),
	(5, '2019-10-16 00:00:00', NULL, 1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela etechday.pedido_item
CREATE TABLE IF NOT EXISTS `pedido_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUTO_ID` int(11) NOT NULL,
  `QTDE` int(11) NOT NULL,
  `VALOR_UNIT` decimal(15,2) NOT NULL,
  `VALOR_TOTAL` decimal(15,2) unsigned NOT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'A' COMMENT 'A=ATIVO = I=INATIVO',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUTO_ID_PRODUTO` (`PRODUTO_ID`),
  CONSTRAINT `FK_PRODUTO_ID_PRODUTO` FOREIGN KEY (`PRODUTO_ID`) REFERENCES `produto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='detalhamento dos itens de um pedido';

-- Copiando dados para a tabela etechday.pedido_item: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_item` ENABLE KEYS */;

-- Copiando estrutura para tabela etechday.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(100) DEFAULT NULL,
  `VALOR` decimal(15,2) DEFAULT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'A' COMMENT 'A=ATIVO | I=INATIVO',
  `CATEGORIA_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATUS` (`STATUS`),
  KEY `FK_CATEGORIA_ID_PRODUTO_CATEGORIA` (`CATEGORIA_ID`),
  CONSTRAINT `FK_CATEGORIA_ID_PRODUTO_CATEGORIA` FOREIGN KEY (`CATEGORIA_ID`) REFERENCES `produto_categoria` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='tabela de produtos';

-- Copiando dados para a tabela etechday.produto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT IGNORE INTO `produto` (`ID`, `DESCRICAO`, `VALOR`, `STATUS`, `CATEGORIA_ID`) VALUES
	(4, 'café pequeno', 5.50, 'A', 1),
	(5, 'café grande', 7.50, 'A', 1),
	(6, 'café médio', 9.50, 'A', 1),
	(7, 'capuccino com nozes', 9.50, 'A', 2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela etechday.produto_categoria
CREATE TABLE IF NOT EXISTS `produto_categoria` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela etechday.produto_categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produto_categoria` DISABLE KEYS */;
INSERT IGNORE INTO `produto_categoria` (`ID`, `DESCRICAO`) VALUES
	(1, 'café'),
	(2, 'capuccino'),
	(3, 'bolo');
/*!40000 ALTER TABLE `produto_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela etechday.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) DEFAULT NULL,
  `LOGIN` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='tabela de usuários para realização de login';

-- Copiando dados para a tabela etechday.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT IGNORE INTO `usuario` (`ID`, `NOME`, `LOGIN`, `PASSWORD`) VALUES
	(1, 'Guilherme Lobo', 'guilherme', 'lobo123'),
	(2, 'Gustavo Pereira', 'gustavo', 'gu123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
