Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F522FAE
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 11:49:26 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 29so8813514pgu.11
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 04:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJxQyoocELt1x3hvzM8wTlUu+RsxX8BaAC7AmiRxVCs=;
        b=tbhQ5Efx/OZP4YmD1nKh80oG1m9AMab92RINRSIPFGGaQQc3hYQLPhTVKQBQ5KEmwR
         4C2LbYCJahzLJTnURuXplAunB+DHiBvC6DvrOiMTdhptQpPMqcqHRR7pe4VgurIs0UGv
         s0Cp6Y4Pyb+t4QZS3cypn+TqMi5y+/gVFnUzphdAFwWCIVh6JyM9ECe4lWnVZ1ZuDrQT
         AfiepuEgxkL5muXZfNTrU6DJDanlw5qAeFaDI4gDnEdfEwG0UxdELHMLC5OLma/NIxry
         pPaVG5LaO9JEJsm7YOcESmnPi5AG6G4ZZ/+9WHMhdv56CROgWGr92kS42MGUTIAjJ2hq
         qNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJxQyoocELt1x3hvzM8wTlUu+RsxX8BaAC7AmiRxVCs=;
        b=tq782gCrsV7hwNHrFlo6EFco5/bidk/hO3RYo1NfSLk66c8e7162USCUsCvf/0cMvF
         tTxwIUMIaUMr7sLBbTvIAf7BqRFatzJp1bG4HmV9EBkziZmjjRXFcQJvnagFhCNrAoHm
         mD3V+Q2ilJELeBBTrAm1PYrKdWsejrEFi9Zh9s7hchprqKyIBjIuikcDBfFr/taux+tj
         QwCaDObyysfAwhlHOyXMnttMIla6enB3P1DIJDpFax3sb/by6ZFEa09fdIQWaSHP3yCb
         EZZN2tv6gEnA47dckyqBC2kJAfalUpn0v834jhbGAu83Neiz9LEieR0QwU0q+0F30ou3
         QnOQ==
X-Gm-Message-State: AOAM532jDS2Q2XtiSh8NBCZ8O8qNKHDgV4H7gLYOoy9tvv6l7UEdPR4H
	ZX+iVPvjcMj4c0KwsazfAGc=
X-Google-Smtp-Source: ABdhPJyDA4iAmLxif4YlW0xGRu1E8LXmCz6hiH7rb1vO6QQCPbfIeYXP7GxPfIqUpsfcFd11MKYtjQ==
X-Received: by 2002:a63:f557:: with SMTP id e23mr2997197pgk.55.1621856966245;
        Mon, 24 May 2021 04:49:26 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.20])
        by smtp.gmail.com with ESMTPSA id a15sm10429195pff.128.2021.05.24.04.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 04:49:25 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	rkovhaev@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: [PATCH] staging: rtl8712: Fix memory leak in r8712_init_recv_priv
Date: Mon, 24 May 2021 19:49:04 +0800
Message-Id: <20210524114904.873174-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit b4383c971bc5 ("staging: rtl8712: handle firmware load failure")
adds a goto statement when failing to load the firmware, however, it fails to
deallocate the resources (e.g., struct urb) allocated in the function
r8712_init_drv_sw.

Fix this by invoking r8712_free_drv_sw() before the goto statement.

backtrace:
  [<00000000e0748eb7>] kmalloc include/linux/slab.h:557 [inline]
  [<00000000e0748eb7>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
  [<00000000fe5a9432>] r8712_os_recvbuf_resource_alloc+0x1b/0x80 drivers/staging/rtl8712/recv_linux.c:46
  [<00000000923fed72>] r8712_init_recv_priv+0x96/0x210 drivers/staging/rtl8712/rtl8712_recv.c:54
  [<000000000038512f>] _r8712_init_recv_priv+0x134/0x150 drivers/staging/rtl8712/rtl871x_recv.c:78
  [<0000000066e70a4e>] r8712_init_drv_sw+0xa0/0x1d0 drivers/staging/rtl8712/os_intfs.c:312
  [<000000001d2974c0>] r871xu_drv_init.cold+0x104/0x7d1 drivers/staging/rtl8712/usb_intf.c:391
  [<000000001d449ce2>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
  [<00000000cd123d34>] really_probe+0x159/0x4a0 drivers/base/dd.c:554
  [<00000000364585cc>] driver_probe_device+0x84/0x100 drivers/base/dd.c:740
  [<0000000048b74bde>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:846
  [<00000000c358ab15>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
  [<00000000bfa9b076>] __device_attach+0x122/0x250 drivers/base/dd.c:914
  [<0000000048fe302a>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
  [<000000002ceae175>] device_add+0x5be/0xc30 drivers/base/core.c:3109
  [<00000000e4813a0d>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
  [<00000000cbb8c98f>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238

Fixes: b4383c971bc5 ("staging: rtl8712: handle firmware load failure")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/staging/rtl8712/usb_intf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index dc21e7743349..fd5da3a04b4e 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -599,8 +599,10 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 		wait_for_completion(&padapter->rtl8712_fw_ready);
 		pnetdev = usb_get_intfdata(pusb_intf);
 		usb_set_intfdata(pusb_intf, NULL);
-		if (!pnetdev)
+		if (!pnetdev) {
+			r8712_free_drv_sw(padapter);
 			goto firmware_load_fail;
+		}
 		release_firmware(padapter->fw);
 		if (drvpriv.drv_registered)
 			padapter->surprise_removed = true;
-- 
2.25.1

