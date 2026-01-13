# HR Database SQL Script

Dieses Repository enthält ein SQL-Skript zur Erstellung und Verwaltung einer HR-Datenbank. Die Datenbank enthält drei Tabellen: PERSON, DEPARTMENT und POSITION, die typische HR-Daten wie Mitarbeiterinformationen, Abteilungen und Positionen verwalten.

## Tabellenübersicht
| Spalte           | Typ          | Beschreibung                      |
| ---------------- | ------------ | --------------------------------- |
| ID               | INT IDENTITY | Primärschlüssel, automatisch      |
| CODE             | VARCHAR(50)  | Mitarbeitercode                   |
| TCNUMBER         | VARCHAR(11)  | Personalausweisnummer             |
| NAME_ / SURNAME  | VARCHAR(50)  | Vorname / Nachname                |
| GENDER           | VARCHAR(1)   | E=Erkek / K=Kadın                 |
| BIRTHDATE        | DATE         | Geburtsdatum                      |
| INDATE / OUTDATE | DATE         | Einstellungs- / Austrittsdatum    |
| DEPARTMENTID     | INT          | FK → DEPARTMENT.ID                |
| POSITIONID       | INT          | FK → POSITION.ID                  |
| PARENTPOSITIONID | INT          | Hierarchische Position (optional) |
| MANAGERID        | INT          | Manager-ID (FK → PERSON.ID)       |
| TELNR            | VARCHAR(12)  | Telefonnummer                     |
| SALARY           | FLOAT        | Gehalt                            |

| Spalte     | Typ          | Beschreibung    |
| ---------- | ------------ | --------------- |
| ID         | INT IDENTITY | Primärschlüssel |
| DEPARTMENT | VARCHAR(50)  | Abteilungsname  |

| Spalte   | Typ          | Beschreibung    |
| -------- | ------------ | --------------- |
| ID       | INT IDENTITY | Primärschlüssel |
| POSITION | VARCHAR(50)  | Positionsname   |

## Beziehungen

PERSON.DEPARTMENTID → DEPARTMENT.ID

PERSON.POSITIONID → POSITION.ID

PERSON.PARENTPOSITIONID → POSITION.ID

PERSON.MANAGERID → PERSON.ID
## Beispiele im Skript

Mitarbeiter anzeigen (Name, Gehalt, Geburtsdatum)

Neue Mitarbeiter einfügen

Gehalt aktualisieren und erhöhen

Mitarbeiter löschen

Filter nach Abteilung, Gehalt oder Geburtsdatum

Sortieren und Top 5 Gehälter anzeigen

Anzahl der Abteilungen zählen
