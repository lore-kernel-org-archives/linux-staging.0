Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ECA2C81
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 21:17:33 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id u21so10399544lff.8
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 14:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bpFxd53CAHYKczCq3v4lVV5jmE8IcTlnWv6pG2Lu9o=;
        b=EBjNC78e8rjQLzrT+3EwmXYI7ewO6+H2OvqRqC1CqQBzgNM/oseUGJKsqwgicvRFRT
         ZzOrC5a+yHZbO53LnkJNeYKml6VBXPa0pj/D2+kQd0HHO4N0DN6iO6P0S1hRB7ckpYbk
         1NL0GymoU1VCBF2ElQqHM2bzI2KYaQsTuzvJhLifrZPe/e9RfX5kbH1YrEN7aPAfU5+o
         p5yPrFwulH+APr9tGw+cTBNw6LHyPh+fhzyWVSHCRtf6p6UapSo3tyRBhVBg6excEYum
         NJqqU7tKDlMr3roY/sdz+/QDC6tEM4x4cXyBqvaUzwFHrnR3S4+97mduWqunoHMeezeb
         f5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bpFxd53CAHYKczCq3v4lVV5jmE8IcTlnWv6pG2Lu9o=;
        b=mBOgPfIG1U/h3anlya2wW5oAWwEWwLC/vosUXFBFiclBqWIil3eFdzh2yJP1G4tL5/
         cbEWXZTb9NH4LEXPbiBzZ17gQc7mvQL2u+jviGIYIqg/ydl/m/L4F5OwBbXD8ESGCB1k
         5Ykx39xqkODkwI/pfQ7MQMNoFr9cioPSWZ8JMzLrm52EzbVPf8rht553eEb4J2LFLX8X
         DhM4QYPogxlwz8cuB0jXblndiZnkaOFeG0FRdUYJm51G1LMeIQ/KWARpxAYeWJpAO9+H
         ER3HoejNxwtez+vJQBQ/6sPiCpsMpRsVs0R+0LfH3fBAugEEa/5iIrhZirS6oO7Wxdf/
         ymOQ==
X-Gm-Message-State: AOAM5333/8i/X59RkETxg9FjSvh0jKsff8A6f14D3xyj5L6RhyXw0fsD
	9O2yNFSB4Gu99XKuwaiXmZE=
X-Google-Smtp-Source: ABdhPJx+vyVxhDReZopMlegXcwMMh6dclK8RubwcAqbTMekYgokYz0PBPX6npDBV/In1+xKXNOA8uA==
X-Received: by 2002:ac2:4c42:: with SMTP id o2mr8379327lfk.504.1634678251628;
        Tue, 19 Oct 2021 14:17:31 -0700 (PDT)
Received: from localhost.localdomain ([94.103.235.181])
        by smtp.gmail.com with ESMTPSA id p16sm22330lfa.266.2021.10.19.14.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:17:31 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	hridayhegde1999@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	syzbot+c55162be492189fb4f51@syzkaller.appspotmail.com
Subject: [PATCH] staging: rtl8712: fix use-after-free in rtl8712_dl_fw
Date: Wed, 20 Oct 2021 00:17:18 +0300
Message-Id: <20211019211718.26354-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported use-after-free in rtl8712_dl_fw(). The problem was in
race condition between r871xu_dev_remove() ->ndo_open() callback.

It's easy to see from crash log, that driver accesses released firmware
in ->ndo_open() callback. It may happen, since driver was releasing
firmware _before_ unregistering netdev. Fix it by moving
unregister_netdev() before cleaning up resources.

Call Trace:
...
 rtl871x_open_fw drivers/staging/rtl8712/hal_init.c:83 [inline]
 rtl8712_dl_fw+0xd95/0xe10 drivers/staging/rtl8712/hal_init.c:170
 rtl8712_hal_init drivers/staging/rtl8712/hal_init.c:330 [inline]
 rtl871x_hal_init+0xae/0x180 drivers/staging/rtl8712/hal_init.c:394
 netdev_open+0xe6/0x6c0 drivers/staging/rtl8712/os_intfs.c:380
 __dev_open+0x2bc/0x4d0 net/core/dev.c:1484

Freed by task 1306:
...
 release_firmware+0x1b/0x30 drivers/base/firmware_loader/main.c:1053
 r871xu_dev_remove+0xcc/0x2c0 drivers/staging/rtl8712/usb_intf.c:599
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458

Fixes: 8c213fa59199 ("staging: r8712u: Use asynchronous firmware loading")
Reported-and-tested-by: syzbot+c55162be492189fb4f51@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/rtl8712/usb_intf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index 505ebeb643dc..cae04272deff 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -595,12 +595,12 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 
 	/* never exit with a firmware callback pending */
 	wait_for_completion(&padapter->rtl8712_fw_ready);
+	if (pnetdev->reg_state != NETREG_UNINITIALIZED)
+		unregister_netdev(pnetdev); /* will call netdev_close() */
 	usb_set_intfdata(pusb_intf, NULL);
 	release_firmware(padapter->fw);
 	if (drvpriv.drv_registered)
 		padapter->surprise_removed = true;
-	if (pnetdev->reg_state != NETREG_UNINITIALIZED)
-		unregister_netdev(pnetdev); /* will call netdev_close() */
 	r8712_flush_rwctrl_works(padapter);
 	r8712_flush_led_works(padapter);
 	udelay(1);
-- 
2.33.1

