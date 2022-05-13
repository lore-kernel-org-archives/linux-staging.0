Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A2C2100
	for <linux-staging@lists.linux.dev>; Fri, 13 May 2022 07:51:40 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id x88so7426717pjj.1
        for <linux-staging@lists.linux.dev>; Fri, 13 May 2022 00:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=QrqaDOovabmDJIWbQp5jwa4H/wrRF/tDldOr21QOUG4=;
        b=JZDuLkdBTFDQ7KWBfaXar4nccamEVRPV8aYGT+jAlBqgUy7xAE50b6PfTPWkSpBSUJ
         RfFaWL13Ii0HXejxG2THMOhsk9sCuc+TPRKm8lT7Eq2TNzG6iLB6b2PdXtWhZ4i0vPm/
         FxVPUhzwel0M2NDefl0HXRj6j3TjEPQ7WydboFnFx7mTbhYLuzjLrt6dLnFYonvS6i95
         hciohckIA9Xho+Z63+dFvOYwOdFz4q2aRdcnfbOJgdEEvjwBxk3apgJ801Ps03VkbtZP
         TyKAi20gCp1duBtVxmFmw9lP0GoUsN/xNgpzECLb91m/k7apWSG+dBS8wHADLmnAOwla
         Tl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QrqaDOovabmDJIWbQp5jwa4H/wrRF/tDldOr21QOUG4=;
        b=5DXka0z1XjColmJafHiWIqEeUyleP8pgYaXf1dfjFCDg/W2cdAszcgIsJWLkLyrPnc
         FE4e9fiQQRAr7FBl2WexUwBfGNjeB7iOogDJ4e3c9lSsL7uoEG3rE+a3k5RN1KV/Vstf
         q/0Qyzfl4jMkddFc83LdZc/8/NRqAnDsIbgHkhCjbsROt9ZBYQ/VKyD/2EzElJtFVyMf
         52Ybx67RA5/JV/PKINLyZtfc9DM9Ye5aLXL0n67AY0vUv4MOf/rSqLis/AiHw5mbBpoD
         BFeytgU4Nk266n3OyR827GVRt0PJBSMNd6c3e35QF8Q8CNVJfeBYXAfGM2wK4tpEHG1L
         8IOw==
X-Gm-Message-State: AOAM530QQ1c8lTNaeMEeK5QHIaTY1HOKOYaZXI28kfngRHcj0zxx8RGt
	YoV4KO7qrZ6btEBCV72RLj0=
X-Google-Smtp-Source: ABdhPJyWmgoWTR40oS2xAUiT/lGyMb4AB8dUzXDLfA22y1IuOAspj8AvdRVmVI6ODS+SgiFp0oniyw==
X-Received: by 2002:a17:903:1252:b0:154:ca85:59a0 with SMTP id u18-20020a170903125200b00154ca8559a0mr3689431plh.169.1652428299951;
        Fri, 13 May 2022 00:51:39 -0700 (PDT)
Received: from Negi ([207.151.52.3])
        by smtp.gmail.com with ESMTPSA id w18-20020a62c712000000b0050dc7628166sm1099898pfg.64.2022.05.13.00.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 00:51:39 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Fix block comment format
Date: Fri, 13 May 2022 00:51:07 -0700
Message-Id: <20220513075107.23285-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Adhere to Linux coding style. Fix the below checkpatch warning:
 WARNING: Block comments should align the * on each line

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 60 ++++++++++++-------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index d086812f8c0e..806e24743ecc 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -52,8 +52,8 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	sema_init(&pxmitpriv->terminate_xmitthread_sema, 0);
 
 	/*
-	Please insert all the queue initializaiton using rtw_init_queue below
-	*/
+	 * Please insert all the queue initializaiton using rtw_init_queue below
+	 */
 
 	pxmitpriv->adapter = padapter;
 
@@ -66,10 +66,10 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	rtw_init_queue(&pxmitpriv->free_xmit_queue);
 
 	/*
-	Please allocate memory with the sz = (struct xmit_frame) * NR_XMITFRAME,
-	and initialize free_xmit_frame below.
-	Please also apply  free_txobj to link_up all the xmit_frames...
-	*/
+	 * Please allocate memory with the sz = (struct xmit_frame) * NR_XMITFRAME,
+	 * and initialize free_xmit_frame below.
+	 * Please also apply  free_txobj to link_up all the xmit_frames...
+	 */
 
 	pxmitpriv->pallocated_frame_buf = vzalloc(NR_XMITFRAME * sizeof(struct xmit_frame) + 4);
 
@@ -853,17 +853,15 @@ s32 rtw_txframes_sta_ac_pending(struct adapter *padapter, struct pkt_attrib *pat
 }
 
 /*
-
-This sub-routine will perform all the following:
-
-1. remove 802.3 header.
-2. create wlan_header, based on the info in pxmitframe
-3. append sta's iv/ext-iv
-4. append LLC
-5. move frag chunk from pframe to pxmitframe->mem
-6. apply sw-encrypt, if necessary.
-
-*/
+ * This sub-routine will perform all the following:
+ *
+ * 1. remove 802.3 header.
+ * 2. create wlan_header, based on the info in pxmitframe
+ * 3. append sta's iv/ext-iv
+ * 4. append LLC
+ * 5. move frag chunk from pframe to pxmitframe->mem
+ * 6. apply sw-encrypt, if necessary.
+ */
 s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
@@ -1207,24 +1205,22 @@ s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
 }
 
 /*
-Calling context:
-1. OS_TXENTRY
-2. RXENTRY (rx_thread or RX_ISR/RX_CallBack)
-
-If we turn on USE_RXTHREAD, then, no need for critical section.
-Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
-
-Must be very very cautious...
-
-*/
-
+ * Calling context:
+ * 1. OS_TXENTRY
+ * 2. RXENTRY (rx_thread or RX_ISR/RX_CallBack)
+ *
+ * If we turn on USE_RXTHREAD, then, no need for critical section.
+ * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
+ *
+ * Must be very very cautious...
+ */
 struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv)/* _queue *pfree_xmit_queue) */
 {
 	/*
-		Please remember to use all the osdep_service api,
-		and lock/unlock or _enter/_exit critical to protect
-		pfree_xmit_queue
-	*/
+	 * Please remember to use all the osdep_service api,
+	 * and lock/unlock or _enter/_exit critical to protect
+	 * pfree_xmit_queue
+	 */
 
 	struct xmit_frame *pxframe = NULL;
 	struct list_head *plist, *phead;
-- 
2.17.1

