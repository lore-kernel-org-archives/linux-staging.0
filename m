Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910825;
	b=WOygJVGiA9UF6w2IXNktYSLKGUNukYOLr+60UvszsEBxDXXgUupH2rlMUKWIi0IARELC
	 67GdlBP1M/+L8tdatQZ36TAEq76XBpGFcpWUy2c0XLJ4iBNmXttv3eQATYV5SV5IR02RE
	 yT+qccJnNKQkUGE0QgLdAbTBymUQNjiwGeka+1O/PvgGUzggT3/G1qPpOrEWgDCMXJDP9
	 lpIP/KiqLOUqpLLT7CgvafL8Qx6C+05G78i5FtMNGzQsifq64QhCscJGdV7xENPik+3Oq
	 XeYxRuxQsVCLlGtQr/37yILOyl7vO14qodCjVmnzPN3XgtxtiJuPSMYCLFT81Oe6xxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910825;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=AooaoAilJ+hgjnSAd1rqqNaAAjXN6UUVw/jzA7syHSc=;
	b=5StkMvCs5XPF1De8XE8xxnUPvGMZEn8zsI0GVl1JTNL3odPOxqbxEkPkSBPU6oekR5l4
	 pu0LInJWz4fWWqoYISx4bjlYidPbOSh4CXACl4tYcZNqL7S2eXAGFdmSx33P5PjSctOym
	 i2aBI9rWPqev/aNj7x0EpvoD0aARySZl43APE6HDJbrtVIoMt0uabBkElPWRwTmpqlaIN
	 g+fKJI7b0fwfAnflFxqG1MbbbSlPOQmUbNhqSzNmAemdKB2V5dTp+aLH0iKi9NNIzX5zJ
	 EclN3EFexGblYIrLsDmsgWTQ2HoBND6IMrTDh2UqWrMKggrZ2d4nliY/fm7Agmv2/bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218C9606A32F
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 20:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 218C9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8437834ad7eso3220784a34.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Nov 2026 12:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910824; x=1794515624;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AooaoAilJ+hgjnSAd1rqqNaAAjXN6UUVw/jzA7syHSc=;
        b=1qmpiYuofOVXC48BDqeVbqhBlH5DDNk3nptwLjiYZ1vUdQb0HszjU6eL7DUUii/jiM
         V7CLIa5sgJW59dyofx3N2/b3NpbGqECTEpJqd/XmkbkospX6FiUcgJeYVgi2D8qicuNY
         ScsbZz410Zk1HmIyDO1Kdn7nTmqygutX/JgLi3L0ElZLj820Y0ajU65irA09xtMRnyTn
         gW6pfwq2YZfJbM/e9sY+V2tD0dKFd+1ZaVw9j5/8uyRI6fyf9IY6ofTzQHSVegbpAo3b
         j/CSSrWAqV0CLiPGFlLULuM781r7ssVe/CtAUqklhsOMU7DSkTz6W81CqEaqI+01+gEX
         8Qyg==
X-Forwarded-Encrypted: i=1; AKwUvByCjxhq5kfNV/E4ac3fiY3lMC+fhLdCsHTj7B5zl/Ava/6QhLo+SMDn6P6altvr0Bf/qKRX5oo4NTwodOyw@lists.linux.dev
X-Gm-Message-State: APuU4Z9+MakAT0P4bdW8R4CAAgftf3sBwS6JLmYQVJU9ODCHORjAyVsi
	imFL+IE9Px3UTHasN20sEghXV+6wk9ffKxXV7S/GQSLvFZmVZbSApf7VH61MUYqvHT8esWszceD
	4G4EuFgYbTVZXlLUPBT65tEZTMBJCj3IriRMq18SABdPWlrhZ8A4Kd03KndA=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f61:b0:4c4:a240:9c3a with SMTP id
 5614622812f47-567e0993ebcmr356219b6e.4.1793910824203; Thu, 05 Nov 2026
 12:33:44 -0800 (PST)
Date: Thu, 05 Nov 2026 12:33:44 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aece828.ae8774f5.3905c1.0000.GAE@google.com>
Subject: [syzbot] Monthly greybus report (Nov 2026)
From: syzbot <syzbot+list4050b078885043dc999b@syzkaller.appspotmail.com>
To: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello greybus maintainers/developers,

This is a 31-day syzbot report for the greybus subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/greybus

During the period, 3 new issues were detected and 0 were fixed.
In total, 4 issues are still open.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 233     Yes   KASAN: slab-out-of-bounds Write in gb_operation_message_alloc
                  https://syzkaller.appspot.com/bug?extid=2fd6aefc361af86911d5
<2> 119     Yes   WARNING: ODEBUG bug in gb_operation_put
                  https://syzkaller.appspot.com/bug?extid=61464b62b688791cc24c
<3> 40      Yes   WARNING: ODEBUG bug in gb_operation_sync_timeout
                  https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
