Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1242C70
	for <linux-staging@lists.linux.dev>; Tue, 20 Jul 2021 15:21:06 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id w2-20020a056e0213e2b029020f555eb3c6so13304843ilj.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Jul 2021 08:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=wHPu2v3g0CljzOh50ecL5zxxf0iqTJp1J2cw3INOhJ4=;
        b=IqqWzf0b1OCY4c3foZO82UAFcWAo2DIfM/vGK+ZAL+jGI7Gf5Y+uuEe/YFnl2yilXL
         Xc/5XpJI10HwV8m48uS+vnnnmC+8PmvG+CAv1KHkP9/WAJ8i+UPn466gJhh8MfVE3HoM
         /DF1C/F8uCyFQytgmtNEk4Zyil9rzzddDPc0nmNuIEICjqI8ytWW6LNs86vXsZt2L8hm
         vtzoghj7yr9cx1/+GyUUzhjroyGt4LbmEhs8hzMzUvKUrZV1nIOWTJXAmL7YOKPQMkVj
         /E1BvlmzZGbWRr2JOJiMU94yRHvlTun2evVl57fMEDOpLuJkfdcUjPVvSV3X+1eLBbtP
         84pQ==
X-Gm-Message-State: AOAM532egDGAF4SHO4e243dARVWX7zXOZBv6qdu3W62SpbLZ9HTuz6ig
	4yNVYDeB0Cu1Np+wqpcvYkTYmAbOjNta7adQ+V3XRXlVSdkO
X-Google-Smtp-Source: ABdhPJxNN5WzS3+MS/DmBMOGx4BXlYJjcrxkNPDyxEBAZ4SrLe6u0BnnfwNSpq3H6hywNEbfBE47dCP+UUETIzeCCNZGta4vCKQk
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a5d:938a:: with SMTP id c10mr7334142iol.0.1626794466197;
 Tue, 20 Jul 2021 08:21:06 -0700 (PDT)
Date: Tue, 20 Jul 2021 08:21:06 -0700
In-Reply-To: <20210720141039.3d4ddcfe@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000047c76a05c78f9ab1@google.com>
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
possible deadlock in flush_workqueue

usb 6-1: r8712u: Loading firmware from "rtlwifi/rtl8712u.bin"
usb 6-1: Direct firmware load for rtlwifi/rtl8712u.bin failed with error -2
usb 6-1: Falling back to sysfs fallback for: rtlwifi/rtl8712u.bin
usb 6-1: r8712u: Firmware request failed
============================================
WARNING: possible recursive locking detected
5.14.0-rc2-syzkaller #0 Not tainted
--------------------------------------------
kworker/0:3/3159 is trying to acquire lock:
ffff888011064d38 ((wq_completion)events){+.+.}-{0:0}, at: flush_workqueue+0x15c/0x1750 kernel/workqueue.c:2787

but task is already holding lock:
ffff888011064d38 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x7aa/0x10c0 kernel/workqueue.c:2249

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock((wq_completion)events);
  lock((wq_completion)events);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

5 locks held by kworker/0:3/3159:
 #0: ffff888011064d38 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x7aa/0x10c0 kernel/workqueue.c:2249
 #1: ffffc900021d7d20 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x7e8/0x10c0 kernel/workqueue.c:2251
 #2: ffff8881467d4220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:754 [inline]
 #2: ffff8881467d4220 (&dev->mutex){....}-{3:3}, at: rtl871x_load_fw_fail drivers/staging/rtl8712/hal_init.c:43 [inline]
 #2: ffff8881467d4220 (&dev->mutex){....}-{3:3}, at: rtl871x_load_fw_cb+0x102/0x130 drivers/staging/rtl8712/hal_init.c:56
 #3: ffff8880363da220 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:754 [inline]
 #3: ffff8880363da220 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1028 [inline]
 #3: ffff8880363da220 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0xc1/0x7b0 drivers/base/dd.c:1229
 #4: ffff8880308211a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:754 [inline]
 #4: ffff8880308211a8 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1028 [inline]
 #4: ffff8880308211a8 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0xc1/0x7b0 drivers/base/dd.c:1229

stack backtrace:
CPU: 0 PID: 3159 Comm: kworker/0:3 Not tainted 5.14.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events request_firmware_work_func
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1ae/0x29f lib/dump_stack.c:105
 __lock_acquire+0x2615/0x6100 kernel/locking/lockdep.c:4853
 lock_acquire+0x182/0x4a0 kernel/locking/lockdep.c:5625
 flush_workqueue+0x178/0x1750 kernel/workqueue.c:2787
 flush_scheduled_work include/linux/workqueue.h:597 [inline]
 r871xu_dev_remove+0x159/0x420 drivers/staging/rtl8712/usb_intf.c:604
 usb_unbind_interface+0x1f2/0x860 drivers/usb/core/driver.c:458
 __device_release_driver drivers/base/dd.c:1201 [inline]
 device_release_driver_internal+0x51e/0x7b0 drivers/base/dd.c:1232
 bus_remove_device+0x2fd/0x410 drivers/base/bus.c:529
 device_del+0x6e1/0xc10 drivers/base/core.c:3540
 usb_disable_device+0x407/0x800 drivers/usb/core/message.c:1419
 usb_set_configuration+0x42b/0x2100 drivers/usb/core/message.c:2027
 usb_unbind_device+0x6b/0x170 drivers/usb/core/driver.c:309
 __device_release_driver drivers/base/dd.c:1201 [inline]
 device_release_driver_internal+0x51e/0x7b0 drivers/base/dd.c:1232
 rtl871x_load_fw_fail drivers/staging/rtl8712/hal_init.c:45 [inline]
 rtl871x_load_fw_cb+0x10a/0x130 drivers/staging/rtl8712/hal_init.c:56
 request_firmware_work_func+0x175/0x250 drivers/base/firmware_loader/main.c:1081
 process_one_work+0x833/0x10c0 kernel/workqueue.c:2276
 worker_thread+0xac1/0x1320 kernel/workqueue.c:2422
 kthread+0x453/0x480 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295


Tested on:

commit:         8cae8cd8 seq_file: disallow extremely large seq buffer..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149905f2300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=300aea483211c875
dashboard link: https://syzkaller.appspot.com/bug?extid=cc699626e48a6ebaf295
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.1
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15737b4a300000

