Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3907A
	for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 21:33:29 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id b11-20020a92340b000000b002d3dbbc7b15so4650358ila.5
        for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 14:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=UBb7FXZ2HjkvN5VW+yOvWBc5CJthxRRWPN6cbtdXnTA=;
        b=nDfq7KXFrMnjbeSm9LuIs7X7kB5XXVe3TO5N6ypp+WFamRqQxiclvqUFVnixOHP/8W
         2G0oc2c72Bt2cZOv6gWBF/S4bywm7NFZMdSUxl5qX0t6xjKZcrFTOC/lMPTW0qMZVteL
         Hkb+ynjDfu8qOXzfjA1z3WJBR5tgVIstRffCYJCOmygMJKUdTQaaLoVly7OoViuWQQAx
         9ey3K9A9Ro7dj/gWlKMA3fRHKwKVK+DV4eKhgwGiKP/68PHoL8AexnOeyVl2afJyvrK0
         aCyZ4FPzKzTI5JE4n2ypFi3l/54M3ES4vIDO/uFdwSBaNNexKUoouOrMaphYW3klWqVq
         4OCw==
X-Gm-Message-State: AJIora9r+H6diHWJ/bMEbMJU0v8aZssDJngS0qGNPq17hkMEs+zYWmem
	xBgLx4ET1KENdX8QW0j8KMAV9XCwd8wP7g/yIQjzHRhSFdqy
X-Google-Smtp-Source: AGRyM1vd2SRVB05zS2Hxupa/d5pKOBpY7p0/s0vcJd4qSyXhI0yVmPKfXVuEjH0ucuwIkdygRkHhZFPKPlR+5ccAuIqCxFDjBdhj
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:c85c:0:b0:339:dc91:d486 with SMTP id
 r28-20020a02c85c000000b00339dc91d486mr6093020jao.199.1656279208818; Sun, 26
 Jun 2022 14:33:28 -0700 (PDT)
Date: Sun, 26 Jun 2022 14:33:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e3fc8905e2608d4f@google.com>
Subject: [syzbot] WARNING: locking bug in hfa384x_usbctlx_completion_task
From: syzbot <syzbot+ce3408364c4a234dd90c@syzkaller.appspotmail.com>
To: aldas60@gmail.com, dave@stgolabs.net, gregkh@linuxfoundation.org, 
	keescook@chromium.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, nathan@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    105f3fd2f789 Merge branch 'staging-octeon' of gitolite.ker..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=129a824bf00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a352a56bc8822d0c
dashboard link: https://syzkaller.appspot.com/bug?extid=ce3408364c4a234dd90c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10a97af8080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1031ec4bf00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ce3408364c4a234dd90c@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 1 PID: 21 at kernel/locking/lockdep.c:231 hlock_class kernel/locking/lockdep.c:231 [inline]
WARNING: CPU: 1 PID: 21 at kernel/locking/lockdep.c:231 hlock_class kernel/locking/lockdep.c:220 [inline]
WARNING: CPU: 1 PID: 21 at kernel/locking/lockdep.c:231 check_wait_context kernel/locking/lockdep.c:4727 [inline]
WARNING: CPU: 1 PID: 21 at kernel/locking/lockdep.c:231 __lock_acquire+0x1356/0x5660 kernel/locking/lockdep.c:5003
Modules linked in:
CPU: 1 PID: 21 Comm: kworker/1:0 Not tainted 5.19.0-rc3-syzkaller-00071-g105f3fd2f789 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events hfa384x_usbctlx_completion_task
RIP: 0010:hlock_class kernel/locking/lockdep.c:231 [inline]
RIP: 0010:hlock_class kernel/locking/lockdep.c:220 [inline]
RIP: 0010:check_wait_context kernel/locking/lockdep.c:4727 [inline]
RIP: 0010:__lock_acquire+0x1356/0x5660 kernel/locking/lockdep.c:5003
Code: 08 84 d2 0f 85 0e 30 00 00 8b 35 7d ec b3 07 85 f6 0f 85 f4 fd ff ff 48 c7 c6 e0 97 47 86 48 c7 c7 20 92 47 86 e8 9a 5b 96 04 <0f> 0b 31 ed e9 aa f0 ff ff e8 fc f1 e8 00 85 c0 0f 84 12 fe ff ff
RSP: 0018:ffffc9000016fa28 EFLAGS: 00010082
RAX: 0000000000000000 RBX: ffff888109450be0 RCX: 0000000000000000
RDX: ffff888100371c80 RSI: ffffffff812c1d98 RDI: fffff5200002df37
RBP: 0000000000000edc R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000001 R11: 0000000000000001 R12: ffff8881003726c8
R13: ffff888100371c80 R14: 0000000000040000 R15: 00000000000c0edc
FS:  0000000000000000(0000) GS:ffff8881f6900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055fb59fac7c0 CR3: 0000000109e53000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire kernel/locking/lockdep.c:5665 [inline]
 lock_acquire+0x1ab/0x570 kernel/locking/lockdep.c:5630
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x39/0x50 kernel/locking/spinlock.c:162
 hfa384x_usbctlx_completion_task+0x35/0x510 drivers/staging/wlan-ng/hfa384x_usb.c:2641
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2ef/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:302
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
