Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBF3168
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 17:12:10 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id s7-20020a92cb070000b02902021736bb95so1962297ilo.5
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 10:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Y6Y4vaAAE0NKEq1EsKmEUMtdOo6howUC6ShUJPK7rvY=;
        b=ceRjTzIglWF9jW123kiKpJtzz28KHNEFPcYu0zoYn/ZMFjNrR8418rPV/XwIKFse15
         6kPBwqacXx++iYQJ+Kws/JrzPZGLB0430rSA2/bKtiei6NHGF7qx9iM7Q5vKI99cGib/
         5sYCPpqAZezPZyohMwuiqWtdNnO+5TU4/+NZVb4b78ocSXkFIOch2KqFcs1NN7G2uy/9
         i2/4uMTgWiBBTJ/AOD8pdekTtPHrGRVcy/r4bGM3M4deRTm7CGqtqwT3Nk62JX8bUbrg
         zMXSkSLfsIT+TQOIszxdfqmpXJzA3Lx2h7IctI3cIG+smW0CVeBTrCAqYXrfCKePj67N
         IxoQ==
X-Gm-Message-State: AOAM5324eEH6eHCZ7DsSJUYHlxjyzZUQHTAAT4G6Ehw8l/pDWQyGd5Fu
	0cTkiBAKmKXcntpV5pZO6EqQab95EqH+dWzPULL31VYTd6xR
X-Google-Smtp-Source: ABdhPJwOcoCWNrFNs7X5bO4INkmOxb/0VbZ+2JV+gC5QQQzrnTq80EKiEfN0a6IyAyRs0n40t/rA5mYatxazN77t71VCI4vUJf0b
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:538:: with SMTP id j24mr22358891jar.59.1626887529635;
 Wed, 21 Jul 2021 10:12:09 -0700 (PDT)
Date: Wed, 21 Jul 2021 10:12:09 -0700
In-Reply-To: <20210721130143.396c1626@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004b212a05c7a545a7@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in r871xu_dev_remove
From: syzbot <syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	gregkh@linuxfoundation.org, hridayhegde1999@gmail.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	paskripkin@gmail.com, rkovhaev@gmail.com, straube.linux@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com

Tested on:

commit:         8cae8cd8 seq_file: disallow extremely large seq buffer..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f7dfeb6dfc05ea19
dashboard link: https://syzkaller.appspot.com/bug?extid=5872a520e0ce0a7c7230
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11291aa2300000

Note: testing is done by a robot and is best-effort only.
