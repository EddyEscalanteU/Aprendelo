--
-- Base de datos: `nodoscognitivos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `ID` int(11) NOT NULL,
  `INICIO` datetime NOT NULL,
  `FIN` datetime NOT NULL,
  `ID_PERSONA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`ID`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'Administrador', 'El big boss'),
(2, 'Cliente', 'Capacitado para crear sus nodos cognitivos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cu`
--

CREATE TABLE `cu` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `POSICION` varchar(10) DEFAULT NULL,
  `ID_MODULO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(150) NOT NULL,
  `HABILITADO` bit(1) NOT NULL DEFAULT b'0',
  `CONCLUIDO` bit(1) DEFAULT b'0',
  `PUNTAJE` int(11) DEFAULT NULL,
  `ID_PERSONA` int(11) NOT NULL,
  `ESTADO` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`ID`, `NOMBRE`, `DESCRIPCION`, `HABILITADO`, `CONCLUIDO`, `PUNTAJE`, `ID_PERSONA`, `ESTADO`) VALUES
(1, 'Introducción a la informática', 'Materia del primer semestre. Sumamente esencial para las carreras de ciencias de la computación.', b'0', b'0', NULL, 4, b'1'),
(2, 'Cálculo I', 'Materia del primer semestre de todas las carreras relacionadas con ingeniería.', b'0', b'0', NULL, 4, b'1'),
(4, 'Sistemas de información I', 'Materia importante de las carreras de Informática y Sistemas.', b'0', b'0', NULL, 4, b'1'),
(5, 'Base de datos I', 'Ing. Veizaga', b'0', b'0', NULL, 4, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_bitacora`
--

CREATE TABLE `detalle_bitacora` (
  `ID` int(11) NOT NULL,
  `ID_BITACORA` int(11) NOT NULL,
  `ACCION` varchar(50) NOT NULL,
  `HORA` datetime NOT NULL,
  `TABLA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cu`
--

CREATE TABLE `detalle_cu` (
  `ID` int(11) NOT NULL,
  `ID_CU` int(11) NOT NULL,
  `IDCARGO` int(11) NOT NULL,
  `HABILITADO` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nodo`
--

CREATE TABLE `nodo` (
  `ID` int(11) NOT NULL,
  `TITULO` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `APROBADO` bit(1) DEFAULT b'0',
  `HABILITADO` bit(1) DEFAULT b'0',
  `ID_CURSO` int(11) NOT NULL,
  `ESTADO` bit(1) DEFAULT b'1',
  `RAIZ` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nodo`
--

INSERT INTO `nodo` (`ID`, `TITULO`, `DESCRIPCION`, `APROBADO`, `HABILITADO`, `ID_CURSO`, `ESTADO`, `RAIZ`) VALUES
(1, 'Sistemas de representación de la información', 'Unidad la cual contiene Sistemas de numeración y Representación de la información.', b'0', b'0', 1, b'1', b'0'),
(2, 'Fundamentos de programación', 'Unidad en la que se describe la metodología de resolución de problemas y los métodos y técnicas de programación.', b'0', b'0', 1, b'1', b'0'),
(3, 'Desarrollo de algoritmos', 'Unidad en la cual se desarrollarán algoritmos para dar solución a problemas específicos mediante el uso de Estructuras, Procesos y las herramientas para simbolizar soluciones.', b'0', b'0', 1, b'1', b'0'),
(8, 'Teoría General de Sistemas (TGS)', 'Unidad del diablo', b'0', b'1', 4, b'1', b'1'),
(9, 'Derivadas', 'Anti-integrales', b'0', b'1', 2, b'0', b'1'),
(10, 'Introducción al diseño de Bases de Datos', 'Primer tema de la materia, Base de Datos I.', b'0', b'1', 5, b'1', b'1'),
(11, 'Paradigmas de desarrollo de sotware', 'Segundo tema de SI.', b'0', b'0', 4, b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ID` int(11) NOT NULL,
  `PASS` varchar(10) NOT NULL,
  `CI` varchar(15) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `NICK` varchar(15) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `ESTADO` bit(1) DEFAULT b'1',
  `IDCARGO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ID`, `PASS`, `CI`, `NOMBRE`, `NICK`, `EMAIL`, `ESTADO`, `IDCARGO`) VALUES
(1, '123', '8460428 LP', 'Genaro Alvarez', 'Naro', 'naroalvarez97@gmail.com', b'1', 1),
(3, '123', '', 'Natalia Oviedo', 'Naty', 'natalia_o_95@hotmail.com', b'1', 1),
(4, '123', '', 'Eddy Escalante', 'Eddy', 'eddy,escalante.u@hotmail.com', b'1', 2),
(5, '123', '', 'Joaquin Chumacero', 'Chumi', 'joaquinchuma@gmail.com', b'1', 2),
(6, '8460428 SC', '8460428 SC', 'Pedro Gutierrez', 'Pedro', 'pedro@gmail.com', b'1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre`
--

CREATE TABLE `pre` (
  `ID_NODO` int(11) NOT NULL,
  `ID_PRE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pre`
--

INSERT INTO `pre` (`ID_NODO`, `ID_PRE`) VALUES
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `ID` int(11) NOT NULL,
  `DESCRIPCION` varchar(20) NOT NULL,
  `PUNTAJE` int(11) NOT NULL,
  `ID_TIPO` int(11) NOT NULL,
  `ID_SUBNODO` int(11) NOT NULL,
  `ESTADO` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `ID` int(11) NOT NULL,
  `ID_PREGUNTA` int(11) NOT NULL,
  `DESCRIPCION` varchar(20) NOT NULL,
  `APROBADO` bit(1) DEFAULT b'0',
  `COMENTARIO` varchar(15) NOT NULL,
  `ID_SUBNODO` int(11) NOT NULL,
  `ESTADO` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subnodo`
--

CREATE TABLE `subnodo` (
  `ID` int(11) NOT NULL,
  `ID_NODO` int(11) NOT NULL,
  `TITULO` varchar(50) NOT NULL,
  `CONTENIDO` text NOT NULL,
  `APROBADO` bit(1) DEFAULT b'0',
  `HABILITADO` bit(1) DEFAULT b'0',
  `PUNTAJE` int(11) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pregunta`
--

CREATE TABLE `tipo_pregunta` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PERSONA` (`ID_PERSONA`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `cu`
--
ALTER TABLE `cu`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_MODULO` (`ID_MODULO`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PERSONA` (`ID_PERSONA`);

--
-- Indices de la tabla `detalle_bitacora`
--
ALTER TABLE `detalle_bitacora`
  ADD PRIMARY KEY (`ID_BITACORA`,`ID`);

--
-- Indices de la tabla `detalle_cu`
--
ALTER TABLE `detalle_cu`
  ADD PRIMARY KEY (`ID_CU`,`ID`),
  ADD KEY `IDCARGO` (`IDCARGO`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `nodo`
--
ALTER TABLE `nodo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_CURSO` (`ID_CURSO`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDCARGO` (`IDCARGO`);

--
-- Indices de la tabla `pre`
--
ALTER TABLE `pre`
  ADD PRIMARY KEY (`ID_PRE`,`ID_NODO`),
  ADD KEY `ID_NODO` (`ID_NODO`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_TIPO` (`ID_TIPO`),
  ADD KEY `ID_SUBNODO` (`ID_SUBNODO`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`ID_PREGUNTA`,`ID`),
  ADD KEY `ID_SUBNODO` (`ID_SUBNODO`);

--
-- Indices de la tabla `subnodo`
--
ALTER TABLE `subnodo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_NODO` (`ID_NODO`);

--
-- Indices de la tabla `tipo_pregunta`
--
ALTER TABLE `tipo_pregunta`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `nodo`
--
ALTER TABLE `nodo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `subnodo`
--
ALTER TABLE `subnodo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`ID_PERSONA`) REFERENCES `persona` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cu`
--
ALTER TABLE `cu`
  ADD CONSTRAINT `cu_ibfk_1` FOREIGN KEY (`ID_MODULO`) REFERENCES `modulo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`ID_PERSONA`) REFERENCES `persona` (`ID`);

--
-- Filtros para la tabla `detalle_bitacora`
--
ALTER TABLE `detalle_bitacora`
  ADD CONSTRAINT `detalle_bitacora_ibfk_1` FOREIGN KEY (`ID_BITACORA`) REFERENCES `bitacora` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_cu`
--
ALTER TABLE `detalle_cu`
  ADD CONSTRAINT `detalle_cu_ibfk_1` FOREIGN KEY (`ID_CU`) REFERENCES `cu` (`ID`),
  ADD CONSTRAINT `detalle_cu_ibfk_2` FOREIGN KEY (`IDCARGO`) REFERENCES `cargo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nodo`
--
ALTER TABLE `nodo`
  ADD CONSTRAINT `nodo_ibfk_1` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`IDCARGO`) REFERENCES `cargo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pre`
--
ALTER TABLE `pre`
  ADD CONSTRAINT `pre_ibfk_1` FOREIGN KEY (`ID_NODO`) REFERENCES `nodo` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pre_ibfk_2` FOREIGN KEY (`ID_PRE`) REFERENCES `nodo` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`ID_TIPO`) REFERENCES `tipo_pregunta` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`ID_SUBNODO`) REFERENCES `subnodo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `pregunta` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `respuesta_ibfk_2` FOREIGN KEY (`ID_SUBNODO`) REFERENCES `subnodo` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `subnodo`
--
ALTER TABLE `subnodo`
  ADD CONSTRAINT `subnodo_ibfk_1` FOREIGN KEY (`ID_NODO`) REFERENCES `nodo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
