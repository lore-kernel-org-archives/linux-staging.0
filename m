Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4FB7B;
	Tue, 25 Oct 2022 23:39:29 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id u2so10258901ljl.3;
        Tue, 25 Oct 2022 16:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rE7Qn2LJBw8oRGNZ8jZhcTnY/ucTu/x/xnasCdttkZM=;
        b=FmDhoxwjDUlKlmkONPUz9V7W3/Kwk0CBFEgESZq6/unF/EzolZFw+WJN5jVxi3Ncwl
         hLZjdLWocl5LUzVeJiAqU/2Jwlk9XboIG23o6O/wP1Abgst+20FdUElcenuWVkDZQNir
         DErLib+eOebSw+m7fLcoKhGlP9Bwsmj84kbpwu+OyYLiBMlNz4v6POnqzw0pai5ubyfx
         mQAcFCjpsvRvtfkPiaizKl10eJm3kXvtRRjrlietGwLqcFTr37kcasY/sxq0sld2sDla
         2fiFeQn3B3CZyKo/Ssdv6prq5LOxQcsHcBe9BfVmiHh2is/1eU80o1Wh2uBk9bkrT7tx
         u4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rE7Qn2LJBw8oRGNZ8jZhcTnY/ucTu/x/xnasCdttkZM=;
        b=snDI1e2lDT95vunQe8+pRfEIe7VOBW6L8imFE9Wti6TpECxvN63y+4/8i0pHONXKwY
         ecbhiE4C4K/UyyI2obk4pAA1Z0LxD/TzEFxBI+c+tRNLls02meY7Fxh8zh9X+Sde51/j
         Jp+5TkYjMa4xidGi9UvpMLUyHW1ePtXqEvrJKpNdGdoEbVg9GD4aFYUXdwmpfySMbNFK
         SJ6K7N4BV+F/krzxanAIx/zTu2nXk/SPjCdJ8V8VSqqfKuYwqFbfPIJlM6fLTdrfCd9N
         VWDbegRfibm2xU1AYt6/pdzapV4WbiQYyFgsr1P7D+BxPgqnlsZ6jGf1n0c/mrbM1BDH
         ktDg==
X-Gm-Message-State: ACrzQf1yAEyOkf/EnvDfJsiCUypVx9P17F6KOJ6KshoM1oiQW1aArHG3
	3Dbk4ZcyW5lijVnYzBtaA+sQOggU3vQXKQ==
X-Google-Smtp-Source: AMsMyM4zV0sl9A0tncbG1gM7BRs6RzCO70UrswQmq/m/SFoU/pIu57Jkzx8UI4lMGwYc2N/JLwTcWA==
X-Received: by 2002:a05:651c:547:b0:26f:d2ef:bccc with SMTP id q7-20020a05651c054700b0026fd2efbcccmr15973015ljp.272.1666741168006;
        Tue, 25 Oct 2022 16:39:28 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:39:25 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 17/17] staging: vt6655: changed variable name: pbyTxBufferAddr
Date: Tue, 25 Oct 2022 23:37:13 +0000
Message-Id: <c9b3f6bf5a2956613a18071328e693a479638d90.1666740522.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666740522.git.tanjubrunostar0@gmail.com>
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

change variable names pbyTxBufferAddr to meet the
linux coding standard, as it says to avoid using camelCase naming
style. Cought by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 66 +++++++++++++++++------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 90e7330680d9..da75ae573a00 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -109,7 +109,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 
 static unsigned int s_cb_fill_tx_buf_head(struct vnt_private *p_device,
 					  unsigned char by_pkt_type,
-					  unsigned char *pbyTxBufferAddr,
+					  unsigned char *pby_tx_buffer_addr,
 					  unsigned int u_dma_idx,
 					  struct vnt_tx_desc *pHeadTD,
 					  unsigned int uNodeIndex);
@@ -1045,7 +1045,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 
 static unsigned int s_cb_fill_tx_buf_head(struct vnt_private *p_device,
 					  unsigned char by_pkt_type,
-					  unsigned char *pbyTxBufferAddr,
+					  unsigned char *pby_tx_buffer_addr,
 					  unsigned int u_dma_idx,
 					  struct vnt_tx_desc *pHeadTD,
 					  unsigned int is_pspoll)
@@ -1111,26 +1111,26 @@ static unsigned int s_cb_fill_tx_buf_head(struct vnt_private *p_device,
 
 		if (by_fb_option == AUTO_FB_NONE) {
 			if (bRTS) {/* RTS_need */
-				pv_rrv_time = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rrv_time = (void *)(pby_tx_buffer_addr + wTxBufSize);
+				pMICHDR = (struct vnt_mic_hdr *)(pby_tx_buffer_addr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_rts));
-				pv_rts = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rts = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						 sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
 				pv_cts = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pvTxDataHd = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						      sizeof(struct vnt_rrv_time_rts) +
 						      cbMICHDR + sizeof(struct vnt_rts_g));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
 							cbMICHDR + sizeof(struct vnt_rts_g) +
 							sizeof(struct vnt_tx_datahead_g);
 			} else { /* RTS_needless */
-				pv_rrv_time = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rrv_time = (void *)(pby_tx_buffer_addr + wTxBufSize);
+				pMICHDR = (struct vnt_mic_hdr *)(pby_tx_buffer_addr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_cts));
 				pv_rts = NULL;
