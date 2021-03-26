Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952871
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 17:41:39 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id k10so9695465ejg.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 10:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BIpWdSCdpMZajEhKNmxVHX/eJ4+jjzsruUB2RThCzNM=;
        b=tXexAtJFQQiz2e/gtOpZhK9h85Af/k2wy4erhevqW5Z5u+1A+3/okI2bGk0EBMuIhI
         cE2hSBUTHhSZo6YFNP0HX1mt2HEsAQ1tMfZz7GGCM7fOmYkCQT9WkBjhjKACQ5sHs7Pe
         DSutZipL9Rif9UN2UBrNKRE7bsM+HlT61nVXrE0b0wcm8vS520Jxx6Y0YWJvvLE0ggEq
         ww4PcrbXccs69QdAQbj1WKFWQAJJpgUvqd79lwOLArz6yISaYxlMNsdhbW8ebQeSCVw6
         U1330xDLyCJBjdJLmZ5Y3FhHyu/htFaRkmkskP4PzGhTVkebZEBDeMz9qm1PqtfNgwjr
         4mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BIpWdSCdpMZajEhKNmxVHX/eJ4+jjzsruUB2RThCzNM=;
        b=okPgmScBFG+bbKqij1fRGJg3cGZ8mGGomb00tSk/GuXKgf5UbU0xEKHcDZTPni4CWa
         2KtsZz9HlsjJ6+jocYUxnlpgCZ8neK0PS1pHmlI23g0mHJOsMYlr85fhs+22RiWRUQbL
         NBlIUGSoeM/V5uWWjoFzNbBgAUbr2vMdLo1IJoDHet8CUtRfeL4vzFS0TUiGRa8gZQuJ
         ZK4fhDKr6cHbc/lRpXrvX7vpCAVOZNVaWsYjZyaZGs1spE7+iwdR6DbaHxR+4qPDVsLv
         EnXtWsxa5z5EBz0dZs8KzDDKpL73jdTcHAD+kC9CK4l7PAu5TS4oNzM4oPCvjIdLQcHB
         S5GA==
X-Gm-Message-State: AOAM532T7RitYdX4jUkJK7YLrSo2XkJX5+E8sQ58Zxx+hwRPtsbNdbTp
	mz/Tc9FnT6/ATfhJdKcdoSTeluDka4E=
X-Google-Smtp-Source: ABdhPJxYKt37r0Los7OfXTSJIZ9+XcvSf/ree4MAWSYzTCuWi+AldVAGU1CfjNgDRx3uO39sOUDhgw==
X-Received: by 2002:a17:906:cd12:: with SMTP id oz18mr16776368ejb.498.1616780497820;
        Fri, 26 Mar 2021 10:41:37 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id mc10sm4142345ejb.56.2021.03.26.10.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:41:37 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/2] Staging: rtl8723bs: remove useless macros
Date: Fri, 26 Mar 2021 18:41:45 +0100
Message-Id: <20210326174145.19427-2-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326174145.19427-1-marcocesati@gmail.com>
References: <20210326174145.19427-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove two 'no-op' macros, as well as two related unreferenced macros,
in the staging/rtl8723bs driver.

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 5 -----
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 --
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      | 2 --
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c     | 4 +---
 4 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index fd8830a51707..b49838c7e457 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -58,11 +58,6 @@
 
 extern int RTW_STATUS_CODE(int error_code);
 
-#define mstat_tf_idx(flags) ((flags)&0xff)
-#define mstat_ff_idx(flags) (((flags)&0xff00) >> 8)
-
-#define rtw_mstat_update(flag, status, sz) do {} while (0)
-#define rtw_mstat_dump(sel) do {} while (0)
 void *_rtw_zmalloc(u32 sz);
 void *_rtw_malloc(u32 sz);
 void _kfree(u8 *pbuf, u32 sz);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 8deaf98a83dd..4f6398f86b75 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2385,8 +2385,6 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 	if (!skb)
 		goto fail;
 
-	rtw_mstat_update(MSTAT_TYPE_SKB, MSTAT_ALLOC_SUCCESS, skb->truesize);
-
 	if (unlikely(skb->len < sizeof(struct ieee80211_radiotap_header)))
 		goto fail;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 156ad91d33ee..b6be1423ef75 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -577,8 +577,6 @@ static void __exit rtw_drv_halt(void)
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

