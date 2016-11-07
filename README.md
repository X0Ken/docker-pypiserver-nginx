## Pypi Server in docker
This project help you start a Pypi Server in a easy way.

## Quit start

### Start PYPI server in local
```bash
git clone https://github.com/wang19930902/docker-pypiserver-nginx.git
docker-compose up -d

# You can use pip download to fast fill storage
cd /var/pypiserver/packages
pip download ...
```

### Download package from local PYPI server
```bash
## Download and Install hosted packages.
pip install  -i http://localhost:8080 ...

## Search hosted packages
pip search --index http://localhost:8080 ...
```
Now you can enjoy it.

## More option

### Create a password file
If you do not need to upload with pip, you just skip this section.
```bash
# install htpasswd tool
# for debian
apt-get install apache2-utils
# for centos
yum install httpd-tools

# create password
htpasswd -sc /var/pypiserver/.htaccess <your-name>

vim docker-compose.yml
# change environment AUTH
AUTH=update,download,list
```

### Upload package
```bash
# create .pypirc
cat >> ~/.pypirc <<EOF
[distutils]
index-servers =
  pypi
  local

[pypi]
username:<your_pypi_username>
password:<your_pypi_passwd>

[local]
repository: http://localhost:8080
username: <your-name>
password: <your-passwd>
EOF

# upload package
python setup.py sdist upload -r local
```
Note: The `<your-name>` and `<your-passwd>` must in `.htaccess`

