# Xmrig-0donation

## Overview

`xmrig-0donation` is a pre-built Docker image configured to set Xmrig's donation level to 0%. Xmrig is a popular CPU miner for Monero.

## Docker Usage

### Docker Run Command

To run the `xmrig-0donation` Docker image, use the following `docker run` command:

```sh
docker run -d \
  --privileged \
  --user root \
  --restart unless-stopped \
  --network host \
  --cap-add SYS_ADMIN \
  --cap-add SYS_RAWIO \
  --device /dev/cpu \
  --device /dev/mem \
  -p 35689:35689 \ # API port
  --name xmrig \
  -v /lib/modules:/lib/modules \
  xmrig-0donation:latest \
  --parameter1=value1
  --parameter2=value2
```
[Parameters and Respective Values](https://xmrig.com/docs/miner/command-line-options)
