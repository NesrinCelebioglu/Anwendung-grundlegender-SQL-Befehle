
-- HR isimli bir veritabani olusturunuz ve bu veritabani içerisine gosterilen tablolari SQL kodu yazarak olusturunuz.
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

--1. Tüm çalışanların ad, soyad ve maaş bilgilerini getiren SQL sorgusunu yazınız:
SELECT [NAME_],[SURNAME],[SALARY]
  FROM PERSON

--2. Sadece kadın çalışanların (GENDER = 'K') isim, soyisim ve doğum tarihlerini listeleyen bir sorgu yazınız.:
SELECT  [NAME_],[SURNAME],[BIRTHDATE]
 FROM PERSON
 WHERE GENDER = 'K'
 
--3. 2017 yılından sonra işe giren çalışanların isimlerini ve işe giriş tarihlerini listele:
SELECT  [NAME_],[SURNAME],[INDATE]
  FROM PERSON
  WHERE INDATE > '2017-12-31' 

--4. Yeni bir çalışan ekle(Örnek: Ali Veli, TC No: 12345678901, Erkek, 1985-12-05 doğumlu, 2022-01-15 tarihinde işe girdi, Departman: 3, Pozisyon: 40, Maaş: 6000):
INSERT INTO PERSON
([NAME_],[SURNAME],[TCNUMBER],[GENDER],[BIRTHDATE],[INDATE],[DEPARTMENTID],[POSITIONID],[SALARY])  
VALUES ('Ali', 'Veli', '12345678901', 'E', '1985-12-05', '2022-01-15', 3, 40, 6000)

SELECT * FROM PERSON

--5. Ferhat Cinar’ın maaşını 6000 olarak güncelle:
UPDATE PERSON
SET  [SALARY]=6000  
WHERE [NAME_]= 'Ferhat' AND [SURNAME]= 'CINAR'

SELECT * FROM PERSON
WHERE [NAME_]= 'Ferhat' AND [SURNAME] = 'CINAR'

--6. Deniz Eravcı’yı veri tabanından sil:

DELETE FROM PERSON WHERE [NAME_]= 'Deniz' AND [SURNAME] = 'ERAVCI'

SELECT * FROM PERSON WHERE [NAME_]= 'Deniz' 

--7. Doğum yılı 1960’tan önce olan çalışanları listele:
SELECT [NAME_],[SURNAME],[BIRTHDATE]
FROM   PERSON
WHERE [BIRTHDATE] < '1960-01-01'

--8. Doğum tarihi 1960’tan önce ve maaşı 5000’den yüksek olan çalışanları listele:
SELECT [NAME_],[SURNAME],[BIRTHDATE],[SALARY]
FROM   PERSON
WHERE [BIRTHDATE] < '1960-01-01' AND [SALARY]> 5000

--9. Departman ID’si 4 olan veya maaşı 5500’den fazla olan çalışanları listele:
SELECT [NAME_],[SURNAME],[DEPARTMENTID],[SALARY]
FROM   PERSON
WHERE [DEPARTMENTID]=4  OR [SALARY]> 5500

--10. Çıkış tarihi (OUTDATE) NULL olan çalışanların maaşlarına %10 zam yap:
UPDATE PERSON
SET [SALARY] = [SALARY]* 1.10  
WHERE [OUTDATE] IS NULL

SELECT * FROM PERSON WHERE [OUTDATE] IS NULL

--11. 2015’ten önce işe giren ve maaşı 5000’den düşük olan çalışanları sil:
DELETE FROM PERSON
WHERE [INDATE]< '2015-01-01'  
AND [SALARY] < 5000

--12. Veri setinde kaç farklı departman olduğunu listele:

SELECT DISTINCT [DEPARTMENTID] FROM PERSON 

--Veri setinde kaç farklı departman olduğunu ise:

SELECT COUNT(DISTINCT [DEPARTMENTID] ) AS  unique_department_count  
FROM PERSON

--13. Çalışanları maaşlarına göre en yüksekten en düşüğe sırala:
SELECT [NAME_],[SURNAME],[SALARY]
FROM PERSON
ORDER BY [SALARY] DESC


--14. En yüksek maaş alan 5 çalışanı listele:
SELECT TOP 5 [NAME_],[SURNAME],[SALARY]
FROM PERSON
ORDER BY [SALARY] DESC