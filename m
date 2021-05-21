Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD93A70
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 12:08:28 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id t9so2420589ply.6
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gQ/WekuR1RGoY4zmcpocpvZYk1dMpxlcgxwJmavsB/o=;
        b=mhwUJb3t73WsVeIhnkrLra6VbEc0SwtvuQN+3omwPqC+n6BFjia4kopSyjgpBytKeQ
         6ZLz2Vi8xvUjDZgyZR8L7ZD3WmjW2DZbLIDDY4G0LFkvVZ/pqjKNayevtBYs3ECcTeHA
         bVxksR8wQr+wjueFSBl2hZmT55/c3aKm4vBSt1uvDimgQYcKBN1UZVdSjiTc2T/nhIpY
         /PnlS6Gm+dOTSjF20XdtZuKVTQy4scROtDy3N9GdalR5XSwEVyXjDATYE405adhsc8eF
         ok8lYSlVWQPhzZNCGKF+BbGGNTx17fP0t/90RdYwLy1UDar/vB2BksYUneLNqqOdgJNu
         Qxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gQ/WekuR1RGoY4zmcpocpvZYk1dMpxlcgxwJmavsB/o=;
        b=LS2anMcP0sg9rAI0+vbNepwSiJy0Xt1XcP8q61/3Q589EvMmv3UQAQ+86uRoeiN5o4
         T5rqZSRJo0AK0B/whtnRgRhBD0DPDUQb4HW4e9mxIK0yozkWhzjTcRMOGMw5pVGNeKQw
         Tk/Vf/c5m6MukvEekkIbadaqWl0oa1nxZnt91FZ8TH02DbVg3HCUZLiIjX3OaWu8cl9P
         EyQmGzwCYYr+3PqgGzfzQW4/QvXmCsIFeMU3Kj0ReLC19GE5JfgeDw0rQEGirbasJwKp
         01VKtDLnfbQMF/aBsf1Ue6PvHadbNwQ398QP0H+i3s3qDU45laSKGbKKjsseMn4RrtC2
         YYpg==
X-Gm-Message-State: AOAM532cn54gwNJNdFIetzz1G9V3+aAR0huG7Zf3DzoVF98YT+PqcUxd
	tYdMH0Ks0d4SK9kq4DAl7QM=
X-Google-Smtp-Source: ABdhPJz/xJk2duV8Ct8z6sBVcUjJY6IdRaJ0hW9unm8XnkD0kmQHQBodHMQIyY549nR2x+SoOJ6E2Q==
X-Received: by 2002:a17:90a:17a6:: with SMTP id q35mr10726348pja.118.1621598908113;
        Fri, 21 May 2021 05:08:28 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.20])
        by smtp.gmail.com with ESMTPSA id 69sm4338947pfx.115.2021.05.21.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 05:08:27 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	rkovhaev@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dongliang Mu <mudongliangabcd@gmail.com>,
	syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
Subject: [PATCH] staging: rtl8712: Fix memory leak in r8712_init_recv_priv
Date: Fri, 21 May 2021 20:08:11 +0800
Message-Id: <20210521120811.516339-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

r871xu_dev_remove failed to call r8712_free_drv_sw() and free the
resource (e.g., struct urb) due to the failure of firmware loading.

Fix this by invoking r8712_free_drv_sw at the failure site.

Reported-by: syzbot+1c46f3771695bccbdb3a@syzkaller.appspotmail.com
Fixes: b4383c971bc5 ("staging: rtl8712: handle firmware load failure")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/staging/rtl8712/usb_intf.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index dc21e7743349..a5190b4250ce 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -589,7 +589,7 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
  */
 static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 {
-	struct net_device *pnetdev = usb_get_intfdata(pusb_intf);
+	struct net_device *pnetdev, *newpnetdev = usb_get_intfdata(pusb_intf);
 	struct usb_device *udev = interface_to_usbdev(pusb_intf);
 
 	if (pnetdev) {
@@ -597,9 +597,9 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 
 		/* never exit with a firmware callback pending */
 		wait_for_completion(&padapter->rtl8712_fw_ready);
-		pnetdev = usb_get_intfdata(pusb_intf);
+		newpnetdev = usb_get_intfdata(pusb_intf);
 		usb_set_intfdata(pusb_intf, NULL);
-		if (!pnetdev)
+		if (!newpnetdev)
 			goto firmware_load_fail;
 		release_firmware(padapter->fw);
 		if (drvpriv.drv_registered)
@@ -625,6 +625,13 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 	 */
 	if (udev->state != USB_STATE_NOTATTACHED)
 		usb_reset_device(udev);
+	if (pnetdev) {
+		struct _adapter *padapter = netdev_priv(pnetdev);
+		/* Stop driver mlme relation timer */
+		//r8712_stop_drv_timers(padapter);
+		//r871x_dev_unload(padapter);
+		r8712_free_drv_sw(padapter);
+	}
 }
 
 static int __init r8712u_drv_entry(void)
-- 
2.25.1

