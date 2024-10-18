#!/bin/sh

cd /opt/ylem/processor/taskrunner && ./ylem_taskrunner taskrunner start &
cd /opt/ylem/processor/taskrunner && ./ylem_taskrunner loadbalancer start &
cd /opt/ylem/backend/integrations && ./ylem_integrations server serve
