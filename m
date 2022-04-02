Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2005F7C;
	Sat,  2 Apr 2022 12:28:27 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w21so7774846wra.2;
        Sat, 02 Apr 2022 05:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+wUVfcP1Kq4anpR9aDlXlD62iSVYYqFHg1dfGPcvyE=;
        b=SuqBZt9WHRSlMmoDljfZ2o6v2iqbSxryE8SmG7HI0zvApvlnAay0YbN9uRijWGsMlQ
         iaLz9+Op0PJFTD6Dl/2RkkC9E0afHnKBFecJi6QwgJm7SGK8bbfrNK7GWjbj1FZepICX
         uKQLS8v77mLfroFmp/MpCHXZeL0RKrTCAO5RO7zXalGMXifVhBbq+0OUiKf0Nn+toN5f
         jM12uokZDPGW6jFzaU9AiGxdOCqW31i7ytMfv1hwVR+eAX5NL6+UVBxCBkh1M6y/3IpJ
         fJBuVtYZ5mF3PjKa/sUaXMxek6J3/Bv+f95BvNnPEtfmXBsfaw8EaC06aI53hmwOefUq
         hblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+wUVfcP1Kq4anpR9aDlXlD62iSVYYqFHg1dfGPcvyE=;
        b=wn15E83QpbIrkdJqmyJBPQhatZvpUY4akYrl0+BcE8XANNzwqpXsijSzoia7mriCpV
         ECm2Z1EnHJBoCuQtV2sx0JNhZkoPSvEYlcBzVLvj2/v0UXiqNtkMV6y2y6cjhd2E0mCj
         2LFgvxC48lS4xQXFBOAHuabtcBei0CTyllqEOlZq7uzPB6ih1FH3hFf1QvJwiwyOWgld
         GDQc9lqxZlzMT0ctFbhfYjH3q0Ub2B1u+FvCKz+WFHdJAQme55XnjHB5L62aVqhbeIas
         Mc3MwbWwoUMujVoEWDSS6IeTfzV4tl12FgUSnX9CpahM1qpFpg+JaD2zzci2IhvW9LKF
         pHtg==
X-Gm-Message-State: AOAM533WRchwkKBko+5/r6pH2u5etSMx8vpPGJ535rimPeMCQ80W2L7d
	SY7gb11EeNgQ5I7X6z/7QA8=
X-Google-Smtp-Source: ABdhPJwHB1o3gLPTaHMN2eGdujHQRk9YnbPhNyCqzdRLhiYg7/HNsdgt+L6kRLixDM02UIT7e396hA==
X-Received: by 2002:a05:6000:1d8b:b0:203:df82:ff8d with SMTP id bk11-20020a0560001d8b00b00203df82ff8dmr11039502wrb.623.1648902505436;
        Sat, 02 Apr 2022 05:28:25 -0700 (PDT)
Received: from alaa-emad ([197.57.138.121])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d588a000000b002052e4aaf89sm4563681wrf.80.2022.04.02.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 05:28:24 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH 1/2] staging: rtl8712: remove blank line after brace {
Date: Sat,  2 Apr 2022 14:28:16 +0200
Message-Id: <8c88829f625f9847a1db18fe467399594dacb064.1648902188.git.eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix " CHECK: Blank lines aren't necessary after an open brace '{' "
Reported by checkpatch

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index 84a22eba7ebf..05ba0ca7d627 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -147,7 +147,7 @@ static u32 get_ff_hwaddr(struct xmit_frame *pxmitframe)
 }
 
 static struct xmit_frame *dequeue_one_xmitframe(struct xmit_priv *pxmitpriv,
-					 struct hw_xmit *phwxmit,
+						struct hw_xmit *phwxmit,
 					 struct tx_servq *ptxservq,
 					 struct  __queue *pframe_queue)
 {
@@ -167,7 +167,7 @@ static struct xmit_frame *dequeue_one_xmitframe(struct xmit_priv *pxmitpriv,
 }
 
 static struct xmit_frame *dequeue_xframe_ex(struct xmit_priv *pxmitpriv,
-				     struct hw_xmit *phwxmit_i, sint entry)
+					    struct hw_xmit *phwxmit_i, sint entry)
 {
 	unsigned long irqL0;
 	struct list_head *sta_plist, *sta_phead;
@@ -201,7 +201,7 @@ static struct xmit_frame *dequeue_xframe_ex(struct xmit_priv *pxmitpriv,
 						tx_pending);
 			pframe_queue = &ptxservq->sta_pending;
 			pxmitframe = dequeue_one_xmitframe(pxmitpriv, phwxmit,
-				     ptxservq, pframe_queue);
+							   ptxservq, pframe_queue);
 			if (pxmitframe) {
 				phwxmit->accnt--;
 				goto exit_dequeue_xframe_ex;
@@ -292,14 +292,14 @@ void r8712_append_mpdu_unit(struct xmit_buf *pxmitbuf,
 	r8712_xmit_complete(padapter, pxmitframe);
 	if (pxmitframe->attrib.ether_type != 0x0806) {
 		if ((pxmitframe->attrib.ether_type != 0x888e) &&
-			(pxmitframe->attrib.dhcp_pkt != 1)) {
+		    (pxmitframe->attrib.dhcp_pkt != 1)) {
 			r8712_issue_addbareq_cmd(padapter,
-					pxmitframe->attrib.priority);
+						 pxmitframe->attrib.priority);
 		}
 	}
 	pxmitframe->last[0] = 1;
 	update_txdesc(pxmitframe, (uint *)(pxmitframe->buf_addr),
-		pxmitframe->attrib.last_txcmdsz);
+		      pxmitframe->attrib.last_txcmdsz);
 	/*padding zero */
 	last_txcmdsz = pxmitframe->attrib.last_txcmdsz;
 	padding_sz = (8 - (last_txcmdsz % 8));
