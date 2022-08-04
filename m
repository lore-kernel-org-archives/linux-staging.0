Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307281A
	for <linux-staging@lists.linux.dev>; Thu,  4 Aug 2022 10:55:50 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id k26so20474529ejx.5
        for <linux-staging@lists.linux.dev>; Thu, 04 Aug 2022 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lUOvAB0NzPCcukU3GQHVbbdG86I0mmT1LxMwshTxPVo=;
        b=LdFuv0O4BQq6HLKCIZ4qWLKYfHuq1jZz80vffaWQphDjyAOSthqQOvwMM41BB7NuHY
         x0GUwAWtvoUtkVneivoz59aZls5kQZGvop5Cycz+eKk3jFaFcOnlaxbIkJimBblYUtqs
         sXl3ne+rf0W9GDleznzzGPQ3gSp6CCaNRGYRcvYcHEhvjpZtk1fmHNsy1faoNLLSb4Zz
         8dOLlGrWrkX91jU1pB627Egjeqlh3iVTVvZLY6MGWxEldMM1HgzD8dPlWC+7fTTFT0Vn
         +TQy1Glr7k4IXkogfsG224EMag+tj+stmH93DukUzS2PDdduJwqltG+aF/5HXZbq8UNz
         O6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lUOvAB0NzPCcukU3GQHVbbdG86I0mmT1LxMwshTxPVo=;
        b=6YRYHyZsClmxJUbSaGjYz/gqFWxb3Rk2gPGnjUkSlX1idQCO9mQsz9VgDqXiC/xV7p
         SxJkTsCXgdO8v4hXEInyDrJaH1TSN4Ik2XxzdPbSZcqUKV4BV0lrWN49Z77cRh1vTiCH
         JHXETB2ctl0xdLg8DwdVy0Uv/BPk5aZH1UENuEpzohglT6ESv0NVd2D8xMn0wW9WWPWP
         V/Fe7wrlbhDMnh7qghSs8JjvNzLpmMN0DkiRIlb2yh6ZKwBV0/XplhLjOCv1ATpkiNR3
         9kgdOGC1+VwXDSRTiZ7VG8NmxTJvJXD3dvp52+i9fMjybcdP6+QCfiQGihL8ejqIccy1
         7VYg==
X-Gm-Message-State: ACgBeo2ew2xPccy4qAWF1I4BRQ58eCUIGCWgRe4SYraufrUppu+3ZS4V
	D/Oe+xMn5fdqrW1ZU38Pkk4=
X-Google-Smtp-Source: AA6agR7OgpUNubmCnUfMMrn7jSloKsToiTxVl7LxPvDtFsAMmbDjndJMWmINaBhelF81KpdM+M3cSg==
X-Received: by 2002:a17:907:8688:b0:730:a1be:ee5 with SMTP id qa8-20020a170907868800b00730a1be0ee5mr1019113ejc.444.1659610549030;
        Thu, 04 Aug 2022 03:55:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id y89-20020a50bb62000000b0043ba0cf5dbasm510013ede.2.2022.08.04.03.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 03:55:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: make rtl8188eu_{init,free}_recv_priv() static
Date: Thu,  4 Aug 2022 12:55:32 +0200
Message-Id: <20220804105532.7532-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804105532.7532-1-straube.linux@gmail.com>
References: <20220804105532.7532-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions rtl8188eu_init_recv_priv() and rtl8188eu_free_recv_priv()
are only used in rtw_recv.c. Make them static and remove the now empty
file rtl8188eu_recv.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/Makefile              |  1 -
 drivers/staging/r8188eu/core/rtw_recv.c       | 79 ++++++++++++++++
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  | 91 -------------------
 .../staging/r8188eu/include/rtl8188e_recv.h   |  2 -
 4 files changed, 79 insertions(+), 94 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/rtl8188eu_recv.c

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index cddfee3efd36..b118fd9b695c 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -18,7 +18,6 @@ r8188eu-y = \
 		hal/rtl8188e_phycfg.o \
 		hal/rtl8188e_rf6052.o \
 		hal/rtl8188e_rxdesc.o \
