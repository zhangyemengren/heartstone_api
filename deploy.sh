#!/bin/bash
# 停止现有的 docker compose 服务
sudo docker compose down

# 只启动数据库服务
sudo docker compose up -d

# 编译项目
cargo build --release --package server --bin server

# 复制 systemd 服务文件
sudo cp hs.service /etc/systemd/system/

# 重新加载 systemd 配置
sudo systemctl daemon-reload

# 启动服务
sudo systemctl start hs

# 设置开机自启
sudo systemctl enable hs