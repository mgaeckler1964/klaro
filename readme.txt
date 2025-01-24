Klaro 2.0.0                                                      24.02.2010
===========================================================================

Willkomen bei der neuen Version Klaro 2.0.0

Beim ersten Aufruf von Klaro werden Sie nach den Lizenzdaten gefragt. Geben 
Sie folgende Werte ein:

Produkt : Klaro-12:2012-1
Benutzer: Public
Code    : 048261220281

Hiermit haben Sie die Möglichkeit Klaro bis Dezember 2012 ausführlich zu 
testen.

Nachfolgend finden Sie die Historie der Klaro Kursverwaltung.

Änderungen
----------

- Neue Formulare für Stammdaten, Ferien, Prüfungen, Anwesenheitsliste und 
  Lehrbücher.
- Neuer XML-Export mit allen neuen Feldern.
- Berüchsichtigung der Ferien und Unterrichtszeiten beim XML-Export.
- Neue XSL-Stylesheets mit den aktuellen Formularen des BAMF.
- Schulliste und Anwesenheitsliste wurden entfernt.
- Als Datenbank kann nun auch ein SQL Server (z.B. Oracle) verwendet werden.


Klaro 1.1.1                                                      23.12.2004
===========================================================================

Willkomen bei der neuen Version Klaro 1.1.1

Nachfolgend finden Sie die Historie der Klaro Kursverwaltung.

Änderungen
----------

- Die Erkennung, ob Klaro schon einmal läuft, wurde nocheinmal verbessert.


Klaro 1.1                                                         22.7.2004
===========================================================================

Änderungen
----------

- Die Erkennung, ob Klaro schon einmal läuft, wurde nun für Windows XP 
  verbessert.
- XML-Export war fehlerhaft, so daß der Internet Explorer die Dateien nicht
  darstellen konnte.
- Schulliste und Anwesenheitsliste wurden wieder integriert. Sie werden 
  jedoch in einer der nächsten Versionen endgültig entfernt.


Klaro 1.1.0ß4 (RC)                                                 6.7.2004
===========================================================================

Release Candidate.

Änderungen
----------
- Reports: Schüler werden nun nach Namen sortiert.
- Die integrierten Reports Schulliste und Anwesenheitsliste wurden durch 
  je eine XSL Datei ersetzt. Diese können nun durch Rechtsklick auf den 
  Schalter XML-Export ausgewählt werden.

Klaro 1.1.0ß3                                                     22.5.2004
===========================================================================

Änderungen
----------

- Das Konvertierungsprogramm zeigt nun eine genauere Fehlermeldung, falls
  beim Kopieren ein Fehler auftrat.
- Das Konvertierungsprogramm hat versucht ein Feld zu kopieren, das es 
  nicht gibt.
- Beim Kopieren der Schüler wurde ein Fehler gemeldet, falls einem Schüler 
  ein Kurs doppelt zugeordnet war.
- Anpassung des BAFL-Reports.
- In der Kursliste werden nun die Kurse nach Nummer sortiert.
- Die Kursliste zeigt nun nur noch die Kurse eines Jahres an.
- Diese Betaversion läuft am 1. 8. 2004 ab.

Klaro 1.1.0ß2                                                     9.11.2003
===========================================================================

Änderungen
----------

- Neues Programm "Klaro Datenbankverwaltung". Damit können Sie Ihre alten 
  Datenbestände in das neue Format konvertieren.
-- Kopieren Sie Ihre alten Tabellen in ein beliebiges Verzeichnis auf den 
   Rechner mit Ihrer Testversion.
-- Erzeugen Sie mit Hilfe der BDE Datenbankadministration einen neuen Alias
   KLARO_OLD, das auf Ihre alten Tabellen verweisen muß.
-- Starten Sie nun das Programm KlaroDB.exe.
-- Kopieren Sie nun Ihre alten Daten in die neue Datenbank.
-- Wenn Sie beim Kopieren einen Indexfehler bekommen, müssen Sie ihre 
   Testdatenbank mit dem Schalter Leeren neu initialisieren. Dabei werden
   jedoch alle Datensätze aus Ihrer Testdatenbank entfernt.
