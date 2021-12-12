LOG4J_VER=2.5
LOG4J_PATH=apache-log4j-$(LOG4J_VER)-bin
all:
	rm -f /tmp/*selftest.rj*
	javac -classpath $(LOG4J_PATH)/log4j-core-$(LOG4J_VER).jar Log4jSocketServer.java
	java -classpath ".:$(LOG4J_PATH)/*:commons-collections-3.2.1/*" Log4jSocketServer

