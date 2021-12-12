include inc.mk

all:
	rm -f /tmp/*selftest.rj*
	javac -classpath $(LOG4J_PATH)/log4j-core-$(LOG4J_VER).jar Log4jSocketServer.java

run:
	./start_log4j.sh

clean:
	rm -f *.class /tmp/*selftest.rj*
