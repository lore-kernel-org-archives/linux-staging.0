Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013F47D936
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119881; cv=none; b=B0MTVjWRqTUBPleJzWUXdoA7WXlooaXhTIywoBwb8Mo6wifca9reQyRcpYfZzbwmfP0gZmORjdluROaXvJkliE7HCDeYmtt2uH7LNreeJmUtMMVSaz9z0eXdMnWq2zwCBmf1c11KgUawXGau5G6I3DOnms9JMuR8WBG40Bq8O/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119881; c=relaxed/simple;
	bh=fISncI/RA4hTAB1pJnBoN0nB4uV7YsltXJ7Bvn3kBgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pu8llDHU4MVQeYmi1ykYnpCvi8tifCHghROTBvafaTKdEEKdcIO0fRaj4urypCZU6lFr59udM1iSzizKiad6QEo/xw9m6QsaaWHCR6SKI1bxxjcW8gf7c22YBlWXtT88HLTXxhJpAFY8A2Fx0NiAErmuXhmByJy0cM69c05ZLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xvu7I4nh; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvu7I4nh"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aea0fff535so2260735e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119866; x=1784724666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHJFILJjmYuD0QyR36xdFL//pqzNWfMe1G6QhVxTjco=;
        b=Xvu7I4nhE66oPpPkk268dTa80KRCPFUrJ3cPtelXF+08AEMGWxKLcpdPKpCpJk9M6z
         aCf4uZMjHR+0Qk/0Iok/1lwIKNNM+tFNSQWEUzVZcKxGJJxd9u4u/pWqfhjZXq1dF05A
         r6gVNCyXeP5dcZpzb4X7OOBgoomnr1KL1ngwgp0xA3pbjyAbLOIUmy3NqpEofYbM6k/R
         k8X8aLsWEakgrPBALwuzCtnGZ/nP1qPG607Y3lKi7SdLmrc4vHJ2Pxg8To76pINcV0X/
         fV55h3OXgtZbsZoB+gI99XQaHe3ne0F6cn7+x0dSSzwv4GoBjfyDhMjCgFBWVh50lIdY
         a3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119866; x=1784724666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHJFILJjmYuD0QyR36xdFL//pqzNWfMe1G6QhVxTjco=;
        b=rt/DqvjTH2tczCLR1rFKG5ONqtSRleD0Ilm77cGigdbMYMPR5sBXxlmOnsekrN1bH8
         RRXtjMXasD/oWVcQomGhkMNgTzuQ+A2MUsj9Oz76f7vkV/xj5EUXyDvi5TD3GSzJbK8Y
         sBR2jJJs76rcRFdxLJJ7ZnsTsM8/omF3R6BXBRcFmXthtoBlRwbOMN7JFXYZ31s9sn8n
         /Hd02ysAwyegEaMh8seJdVHAHB24J5ru/3s2RvnAkXpMZJpTELojEaVGsGj+KpYybuth
         AP8eijQydPHgC3vmN4zU4r1+gIqRPgyVeeOVAkQQgzQGCQrpSUAQQGPcF2pWfPqUULh5
         9iJQ==
X-Gm-Message-State: AOJu0YyL0UbCsligiwwzhP9KoOmqn1now2cz6UVHwPoFvlOOtFtMgSlU
	TraEUM17bLBYjbemWty6osRY1D/4G9EPQ+1O9p+6t/Rw8xauA+C12aqL
X-Gm-Gg: AfdE7cmcsQbdnpyz4XzFKvt/yQojOfzG5xRF1zfnVdern0SGxTFkzekrHqLXENlZT49
	PyJh0EHUvZ1bwCyhrACTi2gCA9VL4nVDNqrzGft+BtBpYbrr4rSKxldIyVMIiIdEXDKdr2UYxNK
	4P0HmuMGYvKPATekSjGyWZn2EwV7kRq2PZg8ePLlUVW/XW9UQS3wZKMidjARGEfTJfYuGrR0FsV
	yjj+MHU+jWE6f3W1tu4s6xg47G5ybzyej13R9uUVXn7LOAxUOaQbBX8c6ZWVpoeE2pm+RD1uxMw
	gNkBkOZugKW4MFYzNmXHYAUIU4yeJI4N0LFEGTsWrPqBpWzA98pOcs4tbJL6G3BsUPtUs8TG9B/
	3Vst0olAJgqUKxi7StyF1z/vGTg6a2RHWnBTKpY8xH02WRLpNWd9hPzSYE7UDw2guEFTf1IqoKX
	ZXuK41YqocefnwV38o1s5SHmhnJgM6ze9AkjvzkhNqqdIHSKMckjgF7ncQtALuQY/62dPXW+PnR
	l0yn8saFzVaWzCtjZ8gB5iF
