Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E62C322A
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:49 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id u15so5567236ejt.6
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=88oHSzQ0vTHS0TxhRNvuFrIFb5k3LWgW3oAtlKkp/5g=;
        b=cWvX/3XYWw1VWHai/C2N4aD2DL5E9rQkXXxX7Z/rbs4P8owd0RWXpSDsK9eAdCM4UL
         RzZY4WyrXMYIvqzqYpGSqaCYbloJs9190wWQXGbCp84x25/yiOTKbtipJzemfjkzyWt+
         fsft6WFJvpbySkTgRg1yE+V01xzvoKsSqTkx97e37470UGXPBvQbyp6Xa9dgGcAqvxZ/
         KbJrwZnr4kyHD7La34IPWj0goNyvtxNklwhL36q33JO1JX5q80AilSwgrewv0T8YDlaE
         alMDCWq7dg6xsHpF/Z2BReDF45yN2CzWl55SllyczRRzz0taQFPnUbybKDT0CFhDNnb5
         NgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=88oHSzQ0vTHS0TxhRNvuFrIFb5k3LWgW3oAtlKkp/5g=;
        b=Q1u4V/KcT5gfrbxeQOROLDfjyPML6ffednq40pNeoYZa1MSK+ibvdP+HdcP9zICPgF
         z5PFkr1UbG4hFatMotZTog2Jbm574upBj9yFoQNUSfXmJIew25OBZXyKaULHdIGudEbv
         WiwDGSMcqmoTSFqnKcNldyi0pquQmEipzCmFxoNJW4D6D3ge9+bQf5cXGz/+O9ohHBVO
         vnJwLbI1Dx73i+aTIANKFn4lPLr8TlV5OCStHXH8Cb/LQihLq6vFcukmnC92FpMb7xFe
         s46dbOU7EakDBLmRDX+iX7z3P8yStPg1ZbtM4Nmqcwug2nMi0oqtShWjl9X3t2KPDphN
         Q0fQ==
X-Gm-Message-State: ACgBeo2Jn2BNLPGxEovgw0c4+JA2q/r4q913eQP3oPbNV5fEqftOFEtx
	ODf/DcfghvZ6/tQI2Q7blNY=
X-Google-Smtp-Source: AA6agR5bLCKHk3jgTFpxnCTHYYLw6AWbWkNdbHL8hGi0BltBIa8RQZNCEsEJ7WDueawwZxhZ4szQ/g==
X-Received: by 2002:a17:907:28c8:b0:730:9ccc:331f with SMTP id en8-20020a17090728c800b007309ccc331fmr8060357ejc.608.1661019408684;
        Sat, 20 Aug 2022 11:16:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 18/19] staging: r8188eu: remove os_dep/xmit_linux.c
Date: Sat, 20 Aug 2022 20:16:22 +0200
Message-Id: <20220820181623.12497-19-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the last remaining function rtw_xmit_entry(), and the static
functions it calls, from os_dep/xmit_linux.c to core/rtw_xmit.c and
remove the now empty file os_dep/xmit_linux.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/Makefile             |   1 -
 drivers/staging/r8188eu/core/rtw_xmit.c      | 102 ++++++++++++++++
 drivers/staging/r8188eu/include/rtw_xmit.h   |   1 +
 drivers/staging/r8188eu/include/xmit_osdep.h |   2 -
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 115 -------------------
 5 files changed, 103 insertions(+), 118 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/os_dep/xmit_linux.c

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index b38fb8157d79..afafe6957155 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -27,7 +27,6 @@ r8188eu-y = \
 		os_dep/osdep_service.o \
 		os_dep/usb_intf.o \
 		os_dep/usb_ops_linux.o \
-		os_dep/xmit_linux.o \
 		core/rtw_ap.o \
 		core/rtw_br_ext.o \
 		core/rtw_cmd.o \
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index f8d6f458b83e..d41d1d09d8ae 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -2226,3 +2226,105 @@ void rtw_ack_tx_done(struct xmit_priv *pxmitpriv, int status)
 	if (pxmitpriv->ack_tx)
 		rtw_sctx_done_err(&pack_tx_ops, status);
 }
