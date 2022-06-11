
--
-- Table data for table `estado`
--
INSERT INTO `estado` VALUES (1,'Habilitado'),(2,'Deshabilitado');

--
-- Table data for table `estado_mensaje`
--
INSERT INTO `estado_mensaje` VALUES (1,'No Gestionado'),(2,'Asignado'),(3,'Gestionado'),(4,'Anulado');


--
-- Table data for table `rama_estadistica`
--
INSERT INTO `rama_estadistica` VALUES (1,1,'Descriptiva','ESTADÍSTICA DESCRIPTIVA','/descriptiva'),(2,1,'Inferencial','ESTADÍSTICA INFERENCIAL','/inferencial');

--
-- Table data for table `tema_rama`
--
INSERT INTO `tema_rama` VALUES (1,2,1,'PRUEBA DE INDEPENDENCIA','/prueba-independencia'),(2,2,1,'PRUEBA DE HIPÓTESIS PARA LA MEDIA POBLACIONAL','/prueba-hipotesis-media-poblacional');


--
-- Table data for table `tipo_usuario`
--
INSERT INTO `tipo_usuario` VALUES (1,1,'Administrador'),(2,1,'Gestor');


--
-- Table data for table `usuario`
--
INSERT INTO `usuario` VALUES (1,1,1,'MPOMA','123','Miguel Angel Poma Hinostroza','pomahinostroza.miguel@gmail.com');
