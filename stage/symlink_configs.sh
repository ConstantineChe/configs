#!/bin/sh
# davtool.ini/cron.local.config/test_webdav_config.py .

cd ../../build/gateway/
ln -snf ../../configs/stage/davtool.ini .
ln -snf ../../configs/stage/cron.local.config .
ln -snf ../../configs/stage/test_webdav_config.py .
cd ../../configs/stage


# parser.local.py
cd ../../bringmeister_imex/build/gateway/bringmeister/app/etc/util/ini/
ln -snf ../../../../../../../../../configs/stage/parser.local.py.dist.stage parser.local.py
ln -snf ../../../../../../../../configs/stage/parser.local.py.dist.stage parser.local.py
cd ../../../../../../../../configs/stage/

cd ../../
ln -snf ./bringmeister_imex/build/var/gateway/log/ log
ln -snf ./bringmeister_imex/build/var/gateway/done/ done
ln -snf ./bringmeister_imex/build/var/gateway/import/ import