+
+static void rtw_check_xmit_resource(struct adapter *padapter, struct sk_buff *pkt)
+{
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+	u16 queue;
+
+	queue = skb_get_queue_mapping(pkt);
+	if (padapter->registrypriv.wifi_spec) {
+		/* No free space for Tx, tx_worker is too slow */
+		if (pxmitpriv->hwxmits[queue].accnt > WMM_XMIT_THRESHOLD)
+			netif_stop_subqueue(padapter->pnetdev, queue);
+	} else {
+		if (pxmitpriv->free_xmitframe_cnt <= 4) {
+			if (!netif_tx_queue_stopped(netdev_get_tx_queue(padapter->pnetdev, queue)))
+				netif_stop_subqueue(padapter->pnetdev, queue);
+		}
+	}
+}
+
+static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
+{
+	struct	sta_priv *pstapriv = &padapter->stapriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+	struct list_head *phead, *plist;
+	struct sk_buff *newskb;
+	struct sta_info *psta = NULL;
+	s32 res;
+
+	spin_lock_bh(&pstapriv->asoc_list_lock);
+	phead = &pstapriv->asoc_list;
+	plist = phead->next;
+
+	/* free sta asoc_queue */
+	while (phead != plist) {
+		psta = container_of(plist, struct sta_info, asoc_list);
+
+		plist = plist->next;
+
+		/* avoid   come from STA1 and send back STA1 */
+		if (!memcmp(psta->hwaddr, &skb->data[6], 6))
+			continue;
+
+		newskb = skb_copy(skb, GFP_ATOMIC);
+
+		if (newskb) {
+			memcpy(newskb->data, psta->hwaddr, 6);
+			res = rtw_xmit(padapter, &newskb);
+			if (res < 0) {
+				pxmitpriv->tx_drop++;
+				dev_kfree_skb_any(newskb);
+			} else {
+				pxmitpriv->tx_pkts++;
+			}
+		} else {
+			pxmitpriv->tx_drop++;
+
+			spin_unlock_bh(&pstapriv->asoc_list_lock);
+			return false;	/*  Caller shall tx this multicast frame via normal way. */
+		}
+	}
+
+	spin_unlock_bh(&pstapriv->asoc_list_lock);
+	dev_kfree_skb_any(skb);
+	return true;
+}
+
+int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
+{
+	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	s32 res = 0;
+
+	if (!rtw_if_up(padapter))
+		goto drop_packet;
+
+	rtw_check_xmit_resource(padapter, pkt);
+
+	if (!rtw_mc2u_disable && check_fwstate(pmlmepriv, WIFI_AP_STATE) &&
+	    (IP_MCAST_MAC(pkt->data) || ICMPV6_MCAST_MAC(pkt->data)) &&
+	    (padapter->registrypriv.wifi_spec == 0)) {
+		if (pxmitpriv->free_xmitframe_cnt > (NR_XMITFRAME / 4)) {
+			res = rtw_mlcst2unicst(padapter, pkt);
+			if (res)
+				goto exit;
+		}
+	}
+
+	res = rtw_xmit(padapter, &pkt);
+	if (res < 0)
+		goto drop_packet;
+
+	pxmitpriv->tx_pkts++;
+	goto exit;
+
+drop_packet:
+	pxmitpriv->tx_drop++;
+	dev_kfree_skb_any(pkt);
+
+exit:
+	return 0;
+}
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index be9a7afad8ea..0d05ab9abcfb 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -368,6 +368,7 @@ int rtw_ack_tx_wait(struct xmit_priv *pxmitpriv, u32 timeout_ms);
 void rtw_ack_tx_done(struct xmit_priv *pxmitpriv, int status);
 
 void rtw_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe);
+int rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
 
 /* include after declaring struct xmit_buf, in order to avoid warning */
 #include "xmit_osdep.h"
diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index ae738d215e99..0a68b2dd8d5e 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -17,6 +17,4 @@ struct sta_xmit_priv;
 struct xmit_frame;
 struct xmit_buf;
 
