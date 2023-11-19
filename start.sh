# /start.sh
# nvm에 대한 환경변수를 설정하는 것임.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

cd $PROJECT_ROOT

#!/bin/bash
[ -d /home/ubuntu/action ] || mkdir -p /home/ubuntu/action
echo "> current time: $(date)" >> /home/ubuntu/action/deploy.log

echo "> check running application" >> /home/ubuntu/action/deploy.log

# pm2 list 명령어를 사용하여 실행 중인 프로세스 리스트 가져오기
PM2_LIST=$(pm2 list) >> /home/ubuntu/action/deploy.log

# pm2로 애플리케이션을 시작합니다.
echo "> pm2 start node-test" >> /home/ubuntu/action/deploy.log
pm2 kill
sleep 5
pm2 start ./bin/www

PM2_LIST=$(pm2 list)

echo "현재 구동 중인 애플리케이션 리스트:"
echo "$PM2_LIST" >> /home/ubuntu/action/deploy.log
