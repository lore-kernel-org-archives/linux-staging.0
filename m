Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915762AB35
	for <linux-staging@lists.linux.dev>; Wed, 12 Jul 2023 15:05:05 +0000 (UTC)
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-6b8c415fdd3so1340290a34.1
        for <linux-staging@lists.linux.dev>; Wed, 12 Jul 2023 08:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689174304; x=1691766304;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m94uNVGmc3E0yBEqPvT1uJfZAtrvKe9dapVrNuSbByc=;
        b=YHCiqnZzBj6YaOpoCWSUf2MAVfNhiaUmujWrZ8WPNvRKBI9ebKL0WL0OqWO8eX7Fkj
         qAaWnRlIp7p77TM6YQFAUnpXD50tWjKCkqJf78/G+zQDBh18ACx93YHdcXUyKQHHEVZO
         qgj/893sy65DcRb8k2RMLYqUM0J8b6L6uW8NQuz5E54LaaZiw33BIDxnwsii/7arAeR1
         RZzf+PrzSMX+Tqm9UHyZCtcuiCk/6M6fpdRzzy4/MfEjp9hSAmfnCakFoDElZiuGhyPv
         TW6fUMAC/2tqV8NX9D1y0FYkEXg7+Ylxe/roBQF8bWuJRJQMh3DN1iPQVEqyRJ+Ed2cB
         5waA==
X-Gm-Message-State: ABy/qLadDzf2kyuLQJPv7A7zNFnY63RZTvCJpXVP4eC0aPpCoI7u0oEa
	PaFV3w8Resezt3NN18fZdPMtZZtub8TxPZLcIr4bHw2GX3b+
X-Google-Smtp-Source: APBJJlE6T4mKAFfXv9J5kh533uZw7yg1Mbm6bvYZirhGaKSi+0a2yNsJa1xutVhKpvYIqxMqZPLHddPeicgsgBG5OrRP2aA+x8U5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:ee16:b0:1b0:4e46:7f13 with SMTP id
 ga22-20020a056870ee1600b001b04e467f13mr3474579oab.2.1689174304068; Wed, 12
 Jul 2023 08:05:04 -0700 (PDT)
Date: Wed, 12 Jul 2023 08:05:04 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005b9d6e06004b8aa0@google.com>
Subject: [syzbot] [staging?] [usb?] memory leak in _r8712_init_xmit_priv
From: syzbot <syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8689f4f2ea56 Merge tag 'mmc-v6.5-2' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11ac3fa0a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=832b404e095b70c0
dashboard link: https://syzkaller.appspot.com/bug?extid=cf71097ffb6755df8251
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16f26d02a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14482e54a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/31f0c2383fbf/disk-8689f4f2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/98c44efd609e/vmlinux-8689f4f2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bbd75026af9a/bzImage-8689f4f2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com

