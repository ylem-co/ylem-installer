#!/bin/sh

cd /opt/ylem/api && ./ylem_api server serve &
cd /opt/ylem/backend/users && ./ylem_users server serve &
cd /opt/ylem/backend/pipelines && ./ylem_pipelines server serve &
cd /opt/ylem/backend/pipelines && ./ylem_pipelines schedulegen start &
cd /opt/ylem/backend/pipelines && ./ylem_pipelines schedulepub start &
cd /opt/ylem/backend/pipelines && ./ylem_pipelines triggerlistener start &
cd /opt/ylem/backend/statistics && ./ylem_statistics server serve &
cd /opt/ylem/backend/statistics && ./ylem_statistics resultlistener start
