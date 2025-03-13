Dieses Repository dient als ein schneller start, um mit Jenkins automatische Jobs auszuführen.
Es werden Hinweise und Tips gegeben, aber es ist kein komplettes Tutorial. 

# Folgende Themen werden angesprochen:
1. Was es bei der Installation zu beachten gibt.
2. Auf welche Weise Jobs, nach meiner Einschätzung, am einfachsten und Strukturiersten aufgebaut werden sollen
3. Wie kann ein Privater Github Repository durch einen Job erreicht wird 

# Folgende Themen werden nicht angesprochen:
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

# Hinweis 1.
Jenkins wurde für Linux Distrubutoren entwickelt. 
Eine Installierte Jenkins 
Eine Installation auf Windows kann Probleme versuchen. Z.B. können Pipelines die Dockerimages verwenden 
Wenn Sie Jenkins auf Windows installieren, dann wird bei einer Pipeline mit einem Dockerimage ein Fehler gemeldet, dass "Docker" nicht erkannt wurde. Jenkins wird hier in einem Docker Container mit Linux aufgebaut, weshalb es hier kein Problem ist. Damit Jenkins aber Docker in den Jobs und Pipelines verwenden kann, muss Docker installiert sein, weshalb im Dockerfile Docker zusätzlich installiert wird. 

