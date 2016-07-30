
TARGET       := sas
TARGET_DIR   := build/dist

CXXFLAGS     := -std=c++11 -Wall -g
SOURCES      := $(shell find src -name '*.cpp')
#TGT_LDFLAGS  :=
#TGT_LDLIBS   := 

SRC_INCDIRS  := include