-		hal/rtl8188eu_recv.o \
 		hal/rtl8188eu_xmit.o \
 		hal/usb_halinit.o \
 		hal/usb_ops_linux.o \
diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index e5a7b7dfc387..2d4baca804e9 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -37,6 +37,65 @@ void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
 
 }
 
+static int rtl8188eu_init_recv_priv(struct adapter *padapter)
+{
+	struct recv_priv *precvpriv = &padapter->recvpriv;
+	int i, res = _SUCCESS;
+	struct recv_buf *precvbuf;
+
+	tasklet_init(&precvpriv->recv_tasklet,
+		     rtl8188eu_recv_tasklet,
+		     (unsigned long)padapter);
+
+	/* init recv_buf */
+	rtw_init_queue(&precvpriv->free_recv_buf_queue);
+
+	precvpriv->pallocated_recv_buf = kzalloc(NR_RECVBUFF * sizeof(struct recv_buf) + 4,
+						 GFP_KERNEL);
+	if (!precvpriv->pallocated_recv_buf) {
+		res = _FAIL;
+		goto exit;
+	}
+
+	precvpriv->precv_buf = (u8 *)ALIGN((size_t)(precvpriv->pallocated_recv_buf), 4);
+
+	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
+
+	for (i = 0; i < NR_RECVBUFF; i++) {
+		res = rtw_os_recvbuf_resource_alloc(padapter, precvbuf);
+		if (res == _FAIL)
+			break;
+		precvbuf->adapter = padapter;
+		precvbuf++;
+	}
+	precvpriv->free_recv_buf_queue_cnt = NR_RECVBUFF;
+	skb_queue_head_init(&precvpriv->rx_skb_queue);
+	{
+		int i;
+		size_t tmpaddr = 0;
+		size_t alignment = 0;
+		struct sk_buff *pskb = NULL;
+
+		skb_queue_head_init(&precvpriv->free_recv_skb_queue);
+
+		for (i = 0; i < NR_PREALLOC_RECV_SKB; i++) {
+			pskb = __netdev_alloc_skb(padapter->pnetdev,
+						  MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_KERNEL);
+			if (pskb) {
+				pskb->dev = padapter->pnetdev;
+				tmpaddr = (size_t)pskb->data;
+				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
+				skb_reserve(pskb, (RECVBUFF_ALIGN_SZ - alignment));
+
+				skb_queue_tail(&precvpriv->free_recv_skb_queue, pskb);
+			}
+			pskb = NULL;
+		}
+	}
+exit:
+	return res;
+}
+
 int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 {
 	int i;
@@ -91,6 +150,26 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 	return res;
 }
 
