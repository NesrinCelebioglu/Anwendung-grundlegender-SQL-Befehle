
-- Erstellen Sie eine Datenbank mit dem Namen HR und erstellen Sie in dieser Datenbank die dargestellten Tabellen, indem Sie SQL-Code schreiben.
CREATE DATABASE HR

CREATE TABLE PERSON
( ID INT IDENTITY(1,1) PRIMARY KEY,
CODE VARCHAR(10),
TCNUMBER VARCHAR(11),
NAME_ VARCHAR(50),
SURNAME VARCHAR(50),
GENDER VARCHAR(1),
BIRTHDATE DATE,
INDATE DATE,
OUTDATE DATE,
DEPARTMENTID INT,
POSITIONID INT,
PARENTPOSITIONID INT,
MANAGERID INT,
TELNR VARCHAR(15),
SALARY FLOAT)

SELECT * FROM PERSON

--1. Schreiben Sie die SQL-Abfrage, die den Vornamen, Nachnamen und das Gehalt aller Mitarbeiter abruft.
SELECT [NAME_],[SURNAME],[SALARY]
  FROM PERSON

--2. Schreiben Sie eine Abfrage, die nur die Namen, Nachnamen und Geburtsdaten der weiblichen Mitarbeiter (GENDER = 'K') auflistet.
SELECT  [NAME_],[SURNAME],[BIRTHDATE]
 FROM PERSON
 WHERE GENDER = 'K'
 
--3. Listen Sie die Namen und die Einstellungsdaten der Mitarbeiter auf, die nach dem Jahr 2017 eingestellt wurden.
SELECT  [NAME_],[SURNAME],[INDATE]
  FROM PERSON
  WHERE INDATE > '2017-12-31' 

--4. Fügen Sie einen neuen Mitarbeiter hinzu (Beispiel: Ali Veli, TC-Nummer: 12345678901, männlich, geboren am 05.12.1985, eingestellt am 15.01.2022, Abteilung: 3, Position: 40, Gehalt: 6000)
INSERT INTO PERSON
([NAME_],[SURNAME],[TCNUMBER],[GENDER],[BIRTHDATE],[INDATE],[DEPARTMENTID],[POSITIONID],[SALARY])  
VALUES ('Ali', 'Veli', '12345678901', 'E', '1985-12-05', '2022-01-15', 3, 40, 6000)

SELECT * FROM PERSON

--5. Aktualisieren Sie das Gehalt von Ferhat Cinar auf 6000.
UPDATE PERSON
SET  [SALARY]=6000  
WHERE [NAME_]= 'Ferhat' AND [SURNAME]= 'CINAR'

SELECT * FROM PERSON
WHERE [NAME_]= 'Ferhat' AND [SURNAME] = 'CINAR'

--6. Löschen Sie Deniz Eravcı aus der Datenbank.

DELETE FROM PERSON WHERE [NAME_]= 'Deniz' AND [SURNAME] = 'ERAVCI'

SELECT * FROM PERSON WHERE [NAME_]= 'Deniz' 

--7. Listen Sie die Mitarbeiter auf, die vor 1960 geboren wurden.
SELECT [NAME_],[SURNAME],[BIRTHDATE]
FROM   PERSON
WHERE [BIRTHDATE] < '1960-01-01'

--8. Listen Sie die Mitarbeiter auf, deren Geburtsdatum vor 1960 liegt und deren Gehalt über 5000 liegt.
SELECT [NAME_],[SURNAME],[BIRTHDATE],[SALARY]
FROM   PERSON
WHERE [BIRTHDATE] < '1960-01-01' AND [SALARY]> 5000

--9. Listen Sie die Mitarbeiter auf, deren Abteilungs-ID 4 ist oder deren Gehalt über 5500 liegt.
SELECT [NAME_],[SURNAME],[DEPARTMENTID],[SALARY]
FROM   PERSON
WHERE [DEPARTMENTID]=4  OR [SALARY]> 5500

--10. Erhöhen Sie das Gehalt der Mitarbeiter um 10 %, deren Austrittsdatum (OUTDATE) NULL ist
UPDATE PERSON
SET [SALARY] = [SALARY]* 1.10  
WHERE [OUTDATE] IS NULL

SELECT * FROM PERSON WHERE [OUTDATE] IS NULL

--11. Löschen Sie die Mitarbeiter, die vor 2015 eingestellt wurden und deren Gehalt unter 5000 liegt.
DELETE FROM PERSON
WHERE [INDATE]< '2015-01-01'  
AND [SALARY] < 5000

--12. Listen Sie, wie viele verschiedene Abteilungen im Datensatz vorhanden sind.

SELECT DISTINCT [DEPARTMENTID] FROM PERSON 

--Ermitteln Sie, wie viele verschiedene Abteilungen im Datensatz vorhanden sind.

SELECT COUNT(DISTINCT [DEPARTMENTID] ) AS  unique_department_count  
FROM PERSON

--13. Sortieren Sie die Mitarbeiter nach ihrem Gehalt von höchstem zu niedrigstem.
SELECT [NAME_],[SURNAME],[SALARY]
FROM PERSON
ORDER BY [SALARY] DESC


--14. Listen Sie die 5 Mitarbeiter mit dem höchsten Gehalt auf.
SELECT TOP 5 [NAME_],[SURNAME],[SALARY]
FROM PERSON
ORDER BY [SALARY] DESC