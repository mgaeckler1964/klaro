Klaro 2.0.0                                                      24.02.2010
===========================================================================

Willkomen bei der neuen Version Klaro 2.0.0

Beim ersten Aufruf von Klaro werden Sie nach den Lizenzdaten gefragt. Geben 
Sie folgende Werte ein:

Produkt : Klaro-12:2012-1
Benutzer: Public
Code    : 048261220281

Hiermit haben Sie die M�glichkeit Klaro bis Dezember 2012 ausf�hrlich zu 
testen.

Nachfolgend finden Sie die Historie der Klaro Kursverwaltung.

�nderungen
----------

- Neue Formulare f�r Stammdaten, Ferien, Pr�fungen, Anwesenheitsliste und 
  Lehrb�cher.
- Neuer XML-Export mit allen neuen Feldern.
- Ber�chsichtigung der Ferien und Unterrichtszeiten beim XML-Export.
- Neue XSL-Stylesheets mit den aktuellen Formularen des BAMF.
- Schulliste und Anwesenheitsliste wurden entfernt.
- Als Datenbank kann nun auch ein SQL Server (z.B. Oracle) verwendet werden.


Klaro 1.1.1                                                      23.12.2004
===========================================================================

Willkomen bei der neuen Version Klaro 1.1.1

Nachfolgend finden Sie die Historie der Klaro Kursverwaltung.

�nderungen
----------

- Die Erkennung, ob Klaro schon einmal l�uft, wurde nocheinmal verbessert.


Klaro 1.1                                                         22.7.2004
===========================================================================

�nderungen
----------

- Die Erkennung, ob Klaro schon einmal l�uft, wurde nun f�r Windows XP 
  verbessert.
- XML-Export war fehlerhaft, so da� der Internet Explorer die Dateien nicht
  darstellen konnte.
- Schulliste und Anwesenheitsliste wurden wieder integriert. Sie werden 
  jedoch in einer der n�chsten Versionen endg�ltig entfernt.


Klaro 1.1.0�4 (RC)                                                 6.7.2004
===========================================================================

Release Candidate.

�nderungen
----------
- Reports: Sch�ler werden nun nach Namen sortiert.
- Die integrierten Reports Schulliste und Anwesenheitsliste wurden durch 
  je eine XSL Datei ersetzt. Diese k�nnen nun durch Rechtsklick auf den 
  Schalter XML-Export ausgew�hlt werden.

Klaro 1.1.0�3                                                     22.5.2004
===========================================================================

�nderungen
----------

- Das Konvertierungsprogramm zeigt nun eine genauere Fehlermeldung, falls
  beim Kopieren ein Fehler auftrat.
- Das Konvertierungsprogramm hat versucht ein Feld zu kopieren, das es 
  nicht gibt.
- Beim Kopieren der Sch�ler wurde ein Fehler gemeldet, falls einem Sch�ler 
  ein Kurs doppelt zugeordnet war.
- Anpassung des BAFL-Reports.
- In der Kursliste werden nun die Kurse nach Nummer sortiert.
- Die Kursliste zeigt nun nur noch die Kurse eines Jahres an.
- Diese Betaversion l�uft am 1. 8. 2004 ab.

Klaro 1.1.0�2                                                     9.11.2003
===========================================================================

�nderungen
----------

- Neues Programm "Klaro Datenbankverwaltung". Damit k�nnen Sie Ihre alten 
  Datenbest�nde in das neue Format konvertieren.
-- Kopieren Sie Ihre alten Tabellen in ein beliebiges Verzeichnis auf den 
   Rechner mit Ihrer Testversion.
-- Erzeugen Sie mit Hilfe der BDE Datenbankadministration einen neuen Alias
   KLARO_OLD, das auf Ihre alten Tabellen verweisen mu�.
-- Starten Sie nun das Programm KlaroDB.exe.
-- Kopieren Sie nun Ihre alten Daten in die neue Datenbank.
-- Wenn Sie beim Kopieren einen Indexfehler bekommen, m�ssen Sie ihre 
   Testdatenbank mit dem Schalter Leeren neu initialisieren. Dabei werden
   jedoch alle Datens�tze aus Ihrer Testdatenbank entfernt.