X-Received: by 2002:ac2:5227:0:b0:5ae:be77:44bc with SMTP id 2adb3069b0e04-5b0235614f6mr3163533e87.4.1784119865564;
        Wed, 15 Jul 2026 05:51:05 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:51:05 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 59/61] staging: rtl8723bs: inline rtl8723bs_init_xmit_priv helper
Date: Wed, 15 Jul 2026 19:48:27 +0700
Message-ID: <20260715124829.90290-60-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline the xmit private initialization logic from the internal function
directly into rtw_hal_init_xmit_priv. This eliminates an unnecessary
redirection layer for initializing SDIO-specific completions and locks.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 118 +++++++++++++++++-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  88 +------------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  53 --------
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |   2 +
 .../staging/rtl8723bs/include/rtl8723b_recv.h |   2 +-
 .../staging/rtl8723bs/include/rtl8723b_xmit.h |   3 +-
 6 files changed, 121 insertions(+), 145 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 7cf5128e7..3244f121d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -278,17 +278,129 @@ s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 
 s32	rtw_hal_init_xmit_priv(struct adapter *padapter)
 {
-	return rtl8723bs_init_xmit_priv(padapter);
+	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
+	struct hal_com_data *phal;
+
+	phal = GET_HAL_DATA(padapter);
+
+	spin_lock_init(&phal->SdioTxFIFOFreePageLock);
+	init_completion(&xmitpriv->SdioXmitStart);
+	init_completion(&xmitpriv->SdioXmitTerminate);
+
+	return _SUCCESS;
 }
 
 void rtw_hal_free_xmit_priv(struct adapter *padapter)
 {
-	rtl8723bs_free_xmit_priv(padapter);
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+	struct xmit_buf *pxmitbuf;
+	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
+	struct list_head *plist, *phead;
+	struct list_head tmplist;
+
+	phead = get_list_head(pqueue);
+	INIT_LIST_HEAD(&tmplist);
+
+	spin_lock_bh(&pqueue->lock);
+	if (!list_empty(&pqueue->queue)) {
+		/*  Insert tmplist to end of queue, and delete phead */
+		/*  then tmplist become head of queue. */
+		list_add_tail(&tmplist, phead);
+		list_del_init(phead);
+	}
+	spin_unlock_bh(&pqueue->lock);
+
+	phead = &tmplist;
+	while (!list_empty(phead)) {
+		plist = get_next(phead);
+		list_del_init(plist);
+
+		pxmitbuf = container_of(plist, struct xmit_buf, list);
+		rtw_free_xmitframe(pxmitpriv, (struct xmit_frame *)pxmitbuf->priv_data);
+		pxmitbuf->priv_data = NULL;
+		rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
+	}
 }
 
 s32	rtw_hal_init_recv_priv(struct adapter *padapter)
 {
-	return rtl8723bs_init_recv_priv(padapter);
+	s32 res;
+	u32 i, n;
+	struct recv_priv *precvpriv;
+	struct recv_buf *precvbuf;
+
+	res = _SUCCESS;
+	precvpriv = &padapter->recvpriv;
+
+	/* 3 1. init recv buffer */
+	INIT_LIST_HEAD(&precvpriv->free_recv_buf_queue.queue);
+	spin_lock_init(&precvpriv->free_recv_buf_queue.lock);
+	INIT_LIST_HEAD(&precvpriv->recv_buf_pending_queue.queue);
+	spin_lock_init(&precvpriv->recv_buf_pending_queue.lock);
+
+	n = NR_RECVBUFF * sizeof(struct recv_buf) + 4;
+	precvpriv->pallocated_recv_buf = kzalloc(n, GFP_KERNEL);
+	if (!precvpriv->pallocated_recv_buf) {
+		res = _FAIL;
+		goto exit;
+	}
+
+	precvpriv->precv_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(precvpriv->pallocated_recv_buf), 4);
+
+	/*  init each recv buffer */
+	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
+	for (i = 0; i < NR_RECVBUFF; i++) {
+		initrecvbuf(precvbuf, padapter);
+
+		if (!precvbuf->pskb) {
+			SIZE_PTR tmpaddr = 0;
+			SIZE_PTR alignment = 0;
+
+			precvbuf->pskb = __dev_alloc_skb(
+								MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ,
+								GFP_ATOMIC);
+			if (precvbuf->pskb) {
+				precvbuf->pskb->dev = padapter->pnetdev;
+
+				tmpaddr = (SIZE_PTR)precvbuf->pskb->data;
+				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ-1);
+				skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
+			}
+		}
+
+		list_add_tail(&precvbuf->list, &precvpriv->free_recv_buf_queue.queue);
+
+		precvbuf++;
+	}
+	precvpriv->free_recv_buf_queue_cnt = i;
+
+	if (res == _FAIL)
+		goto initbuferror;
+
+	/* 3 2. init tasklet */
+	tasklet_setup(&precvpriv->recv_tasklet, rtl8723bs_recv_tasklet);
+
+	goto exit;
+
+initbuferror:
+	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
+	if (precvbuf) {
+		n = precvpriv->free_recv_buf_queue_cnt;
+		precvpriv->free_recv_buf_queue_cnt = 0;
+		for (i = 0; i < n ; i++) {
+			list_del_init(&precvbuf->list);
+			if (precvbuf->pskb)
+				dev_kfree_skb_any(precvbuf->pskb);
+			precvbuf++;
+		}
+		precvpriv->precv_buf = NULL;
+	}
+
+	kfree(precvpriv->pallocated_recv_buf);
+	precvpriv->pallocated_recv_buf = NULL;
+
+exit:
+	return res;
 }
 
 void rtw_hal_free_recv_priv(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 97dce28fd..384c5e643 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -8,7 +8,7 @@
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
 
-static void initrecvbuf(struct recv_buf *precvbuf, struct adapter *padapter)
+void initrecvbuf(struct recv_buf *precvbuf, struct adapter *padapter)
 {
 	INIT_LIST_HEAD(&precvbuf->list);
 	spin_lock_init(&precvbuf->recvbuf_lock);
@@ -213,7 +213,7 @@ static inline bool pkt_exceeds_tail(struct recv_priv *precvpriv,
 	return false;
 }
 
-static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
+void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 {
 	struct adapter *padapter = from_tasklet(padapter, t,
 						recvpriv.recv_tasklet);
@@ -357,90 +357,6 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 	} while (1);
 }
 
-/*
- * Initialize recv private variable for hardware dependent
- * 1. recv buf
- * 2. recv tasklet
- *
- */
-s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
-{
-	s32 res;
-	u32 i, n;
-	struct recv_priv *precvpriv;
-	struct recv_buf *precvbuf;
-
-	res = _SUCCESS;
-	precvpriv = &padapter->recvpriv;
-
-	/* 3 1. init recv buffer */
-	INIT_LIST_HEAD(&precvpriv->free_recv_buf_queue.queue);
-	spin_lock_init(&precvpriv->free_recv_buf_queue.lock);
-	INIT_LIST_HEAD(&precvpriv->recv_buf_pending_queue.queue);
-	spin_lock_init(&precvpriv->recv_buf_pending_queue.lock);
-
-	n = NR_RECVBUFF * sizeof(struct recv_buf) + 4;
-	precvpriv->pallocated_recv_buf = kzalloc(n, GFP_KERNEL);
-	if (!precvpriv->pallocated_recv_buf) {
-		res = _FAIL;
-		goto exit;
-	}
-
-	precvpriv->precv_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(precvpriv->pallocated_recv_buf), 4);
-
-	/*  init each recv buffer */
-	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
-	for (i = 0; i < NR_RECVBUFF; i++) {
-		initrecvbuf(precvbuf, padapter);
-
-		if (!precvbuf->pskb) {
-			SIZE_PTR tmpaddr = 0;
-			SIZE_PTR alignment = 0;
-
-			precvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);
-			if (precvbuf->pskb) {
-				precvbuf->pskb->dev = padapter->pnetdev;
-
-				tmpaddr = (SIZE_PTR)precvbuf->pskb->data;
-				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ-1);
-				skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
-			}
-		}
-
-		list_add_tail(&precvbuf->list, &precvpriv->free_recv_buf_queue.queue);
-
-		precvbuf++;
-	}
-	precvpriv->free_recv_buf_queue_cnt = i;
-
-	if (res == _FAIL)
-		goto initbuferror;
-
-	/* 3 2. init tasklet */
-	tasklet_setup(&precvpriv->recv_tasklet, rtl8723bs_recv_tasklet);
-
-	goto exit;
-
-initbuferror:
-	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
-	if (precvbuf) {
-		n = precvpriv->free_recv_buf_queue_cnt;
-		precvpriv->free_recv_buf_queue_cnt = 0;
-		for (i = 0; i < n ; i++) {
-			list_del_init(&precvbuf->list);
-			if (precvbuf->pskb)
-				dev_kfree_skb_any(precvbuf->pskb);
-			precvbuf++;
-		}
-		precvpriv->precv_buf = NULL;
-	}
-
-	kfree(precvpriv->pallocated_recv_buf);
-	precvpriv->pallocated_recv_buf = NULL;
-
-exit:
-	return res;
-}
 
 /*
  * Free recv private variable of hardware dependent
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 2298c41df..1037b9d11 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -452,56 +452,3 @@ s32 rtl8723bs_mgnt_xmit(
 
 	return ret;
 }
-
-
-/*
- * Return
- *_SUCCESS	start thread ok
- *_FAIL		start thread fail
- *
- */
-s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
-{
-	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-	phal = GET_HAL_DATA(padapter);
-
-	spin_lock_init(&phal->SdioTxFIFOFreePageLock);
-	init_completion(&xmitpriv->SdioXmitStart);
-	init_completion(&xmitpriv->SdioXmitTerminate);
-
-	return _SUCCESS;
-}
-
-void rtl8723bs_free_xmit_priv(struct adapter *padapter)
-{
-	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	struct xmit_buf *pxmitbuf;
-	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
-	struct list_head *plist, *phead;
-	struct list_head tmplist;
-
-	phead = get_list_head(pqueue);
-	INIT_LIST_HEAD(&tmplist);
-
-	spin_lock_bh(&pqueue->lock);
-	if (!list_empty(&pqueue->queue)) {
-		/*  Insert tmplist to end of queue, and delete phead */
-		/*  then tmplist become head of queue. */
-		list_add_tail(&tmplist, phead);
-		list_del_init(phead);
-	}
-	spin_unlock_bh(&pqueue->lock);
-
-	phead = &tmplist;
-	while (!list_empty(phead)) {
-		plist = get_next(phead);
-		list_del_init(plist);
-
-		pxmitbuf = container_of(plist, struct xmit_buf, list);
-		rtw_free_xmitframe(pxmitpriv, (struct xmit_frame *)pxmitbuf->priv_data);
-		pxmitbuf->priv_data = NULL;
-		rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
-	}
-}
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index fe6401c4f..e00d9e6b2 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -242,5 +242,7 @@ void Hal_ReadRFGainOffset(struct adapter *padapter, u8 *hwinfo,
 
 void phy_StoreTxPowerByRateBase(struct adapter *padapter);
 void phy_ConvertTxPowerByRateInDbmToRelativeValues(struct adapter *padapter);
+void initrecvbuf(struct recv_buf *precvbuf, struct adapter *padapter);
+void rtl8723bs_recv_tasklet(struct tasklet_struct *t);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index e9ebecb22..c4c91f5f4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -81,7 +81,7 @@ struct rxreport_8723b {
 	u32 tsfl;
 };
 
-s32 rtl8723bs_init_recv_priv(struct adapter *padapter);
+
 void rtl8723bs_free_recv_priv(struct adapter *padapter);
 
 void rtl8723b_query_rx_phy_status(union recv_frame *prframe, struct phy_stat *pphy_stat);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index 157b2a808..d467cc301 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -407,8 +407,7 @@ void rtl8723b_fill_fake_txdesc(struct adapter *padapter, u8 *pDesc, u32 BufferLe
 
 u32 rtl8723bs_hal_init(struct adapter *padapter);
 u32 rtl8723bs_hal_deinit(struct adapter *padapter);
-s32 rtl8723bs_init_xmit_priv(struct adapter *padapter);
-void rtl8723bs_free_xmit_priv(struct adapter *padapter);
+
 s32 rtl8723bs_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe);
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter);
 int rtl8723bs_xmit_thread(void *context);
-- 
2.55.0

