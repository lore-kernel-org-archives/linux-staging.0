Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DAF72
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 19:34:52 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id t2so3792506edd.13
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 12:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3bRunNWeW2lfZZup5nSB82DUjrIpt/jOFnUYQ8vwPzs=;
        b=mPEsradvTXokovjNTjxeaxkEJuooGFpr8pYrtJEJoFrLrz1ogklIfS57bWdTkeC6GY
         Vb7j9U+SaULLpyQKPeQF9SnCHmMD9zPfSFumct0FLMM3AAakDTRb0qNG+XsqqONl4z8s
         Klbrk/wcouG3ZjphxOnW4aG5+8DfGm2JmZX5iZIyuacOs30psHaARI99hhWvi8Rl41DB
         jFFUEPp+2A2P0b2b1DbgLZNLXwdwZ9X3Is3G19YTybTtf18PJ5p3OKbhHcMznpgTDsCa
         iCArVsZWOWG2F6BpNN12uCt3CA95VtM2sftgnzsQMTHjUtxxc5ZnVjuqysyiSr6WUH5x
         6y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3bRunNWeW2lfZZup5nSB82DUjrIpt/jOFnUYQ8vwPzs=;
        b=LVk5N/hptF3iuuRwbK0TKk4eN6J2FtIaO37HnR5gMAOnixtYc+el4AeENSTu5vvTgT
         1X9ipojKuQrf/IIHGhkuk80fTr1nP1CZPabFEMqTM6sO8YhmZDSkI9XzAgzneFe/i0Jp
         AMwFvCllAYEaWPF7MNbIwbYT5wxxEi9vjvyQo1SgvgosumL7Jwcg9i0w/3gf2YUfh43h
         S56Z4F+R1r9/79Wk4Hai50Pj57aYH5h59T8O58f9j1a+sS28OaE1oegzIrGJPoiumVPQ
         RVATsnGmXcot4riec3ndtF53L3Q6M5r4KoHxXJhG3VvUJDiom/zK2GtgHtFTwW4UEflH
         hWxQ==
X-Gm-Message-State: AOAM5334Xyj3Twwi25tjLDcikmMwPA6w+CgxKmueWenRQBgjrx0cGqsK
	mKjtry/UP0JMRB1TKTj1uOo=
X-Google-Smtp-Source: ABdhPJwdL+U/6cyKpLjuzg9kEYtvs5aedL260p2p0iwSzRmBRCzLQng2pdNplLP05MfQVyo67NATfQ==
X-Received: by 2002:a05:6402:4d1:: with SMTP id n17mr49197362edw.337.1626896091243;
        Wed, 21 Jul 2021 12:34:51 -0700 (PDT)
Received: from localhost.localdomain ([176.30.239.20])
        by smtp.gmail.com with ESMTPSA id f22sm11142723edr.16.2021.07.21.12.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 12:34:50 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	zhansayabagdaulet@gmail.com,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com,
	syzbot+cc699626e48a6ebaf295@syzkaller.appspotmail.com
Subject: [PATCH 2/2] staging: rtl8712: error handling refactoring
Date: Wed, 21 Jul 2021 22:34:47 +0300
Message-Id: <d49ecc56e97c4df181d7bd4d240b031f315eacc3.1626895918.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626895918.git.paskripkin@gmail.com>
References: <cover.1626895918.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There was strange error handling logic in case of fw load failure. For
some reason fw loader callback was doing clean up stuff when fw is not
available. I don't see any reason behind doing this. Since this driver
doesn't have EEPROM firmware let's just disconnect it in case of fw load
failure. Doing clean up stuff in 2 different place which can run
concurently is not good idea and syzbot found 2 bugs related to this
strange approach.

So, in this pacth I deleted all clean up code from fw callback and made
a call to device_release_driver() under device_lock(parent) in case of fw
load failure. This approach is more generic and it defend driver from UAF
bugs, since all clean up code is moved to one place.

Fixes: e02a3b945816 ("staging: rtl8712: fix memory leak in rtl871x_load_fw_cb")
Fixes: 8c213fa59199 ("staging: r8712u: Use asynchronous firmware loading")
Reported-and-tested-by: syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com
Reported-and-tested-by: syzbot+cc699626e48a6ebaf295@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/rtl8712/hal_init.c | 30 +++++++++++------
 drivers/staging/rtl8712/usb_intf.c | 52 +++++++++++++-----------------
 2 files changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
