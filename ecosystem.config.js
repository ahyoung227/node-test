module.exports = {
  apps: [
    {
      name: 'node-test', // 애플리케이션 이름
      script: './bin/www',  // 실행할 파일
      watch: true,           // 파일 변경 감지 여부
      ignore_watch: ['node_modules'], // 감지에서 제외할 디렉토리
    },
  ],
};
