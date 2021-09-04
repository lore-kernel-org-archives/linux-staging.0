Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5D972
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 12:47:55 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id p38so3989693lfa.0
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 05:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uFT/AySo/zccMbK2kvcH3TQnn4RaVKtWcnFWmGCOV10=;
        b=Gfs/BDDV/RxhY+rktK1VaxsTtCOKQaZFlmESdWuXDffNt763ixqWkm0ZVvUEg6PHsj
         8eNgRT3gA9Ly1T2hL0rkqx1ROW/1+wA4JklbcACO6u1ek5PTXDutHzZuA9cAo9S/5y3L
         477qxJdb2sCrW8bSWHMCplajvWMcjC1u2GqGBsLkeRcvmO6Qvlqf19Kk/Ux5d9zER/LX
         r1K8Uo3I50hL2Kqt27O80taD9sxN4vtV7b5TawKVKO96k0lylqkJ0K4+dT98NSsjsNdk
         iZj0R6R+JAj7VsNkSJV3ZFYh23wHo4HC7dJI5Of5mopFBIpsmN/bJ6aK6qYn9Yor+ml5
         jAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uFT/AySo/zccMbK2kvcH3TQnn4RaVKtWcnFWmGCOV10=;
        b=UK6aKUMlXtZrySdSX1ky21wMv+ukAHtEOcpz2/bdMd7icfA9VGBfQH1n4GIT7n+xaX
         sexhLcPwcKT2YbLxhpaGHSvbq3FtbBqGS09G3CGr7MyXEczuYd/UKCJ924ucn23FsSg0
         jHyV7PP48t8YaEDsPCRDvQZcwYIXxVkMcsoPeS7BxK0bjTApPCENErQWaJg4XqJtZug6
         JjECWHEZ4o7wpThaWjU6AQYG+lwtOLz1Nx/B++26DTWwkEz53aU2gvK6ibZl0klUieyh
         7urIuDo3zPsRd/zY8cZWjQrT5kzNWoYZOjcTkPmPInmJxSXQgBUc1qKSvJZ9xDDTbKNk
         ITjw==
X-Gm-Message-State: AOAM531AnMr4tD/PVr+1AOa/NruadHF2ifmV9bRgB3vJZTBkVp8ztrN6
	r0cfgoGTac6OuepkZPJBn0Y=
X-Google-Smtp-Source: ABdhPJy8WLdZA1Rfh8zTvfMH+hnILpyNtJkHeYyHwzVvl+k4vQlIRvNbUHU289sPDe8G0jLg7OV4Jw==
X-Received: by 2002:a05:6512:c3:: with SMTP id c3mr2957853lfp.364.1630759673536;
        Sat, 04 Sep 2021 05:47:53 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.70])
        by smtp.gmail.com with ESMTPSA id bi38sm235212lfb.11.2021.09.04.05.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 05:47:53 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: r8188eu: remove _rtw_mutex_{init,free}
Date: Sat,  4 Sep 2021 15:47:47 +0300
Message-Id: <20210904124747.30050-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <YTMhcMSqWCepQMMT@kroah.com>
References: <YTMhcMSqWCepQMMT@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While testing Fabio's patch I hit lockdep warning about possible
deadlock:

[  252.063305] WARNING: possible recursive locking detected
[  252.063642] 5.14.0+ #9 Tainted: G         C
[  252.063946] --------------------------------------------
[  252.064282] ip/335 is trying to acquire lock:
[  252.064560] ffff888009ebad28 (pmutex){+.+.}-{4:4}, at: usbctrl_vendorreq+0xc5/0x4a0 [r8188eu]
[  252.065168]
[  252.065168] but task is already holding lock:
[  252.065536] ffffffffc021b3b8 (pmutex){+.+.}-{4:4}, at:  netdev_open+0x3a/0x5f [r8188eu]
[  252.066085]
[  252.066085] other info that might help us debug this:
[  252.066494]  Possible unsafe locking scenario:
[  252.066494]
[  252.066866]        CPU0
[  252.067025]        ----
[  252.067184]   lock(pmutex);
[  252.067367]   lock(pmutex);

There is one problem with this warning: there is no pmutex in this
driver, *BUT* all mutexes are initialized via private _rtw_mutex_init
API, which had struct mutex *pmutex argument.

So, all mutexes in this driver had same name in lockdep map. Of course,
lockdep will complain about any nested locking.

Fix it by open-coding _rtw_mutex_{init,free} wrappers, because we do not
need them at all.

Cc: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v2:
	Removed Fixes tag (suggested by Greg)