- Verbessertes XSL Stylesheet für den XML Export.


Klaro 1.1.0ß1                                                    28.10.2003
===========================================================================

Änderungen
----------

Installation:
- Sie können nun bei der Installation den Pfad zu Ihren Dateiserver 
  angeben. Installieren Sie zuerst Klaro auf ALLEN Arbeitsstationen, auf 
  denen Sie Klaro verwenden möchten, bevor Sie mit der Arbeit beginnen. 
  Nach dem Ausführen des Setups, müssen Sie auf jeder Arbeitsstation mit 
  dem Programm BDE-Administration den Eintrag NET_DIR auf einen 
  Netzwerkweitig gültigen Laufwerksbuchstaben setzen.

Allgemein:
- Klaro verwendet nun für temporäre Dateien das Verzeichnis TEMP.
- Tabellen verwenden nun einen Sprachtreiber, der das EURO Symbol erlaubt.
- Klaro kann nun auf einem Rechner nur noch einmal gestartet werden.

Kurse:
- Anzeige des Feldes Nummer verbreitert.
- Es werden nur noch die Kurse eines Jahres angezeigt.
- Neues Feld Bemerkung für kursspezifische Zusatzinformationen.

Schüler:
- Die Länge des Feldes Einstufung wurde auf 64 Zeichen verdoppelt.
- Im Unterformular Schülerkurse wurde ein zusätzliches Feld Bemerkung 
  eingeführt.

Berichte:
- Nachname und Vorname der Schüler sind nun durch ein Komma getrennt.
- Schüler werden nun zuerst nach Einstiegsdatum einsortiert, so daß neue 
  Schüler, die erst nach Kursbeginn anfangen, hinter bereits gemeldeten 
  Schüler erscheinen.
- Der Bericht für die Schule zeigt statt dem Feld Bemerkung des Formulars
  Schüler nun das neue Feld des Unterformulars Schülerkurse. Darüber hinaus
  wird auch das neue Feld Bemerkung des Formulars Kurse ausgegeben.
- Neuer XML Export. Mit dem neuen XML Export können die Daten eines Kurses
  exportiert werden. Wenn Sie mit der rechten Maustaste auf den Schalter
  XML-Export klicken, können Sie eines der vorhanden XSL-Stylesheets 
  auswählen, mit denen die XML-Datei formatiert werden soll. Sie benötigen
  hierzu einen XML-Parser wie z.B. den Netscape Browser 7.0 oder Internet 
  Explorer 6.0. Eine Beispiel XSL-Datei wird mitgeliefert. Die XML Datei 
  wird grundsätzlich im Verzeichnis %TEMP%\Klaro erzeugt. Die dazugehörige
  DTD (kurs.dtd) und eine evt. ausgewählte XSL-Datei wird ebenfalls dorthin
  kopiert.


Klaro 1.0.2                                                       23.6.2003
===========================================================================

Änderungen
----------

Berichte:
Neugestaltung des Schulberichts zur besseren Lesbarkeit.

Allgemein:
Das zuletzt geöffnete Tabellenfenster wird beim Start wieder angezeigt.
Titel des Haupfensters und der Anwendung geändert.

Klaro 1.0.1                                                       26.5.2003
===========================================================================

Änderungen
----------

Schüler:

der Eintrag des Feldes c/o wird nun in der Schulliste unterhalb des Namens
ausgegeben.

Wenn das Feld Geschlecht beim Schüler  verlassen wird, so wird automatisch
das Feld Anrede gefüllt, wenn es leer war.

Im Feld Tätigkeiten/Status wurde der Wert Hausmann/-frau hinzugefügt.

Lehrer:
Das Feld Anrede ist nun eine Auswahlliste.

Berichte:
Wenn beim Schüler kein Geburtstag eingegeben wurde, so wird bei den
Berichten für Bafl und der Schulliste kein falsches Alter ausgegeben.

Es wurde eine Fußzeile in der Anwesenheitsliste hinzugefügt.


