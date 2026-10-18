Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099F415B79
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341883; cv=none; b=pBLExKejVW3ffb9G3ZqRIl0prX/XiyRLcamt4vRooAlQLGO5sGvgRimSBIya05+YUxasBw2ey/ETHezn8bapHaaDKwTuE2ARLAO+KZBuDKCnx1JiZLHUqyRmGbiHRe9YgGHB6MC22PCnYXAtiwi7Un1vlFAHqLEh2CQKmemHM4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341883; c=relaxed/simple;
	bh=i+j5gi6hbhWHWTwayXv06deV6m3oJ9OZrjzPHkKH2ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bsx6M2I9FNrXejHKC0ShIUG0iEUSzmvwgV8vvZV8tyf2kIcs058lnH9g4plSberJyXrw0sX/Xmqa8R4jRYuUhNOlub9l4boy+rH+3mCNK3054IwZ0jS1XWqYiEvVhXqp5M3K6tFw+exj0+scmL5aYv/0rTWwerGZCAK04nKPLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7TepsO2; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7TepsO2"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso2564927eec.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341876; x=1792946676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gjzmg7eae/uR0QuhBKnPSRHZ8ca7zvPy7TlEZod/kQw=;
        b=i7TepsO2mv7SbMSlxU3AyonZhstbdJJtJMfNjWmQvg7VW40iudbBI4aUZiEI56JtJl
         frgkmdPBWLCMb0bGOmR+Cu0qbmcJ+/g29rgBoHRdsq2PYSB47No7EL8Exo5LFeoOiM/g
         TywFvsPKuw66T8GNgavmSaCJPFSr4Ds2vbqM8kfx6LNhvdoRExa5i9PqVgIhbtX28Qvx
         NQIkR6X0/cNX/+QwXpePPDwsYQ/tcWPVh6fbx2kljLyYZtYz//7eYBlf/65m0icwa/kr
         C+QRlgy9t9t+wljtN+CxolANmsuP7t9ivdJ9Qvu3s9z/jszgKJ71XAKIc7FX/5dLuByp
         5sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341876; x=1792946676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gjzmg7eae/uR0QuhBKnPSRHZ8ca7zvPy7TlEZod/kQw=;
        b=hJwL192EvmsxgnEOcL8lHWQsv5EGwlXPGSp1kICAhSbVDGYAL0RmLMUNJYIzJ/Bsa9
         FWYmXhgQb/XHK0FulgjC28tJFZZFgYH9xh1XmX3+iPqaiEao9v70cTBxDwtgrBfDDlr1
         PJQOWxjPtggR0251hgwrXmlf72hWdmjNXOvd1UltoWPX3CugnfNye4cEawTs3QmRmFT/
         KhOM4u4PuZDifaz8b0zINVO8W4BoBOdunxIH1CaMj+6RxmIAniKvRZpX5x/qAqc2YhZ3
         XqahL6ClxG9+3glnevzzbVCqQSG0lm3g7emnNKxD19FJAKzdopTpm5hR+SpekIZ9WiPz
         39nA==
X-Gm-Message-State: AFq9FYLjDV8dARR4FjbCGxWATFHYIdi+1z4LiEudn9Kkv1O7AAOD85TL
	3nSJ3JrgUgOtMdjLe5PFeK1Svi2IizviAU39kdpTUiAG1fMEcTuuCY5X
X-Gm-Gg: AYBFou2RL+RZXDOokalO4KEV41GSxqaQbmHFaf8cFv3LbRUgVuTmomNMGDTv5mpOWxk
	Rwvtc0nHRc2pkJYS9YiIeyV0wuycXe0YznQVckcSGyHC/LrRmMCeaJRdMxB8Ge+e7hIeJyP03cH
	+qzf0Eu+SRUouPGmdzoLsRp0opBfuRoNQutTF/tYZpUxVWX53T2xbZEx7OhV9A7pIe2tEyeakBw
	6qwGwAtuCn2+tz1KltzTaMnJLj+O+AcimLGOBVSjrZNUWaHf15+HZ/CGboRhpW2Qy/KSCszm+y/
	l9jBnrheytQPBPyYb1zsAjeKUpNUjrF6HwX/zQFgLiYmB9zwVKgwZG9pZMfvfUSfCUc18BN1+Q1
	2llyztYfzMEPK+53ZS/flnRLdxMQEZGWREXR6oPGckQYqzAK5TSW+qgS3RKcf2RkqtSuyYkMblT
	PB42EI6SxXA1UVYbmrhvWDOOEeia5MZm7JcRKa9ky6ir6+UaowYK15wYegS2tmi9Ht6gPBBYcTl
	zQuxNiG5q2t9E/8Jw==