---
 drivers/staging/r8188eu/core/rtw_sreset.c       |  2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c         |  4 ++--
 drivers/staging/r8188eu/include/osdep_service.h |  2 --
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 10 ----------
 drivers/staging/r8188eu/os_dep/usb_intf.c       |  8 ++++----
 5 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sreset.c b/drivers/staging/r8188eu/core/rtw_sreset.c
index c831033d20a9..1787c2d7ea5f 100644
--- a/drivers/staging/r8188eu/core/rtw_sreset.c
+++ b/drivers/staging/r8188eu/core/rtw_sreset.c
@@ -8,7 +8,7 @@ void sreset_init_value(struct adapter *padapter)
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(padapter);
 	struct sreset_priv *psrtpriv = &pHalData->srestpriv;
 
-	_rtw_mutex_init(&psrtpriv->silentreset_mutex);
+	mutex_init(&psrtpriv->silentreset_mutex);
 	psrtpriv->silent_reset_inprogress = false;
 	psrtpriv->wifi_error_status = WIFI_STATUS_SUCCESS;
 	psrtpriv->last_tx_time = 0;
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 46fe62c7c32c..bbb9889c4b89 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -196,7 +196,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxmitpriv->voq_cnt = 0;
 
 	pxmitpriv->ack_tx = false;
-	_rtw_mutex_init(&pxmitpriv->ack_tx_mutex);
+	mutex_init(&pxmitpriv->ack_tx_mutex);
 	rtw_sctx_init(&pxmitpriv->ack_tx_ops, 0);
 
 	rtw_hal_init_xmit_priv(padapter);
@@ -243,7 +243,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 
 	rtw_free_hwxmits(padapter);
 
-	_rtw_mutex_free(&pxmitpriv->ack_tx_mutex);
+	mutex_destroy(&pxmitpriv->ack_tx_mutex);
 }
 
 static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *pxmitframe)
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 029aa4e92c9b..05bac61c3a19 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -155,8 +155,6 @@ extern unsigned char RSN_TKIP_CIPHER[4];
 void *rtw_malloc2d(int h, int w, int size);
 
 u32  _rtw_down_sema(struct semaphore *sema);
-void _rtw_mutex_init(struct mutex *pmutex);
-void _rtw_mutex_free(struct mutex *pmutex);
 
 void _rtw_init_queue(struct __queue *pqueue);
 
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 95ac6086370b..4328992907f2 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -67,16 +67,6 @@ u32 _rtw_down_sema(struct semaphore *sema)
 		return _SUCCESS;
 }
 
-void	_rtw_mutex_init(struct mutex *pmutex)
-{
-	mutex_init(pmutex);
-}
-
-void	_rtw_mutex_free(struct mutex *pmutex)
-{
-	mutex_destroy(pmutex);
-}
-
 void	_rtw_init_queue(struct __queue *pqueue)
 {
 	INIT_LIST_HEAD(&pqueue->queue);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index bb85ab77fd26..8a981a30ea1f 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -116,7 +116,7 @@ static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
 {
 	u8 rst = _SUCCESS;
 
-	_rtw_mutex_init(&dvobj->usb_vendor_req_mutex);
+	mutex_init(&dvobj->usb_vendor_req_mutex);
 
 	dvobj->usb_alloc_vendor_req_buf = kzalloc(MAX_USB_IO_CTL_SIZE, GFP_KERNEL);
 	if (!dvobj->usb_alloc_vendor_req_buf) {
@@ -132,7 +132,7 @@ static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
 static void rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
 {
 	kfree(dvobj->usb_alloc_vendor_req_buf);
-	_rtw_mutex_free(&dvobj->usb_vendor_req_mutex);
+	mutex_destroy(&dvobj->usb_vendor_req_mutex);
 }
 
 static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
@@ -760,7 +760,7 @@ static int __init rtw_drv_entry(void)
 {
 	DBG_88E(DRV_NAME " driver version=%s\n", DRIVERVERSION);
 
-	_rtw_mutex_init(&usb_drv->hw_init_mutex);
+	mutex_init(&usb_drv->hw_init_mutex);
 
 	usb_drv->drv_registered = true;
 	return usb_register(&usb_drv->usbdrv);
@@ -773,7 +773,7 @@ static void __exit rtw_drv_halt(void)
 	usb_drv->drv_registered = false;
 	usb_deregister(&usb_drv->usbdrv);
 
-	_rtw_mutex_free(&usb_drv->hw_init_mutex);
+	mutex_destroy(&usb_drv->hw_init_mutex);
 	DBG_88E("-rtw_drv_halt\n");
 }
 
-- 
2.33.0

