-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Nov-2020 às 11:53
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `controleteste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `cidcod` int(11) NOT NULL,
  `cidnome` varchar(50) NOT NULL,
  `estado_estcod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `escopo`
--

CREATE TABLE `escopo` (
  `esccod` int(11) NOT NULL,
  `escnome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `estcod` int(11) NOT NULL,
  `estnome` varchar(50) NOT NULL,
  `estsigla` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

CREATE TABLE `fabricante` (
  `idFabricante` int(11) NOT NULL,
  `NomeFabricante` varchar(75) NOT NULL,
  `CNPJFabricante` varchar(75) NOT NULL,
  `EmailFabricante` varchar(75) NOT NULL,
  `EnderecoFabricante` varchar(75) NOT NULL,
  `TelefoneFabricante` varchar(45) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fabricante`
--

INSERT INTO `fabricante` (`idFabricante`, `NomeFabricante`, `CNPJFabricante`, `EmailFabricante`, `EnderecoFabricante`, `TelefoneFabricante`, `Usuario_idUser`) VALUES
(1, 'dfgfdg', '45435', 'fgdfgfd@sdsad.com', 'redfgdfg', '46 32250000', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gerente`
--

CREATE TABLE `gerente` (
  `gercod` int(11) NOT NULL,
  `gerusername` varchar(50) NOT NULL,
  `gernome` varchar(50) NOT NULL,
  `geremail` varchar(50) NOT NULL,
  `gersenha` varchar(50) NOT NULL,
  `gerimagem` varchar(100) DEFAULT NULL,
  `gerfone` varchar(20) NOT NULL,
  `gerpermissao` int(11) NOT NULL,
  `escopo_esccod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE `itens` (
  `idItens` int(11) NOT NULL,
  `QuantItens` int(11) NOT NULL,
  `QuantItensVend` int(11) NOT NULL,
  `ValCompItens` decimal(10,0) NOT NULL,
  `ValVendItens` decimal(10,0) NOT NULL,
  `DataCompraItens` date NOT NULL,
  `DataVenci_Itens` date DEFAULT NULL,
  `Ativo` tinyint(4) NOT NULL,
  `Produto_CodRefProduto` int(11) NOT NULL,
  `Fabricante_idFabricante` int(11) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`idItens`, `QuantItens`, `QuantItensVend`, `ValCompItens`, `ValVendItens`, `DataCompraItens`, `DataVenci_Itens`, `Ativo`, `Produto_CodRefProduto`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES
(1, 1, 0, '50', '80', '0000-00-00', '0000-00-00', 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `joresp`
--

CREATE TABLE `joresp` (
  `jorespcod` int(11) NOT NULL,
  `jorespinicial` time DEFAULT NULL,
  `jorespfinal` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jorinter`
--

CREATE TABLE `jorinter` (
  `jorintercod` int(11) NOT NULL,
  `jorinterinicial` time DEFAULT NULL,
  `jorinterfinal` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jornada`
--

CREATE TABLE `jornada` (
  `jorcod` int(11) NOT NULL,
  `jortitulo` varchar(45) DEFAULT NULL,
  `jordia` date DEFAULT NULL,
  `jorhorainicio` time DEFAULT NULL,
  `jorhorafinal` time DEFAULT NULL,
  `jorhoraext` varchar(45) DEFAULT NULL,
  `jordescanso` varchar(45) DEFAULT NULL,
  `motorista_motcod` int(11) NOT NULL,
  `jorinter_jorintercod` int(11) NOT NULL,
  `jorref_jorrefcod` int(11) NOT NULL,
  `joresp_jorespcod` int(11) NOT NULL,
  `cidade_cidcod` int(11) NOT NULL,
  `veiculo_veicod` int(11) NOT NULL,
  `gerente_gercod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jorref`
--

CREATE TABLE `jorref` (
  `jorrefcod` int(11) NOT NULL,
  `jorrefinicial` time DEFAULT NULL,
  `jorreffinal` time DEFAULT NULL,
  `jorrefcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `motorista`
--

CREATE TABLE `motorista` (
  `motcod` int(11) NOT NULL,
  `motnome` varchar(45) DEFAULT NULL,
  `motrua` varchar(45) DEFAULT NULL,
  `motbairro` varchar(45) DEFAULT NULL,
  `motcidade` varchar(45) DEFAULT NULL,
  `motestado` varchar(45) DEFAULT NULL,
  `motemail` varchar(45) DEFAULT NULL,
  `motsenha` varchar(45) DEFAULT NULL,
  `motfone` varchar(45) DEFAULT NULL,
  `motcpf` varchar(45) DEFAULT NULL,
  `motrg` varchar(45) DEFAULT NULL,
  `motcnh` varchar(45) DEFAULT NULL,
  `motdtadmissao` varchar(45) DEFAULT NULL,
  `motdtafast` varchar(45) DEFAULT NULL,
  `motsituacao` varchar(45) DEFAULT NULL,
  `gerente_gercod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `CodRefProduto` int(11) NOT NULL,
  `NomeProduto` varchar(75) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`CodRefProduto`, `NomeProduto`, `Usuario_idUser`) VALUES
(1, 'bdfgd', 1),
(2, 'dsdsfdsf', 1),
(3, 'sadsad', 1),
(4, 'Bagulho', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `regrasjornada`
--

CREATE TABLE `regrasjornada` (
  `rjocod` int(11) NOT NULL,
  `rjotrabinint` varchar(45) DEFAULT NULL,
  `rjodesc` varchar(45) DEFAULT NULL,
  `rjodescinint` varchar(45) DEFAULT NULL,
  `rjorefeicao` varchar(45) DEFAULT NULL,
  `rjomaxdia` varchar(45) DEFAULT NULL,
  `rjoextra` varchar(45) DEFAULT NULL,
  `rjoesprep` varchar(45) DEFAULT NULL,
  `rjodescinter` varchar(45) DEFAULT NULL,
  `tpveiculo_tpvcod` int(11) NOT NULL,
  `jornada_jorcod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `representante`
--

CREATE TABLE `representante` (
  `idRepresentante` int(11) NOT NULL,
  `NomeRepresentante` varchar(75) NOT NULL,
  `TelefoneRepresentante` varchar(45) NOT NULL,
  `EmailRepresentante` varchar(45) NOT NULL,
  `Fabricante_idFabricante` int(11) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `representante`
--

INSERT INTO `representante` (`idRepresentante`, `NomeRepresentante`, `TelefoneRepresentante`, `EmailRepresentante`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES
(1, 'dsfdsf', '46 99999999', 'vinicius@teste.com', 1, 1),
(2, 'dsfdsf', '46 99999999', 'vinicius@teste.com', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tpveiculo`
--

CREATE TABLE `tpveiculo` (
  `tpvcod` int(11) NOT NULL,
  `tpvnome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Email` varchar(75) NOT NULL,
  `Password` varchar(75) NOT NULL,
  `Dataregistro` date NOT NULL,
  `Permissao` tinyint(4) NOT NULL,
  `imagem` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `Username`, `Email`, `Password`, `Dataregistro`, `Permissao`, `imagem`) VALUES
(1, 'vinicius', 'vinicius@teste.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-03', 1, 'dist/img/avatar5.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `veicod` int(11) NOT NULL,
  `veiplaca` varchar(10) DEFAULT NULL,
  `veiano` varchar(45) DEFAULT NULL,
  `veimodelo` varchar(45) DEFAULT NULL,
  `tpveiculo_tpvcod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`cidcod`),
  ADD KEY `fk_cidade_estado1_idx` (`estado_estcod`);

--
-- Índices para tabela `escopo`
--
ALTER TABLE `escopo`
  ADD PRIMARY KEY (`esccod`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`estcod`);

--
-- Índices para tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`idFabricante`),
  ADD KEY `fk_Fabricante_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`gercod`),
  ADD KEY `fk_gerente_escopo1_idx` (`escopo_esccod`);

--
-- Índices para tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`idItens`),
  ADD KEY `fk_Itens_Produto1_idx` (`Produto_CodRefProduto`),
  ADD KEY `fk_Itens_Fabricante1_idx` (`Fabricante_idFabricante`),
  ADD KEY `fk_Itens_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `joresp`
--
ALTER TABLE `joresp`
  ADD PRIMARY KEY (`jorespcod`);

--
-- Índices para tabela `jorinter`
--
ALTER TABLE `jorinter`
  ADD PRIMARY KEY (`jorintercod`);

--
-- Índices para tabela `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`jorcod`),
  ADD KEY `fk_jornada_motorista1_idx` (`motorista_motcod`),
  ADD KEY `fk_jornada_jorinter1_idx` (`jorinter_jorintercod`),
  ADD KEY `fk_jornada_jorref1_idx` (`jorref_jorrefcod`),
  ADD KEY `fk_jornada_joresp1_idx` (`joresp_jorespcod`),
  ADD KEY `fk_jornada_cidade1_idx` (`cidade_cidcod`),
  ADD KEY `fk_jornada_veiculo1_idx` (`veiculo_veicod`),
  ADD KEY `fk_jornada_gerente1_idx` (`gerente_gercod`);

--
-- Índices para tabela `jorref`
--
ALTER TABLE `jorref`
  ADD PRIMARY KEY (`jorrefcod`);

--
-- Índices para tabela `motorista`
--
ALTER TABLE `motorista`
  ADD PRIMARY KEY (`motcod`),
  ADD KEY `fk_motorista_gerente1_idx` (`gerente_gercod`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`CodRefProduto`),
  ADD KEY `fk_Produto_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `regrasjornada`
--
ALTER TABLE `regrasjornada`
  ADD PRIMARY KEY (`rjocod`),
  ADD KEY `fk_regrasjornada_tpveiculo1_idx` (`tpveiculo_tpvcod`),
  ADD KEY `fk_regrasjornada_jornada1_idx` (`jornada_jorcod`);

--
-- Índices para tabela `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`idRepresentante`),
  ADD KEY `fk_Representante_Fabricante1_idx` (`Fabricante_idFabricante`),
  ADD KEY `fk_Representante_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `tpveiculo`
--
ALTER TABLE `tpveiculo`
  ADD PRIMARY KEY (`tpvcod`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`);

--
-- Índices para tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`veicod`),
  ADD KEY `fk_veiculo_tpveiculo1_idx` (`tpveiculo_tpvcod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `cidcod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `escopo`
--
ALTER TABLE `escopo`
  MODIFY `esccod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `estcod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `idFabricante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `gerente`
--
ALTER TABLE `gerente`
  MODIFY `gercod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `idItens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `joresp`
--
ALTER TABLE `joresp`
  MODIFY `jorespcod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jorinter`
--
ALTER TABLE `jorinter`
  MODIFY `jorintercod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jorref`
--
ALTER TABLE `jorref`
  MODIFY `jorrefcod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `CodRefProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `representante`
--
ALTER TABLE `representante`
  MODIFY `idRepresentante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `veicod` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_estado1` FOREIGN KEY (`estado_estcod`) REFERENCES `estado` (`estcod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD CONSTRAINT `fk_Fabricante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `fk_gerente_escopo1` FOREIGN KEY (`escopo_esccod`) REFERENCES `escopo` (`esccod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_Itens_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Itens_Produto1` FOREIGN KEY (`Produto_CodRefProduto`) REFERENCES `produto` (`CodRefProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Itens_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `jornada`
--
ALTER TABLE `jornada`
  ADD CONSTRAINT `fk_jornada_cidade1` FOREIGN KEY (`cidade_cidcod`) REFERENCES `cidade` (`cidcod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jornada_gerente1` FOREIGN KEY (`gerente_gercod`) REFERENCES `gerente` (`gercod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jornada_joresp1` FOREIGN KEY (`joresp_jorespcod`) REFERENCES `joresp` (`jorespcod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jornada_jorinter1` FOREIGN KEY (`jorinter_jorintercod`) REFERENCES `jorinter` (`jorintercod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jornada_jorref1` FOREIGN KEY (`jorref_jorrefcod`) REFERENCES `jorref` (`jorrefcod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jornada_motorista1` FOREIGN KEY (`motorista_motcod`) REFERENCES `motorista` (`motcod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jornada_veiculo1` FOREIGN KEY (`veiculo_veicod`) REFERENCES `veiculo` (`veicod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `motorista`
--
ALTER TABLE `motorista`
  ADD CONSTRAINT `fk_motorista_gerente1` FOREIGN KEY (`gerente_gercod`) REFERENCES `gerente` (`gercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_Produto_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `regrasjornada`
--
ALTER TABLE `regrasjornada`
  ADD CONSTRAINT `fk_regrasjornada_jornada1` FOREIGN KEY (`jornada_jorcod`) REFERENCES `jornada` (`jorcod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_regrasjornada_tpveiculo1` FOREIGN KEY (`tpveiculo_tpvcod`) REFERENCES `tpveiculo` (`tpvcod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `representante`
--
ALTER TABLE `representante`
  ADD CONSTRAINT `fk_Representante_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Representante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `fk_veiculo_tpveiculo1` FOREIGN KEY (`tpveiculo_tpvcod`) REFERENCES `tpveiculo` (`tpvcod`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
