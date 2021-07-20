Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1579E72
	for <linux-staging@lists.linux.dev>; Tue, 20 Jul 2021 22:10:09 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id a13-20020a92c54d0000b0290216ae9088ffso380768ilj.9
        for <linux-staging@lists.linux.dev>; Tue, 20 Jul 2021 15:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=su0ZDiChfXsok14gNrh34ghXNW9Yz7pmB2Wte3vJIIU=;
        b=RRyTpPsNNWh0ezOJxkOnW7koCFrdkCYpEkmh+NT0TgnqC8Iy7wGP42SIK9WVJsNCGJ
         tcnvVsCp3Rl/0DxZETtOg3EikREenx/S8lQbeD0HBFrWXbZTdbMKEAWn58PRFpdt+Loc
         4LD/8qdoL+gdtGKzSjjmloo0uSdGPMsNfq6h3TQ+8O98WtHv610Ap1Fg4IGJy7STogqw
         A+FKYVwAj+t9FqhEntGG7/IyuL283BmsNX3bzFoSnVhXD6NS6a1R4aMlYO04GKGgI7Md
         N3zpx9F6Zrq32fjHjUASIdJdDRv3ytL0ikUffdS4qF4MJnPQpmXrcRVKJ/WNyaS87Hur
         EZjQ==
X-Gm-Message-State: AOAM532x7SWur+cTVsL1si1698qaaU1+jKuMomdxVGXeW8iZ9/cPhaqI
	Yg98zRadZG2fqifwsVYDy/V+A/pajd7xzhApA5W9EQVcUGX5
X-Google-Smtp-Source: ABdhPJw7gKJqBfPZhtoEW17TY2o5NwcXqOloYEoHUj5de29DbsZwtbAHDlVohsYHSOXNqd2gHkTi+g1IngNnrlUzrBL6/KYKWFuG
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:10e:: with SMTP id s14mr25137569iot.52.1626819008218;
 Tue, 20 Jul 2021 15:10:08 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:10:08 -0700
In-Reply-To: <20210720221445.7d022a9e@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001950a705c795515d@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in do_wait_for_common
From: syzbot <syzbot+cc699626e48a6ebaf295@syzkaller.appspotmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	gregkh@linuxfoundation.org, hridayhegde1999@gmail.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	paskripkin@gmail.com, rkovhaev@gmail.com, straube.linux@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: sleeping function called from invalid context in lock_sock_nested

BUG: sleeping function called from invalid context at net/core/sock.c:3161
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 8824, name: syz-executor.2
1 lock held by syz-executor.2/8824:
 #0: ffffffff8d89c920 (hci_sk_list.lock){++++}-{2:2}, at: hci_sock_dev_event+0x2b6/0x630 net/bluetooth/hci_sock.c:763
Preemption disabled at:
[<0000000000000000>] 0x0
CPU: 0 PID: 8824 Comm: syz-executor.2 Not tainted 5.14.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1d3/0x29f lib/dump_stack.c:105
 ___might_sleep+0x4e5/0x6b0 kernel/sched/core.c:9154
 lock_sock_nested+0x34/0x110 net/core/sock.c:3161
 lock_sock include/net/sock.h:1613 [inline]
 hci_sock_dev_event+0x30a/0x630 net/bluetooth/hci_sock.c:765
 hci_unregister_dev+0x487/0x19b0 net/bluetooth/hci_core.c:4033
 vhci_release+0x73/0xc0 drivers/bluetooth/hci_vhci.c:340
 __fput+0x352/0x7b0 fs/file_table.c:280
 task_work_run+0x146/0x1c0 kernel/task_work.c:164
 exit_task_work include/linux/task_work.h:32 [inline]
 do_exit+0x72b/0x2510 kernel/exit.c:825
 do_group_exit+0x168/0x2d0 kernel/exit.c:922
 __do_sys_exit_group+0x13/0x20 kernel/exit.c:933
 __se_sys_exit_group+0x10/0x10 kernel/exit.c:931
 __x64_sys_exit_group+0x37/0x40 kernel/exit.c:931
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4665d9
Code: Unable to access opcode bytes at RIP 0x4665af.
RSP: 002b:00007ffe15e4abc8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007ffe15e4b388 RCX: 00000000004665d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000043
RBP: 0000000000000000 R08: 0000000000000025 R09: 00007ffe15e4b388
R10: 00000000ffffffff R11: 0000000000000246 R12: 00000000004bef54
R13: 0000000000000010 R14: 0000000000000000 R15: 0000000000400538

======================================================


Tested on:

commit:         8cae8cd8 seq_file: disallow extremely large seq buffer..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=161182ea300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=300aea483211c875
dashboard link: https://syzkaller.appspot.com/bug?extid=cc699626e48a6ebaf295
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.1
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13c31a5a300000

