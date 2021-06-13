Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45876D0D
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 22:00:17 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id s22so17396407ljg.5
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 15:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iJgviWmzWfor8SMzjMEV7S/Xf7moSv9Xz3WoTzx0rUs=;
        b=c3OT5EbehKbUkpqQh1MFMpCIedzjYibGIQqIjbNFoE9JNYo4e1SpmH5vPp02V3EhKo
         btTXeiE1YC16QYyUMlNU4uYRAsUgnFL1z3/kbq75Ebh5jyqMhG7Fl/jkoNtvWvkp1VKY
         bpHE8gP7auJZyAMiSDG5wSWUiu3l3JP+LsYR3jbMD3U4pUAmj4UbRLTexIX9IxnRsff8
         y4cgV6USipE6AdmWqg2GEQ7VxvcXmMNxZ1SeNQXhCSNSUDaH3hfldkpt6Ny7bkGrQdTl
         g1Jx2oxpoJNMQTu5uyQz2gOpPZ/vkHqNdD6wBnc29PGELu7J1xqSgAuWF5ycclnv3uNl
         rA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iJgviWmzWfor8SMzjMEV7S/Xf7moSv9Xz3WoTzx0rUs=;
        b=FeYC866FM0qK8PjuvFwdOKJShF0barVzFWJkTCtQiYn17SlNIaaajALydRNs0/4WcU
         vAYE/CxJr4QaACWQGFFAIHQiJADKtKfVz2kx5i6jJR2xvp/Fqb9ujhXV5vsSxYgIv0dx
         vd+t4jLIabHQHO4imQfyUDsLGKNvwtX1SIorbZGqA5Y9V4NgLEoMy0Cf1qeqYvoXC+en
         x+76T4anl2JezBAewbqT4TyKpU1sHsqh3DocKDVdPy9D73G52BAHaL4b14gSg/GyrEfT
         Mko0J+2Mrlm0kM76/xuY1j+QgcPtt+aLE3Bi2e1GBwdTDqTcKD4o01ONwHQwx6Z4GTu0
         ExvA==
X-Gm-Message-State: AOAM5325yE3ncX0XMyOWSD4kWg7wAYmWqvRa1rmIa7wdlSVhMsSO69YM
	x2we6/iRlsnGVn+oq7FZPWY=
X-Google-Smtp-Source: ABdhPJy0pPevgx09PW6J7p6pHNDmZpXH61+Hkex7gD7XTRFPXxPPvf+YjpestZwt9jfcstqsIF0gVg==
X-Received: by 2002:a2e:9a0d:: with SMTP id o13mr11277155lji.440.1623621616011;
        Sun, 13 Jun 2021 15:00:16 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
        by smtp.gmail.com with ESMTPSA id y13sm195081lfg.247.2021.06.13.15.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 15:00:15 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 2/3] staging: rtl8712: fix error handling in r871xu_drv_init
Date: Mon, 14 Jun 2021 01:00:13 +0300
Message-Id: <febb00f72354449bb4d305f373d6d2f47e539ab4.1623620630.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623620630.git.paskripkin@gmail.com>
References: <cover.1623620630.git.paskripkin@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous error handling path was unique for all
possible errors and there was unnecessary branching.
Also, one step for freeing drv_sw was missing. All
these problems was fixed by restructuring error
handling path.

Also, moved out free_netdev() from r8712_free_drv_sw() for
correct error handling.

Fixes: 2865d42c78a9 ("staging: r8712u: Add the new driver to the mainline kernel")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/rtl8712/os_intfs.c |  4 ----
 drivers/staging/rtl8712/usb_intf.c | 22 +++++++++++++---------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 0c3ae8495afb..2214aca09730 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -328,8 +328,6 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 
 void r8712_free_drv_sw(struct _adapter *padapter)
 {
-	struct net_device *pnetdev = padapter->pnetdev;
-
 	r8712_free_cmd_priv(&padapter->cmdpriv);
 	r8712_free_evt_priv(&padapter->evtpriv);
 	r8712_DeInitSwLeds(padapter);
@@ -339,8 +337,6 @@ void r8712_free_drv_sw(struct _adapter *padapter)
 	_r8712_free_sta_priv(&padapter->stapriv);
 	_r8712_free_recv_priv(&padapter->recvpriv);
 	mp871xdeinit(padapter);
-	if (pnetdev)
-		free_netdev(pnetdev);
 }
 
 static void enable_video_mode(struct _adapter *padapter, int cbw40_value)
diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index c482a6d1998b..f97830049fc8 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -361,7 +361,7 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 	/* step 1. */
 	pnetdev = r8712_init_netdev();
 	if (!pnetdev)
-		goto error;
+		goto put_dev;
 	padapter = netdev_priv(pnetdev);
 	disable_ht_for_spec_devid(pdid, padapter);
 	pdvobjpriv = &padapter->dvobjpriv;
@@ -383,12 +383,12 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 
 	status = padapter->dvobj_init(padapter);
 	if (status != _SUCCESS)
-		goto error;
+		goto free_netdev;
 
 	/* step 4. */
 	status = r8712_init_drv_sw(padapter);
 	if (status)
-		goto error;
+		goto dvobj_deinit;
 	/* step 5. read efuse/eeprom data and get mac_addr */
 	{
 		int i, offset;
@@ -568,17 +568,20 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 	}
 	/* step 6. Load the firmware asynchronously */
 	if (rtl871x_load_fw(padapter))
-		goto error;
+		goto deinit_drv_sw;
 	spin_lock_init(&padapter->lock_rx_ff0_filter);
 	mutex_init(&padapter->mutex_start);
 	return 0;
-error:
+
+deinit_drv_sw:
+	r8712_free_drv_sw(padapter);
+dvobj_deinit:
+	padapter->dvobj_deinit(padapter);
+free_netdev:
+	free_netdev(pnetdev);
+put_dev:
 	usb_put_dev(udev);
 	usb_set_intfdata(pusb_intf, NULL);
-	if (padapter && padapter->dvobj_deinit)
-		padapter->dvobj_deinit(padapter);
-	if (pnetdev)
-		free_netdev(pnetdev);
 	return -ENODEV;
 }
 
@@ -610,6 +613,7 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 		r8712_stop_drv_timers(padapter);
 		r871x_dev_unload(padapter);
 		r8712_free_drv_sw(padapter);
+		free_netdev(pnetdev);
 
 		/* decrease the reference count of the usb device structure
 		 * when disconnect
-- 
2.32.0

