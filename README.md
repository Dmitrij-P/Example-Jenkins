Dieses Repository dient als ein schneller start, um mit Jenkins automatische Jobs auszuführen.
Ich habe diese Informationen für mich selber aufgeschrieben, um diese an einem späteren Zeitpunkt wieder zu verinnerlichen. 
Vielleicht helfen diese Hinweise euch. Bitte beachtet, dass es sich um ein schnellen Start mit Hinweisen handeln und nicht auf ein komplettes Tutorial und ein Muster Beispiel, wie Jenkins bedient werden muss.

Es werden Hinweise und Tips gegeben, aber es ist kein komplettes Tutorial. 

# Folgende Themen werden angesprochen:
1. Was es bei der Installation zu beachten gibt.
2. Auf welche Weise Jobs, nach meiner Einschätzung, am einfachsten und Strukturiersten aufgebaut werden sollen
3. Wie kann ein Privater Github Repository durch einen Job erreicht wird 

# Folgende Themen werden NICHT angesprochen:
1. Wie Jenkins installiert und Configuriert wird.
2. Welche Jobs es gibt und was die Unterschiede sind.
3.1. Welche andere Arten von Verbindungen mit einem Privaten Github Account gibt.
3.2. Wie kann Github durch einen Commit einen Job auslösen
3.3. Es wird nur auf Github eingegangen und nicht auf Gitlab oder ein andere Versionskontrol Plattform

# Um den schnellen Start in Jenkins zu vereinfachen habe ich ein Dockerimage und ein Docker Compose File vorbereitet.
1. Downloade das Repository und installiere Docker Desktop.
2. begebe dich in den Ordner mit einem Terminal
3. führe "docker compose up" aus
4. besuche "localhost:8080" in einem Webbrowser deiner Wahl

# Schnelles einrichten von Jenkins
Jenkins sollte im Webbrowser laufen und fragt nach einem Schlüssel, um fortfahren zu können. 
Im Terminal, worin der Befehl "docker compose up" ausgeführt worden ist, finden sie den Schlüssel.
Falls Sie "docker compose up -d" ausgeführt haben, können sie in Docker Desktop im erstellten Container unter Logs den Schlüssel finden.

# Kurze Erklärung des Dockerfiles
Um schnell etwas zu testen, überspringe ich gerne die Schlüssel eingabe und die Konfiguration eines Users.
Dadurch werden ebenfalls die Plugins nicht installiert, weshalb alle wichtigen Plugins in dem Dockerfile installiert werden.
Wenn Sie das erste mal mit Jenkins arbeiten, dann überspringen sie nicht die wichtigen Schritte!
Damit Jenkins Docker verwenden kann, muss es im System installiert sein. Jenkins wird im Docker Container ausgeführt, weshalb ich es einfach darin installiere. Es gibt andere möglichkeiten, aber zum schnellen Start reicht es aus.

# Hinweis 1: Windows < Linux
Jenkins wurde für Linux Distrubutoren entwickelt. 
Eine Installation auf Windows kann Probleme versuchen. Z.B. können Pipelines die Dockerimages verwenden, eine Fehlermeldung zurückgeben, die aussagt, dass "docker" nicht erkannt wird. 
Jenkins wird hier in einem Docker Container mit Linux aufgebaut, weshalb der Fehler in dieser Umgebung nicht vorkommen kann. 

# Hinweis 2: Jobs < Pipelines
Es sollten Pipelines verwendet werden, weil diese einfacher einzurichten sind und einfach Superior sind.

Die Pipelines sollten im Repository befinden, damit nicht an einem Backup gedacht werden muss und damit das Projekt Organisierter ist. 
Im Repository befindet sich das Projekt und die dafür entwickelte Pipeline.
Alles lässt sich im Repository finden.

# Hinweis 3: Credentials
Im Internet lassen sich einige Tutorial finden, wie Jenkins mit Github verbunden werden kann.
Der einfachste Ansatz zeige ich euch in den folgenden Schritten:
# In Github
1. Github besuchen
2. Gehe zu "Settings" -> "Developer settings"
3. Gehe zu "Tokens (classic)"
4. Erstelle einen Token und Kopiere diesen

# Im Github Repository
1. Erstellen Sie eine Datei mit den Namen "Jenkinsfile" und fügen Sie testweise folgendes ein:
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
2. Commiten Sie!

# In Jenkins
1. Besuche Jenkins
2. Erstelle eine Pipeline: "New Item" -> "Pipeline"
3. Wähle unter "Pipeline"-> "Definition" folgendes aus "Pipeline script from SCM"
4. Wähle darauf unter SCM "Git" aus.
5. Kopiere aus Github die URL des Repository, welches du in Jenkins einbinden möchtest.
  Die Adresse kann in Github im Repository in "<> Code" -> "local" -> "HTTPS" gefunden werden.
6. In Jenkins unter "Credentials" erstellen Sie eine neue Credentials.
7. Ihr Github Username soll in Username und das Password soll den Token aus 1.3 beinhalten.
8. ID können Sie selbst benennen. (Z.B. Github Namen oder "Test")
9. Speichern und auswählen
10. Unter Branch Specifier ihren Branch auswählen. Vorsicht es kann sein, dass ihr Branch "Main" heißt. Vergleichen Sie es am besten!
11. Speichern Sie den Branch und starten Sie einen Build.
12. Sie sollten eine Erfolgreiche Meldung zurück bekommen und in den Logs sollte Hello World zu finden sein.