+static void rtl8188eu_free_recv_priv(struct adapter *padapter)
+{
+	int i;
+	struct recv_buf *precvbuf;
+	struct recv_priv *precvpriv = &padapter->recvpriv;
+
+	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
+
+	for (i = 0; i < NR_RECVBUFF; i++) {
+		rtw_os_recvbuf_resource_free(padapter, precvbuf);
+		precvbuf++;
+	}
+
+	kfree(precvpriv->pallocated_recv_buf);
+
+	skb_queue_purge(&precvpriv->rx_skb_queue);
+
+	skb_queue_purge(&precvpriv->free_recv_skb_queue);
+}
+
 void _rtw_free_recv_priv(struct recv_priv *precvpriv)
 {
 	struct adapter	*padapter = precvpriv->adapter;
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
deleted file mode 100644
index def6d0d6e402..000000000000
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#define _RTL8188EU_RECV_C_
-#include "../include/osdep_service.h"
-#include "../include/drv_types.h"
-#include "../include/recv_osdep.h"
-#include "../include/mlme_osdep.h"
-
-#include "../include/usb_ops.h"
-#include "../include/wifi.h"
-
-#include "../include/rtl8188e_hal.h"
-
-int	rtl8188eu_init_recv_priv(struct adapter *padapter)
-{
-	struct recv_priv	*precvpriv = &padapter->recvpriv;
-	int	i, res = _SUCCESS;
-	struct recv_buf *precvbuf;
-
-	tasklet_init(&precvpriv->recv_tasklet,
-		     rtl8188eu_recv_tasklet,
-		     (unsigned long)padapter);
-
-	/* init recv_buf */
-	rtw_init_queue(&precvpriv->free_recv_buf_queue);
-
-	precvpriv->pallocated_recv_buf = kzalloc(NR_RECVBUFF * sizeof(struct recv_buf) + 4,
-						 GFP_KERNEL);
-	if (!precvpriv->pallocated_recv_buf) {
-		res = _FAIL;
-		goto exit;
-	}
-
-	precvpriv->precv_buf = (u8 *)ALIGN((size_t)(precvpriv->pallocated_recv_buf), 4);
-
-	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
-
-	for (i = 0; i < NR_RECVBUFF; i++) {
-		res = rtw_os_recvbuf_resource_alloc(padapter, precvbuf);
-		if (res == _FAIL)
-			break;
-		precvbuf->adapter = padapter;
-		precvbuf++;
-	}
-	precvpriv->free_recv_buf_queue_cnt = NR_RECVBUFF;
-	skb_queue_head_init(&precvpriv->rx_skb_queue);
-	{
-		int i;
-		size_t tmpaddr = 0;
-		size_t alignment = 0;
-		struct sk_buff *pskb = NULL;
-
-		skb_queue_head_init(&precvpriv->free_recv_skb_queue);
-
-		for (i = 0; i < NR_PREALLOC_RECV_SKB; i++) {
-			pskb = __netdev_alloc_skb(padapter->pnetdev, MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_KERNEL);
-			if (pskb) {
-				pskb->dev = padapter->pnetdev;
-				tmpaddr = (size_t)pskb->data;
-				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
-				skb_reserve(pskb, (RECVBUFF_ALIGN_SZ - alignment));
-
-				skb_queue_tail(&precvpriv->free_recv_skb_queue, pskb);
-			}
-			pskb = NULL;
-		}
-	}
-exit:
-	return res;
-}
-
-void rtl8188eu_free_recv_priv(struct adapter *padapter)
-{
-	int	i;
-	struct recv_buf	*precvbuf;
-	struct recv_priv	*precvpriv = &padapter->recvpriv;
-
-	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
-
-	for (i = 0; i < NR_RECVBUFF; i++) {
-		rtw_os_recvbuf_resource_free(padapter, precvbuf);
-		precvbuf++;
-	}
-
-	kfree(precvpriv->pallocated_recv_buf);
-
-	skb_queue_purge(&precvpriv->rx_skb_queue);
-
-	skb_queue_purge(&precvpriv->free_recv_skb_queue);
-}
diff --git a/drivers/staging/r8188eu/include/rtl8188e_recv.h b/drivers/staging/r8188eu/include/rtl8188e_recv.h
index b752c5c06309..dc4f358f646d 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_recv.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_recv.h
@@ -33,8 +33,6 @@ enum rx_packet_type {
 	HIS_REPORT,/*  USB HISR RPT */
 };
 
-s32 rtl8188eu_init_recv_priv(struct adapter *padapter);
-void rtl8188eu_free_recv_priv(struct adapter * padapter);
 void rtl8188eu_recv_tasklet(unsigned long priv);
 void update_recvframe_phyinfo_88e(struct recv_frame *fra, struct phy_stat *phy);
 void update_recvframe_attrib_88e(struct recv_frame *fra, struct recv_stat *stat);
-- 
2.37.1

