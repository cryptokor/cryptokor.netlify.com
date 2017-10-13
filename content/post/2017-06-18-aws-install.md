---
title: 'AWS CLI 설치 및 설치 방법'
slug: 'aws-cli-install'
date: 2017-01-01
categories: ["zcash"]
tags: ["bitcoin", "aws", "zcash"]
---

AWS CLI는 AWS를 보다 편리하게 사용할 수 있도록 해주는 도구입니다.

이에 대한 설치법 및 업데이트 방법을 정리해 봅니다.

MacOS 위주이나 [영문 링크](http://docs.aws.amazon.com/cli/latest/userguide/cli-install-macos.html) / [한국어 링크](https://aws.amazon.com/ko/cli/) 로 가면 다른 OS에서 대한 정보도 얻을 수 있습니다.

![MacOS에서 버젼 확인 후 업데이트 하는 장면](/static/assets/aws-cli-updates.png)

```
aws configure
```

접속하니 용량이 너무 작았습니다. 용량을 넓히고, 무엇보다 중요한건 CLI에서
optimizing 해줘야 합니다.

- [EBS 용량 늘리는 법](http://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/ebs-expand-volume.html)
- [볼륨 크기 조정 후 Linux 파일 시스템 확장](http://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/ebs-expand-volume.html#recognize-expanded-volume-linux)
- [Stackoverflow](https://stackoverflow.com/questions/11014584/ec2-cant-resize-volume-after-increasing-size)

I faced same issue today. AWS documentation does not clearly mention growpart. I figured out the hard way and indeed the two commands worked perfectly on M4.large & M4.xlarge with Ubuntu

```
sudo growpart /dev/xvda 1
sudo resize2fs /dev/xvda1
```


