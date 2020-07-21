cp -f WebAppTest.conf /etc/nginx/conf.d
systemctl restart nginx
cp -f WebAppTest.service /etc/systemd/system
systemctl enable WebAppTest.service
systemctl restart WebAppTest.service