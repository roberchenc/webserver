CXX ?= g++
OUT_DIR = ./build
DEBUG ?= 1
ifeq ($(DEBUG), 1)
    CXXFLAGS += -g
else
    CXXFLAGS += -O2

endif

server: main.cpp  ./timer/lst_timer.cpp ./http/http_conn.cpp ./log/log.cpp ./CGImysql/sql_connection_pool.cpp  webserver.cpp config.cpp
	$(CXX) -o $(OUT_DIR)/server  $^ $(CXXFLAGS) -lpthread -lmysqlclient

clean:
	rm  -r $(OUT_DIR)/server
