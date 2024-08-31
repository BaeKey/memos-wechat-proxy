
功能：微信公众号推送消息到 [memos](https://github.com/usememos/memos)的代理服务。

原repo文档：[memos备忘录加入微信公众号功能](https://zhaouncle.com/memos%E5%A4%87%E5%BF%98%E5%BD%95%E5%8A%A0%E5%85%A5%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7%E5%8A%9F%E8%83%BD/)

docker-compose.yaml

```yaml
services:
  memos:
    image: neosmemo/memos:0.14.4
    container_name: memos
    volumes:
      - ./data:/var/opt/memos
    ports:
      - 127.0.0.1:5230:5230

  memos-wechat-proxy:
    image: shiguang2021/memos-wechat-proxy
    container_name: memos-wechat-proxy
    ports:
      - "5000:5000"
    volumes:
      - ./config:/config
```

获取配置文件

```bash
wget https://github.com/BaeKey/memos-wechat-proxy/blob/main/config.ini
```

填写配置文件中的

```
### 微信公众号中的开发者ID
wechat_appid = xxxxxxxxxxxxxxxxxx
### 微信公众号中的开发者密码(需设置服务器IP到白名单)
wechat_appsecret = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

公众号设置与开发，基本配置中服务器配置(已启用)

设置`服务器地址(URL)`

```
http://服务器ip:5000/wechat
```

令牌(Token)

然后将Token填入配置文件，运行docker，然后在公众号后台提交服务器配置
