use copa;

INSERT INTO GRUPOS (NOME) VALUES
						('A'), ('B'),
						('C'), ('D'),
						('E'), ('F'),
						('G'), ('H');


INSERT INTO COPA.TIMES (ID, NOME, ABREVIACAO, SCORE, FK_ID_GRUPOS)
				  VALUES (1,'CATALÃO','CAT',1442.0,1), (2,'EQUADOR','EQU',1463.7,1),
                         (3,'HOLANDA','HOL',1679.4,1), (4,'SENEGAL','SEN',1584.6,1),
                         (1,'ESTADOS UNIDOS','EUA',1635.0,2), (2,'INGLATERRA','ING',1737.5,2),
                         (3,'IRAQUE','IRA',1558.6,2), (4,'PAÍS DE GALES','GAL',1582.1,2),
						 (1,'ARGENTINA','ARG',1770.7,3), (1,'AUSTRÁLIA','AUS',1483.7,4), 
                         (1,'ALEMANHA','ALE',1659.0,5), (1,'BÉLGICA','BEL',1821.9,6),
                         (1,'BRASIL','BRA',1837.6,7), (1,'CORÉIA DO SUL','COR',1526.0,8),
						 (2,'DINAMARCA','DIN',1665.5,4), (2,'COSTA RICA','COS',1500.1,5),
                         (2,'CANADÁ','CAN',1473.8,6), (2,'CAMARÕES','CAM',1485.0,7),
                         (2,'GANA','GAN',1393.5,8), (3,'MÉXICO','MEX',1649.6,3), 
                         (3,'FRANÇA','FRA',1764.9,4), (3,'ESPANHA','ESP',1716.9,5),
                         (3,'CROÁCIA','CRO',1632.2,6), (3,'SUIÇA','SUI',1621.4,7),
                         (3,'PORTUGAL','POR',1678.7,8), (4,'POLÔNIA','POL',1546.2,3), 
                         (4,'TUNÍSIA','TUN',1507.9,4), (4,'JAPÃO','JAP',1554.7,5),
                         (4,'MARROCOS','MAR',1558.4,6), (4,'SÉRVIA','SER',1549.5,7),
                         (4,'URUGUAI','URU',1641.0,8), (2,'ARÁBIA SAUDITA','ARA',1435.7,3);

                        

create table if not exists TIMES_E_SCORES(        
ID INT NOT NULL auto_increment,
N_GRUPO INT NOT NULL, 
GRUPO CHAR(1) NOT NULL,
TIMES VARCHAR(50) NOT NULL,
FK_ID_GRUPOS INT NOT NULL,
PRIMARY KEY (ID),
CONSTRAINT FK_TIMES_GRUPOS
    FOREIGN KEY (FK_ID_GRUPOS)
    REFERENCES COPA.GRUPOS(ID)
);


INSERT INTO TIMES_E_SCORES(N_GRUPO, TIMES, FK_ID_GRUPOS, GRUPO)
(SELECT t.ID, concat_ws('|', t.ABREVIACAO, t.SCORE), t.FK_ID_GRUPOS, g.NOME  
from grupos as g inner join times as t
on (g.ID = t.FK_ID_GRUPOS)
);


alter table times_e_scores drop column FK_ID_GRUPOS, ORDER BY GRUPO ASC, N_GRUPO ASC;