Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770DE2C81
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 21:09:08 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id q17-20020a92c011000000b00259ba4244faso1613720ild.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 14:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=zv4Ff+EvirxD9Sti+DPatT77gsB6mvVIfAn+44z0Cf8=;
        b=2S4v+LSFsoa12rv32tZ2x5zibYsYxhFIbbU/aitHtAe2Nx9IfflBFFJSlGiBn0Dipp
         O4K6mkle+TwpuPgdcZNqfN2R7GbiRqLnek90Nz3OodIg7KPVFFaMgWznqPo/4EtwmtD4
         +Vp1FNarjFZ906jjtajCTp0eOV3H3yq9GMT67EK0B0mjfm0UzrAGTeA3OanSvgidv9Ox
         oFJMYaq3sVr1Rq4X5gbDW7UMypj7ejBlmrvbdTMz4Z2nFgKyrjytLqb8fwi8NR+ucW7r
         GU3bqdFd1mlL06lyTzrVEuXuhYvVRre2dQpd1Z4kQz0cJrKfSgCbI4TYfNsbBa185LLd
         LGIw==
X-Gm-Message-State: AOAM5336xdAiP5cpk4kKA9aDldKm81CiSGL/F9B4BbOZvM3aEhxN5ydI
	ROYv/UKstupAF0MXgWsRUQDJduLm29Q/l/NS4eWhzprNmHNX
X-Google-Smtp-Source: ABdhPJzLYFSTrQZlVF6KtsED28EZgP23hSEbF0h5Qnz5TuhAwjS5tV/Ty7UnPxCZ1gy7WhBDFIjl/kQ6ls1FrBpBH7aREnB92H/K
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a6b:fe05:: with SMTP id x5mr21247279ioh.201.1634677747302;
 Tue, 19 Oct 2021 14:09:07 -0700 (PDT)
Date: Tue, 19 Oct 2021 14:09:07 -0700
In-Reply-To: <4617c408-b7f6-8861-4307-ed0ec24283ea@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000073441e05cebb127c@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in rtl8712_dl_fw
From: syzbot <syzbot+c55162be492189fb4f51@syzkaller.appspotmail.com>
To: Larry.Finger@lwfinger.net, agamkohli9@gmail.com, 
	florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-usb@vger.kernel.org, paskripkin@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+c55162be492189fb4f51@syzkaller.appspotmail.com

Tested on:

commit:         8ef1e587 usb: typec: STUSB160X should select REGMAP_I2C
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
kernel config:  https://syzkaller.appspot.com/x/.config?x=c27d285bdb7457e2
dashboard link: https://syzkaller.appspot.com/bug?extid=c55162be492189fb4f51
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=164527c8b00000

Note: testing is done by a robot and is best-effort only.