-				pv_cts = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pv_cts = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						  sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pvTxDataHd = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						      sizeof(struct vnt_rrv_time_cts) + cbMICHDR +
 						      sizeof(struct vnt_cts));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_cts) +
@@ -1140,26 +1140,26 @@ static unsigned int s_cb_fill_tx_buf_head(struct vnt_private *p_device,
 		} else {
 			/* Auto Fall Back */
 			if (bRTS) {/* RTS_need */
-				pv_rrv_time = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rrv_time = (void *)(pby_tx_buffer_addr + wTxBufSize);
+				pMICHDR = (struct vnt_mic_hdr *)(pby_tx_buffer_addr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_rts));
-				pv_rts = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rts = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						 sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
 				pv_cts = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pvTxDataHd = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						      sizeof(struct vnt_rrv_time_rts) +
 					cbMICHDR + sizeof(struct vnt_rts_g_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
 					cbMICHDR + sizeof(struct vnt_rts_g_fb) +
 					sizeof(struct vnt_tx_datahead_g_fb);
 			} else { /* RTS_needless */
-				pv_rrv_time = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rrv_time = (void *)(pby_tx_buffer_addr + wTxBufSize);
+				pMICHDR = (struct vnt_mic_hdr *)(pby_tx_buffer_addr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_cts));
 				pv_rts = NULL;
-				pv_cts = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pv_cts = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						 sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
-				pvTxDataHd = (void  *)(pbyTxBufferAddr + wTxBufSize +
+				pvTxDataHd = (void  *)(pby_tx_buffer_addr + wTxBufSize +
 						       sizeof(struct vnt_rrv_time_cts) +
 					cbMICHDR + sizeof(struct vnt_cts_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_cts) +
@@ -1171,25 +1171,25 @@ static unsigned int s_cb_fill_tx_buf_head(struct vnt_private *p_device,
 
 		if (by_fb_option == AUTO_FB_NONE) {
 			if (bRTS) {
-				pv_rrv_time = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rrv_time = (void *)(pby_tx_buffer_addr + wTxBufSize);
+				pMICHDR = (struct vnt_mic_hdr *)(pby_tx_buffer_addr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_ab));
-				pv_rts = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rts = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						 sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				pv_cts = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pvTxDataHd = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR +
 						      sizeof(struct vnt_rts_ab));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
 					cbMICHDR + sizeof(struct vnt_rts_ab) +
 					sizeof(struct vnt_tx_datahead_ab);
 			} else { /* RTS_needless, need MICHDR */
-				pv_rrv_time = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rrv_time = (void *)(pby_tx_buffer_addr + wTxBufSize);
+				pMICHDR = (struct vnt_mic_hdr *)(pby_tx_buffer_addr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_ab));
 				pv_rts = NULL;
 				pv_cts = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pvTxDataHd = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
 					cbMICHDR + sizeof(struct vnt_tx_datahead_ab);
@@ -1197,25 +1197,25 @@ static unsigned int s_cb_fill_tx_buf_head(struct vnt_private *p_device,
 		} else {
 			/* Auto Fall Back */
 			if (bRTS) { /* RTS_need */
-				pv_rrv_time = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rrv_time = (void *)(pby_tx_buffer_addr + wTxBufSize);
+				pMICHDR = (struct vnt_mic_hdr *)(pby_tx_buffer_addr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_ab));
-				pv_rts = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rts = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						 sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				pv_cts = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pvTxDataHd = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR +
 						      sizeof(struct vnt_rts_a_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
 					cbMICHDR + sizeof(struct vnt_rts_a_fb) +
 					sizeof(struct vnt_tx_datahead_a_fb);
 			} else { /* RTS_needless */
-				pv_rrv_time = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+				pv_rrv_time = (void *)(pby_tx_buffer_addr + wTxBufSize);
+				pMICHDR = (struct vnt_mic_hdr *)(pby_tx_buffer_addr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_ab));
 				pv_rts = NULL;
 				pv_cts = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+				pvTxDataHd = (void *)(pby_tx_buffer_addr + wTxBufSize +
 						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
 					cbMICHDR + sizeof(struct vnt_tx_datahead_a_fb);
@@ -1225,7 +1225,7 @@ static unsigned int s_cb_fill_tx_buf_head(struct vnt_private *p_device,
 
 	td_info->mic_hdr = pMICHDR;
 
-	memset((void *)(pbyTxBufferAddr + wTxBufSize), 0, (cbHeaderLength - wTxBufSize));
+	memset((void *)(pby_tx_buffer_addr + wTxBufSize), 0, (cbHeaderLength - wTxBufSize));
 
 	/* Fill FIFO,RrvTime,RTS,and CTS */
 	s_vgenerate_tx_parameter(p_device, by_pkt_type, tx_buffer_head, pv_rrv_time, pv_rts, pv_cts,
-- 
2.34.1

