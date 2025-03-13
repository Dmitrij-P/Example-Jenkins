# Schnellstart mit Jenkins

Dieses Repository dient als schneller Einstieg, um mit Jenkins automatisierte Jobs auszuführen. Ich habe diese Informationen für mich selbst aufgeschrieben, um sie später wieder nachzulesen. Vielleicht helfen diese Hinweise auch euch.

Es werden Tipps und Hinweise gegeben, aber es handelt sich nicht um ein vollständiges Tutorial mit einem Musterbeispiel! Zusätzlich wird Docker Compose verwendet, um Jenkins schnell einzurichten.

## Themen, die behandelt werden:

1. Wichtige Aspekte bei der Installation.
2. Wie Jobs nach meiner Einschätzung am einfachsten und strukturiertesten aufgebaut werden sollten.
3. Wie ein privates GitHub-Repository durch einen Job erreichbar ist.

## Themen, die NICHT behandelt werden:

1. Wie Jenkins installiert und konfiguriert wird.
2. Welche Job-Typen es gibt und worin sie sich unterscheiden.
3. Weitere Arten der Verbindung mit einem privaten GitHub-Account.
4. Wie GitHub durch einen Commit einen Job auslösen kann.
5. Andere Versionskontrollplattformen wie GitLab werden nicht behandelt.

## Jenkins schnell starten

Um den Einstieg in Jenkins zu vereinfachen, habe ich ein Docker-Image und eine Docker-Compose-Datei vorbereitet.

### Schritte:

1. Lade das Repository herunter und installiere Docker Desktop.
2. Öffne ein Terminal und navigiere in den Ordner des Repositorys.
3. Führe den Befehl `docker compose up` aus.
4. Besuche `localhost:8080` in einem Webbrowser deiner Wahl.

## Schnelle Einrichtung von Jenkins

Jenkins sollte im Webbrowser starten und nach einem Schlüssel fragen, um fortzufahren.

- Falls du `docker compose up` ausgeführt hast, findest du den Schlüssel im Terminal.
- Falls du `docker compose up -d` genutzt hast, kannst du den Schlüssel in den Logs des erstellten Containers in Docker Desktop finden.

## Kurze Erklärung des Dockerfiles

Um Tests schnell durchzuführen, überspringe ich gerne die Schlüssel-Eingabe und die Benutzerkonfiguration. Dadurch werden die Plugins nicht automatisch installiert, weshalb alle wichtigen Plugins im Dockerfile hinterlegt sind. Falls du Jenkins zum ersten Mal verwendest, solltest du diese Schritte jedoch nicht überspringen! Damit Jenkins Docker verwenden kann, muss Docker im System installiert sein. 

Da Jenkins hier in einem Docker-Container ausgeführt wird, installiere ich Docker direkt im Container. Es gibt alternative Methoden, aber für einen schnellen Start reicht diese aus.

## Hinweis 1: Windows < Linux

Jenkins wurde für Linux entwickelt. Eine Installation auf Windows kann zu Problemen führen. Zum Beispiel können Pipelines, die Docker-Images verwenden, eine Fehlermeldung ausgeben, die besagt, dass "docker" nicht erkannt wird.

Da Jenkins hier in einem Linux-basierten Docker-Container läuft, tritt dieser Fehler in dieser Umgebung nicht auf.

## Hinweis 2: Jobs < Pipelines

Es sollten bevorzugt Pipelines verwendet werden, da sie einfacher einzurichten sind.

Die Pipelines sollten sich im Repository befinden, damit:

- keine separaten Backups erforderlich sind,
- das Projekt organisiert bleibt,
- alle relevanten Informationen zentral gespeichert sind.

## Hinweis 3: Credentials

Im Internet gibt es viele Tutorials dazu, wie Jenkins mit GitHub verbunden wird. Hier ist meiner Meinung der einfachste Ansatz:

### In GitHub

1. GitHub aufrufen.
2. Rechts auf das Profil klicken und zu "Settings" gehen.
3. Zu "Developer settings" navigieren.
4. "Tokens (classic)" oder "fine-grained Tokens" auswählen und die benötigten Rechte setzen:
   - Classic: "repo" auswählen.
   - Fine-grained Tokens: "Contents" und "Metadata" auswählen.
5. Token erstellen und kopieren.

### Im GitHub-Repository

1. Eine Datei namens `Jenkinsfile` erstellen und folgendes Beispiel eintragen:

```groovy
pipeline {
  agent {
    docker {
      image 'jenkins/agent:alpine-jdk21'
    }
  }
  
  stages {
    stage('Hello') {
      steps {
        echo 'Hello World'
      }
    }
  }
}
```

2. Datei committen.

### In Jenkins

1. Jenkins öffnen.
2. Eine neue Pipeline erstellen: "New Item" -> "Pipeline".
3. Unter "Pipeline" -> "Definition" die Option "Pipeline script from SCM" auswählen.
4. Als SCM "Git" auswählen.
5. Die URL des Repositorys aus GitHub kopieren:
   - Diese ist in GitHub unter "<> Code" -> "Local" -> "HTTPS" zu finden.
6. In Jenkins unter "Credentials" eine neue Anmeldeinformation erstellen:
   - Username: Dein GitHub-Benutzername.
   - Passwort: Der kopierte Token aus GitHub.
   - ID: Beliebig wählen (z. B. GitHub-Name oder "Test").
7. Speichern und Credential auswählen.
8. Unter "Branch Specifier" den richtigen Branch angeben (achte darauf, ob der Branch "main" heißt!).
9. Speichern und einen Build starten.
10. Falls alles korrekt eingerichtet wurde, sollte die Pipeline erfolgreich durchlaufen und "Hello World" in den Logs ausgegeben werden.

Viel Erfolg mit Jenkins!