- Verbessertes XSL Stylesheet f�r den XML Export.


Klaro 1.1.0�1                                                    28.10.2003
===========================================================================

�nderungen
----------

Installation:
- Sie k�nnen nun bei der Installation den Pfad zu Ihren Dateiserver 
  angeben. Installieren Sie zuerst Klaro auf ALLEN Arbeitsstationen, auf 
  denen Sie Klaro verwenden m�chten, bevor Sie mit der Arbeit beginnen. 
  Nach dem Ausf�hren des Setups, m�ssen Sie auf jeder Arbeitsstation mit 
  dem Programm BDE-Administration den Eintrag NET_DIR auf einen 
  Netzwerkweitig g�ltigen Laufwerksbuchstaben setzen.

Allgemein:
- Klaro verwendet nun f�r tempor�re Dateien das Verzeichnis TEMP.
- Tabellen verwenden nun einen Sprachtreiber, der das EURO Symbol erlaubt.
- Klaro kann nun auf einem Rechner nur noch einmal gestartet werden.

Kurse:
- Anzeige des Feldes Nummer verbreitert.
- Es werden nur noch die Kurse eines Jahres angezeigt.
- Neues Feld Bemerkung f�r kursspezifische Zusatzinformationen.

Sch�ler:
- Die L�nge des Feldes Einstufung wurde auf 64 Zeichen verdoppelt.
- Im Unterformular Sch�lerkurse wurde ein zus�tzliches Feld Bemerkung 
  eingef�hrt.

Berichte:
- Nachname und Vorname der Sch�ler sind nun durch ein Komma getrennt.
- Sch�ler werden nun zuerst nach Einstiegsdatum einsortiert, so da� neue 
  Sch�ler, die erst nach Kursbeginn anfangen, hinter bereits gemeldeten 
  Sch�ler erscheinen.
- Der Bericht f�r die Schule zeigt statt dem Feld Bemerkung des Formulars
  Sch�ler nun das neue Feld des Unterformulars Sch�lerkurse. Dar�ber hinaus
  wird auch das neue Feld Bemerkung des Formulars Kurse ausgegeben.
- Neuer XML Export. Mit dem neuen XML Export k�nnen die Daten eines Kurses
  exportiert werden. Wenn Sie mit der rechten Maustaste auf den Schalter
  XML-Export klicken, k�nnen Sie eines der vorhanden XSL-Stylesheets 
  ausw�hlen, mit denen die XML-Datei formatiert werden soll. Sie ben�tigen
  hierzu einen XML-Parser wie z.B. den Netscape Browser 7.0 oder Internet 
  Explorer 6.0. Eine Beispiel XSL-Datei wird mitgeliefert. Die XML Datei 
  wird grunds�tzlich im Verzeichnis %TEMP%\Klaro erzeugt. Die dazugeh�rige
  DTD (kurs.dtd) und eine evt. ausgew�hlte XSL-Datei wird ebenfalls dorthin
  kopiert.


Klaro 1.0.2                                                       23.6.2003
===========================================================================

�nderungen
----------

Berichte:
Neugestaltung des Schulberichts zur besseren Lesbarkeit.

Allgemein:
Das zuletzt ge�ffnete Tabellenfenster wird beim Start wieder angezeigt.
Titel des Haupfensters und der Anwendung ge�ndert.

Klaro 1.0.1                                                       26.5.2003
===========================================================================

�nderungen
----------

Sch�ler:

der Eintrag des Feldes c/o wird nun in der Schulliste unterhalb des Namens
ausgegeben.

Wenn das Feld Geschlecht beim Sch�ler  verlassen wird, so wird automatisch
das Feld Anrede gef�llt, wenn es leer war.

Im Feld T�tigkeiten/Status wurde der Wert Hausmann/-frau hinzugef�gt.

Lehrer:
Das Feld Anrede ist nun eine Auswahlliste.

Berichte:
Wenn beim Sch�ler kein Geburtstag eingegeben wurde, so wird bei den
Berichten f�r Bafl und der Schulliste kein falsches Alter ausgegeben.

Es wurde eine Fu�zeile in der Anwesenheitsliste hinzugef�gt.


