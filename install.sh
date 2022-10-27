echo 安装docker
wget -qO- get.docker.com | bash
echo 启动docker
systemctl start docker
systemctl status docker
systemctl enable docker
echo 部署自动续期
docker run -d --name freenom --restart always -v $(pwd):/conf -v $(pwd)/logs:/app/logs luolongfei/freenom
echo vi编辑配置文件
echo 'FREENOM_USERNAME：Freenom 账户'
echo 'FREENOM_PASSWORD:Freenom 密码'
echo '更多高级选项请看https://github.com/luolongfei/freenom'
sleep 10s
vi .env
docker restart freenom
echo 安装ddns中
pip3 install freenom_dns_updater
curl https://raw.githubusercontent.com/s123ttf/freenom_updater/main/freenom_updater.service > /etc/systemd/system/freenom_updater.service
echo 输入freenom账号邮箱
usr = ''
read usr

echo 输入freenom账号密码
pwr = ''
read pwr
echo export FREENOM_USERNAME = $usr >>/etc/profile
echo export FREENOM_PASSWORD = $pwr >>/etc/profile
echo 输入freenom账号密码
dom = ''
read dom
echo export FREENOM_DOMAIN = $dom >>/etc/profile
curl https://raw.githubusercontent.com/s123ttf/freenom_updater/main/freenom_updater.sh > /opt/freenom_updater.sh