Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D2870
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 16:25:33 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id t21so11267457plo.2
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCj0Vj0/aEOSeqE1QBcXcL/Py2Jrh8/U+HcmsMEdhBE=;
        b=T75N1lghG4u7QkKxhi4qohHgR1xioMjwOwJlcZq4twmw+bTpnVdRCZ1dPKaGxe1vuN
         wY+YUXWtgnjIgMCtm8ShVyVVGlDgX2QyMtRuWElkh3J0q2/1OnPeUyq1uAQVUUgjbZ7m
         O9VFBBDCUOY+rfByDhCVOnyGRGopnHEcTs/kL+a5QRtaor7GOGUioPJ3KgEuumV08maA
         K6hU03jp9Wi6SEg2Ca+HRLnpOB9nPF6qkwPRCt8WkfmbOdGyASV88aN7D9jRq3cUYcJP
         kFMMVgOfWC8C3wn5UHFRIaZ/9cFVegJSD+L/uUw2kmNRsMe2fmE201jy2uKaILXmAjZC
         1jaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCj0Vj0/aEOSeqE1QBcXcL/Py2Jrh8/U+HcmsMEdhBE=;
        b=fs7ELfO6l3R4kyRCNC3XRIx5cc8CrWW3YgVBFu52NOkYdtnFyn4Ux59qYE96nTxRHu
         BNIA526nhxx2TIzljDV9/hmuhctpDXolrXasCP96/BC/itoe6wsXONuvfeOPBehNFnr5
         NCeKCKg06mMNPYMGLsd2VQq6OCU9O1ibQxT+QuLlT9RupdrY53bkvhRoxz8c8D0m6PkV
         AlTAlZTtBqil783XrwzFDzPml+4I0l5nFcZnxCNC2kWhCMJ1NO9GN636eEpakHt3xVTs
         c/6hDS9xT+6S9Zec7gVJtEr/0UbhuZOpL8MbZITvKCAWi7oCCXffUHWbzCH2t8Odi7Vz
         vfGA==
X-Gm-Message-State: AOAM530INTXVrDXRKp5RvZgFWGe6OFTVBQvbxxRcojWf6LFdQtlkF7bK
	Vbb/KGsJBMHfzZ9afwIJyeI=
X-Google-Smtp-Source: ABdhPJwp6UIeyFlj1XdEPIz+zbSIck1hMoR25LSacMqM4MahKtAgw4IdcheGg6wMZjzKmnU6McALig==
X-Received: by 2002:a17:902:728c:b029:f6:6aff:4d66 with SMTP id d12-20020a170902728cb02900f66aff4d66mr8229086pll.20.1621614333031;
        Fri, 21 May 2021 09:25:33 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.20])
        by smtp.gmail.com with ESMTPSA id y17sm4544845pfb.183.2021.05.21.09.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 09:25:31 -0700 (PDT)
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
Subject: [PATCH v2] staging: rtl8712: Fix memory leak in r8712_init_recv_priv
Date: Sat, 22 May 2021 00:25:19 +0800
Message-Id: <20210521162519.677074-1-mudongliangabcd@gmail.com>
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
v1->v2: fix the initialization of pnetdev

 drivers/staging/rtl8712/usb_intf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index dc21e7743349..57e773464e18 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -593,13 +593,14 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 	struct usb_device *udev = interface_to_usbdev(pusb_intf);
 
 	if (pnetdev) {
+		struct net_device *newpnetdev = NULL;
 		struct _adapter *padapter = netdev_priv(pnetdev);
 
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
@@ -625,6 +626,10 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 	 */
 	if (udev->state != USB_STATE_NOTATTACHED)
 		usb_reset_device(udev);
+	if (pnetdev) {
+		struct _adapter *padapter = netdev_priv(pnetdev);
+		r8712_free_drv_sw(padapter);
+	}
 }
 
 static int __init r8712u_drv_entry(void)
-- 
2.25.1

