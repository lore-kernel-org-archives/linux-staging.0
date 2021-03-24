Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288D5F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 19:39:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k8so25636462wrc.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FYE0bGD80zrB+s2f9wqCYnAqF6ITvCBq6j3Be/WlGb0=;
        b=kkpU8BwWsLw+OCX3+49UL1zjKW4MVqsb2h8FOwsIxu8Su9nUNbo8a+fIH0kOeLSpzj
         +Q30zincu4t/m4CYsikyYHY+ygzICua5O3BqkJtZIEuMUwf1X8I5aEG+4OlinMaVwpIk
         rzrYDi3XryIQFcChe2OaB/v2Ve+yThjGOmDQ3VONpjOAPN8zykgzgTrZKx7iioJ49xgL
         qJS0dtBPqDlkLnif2Z6nlbZuJk8CO5QF2iRNClMY9mX0PuolwOS0JLAKb+xmu7m3MIXl
         rkBtH3/IlcSunzB+ixxhNke2IGGXoFIFs6ijn/qsvBAuzBJgziUtDmnOX8dq0f3a2jv7
         rkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FYE0bGD80zrB+s2f9wqCYnAqF6ITvCBq6j3Be/WlGb0=;
        b=LYmnwjJ3noyrwza6vn2LWtvxTJtnL1fDhoECacK7XCQTybktUncYWyBqLmX9ST3tN7
         o0dn7nxouOkFJdFsokQUGelcB0jyHW1GsxATwjjwX14zC3Cx8BsDqYF/9TIdsOKsYoq5
         FGNREKCFAY741ECA62uDRzBcOLMqLPNJ86TawrOhX7r0G8oVX2e/EB2U/JDfLmeZhCIK
         h4wuKW/caudHPt5jvl2T2eOwuHWubaegqkcRDxDOKWy7NejcUSv8AB/ZUiCX+q/KnYLp
         cfaqbwWbt6MKmZTAhPv4q0jFzrP2zOl5G3aRcAzFHXIrzcJJRfJFYkh8hy2YuGqLv9te
         LfQg==
X-Gm-Message-State: AOAM533iA17x8xceEJZUwnibIhUxqGXdHRtgA8bFtcglr+K3+PD1gIsY
	rWn/Lkgpbhg9cbugNYdJIW8=
X-Google-Smtp-Source: ABdhPJxbH/UboiRqh0O/6nrvM+hfB65eCMNSW6vln4hH1co7kortL3naE3Uj2UfQ/7coqx5anAtZ9g==
X-Received: by 2002:adf:f841:: with SMTP id d1mr5122675wrq.36.1616614755697;
        Wed, 24 Mar 2021 12:39:15 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id i10sm4471481wrs.11.2021.03.24.12.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 12:39:15 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] Staging: rtl8723bs: remove useless macro and obsolete comment
Date: Wed, 24 Mar 2021 20:39:24 +0100
Message-Id: <20210324193924.12536-1-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove two no-op macros, two related helper macrors, and one related
comment in the staging/rtl8723bs driver.

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 7 -------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 --
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      | 2 --
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c     | 4 +---
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 9405bdb2abf0..b49838c7e457 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -58,13 +58,6 @@
 
 extern int RTW_STATUS_CODE(int error_code);
 
-/* flags used for rtw_mstat_update() */
-
-#define mstat_tf_idx(flags) ((flags)&0xff)
-#define mstat_ff_idx(flags) (((flags)&0xff00) >> 8)
-
-#define rtw_mstat_update(flag, status, sz) do {} while (0)
-#define rtw_mstat_dump(sel) do {} while (0)
 void *_rtw_zmalloc(u32 sz);
 void *_rtw_malloc(u32 sz);
 void _kfree(u8 *pbuf, u32 sz);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a577ddcce8cd..2c12feff0978 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2386,8 +2386,6 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 	if (!skb)
 		goto fail;
 
-	rtw_mstat_update(MSTAT_TYPE_SKB, MSTAT_ALLOC_SUCCESS, skb->truesize);
-
 	if (unlikely(skb->len < sizeof(struct ieee80211_radiotap_header)))
 		goto fail;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 8f8549eee23e..79f51fd5648e 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -580,8 +580,6 @@ static void __exit rtw_drv_halt(void)
 	rtw_ndev_notifier_unregister();
 
 	DBG_871X_LEVEL(_drv_always_, "module exit success\n");
-
-	rtw_mstat_dump(RTW_DBGDUMP);
 }
 
 
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index a3b6584ca0d0..216b2f62eefd 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -248,10 +248,8 @@ int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 {
 	int ret = 0;
 
-	if (pkt) {
-		rtw_mstat_update(MSTAT_TYPE_SKB, MSTAT_ALLOC_SUCCESS, pkt->truesize);
+	if (pkt)
 		ret = _rtw_xmit_entry(pkt, pnetdev);
-	}
 
 	return ret;
 }
-- 
2.30.2

