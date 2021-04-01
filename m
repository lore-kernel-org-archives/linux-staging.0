Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0575E6D09
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 22:16:29 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h25so2465956pgm.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 15:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=20/XsB+4nOjyVNc3FO5kZBSjhLzmibdPtDV2QDGrEKY=;
        b=nyyidNBycRid3npH/SZFrDzLYulf0Qdo3b0lzm34Pqrj0FZjUv/r/Ln/QwjeYQhk5s
         hEG0Z2LzVUo1SXSjaNKV7r2wxdsbV0Qitap1EZ1J9NlAZRyMWLdR17+IzxnHDu4Et0/J
         qSSZauNWIRP1Q6/Vh1X5wASeWOikw55ZpiJmzjPK1DWhGEMTvultBRdRmq9q+rZyQX3P
         RdPy/S0YErFITH7yl7rlOknt+SJRn4Drs7rk0FdPR+WNXMWT29Jfr3XIsZxs3Qk74E18
         urly6ck0LH58BcqXsItZsh5xPxdXOVUrl7OiNfptLHeX2glm6Yj/S4nPO6GrDZqHmrGg
         AXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=20/XsB+4nOjyVNc3FO5kZBSjhLzmibdPtDV2QDGrEKY=;
        b=aSTaKUlZ43/Bj+K+7c6IuhQRPFj1YOQQH68d2D3PTZUhVzQnXT1+OggD4nMU9YIEet
         tjXuWjnGJkv9HZNSz92HO7ANi3Ir6B6OKXAmC+Wzs8rOPXYj2MLvLRA8KhjCVYxBBCzy
         DJeoAbMe5Tf3NRuzLUWGJI5wKwvFIe1WcV/QDh2i444I1jB3AKMpevtQyWpZ4LivBAHy
         75yV07vAJ0NT7jKEDMPDQSPzIykC2Di05peNkEA3ALvxRuiNpzktOXap65oBOAyNKq5r
         LQSAV4AWIu7TUeqvFD/syOmloEN3Iqlf5n26hY/qcCfsCTG8sJyjQlG3k365Jcj0YoPY
         X0ww==
X-Gm-Message-State: AOAM531QB7pkOT39pLHA6QnXGAfSy7bFS/f6sErmozJUAAGNL2FvIMzO
	EXlROMJgl+pUHMH7BTrbuw0=
X-Google-Smtp-Source: ABdhPJz38eh3WuSyN0IkxFTsQTKOkqp+n1Kao3wMI7GQxPkkiGZvbmXsJ3r2w5B5zMn87e5lSDzCwg==
X-Received: by 2002:a65:4243:: with SMTP id d3mr9648485pgq.180.1617315389461;
        Thu, 01 Apr 2021 15:16:29 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id d13sm6671494pgb.6.2021.04.01.15.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 15:16:29 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 2/3] staging: rtl8723bs: core: add * to block comments
Date: Thu,  1 Apr 2021 15:15:41 -0700
Message-Id: <09db7fd3bed9a0ce00289d686a4e8dea256082e5.1617314121.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
References: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
References: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Add * at the beginning of each line in block comments to conform to the
Linux kernel coding style. Issue detected using checkpatch.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 59 +++++++++++------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 3878caf0b56c..428c71ce0334 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -46,8 +46,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	init_completion(&pxmitpriv->terminate_xmitthread_comp);
 
 	/*
-	Please insert all the queue initializaiton using _rtw_init_queue below
-	*/
+	 * Please insert all the queue initializaiton using _rtw_init_queue below
+	 */
 
 	pxmitpriv->adapter = padapter;
 
@@ -60,10 +60,10 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	_rtw_init_queue(&pxmitpriv->free_xmit_queue);
 
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
 
@@ -1069,17 +1069,15 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
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
@@ -1693,23 +1691,22 @@ static void rtw_init_xmitframe(struct xmit_frame *pxframe)
 }
 
 /*
-Calling context:
-1. OS_TXENTRY
-2. RXENTRY (rx_thread or RX_ISR/RX_CallBack)
-
-If we turn on USE_RXTHREAD, then, no need for critical section.
-Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
-
-Must be very, very cautious...
-
-*/
+ * Calling context:
+ * 1. OS_TXENTRY
+ * 2. RXENTRY (rx_thread or RX_ISR/RX_CallBack)
+ *
+ * If we turn on USE_RXTHREAD, then, no need for critical section.
+ * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
+ *
+ * Must be very, very cautious...
+ */
 struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv)/* _queue *pfree_xmit_queue) */
 {
 	/*
-		Please remember to use all the osdep_service api,
-		and lock/unlock or _enter/_exit critical to protect
-		pfree_xmit_queue
-	*/
+	 *	Please remember to use all the osdep_service api,
+	 *	and lock/unlock or _enter/_exit critical to protect
+	 *	pfree_xmit_queue
+	 */
 
 	struct xmit_frame *pxframe = NULL;
 	struct list_head *plist, *phead;
-- 
2.17.1