executing program
BUG: memory leak
unreferenced object 0xffff88810a4db000 (size 4096):
  comm "kworker/0:3", pid 4752, jiffies 4294941496 (age 19.480s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8154bfa4>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
    [<ffffffff83c3bf41>] kmalloc include/linux/slab.h:582 [inline]
    [<ffffffff83c3bf41>] _r8712_init_xmit_priv+0x2b1/0x660 drivers/staging/rtl8712/rtl871x_xmit.c:131
    [<ffffffff83c36b86>] r8712_init_drv_sw+0xc6/0x260 drivers/staging/rtl8712/os_intfs.c:311
    [<ffffffff83c35766>] r871xu_drv_init+0x1f6/0x9d0 drivers/staging/rtl8712/usb_intf.c:386
    [<ffffffff83237329>] usb_probe_interface+0x179/0x3c0 drivers/usb/core/driver.c:396
    [<ffffffff82ba039d>] call_driver_probe drivers/base/dd.c:579 [inline]
    [<ffffffff82ba039d>] really_probe+0x12d/0x430 drivers/base/dd.c:658
    [<ffffffff82ba0761>] __driver_probe_device+0xc1/0x1a0 drivers/base/dd.c:798
    [<ffffffff82ba086a>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:828
    [<ffffffff82ba0a5b>] __device_attach_driver+0xfb/0x150 drivers/base/dd.c:956
    [<ffffffff82b9d7b1>] bus_for_each_drv+0xc1/0x110 drivers/base/bus.c:457
    [<ffffffff82ba0f82>] __device_attach+0x102/0x2a0 drivers/base/dd.c:1028
    [<ffffffff82b9ef1a>] bus_probe_device+0xca/0xd0 drivers/base/bus.c:532
    [<ffffffff82b9b513>] device_add+0x993/0xc60 drivers/base/core.c:3625
    [<ffffffff83234409>] usb_set_configuration+0x9a9/0xc90 drivers/usb/core/message.c:2211
    [<ffffffff83246ed1>] usb_generic_driver_probe+0xa1/0x100 drivers/usb/core/generic.c:238
    [<ffffffff83236a00>] usb_probe_device+0x60/0x140 drivers/usb/core/driver.c:293

BUG: memory leak
unreferenced object 0xffff88810a4de000 (size 4096):
  comm "kworker/0:3", pid 4752, jiffies 4294941496 (age 19.480s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8154bfa4>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
    [<ffffffff83c3bf41>] kmalloc include/linux/slab.h:582 [inline]
    [<ffffffff83c3bf41>] _r8712_init_xmit_priv+0x2b1/0x660 drivers/staging/rtl8712/rtl871x_xmit.c:131
    [<ffffffff83c36b86>] r8712_init_drv_sw+0xc6/0x260 drivers/staging/rtl8712/os_intfs.c:311
    [<ffffffff83c35766>] r871xu_drv_init+0x1f6/0x9d0 drivers/staging/rtl8712/usb_intf.c:386
    [<ffffffff83237329>] usb_probe_interface+0x179/0x3c0 drivers/usb/core/driver.c:396
    [<ffffffff82ba039d>] call_driver_probe drivers/base/dd.c:579 [inline]
    [<ffffffff82ba039d>] really_probe+0x12d/0x430 drivers/base/dd.c:658
    [<ffffffff82ba0761>] __driver_probe_device+0xc1/0x1a0 drivers/base/dd.c:798
    [<ffffffff82ba086a>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:828
    [<ffffffff82ba0a5b>] __device_attach_driver+0xfb/0x150 drivers/base/dd.c:956
    [<ffffffff82b9d7b1>] bus_for_each_drv+0xc1/0x110 drivers/base/bus.c:457
    [<ffffffff82ba0f82>] __device_attach+0x102/0x2a0 drivers/base/dd.c:1028
    [<ffffffff82b9ef1a>] bus_probe_device+0xca/0xd0 drivers/base/bus.c:532
    [<ffffffff82b9b513>] device_add+0x993/0xc60 drivers/base/core.c:3625
    [<ffffffff83234409>] usb_set_configuration+0x9a9/0xc90 drivers/usb/core/message.c:2211
    [<ffffffff83246ed1>] usb_generic_driver_probe+0xa1/0x100 drivers/usb/core/generic.c:238
    [<ffffffff83236a00>] usb_probe_device+0x60/0x140 drivers/usb/core/driver.c:293

BUG: memory leak
unreferenced object 0xffff88810a4d9000 (size 4096):
  comm "kworker/0:3", pid 4752, jiffies 4294941496 (age 19.480s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8154bfa4>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
    [<ffffffff83c3bf41>] kmalloc include/linux/slab.h:582 [inline]
    [<ffffffff83c3bf41>] _r8712_init_xmit_priv+0x2b1/0x660 drivers/staging/rtl8712/rtl871x_xmit.c:131
    [<ffffffff83c36b86>] r8712_init_drv_sw+0xc6/0x260 drivers/staging/rtl8712/os_intfs.c:311
    [<ffffffff83c35766>] r871xu_drv_init+0x1f6/0x9d0 drivers/staging/rtl8712/usb_intf.c:386
    [<ffffffff83237329>] usb_probe_interface+0x179/0x3c0 drivers/usb/core/driver.c:396
    [<ffffffff82ba039d>] call_driver_probe drivers/base/dd.c:579 [inline]
    [<ffffffff82ba039d>] really_probe+0x12d/0x430 drivers/base/dd.c:658
    [<ffffffff82ba0761>] __driver_probe_device+0xc1/0x1a0 drivers/base/dd.c:798
    [<ffffffff82ba086a>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:828
    [<ffffffff82ba0a5b>] __device_attach_driver+0xfb/0x150 drivers/base/dd.c:956
    [<ffffffff82b9d7b1>] bus_for_each_drv+0xc1/0x110 drivers/base/bus.c:457
    [<ffffffff82ba0f82>] __device_attach+0x102/0x2a0 drivers/base/dd.c:1028
    [<ffffffff82b9ef1a>] bus_probe_device+0xca/0xd0 drivers/base/bus.c:532
    [<ffffffff82b9b513>] device_add+0x993/0xc60 drivers/base/core.c:3625
    [<ffffffff83234409>] usb_set_configuration+0x9a9/0xc90 drivers/usb/core/message.c:2211
    [<ffffffff83246ed1>] usb_generic_driver_probe+0xa1/0x100 drivers/usb/core/generic.c:238
    [<ffffffff83236a00>] usb_probe_device+0x60/0x140 drivers/usb/core/driver.c:293



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
