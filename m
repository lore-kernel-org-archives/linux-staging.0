Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B16FB2
	for <linux-staging@lists.linux.dev>; Sat, 25 May 2024 05:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716613866; cv=none; b=YtxOwrKJt8I1GuxOS6qAe9TzbOCvZDzZmxpezUQLN4QAkI2cA+BUXZINLS3x9AryAR7bIn4vYe+HHJjY94Z71Ye8cDpNx/wdYuSFZC1XnF085iqGbGm5m1KXC5AMNXsZ89CGEyc3vZzY+njDG8Xcz4hx0lPwpFxXLp78yIrYuyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716613866; c=relaxed/simple;
	bh=ChEzdL3+2gOHaf5Aw/yfnfdaUguDfZndQdJ72R/j/mQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RijhjN2h7Y7JyA2Y/2N83Oa29rS5ml90aBh4zFjyD8fqGDTo+5UGLzbSFinVEknaiDhY9XNgbboBQSR8buKaEo8IFtPUKR8wBz6CDAY7el11E6xdn3xHB7aeA8hi5EHTOL/4pupBoP14m+yZ2ll8xZux/+cZ8eipfAM9lAkUJyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-36db4c1ecb3so36132215ab.2
        for <linux-staging@lists.linux.dev>; Fri, 24 May 2024 22:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716613863; x=1717218663;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8IyrQNJ0zAFLZsLTn91HX7IoDexMyQtJMtnbbiIgt0=;
        b=m0SHoZWEbK+zY1UK+Vo2o/VpVv4gmBdPfi7gOOu0QKyRKp4matrmHnBEq19BkIm/7e
         en9bRKtWZtACHbCnFqNQ79z8PP7JeQL02Rm4n4N7XM+o8SNcZf2KNTXcsLxwmWqhuJmq
         D/AcP5ZYJMCRZIOkNQsH3/cOn1bk/6mBusd9esZcz8GzB+Vd8CK2RbxdekoX+P2mzblp
         fu0UaKsCEn9N1CXuZkM1zhYofoV1dv2+tWRVTTKnDoKLJpSfbo6hkGinAeoTw+ng1JmM
         okF3lWBUJp3pwIA/MbG9EZhDKVj9IqsprW044C2EFt2Wbd0DWWgAQMOLLg85xRbTE41s
         0+Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXyB4mPQSrKa6CM6nrIvI3C+sQVeNx0yzee7BHh0ZlGaEs3qOYq97gPNyDzB9Nds1GlQjxlLn9pU1QhkgeKnXCGMSn/Vw96RBEWIiMIfw==
X-Gm-Message-State: AOJu0Yybbl9x5YTPL75iJbCBb6pyIBB937IpV019YuutConDtuvr89Fe
	vVGsQAb0GO25KipxBB7F2mDR/wSh6VpzrSM6+xM1DVr229oMZq1eGN0rtmN5vyCTTacAUEZrFDd
	+D8RBpI6TOoRk+lieMvE34zEW9dpRngn3aMtDznzSdDxgHxewUM1GJlQ=
X-Google-Smtp-Source: AGHT+IEwpd5Ene7lFVYgVE0epmFBsfn5s2UO1jINS7zpgHxZEKqzT9qhLjfX+igNk2YQjqbsnny9VTdFYS/nCzzlC7H/KSJs3Gmi
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4e:b0:373:8c59:d31b with SMTP id
 e9e14a558f8ab-3738c59d5c8mr455755ab.2.1716613863064; Fri, 24 May 2024
 22:11:03 -0700 (PDT)
Date: Fri, 24 May 2024 22:11:03 -0700
In-Reply-To: <20240524201212.mjMDljAc@linutronix.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000865ac60619404fa2@google.com>
Subject: Re: [syzbot] [staging?] [usb?] memory leak in _r8712_init_xmit_priv (2)
From: syzbot <syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com>
To: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, 
	larry.finger@lwfinger.net, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-usb@vger.kernel.org, n.zhandarovich@fintech.ru, namcao@linutronix.de, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com

Tested on:

commit:         56fb6f92 Merge tag 'drm-next-2024-05-25' of https://gi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=12817cb2980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b43fd1b132bcf5ba
dashboard link: https://syzkaller.appspot.com/bug?extid=83763e624cfec6b462cb
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=117c460c980000

Note: testing is done by a robot and is best-effort only.