index 22974277afa0..4eff3fdecdb8 100644
--- a/drivers/staging/rtl8712/hal_init.c
+++ b/drivers/staging/rtl8712/hal_init.c
@@ -29,21 +29,31 @@
 #define FWBUFF_ALIGN_SZ 512
 #define MAX_DUMP_FWSZ (48 * 1024)
 
+static void rtl871x_load_fw_fail(struct _adapter *adapter)
+{
+	struct usb_device *udev = adapter->dvobjpriv.pusbdev;
+	struct device *dev = &udev->dev;
+	struct device *parent = dev->parent;
+
+	complete(&adapter->rtl8712_fw_ready);
+
+	dev_err(&udev->dev, "r8712u: Firmware request failed\n");
+
+	if (parent)
+		device_lock(parent);
+
+	device_release_driver(dev);
+
+	if (parent)
+		device_unlock(parent);
+}
+
 static void rtl871x_load_fw_cb(const struct firmware *firmware, void *context)
 {
 	struct _adapter *adapter = context;
 
 	if (!firmware) {
-		struct usb_device *udev = adapter->dvobjpriv.pusbdev;
-		struct usb_interface *usb_intf = adapter->pusb_intf;
-
-		dev_err(&udev->dev, "r8712u: Firmware request failed\n");
-		usb_put_dev(udev);
-		usb_set_intfdata(usb_intf, NULL);
-		r8712_free_drv_sw(adapter);
-		adapter->dvobj_deinit(adapter);
-		complete(&adapter->rtl8712_fw_ready);
-		free_netdev(adapter->pnetdev);
+		rtl871x_load_fw_fail(adapter);
 		return;
 	}
 	adapter->fw = firmware;
diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index 643f21eb1128..505ebeb643dc 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -591,36 +591,30 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 {
 	struct net_device *pnetdev = usb_get_intfdata(pusb_intf);
 	struct usb_device *udev = interface_to_usbdev(pusb_intf);
+	struct _adapter *padapter = netdev_priv(pnetdev);
+
+	/* never exit with a firmware callback pending */
+	wait_for_completion(&padapter->rtl8712_fw_ready);
+	usb_set_intfdata(pusb_intf, NULL);
+	release_firmware(padapter->fw);
+	if (drvpriv.drv_registered)
+		padapter->surprise_removed = true;
+	if (pnetdev->reg_state != NETREG_UNINITIALIZED)
+		unregister_netdev(pnetdev); /* will call netdev_close() */
+	r8712_flush_rwctrl_works(padapter);
+	r8712_flush_led_works(padapter);
+	udelay(1);
+	/* Stop driver mlme relation timer */
+	r8712_stop_drv_timers(padapter);
+	r871x_dev_unload(padapter);
+	r8712_free_drv_sw(padapter);
+	free_netdev(pnetdev);
+
+	/* decrease the reference count of the usb device structure
+	 * when disconnect
+	 */
+	usb_put_dev(udev);
 
-	if (pnetdev) {
-		struct _adapter *padapter = netdev_priv(pnetdev);
-
-		/* never exit with a firmware callback pending */
-		wait_for_completion(&padapter->rtl8712_fw_ready);
-		pnetdev = usb_get_intfdata(pusb_intf);
-		usb_set_intfdata(pusb_intf, NULL);
-		if (!pnetdev)
-			goto firmware_load_fail;
-		release_firmware(padapter->fw);
-		if (drvpriv.drv_registered)
-			padapter->surprise_removed = true;
-		if (pnetdev->reg_state != NETREG_UNINITIALIZED)
-			unregister_netdev(pnetdev); /* will call netdev_close() */
-		r8712_flush_rwctrl_works(padapter);
-		r8712_flush_led_works(padapter);
-		udelay(1);
-		/* Stop driver mlme relation timer */
-		r8712_stop_drv_timers(padapter);
-		r871x_dev_unload(padapter);
-		r8712_free_drv_sw(padapter);
-		free_netdev(pnetdev);
-
-		/* decrease the reference count of the usb device structure
-		 * when disconnect
-		 */
-		usb_put_dev(udev);
-	}
-firmware_load_fail:
 	/* If we didn't unplug usb dongle and remove/insert module, driver
 	 * fails on sitesurvey for the first time when device is up.
 	 * Reset usb port for sitesurvey fail issue.
-- 
2.32.0