@@ -334,7 +334,7 @@ void r8712_xmitframe_aggr_1st(struct xmit_buf *pxmitbuf,
 }
 
 u16 r8712_xmitframe_aggr_next(struct xmit_buf *pxmitbuf,
-			struct xmit_frame *pxmitframe)
+			      struct xmit_frame *pxmitframe)
 {
 	pxmitframe->pxmitbuf = pxmitbuf;
 	pxmitbuf->priv_data = pxmitframe;
@@ -388,7 +388,7 @@ void r8712_dump_aggr_xframe(struct xmit_buf *pxmitbuf,
 		/*default = 32 bytes for TX Desc*/
 	}
 	r8712_write_port(pxmitframe->padapter, RTL8712_DMA_H2CCMD,
-			total_length + TXDESC_SIZE, (u8 *)pxmitframe);
+			 total_length + TXDESC_SIZE, (u8 *)pxmitframe);
 }
 
 #endif
@@ -618,14 +618,13 @@ int r8712_xmitframe_complete(struct _adapter *padapter,
 	pxmitframe = dequeue_xframe_ex(pxmitpriv, phwxmits, hwentry);
 	/* need to remember the 1st frame */
 	if (pxmitframe) {
-
 #ifdef CONFIG_R8712_TX_AGGR
 		/* 1. dequeue 2nd frame
 		 * 2. aggr if 2nd xframe is dequeued, else dump directly
 		 */
 		if (AGGR_NR_HIGH_BOUND > 1)
 			p2ndxmitframe = dequeue_xframe_ex(pxmitpriv, phwxmits,
-							hwentry);
+							  hwentry);
 		if (pxmitframe->frame_tag != DATA_FRAMETAG) {
 			r8712_free_xmitbuf(pxmitpriv, pxmitbuf);
 			return false;
@@ -663,7 +662,7 @@ int r8712_xmitframe_complete(struct _adapter *padapter,
 		if (pxmitframe->frame_tag == DATA_FRAMETAG) {
 			if (pxmitframe->attrib.priority <= 15)
 				res = r8712_xmitframe_coalesce(padapter,
-					pxmitframe->pkt, pxmitframe);
+							       pxmitframe->pkt, pxmitframe);
 			/* always return ndis_packet after
 			 * r8712_xmitframe_coalesce
 			 */
@@ -715,10 +714,10 @@ static void dump_xframe(struct _adapter *padapter,
 		ff_hwaddr = get_ff_hwaddr(pxmitframe);
 #ifdef CONFIG_R8712_TX_AGGR
 		r8712_write_port(padapter, RTL8712_DMA_H2CCMD, w_sz,
-				(unsigned char *)pxmitframe);
+				 (unsigned char *)pxmitframe);
 #else
 		r8712_write_port(padapter, ff_hwaddr, w_sz,
-			   (unsigned char *)pxmitframe);
+				 (unsigned char *)pxmitframe);
 #endif
 		mem_addr += w_sz;
 		mem_addr = (u8 *)RND4(((addr_t)(mem_addr)));
-- 
2.35.1

