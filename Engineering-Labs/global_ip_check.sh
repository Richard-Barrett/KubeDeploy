#!/bin/bash

grep -Eir "192.168" Engineering-Labs/ -R | awk '{print $1,$8,$3}'