X-Received: by 2002:a05:693c:87c2:10b0:351:202c:c7a5 with SMTP id 5a478bee46e88-3619b7f866fmr8293667eec.0.1792341875922;
        Sun, 18 Oct 2026 09:44:35 -0700 (PDT)
Received: from Vicious.localdomain ([117.99.24.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm31431363eec.20.2026.10.18.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:44:35 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: replace SIZE_PTR with uintptr_t and remove definition
Date: Sun, 18 Oct 2026 16:44:02 +0000
Message-ID: <20261018164403.14921-4-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
References: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver defines a custom macro SIZE_PTR as __kernel_size_t, which is
used when casting pointer values to integers to calculate alignment
offsets.

Replace the remaining casts of pointers to integers in rtl8723bs_recv.c
and sdio_ops.c with uintptr_t, use size_t for the alignment variable,
and remove the SIZE_PTR macro definition from basic_types.h.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c  | 11 ++++++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c        |  6 +++---
 drivers/staging/rtl8723bs/include/basic_types.h |  2 --
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index a62b845c69f9..f3f9c2699c68 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -295,7 +295,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 
 				pkt_copy->dev = padapter->pnetdev;
 				precvframe->u.hdr.pkt = pkt_copy;
-				skb_reserve(pkt_copy, 8 - ((SIZE_PTR)(pkt_copy->data) & 7));/* force pkt_copy->data at 8-byte alignment address */
+				/* force pkt_copy->data at 8-byte alignment address */
+				skb_reserve(pkt_copy, 8 - ((uintptr_t)(pkt_copy->data) & 7));
 				skb_reserve(pkt_copy, shift_sz);/* force ip_hdr at 8-byte alignment address according to shift_sz. */
 				memcpy(pkt_copy->data, (ptr + rx_report_sz + pattrib->shift_sz), skb_len);
 				precvframe->u.hdr.rx_head = pkt_copy->head;
@@ -390,15 +391,15 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 		initrecvbuf(precvbuf, padapter);
 
 		if (!precvbuf->pskb) {
-			SIZE_PTR tmpaddr = 0;
-			SIZE_PTR alignment = 0;
+			uintptr_t tmpaddr = 0;
+			size_t alignment = 0;
 
 			precvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);
 			if (precvbuf->pskb) {
 				precvbuf->pskb->dev = padapter->pnetdev;
 
-				tmpaddr = (SIZE_PTR)precvbuf->pskb->data;
-				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ-1);
+				tmpaddr = (uintptr_t)precvbuf->pskb->data;
+				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
 				skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c12f670922d5..9cc5c651f35a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -653,8 +653,8 @@ static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 
 	/* 3 2. alloc skb */
 	if (!recvbuf->pskb) {
-		SIZE_PTR tmpaddr = 0;
-		SIZE_PTR alignment = 0;
+		uintptr_t tmpaddr = 0;
+		size_t alignment = 0;
 
 		recvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);
 		if (!recvbuf->pskb)
@@ -662,7 +662,7 @@ static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 
 		recvbuf->pskb->dev = adapter->pnetdev;
 
-		tmpaddr = (SIZE_PTR)recvbuf->pskb->data;
+		tmpaddr = (uintptr_t)recvbuf->pskb->data;
 		alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
 		skb_reserve(recvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
 	}
diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index d2436459cff6..c3947e61ec22 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -13,8 +13,6 @@
 #include <linux/types.h>
 #include <linux/stddef.h>
 
-#define SIZE_PTR __kernel_size_t
-
 /* port from fw by thomas */
 /*  TODO: Belows are Sync from SD7-Driver. It is necessary to check correctness */
 
-- 
2.43.0