-int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
-
 #endif /* __XMIT_OSDEP_H_ */
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
deleted file mode 100644
index 4721447a02e8..000000000000
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ /dev/null
@@ -1,115 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright(c) 2007 - 2012 Realtek Corporation. */
-
-#define _XMIT_OSDEP_C_
-
-#include "../include/osdep_service.h"
-#include "../include/drv_types.h"
-#include "../include/wifi.h"
-#include "../include/mlme_osdep.h"
-#include "../include/xmit_osdep.h"
-#include "../include/osdep_intf.h"
-#include "../include/usb_osintf.h"
-
-static void rtw_check_xmit_resource(struct adapter *padapter, struct sk_buff *pkt)
-{
-	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	u16	queue;
-
-	queue = skb_get_queue_mapping(pkt);
-	if (padapter->registrypriv.wifi_spec) {
-		/* No free space for Tx, tx_worker is too slow */
-		if (pxmitpriv->hwxmits[queue].accnt > WMM_XMIT_THRESHOLD)
-			netif_stop_subqueue(padapter->pnetdev, queue);
-	} else {
-		if (pxmitpriv->free_xmitframe_cnt <= 4) {
-			if (!netif_tx_queue_stopped(netdev_get_tx_queue(padapter->pnetdev, queue)))
-				netif_stop_subqueue(padapter->pnetdev, queue);
-		}
-	}
-}
-
-static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
-{
-	struct	sta_priv *pstapriv = &padapter->stapriv;
-	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	struct list_head *phead, *plist;
-	struct sk_buff *newskb;
-	struct sta_info *psta = NULL;
-	s32	res;
-
-	spin_lock_bh(&pstapriv->asoc_list_lock);
-	phead = &pstapriv->asoc_list;
-	plist = phead->next;
-
-	/* free sta asoc_queue */
-	while (phead != plist) {
-		psta = container_of(plist, struct sta_info, asoc_list);
-
-		plist = plist->next;
-
-		/* avoid   come from STA1 and send back STA1 */
-		if (!memcmp(psta->hwaddr, &skb->data[6], 6))
-			continue;
-
-		newskb = skb_copy(skb, GFP_ATOMIC);
-
-		if (newskb) {
-			memcpy(newskb->data, psta->hwaddr, 6);
-			res = rtw_xmit(padapter, &newskb);
-			if (res < 0) {
-				pxmitpriv->tx_drop++;
-				dev_kfree_skb_any(newskb);
-			} else {
-				pxmitpriv->tx_pkts++;
-			}
-		} else {
-			pxmitpriv->tx_drop++;
-
-			spin_unlock_bh(&pstapriv->asoc_list_lock);
-			return false;	/*  Caller shall tx this multicast frame via normal way. */
-		}
-	}
-
-	spin_unlock_bh(&pstapriv->asoc_list_lock);
-	dev_kfree_skb_any(skb);
-	return true;
-}
-
-int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev)
-{
-	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
-	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
-	s32 res = 0;
-
-	if (!rtw_if_up(padapter))
-		goto drop_packet;
-
-	rtw_check_xmit_resource(padapter, pkt);
-
-	if (!rtw_mc2u_disable && check_fwstate(pmlmepriv, WIFI_AP_STATE) &&
-	    (IP_MCAST_MAC(pkt->data) || ICMPV6_MCAST_MAC(pkt->data)) &&
-	    (padapter->registrypriv.wifi_spec == 0)) {
-		if (pxmitpriv->free_xmitframe_cnt > (NR_XMITFRAME / 4)) {
-			res = rtw_mlcst2unicst(padapter, pkt);
-			if (res)
-				goto exit;
-		}
-	}
-
-	res = rtw_xmit(padapter, &pkt);
-	if (res < 0)
-		goto drop_packet;
-
-	pxmitpriv->tx_pkts++;
-	goto exit;
-
-drop_packet:
-	pxmitpriv->tx_drop++;
-	dev_kfree_skb_any(pkt);
-
-exit:
-
-	return 0;
-}
-- 
2.37.2

