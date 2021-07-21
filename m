Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD3D168
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 16:53:14 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id i9-20020a0566021349b02904df6556dad4so2020175iov.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 09:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=gxyqQvbXalzs54ThUrwETt9kFkgligD2HIuxmfdETBQ=;
        b=qJX7ce0N7K3mXiQ5gqnYZxeuGPFV50/GRUUA0mj8anzB4x2K3zwiaMRqJyp7qo7Rgl
         5LnQJ2N9J8VuvvhRCb4tT3bmzaBdBWM845ButiZ7HDaxV82uZxDPikW2ElsLkvsmyfDf
         owuIP9BdAWFj3gxDDMEWo+agwB5uuznNxOjGLvfJoMJJ1JIf+xI1+etLrPRiykf9GEJY
         a9XGBhvTgPqIiXXMTDEd1pQE0rDOqyfksN9kHxyXJHzryPryQ+fh9uCCCT8eFlAHJjAz
         YcsWQLx0IE1b7jM6iVR+iZvixwVWMBrLe7e/4OjWRvi8Zm7OC9WFuI/HgfJ9cIk6of4V
         CpHA==
X-Gm-Message-State: AOAM530BpyYA5dhS6OGY2U1uc0J2cVfR/qLvgp037/iRurJ4fLfpSUBq
	0jHkdpepocd3Q/wg8oDGkgAbq06vsU9ALSVIeiWDFGfcsoAW
X-Google-Smtp-Source: ABdhPJxs3YL4DMoh9YXP6oKHGFZzawFBVEXzfEdTgQWajC/iEbeG9HpwgfC30tgN/zbRaL9qcDCGYWliT+MBKtJAOlkNt/LCBF2o
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:b111:: with SMTP id t17mr25820868ilh.208.1626886393308;
 Wed, 21 Jul 2021 09:53:13 -0700 (PDT)
Date: Wed, 21 Jul 2021 09:53:13 -0700
In-Reply-To: <20210721125710.1a1c041f@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000902d5d05c7a50171@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in do_wait_for_common
From: syzbot <syzbot+cc699626e48a6ebaf295@syzkaller.appspotmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	gregkh@linuxfoundation.org, hridayhegde1999@gmail.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	paskripkin@gmail.com, rkovhaev@gmail.com, straube.linux@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+cc699626e48a6ebaf295@syzkaller.appspotmail.com

Tested on:

commit:         8cae8cd8 seq_file: disallow extremely large seq buffer..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=300aea483211c875
dashboard link: https://syzkaller.appspot.com/bug?extid=cc699626e48a6ebaf295
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.1
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1174d0d4300000

Note: testing is done by a robot and is best-effort only.
