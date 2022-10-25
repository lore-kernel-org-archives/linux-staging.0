Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFAF7B;
	Tue, 25 Oct 2022 23:39:10 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id bn35so10735192ljb.5;
        Tue, 25 Oct 2022 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSbtAZQWWUA8oTDpFvYcQ18EJpkt7HUeuRn90GptEz0=;
        b=mStNlURizmGwwogj8cXNTWYxzr9XjCSZqreRIJpf9nQ5klAtRnZLrr+m7d7bX+Ttni
         rRhf+yKLeaFcFMpnOFlKF/ECFKxO+Cw8lcS3fT2zwcx7ecZUbXhpJmROC9oqImPt/sCx
         NTwyoTDID0iB/d74+Jfju2f6YjbVYJXZ+NIZuSz/f3ma/WImvMa9Gqk8rfnfX6ja8riT
         myWKjSIz4IvZgac5sugaijiVut/VncqugeF0MCqf8y8l4a6Im8R9tup+WjbK31+80nNg
         tPPV2lJrzcX16ULm1CG9Jf5oWS69ARn75EoxgiTO1Sp24UNAQRIswTEPW+0cTBPTHfLJ
         ssCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSbtAZQWWUA8oTDpFvYcQ18EJpkt7HUeuRn90GptEz0=;
        b=JVqCY1zYdPdGCrSUZSjCnQon9JjIihLE6tcXwjIXW8vrqnTnkswXfQx+KHv5fhsmrS
         j8Srjd5YU3x9E60W8yYzHgDJ6xzRyFKQREe3nrT+vnkJd8c+YslxwwYucWIa/jOSDlG7
         ermDrk23Y2ObIDfDOU8hBXS+c89VsIe0mnpHSwlobGx+uQy97yp+t4kcCS4rd5TNmEeb
         XB/JUcfJJQ844N6pwKrVkJvOOPgiGtoqHg+OZZMLUikxAMuSp9IA82FNQQcDF0in5HU8
         9eBT8oSkpwdCw90PDz/9tZDRMgyKZfd0nOf3aKMgC+bvNPupKmyHsHWFUxUCFNwECbPL
         b4Iw==
X-Gm-Message-State: ACrzQf30PEIO5zW4Mi4vnimi9r6KmFkqLekKEwhJpLCza3DfbFBppNym
	xcJW/o3pSartIya/z0WEByA=
X-Google-Smtp-Source: AMsMyM6pdPVd6dt3s0MKaOCCsRvUdbiaILZagVCon5/XBfX5/EPzo1x+zfy5pEYokvIIN+W/gEcpXg==
X-Received: by 2002:a05:651c:c88:b0:26d:fea6:36b1 with SMTP id bz8-20020a05651c0c8800b0026dfea636b1mr15976530ljb.433.1666741148867;
        Tue, 25 Oct 2022 16:39:08 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:39:02 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 14/17] staging: vt6655: changed variable name: uDMAIdx
Date: Tue, 25 Oct 2022 23:37:10 +0000
Message-Id: <97d1381cd24f3655ce6a17998805f0e2ca82c83f.1666740522.git.tanjubrunostar0@gmail.com>
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

change variable names uDMAIdx to meet the
linux coding standard, as it says to avoid using camelCase naming
style. Cought by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 1704b63da2cd..5729798973b4 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -103,14 +103,14 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     void *pv_cts,
 				     unsigned int	cb_frame_size,
 				     bool b_need_ack,
-				     unsigned int	uDMAIdx,
+				     unsigned int	u_dma_idx,
 				     void *psEthHeader,
 				     unsigned short wCurrentRate);
 
 static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 				      unsigned char by_pkt_type,
 				      unsigned char *pbyTxBufferAddr,
-				      unsigned int uDMAIdx,
+				      unsigned int u_dma_idx,
 				      struct vnt_tx_desc *pHeadTD,
 				      unsigned int uNodeIndex);
 
@@ -118,7 +118,7 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 			      unsigned char by_pkt_type,
 			      void *pTxDataHead,
 			      unsigned int cb_frame_length,
-			      unsigned int uDMAIdx,
+			      unsigned int u_dma_idx,
 			      bool b_need_ack,
 			      unsigned int uFragIdx,
 			      unsigned int cbLastFragmentSize,
@@ -446,7 +446,7 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 			      unsigned char by_pkt_type,
 			      void *pTxDataHead,
 			      unsigned int cb_frame_length,
-			      unsigned int uDMAIdx,
+			      unsigned int u_dma_idx,
 			      bool b_need_ack,
 			      unsigned int uFragIdx,
 			      unsigned int cbLastFragmentSize,
@@ -818,7 +818,7 @@ static void s_v_fill_rts_head(struct vnt_private *p_device,
 }
 
 static void s_vFillCTSHead(struct vnt_private *p_device,
-			   unsigned int uDMAIdx,
+			   unsigned int u_dma_idx,
 			   unsigned char by_pkt_type,
 			   void *pv_cts,
 			   unsigned int cb_frame_length,
@@ -841,8 +841,8 @@ static void s_vFillCTSHead(struct vnt_private *p_device,
 
 	if (by_pkt_type == PK_TYPE_11GB || by_pkt_type == PK_TYPE_11GA) {
 		if (by_fb_option != AUTO_FB_NONE &&
-		    uDMAIdx != TYPE_ATIMDMA &&
-		    uDMAIdx != TYPE_BEACONDMA) {
+		    u_dma_idx != TYPE_ATIMDMA &&
+		    u_dma_idx != TYPE_BEACONDMA) {
 			/* Auto Fall back */
 			struct vnt_cts_fb *buf = pv_cts;
 			/* Get SignalField, ServiceField & Length */
@@ -883,8 +883,8 @@ static void s_vFillCTSHead(struct vnt_private *p_device,
 					p_device->abyCurrentNetAddr);
 		} else {
 			/* if (by_fb_option != AUTO_FB_NONE &&
-			 * uDMAIdx != TYPE_ATIMDMA &&
-			 * uDMAIdx != TYPE_BEACONDMA)
+			 * u_dma_idx != TYPE_ATIMDMA &&
+			 * u_dma_idx != TYPE_BEACONDMA)
 			 */
 			struct vnt_cts *buf = pv_cts;
 			/* Get SignalField, ServiceField & Length */
@@ -945,7 +945,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     void *pv_cts,
 				     unsigned int cb_frame_size,
 				     bool b_need_ack,
-				     unsigned int uDMAIdx,
+				     unsigned int u_dma_idx,
 				     void *psEthHeader,
 				     unsigned short wCurrentRate)
 {
@@ -1001,7 +1001,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 							       cb_frame_size, wCurrentRate);
 
 			/* Fill CTS */
-			s_vFillCTSHead(p_device, uDMAIdx, by_pkt_type, pv_cts, cb_frame_size,
+			s_vFillCTSHead(p_device, u_dma_idx, by_pkt_type, pv_cts, cb_frame_size,
 				       b_need_ack, b_dis_crc, wCurrentRate, by_fb_option);
 		}
 	} else if (by_pkt_type == PK_TYPE_11A) {
@@ -1046,7 +1046,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 				      unsigned char by_pkt_type,
 				      unsigned char *pbyTxBufferAddr,
-				      unsigned int uDMAIdx,
+				      unsigned int u_dma_idx,
 				      struct vnt_tx_desc *pHeadTD,
 				      unsigned int is_pspoll)
 {
@@ -1229,9 +1229,9 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 
 	/* Fill FIFO,RrvTime,RTS,and CTS */
 	s_vgenerate_tx_parameter(p_device, by_pkt_type, tx_buffer_head, pv_rrv_time, pv_rts, pv_cts,
-				 cb_frame_size, b_need_ack, uDMAIdx, hdr, p_device->wCurrentRate);
+				 cb_frame_size, b_need_ack, u_dma_idx, hdr, p_device->wCurrentRate);
 	/* Fill DataHead */
-	uDuration = s_uFillDataHead(p_device, by_pkt_type, pvTxDataHd, cb_frame_size, uDMAIdx,
+	uDuration = s_uFillDataHead(p_device, by_pkt_type, pvTxDataHd, cb_frame_size, u_dma_idx,
 				    b_need_ack, 0, 0, uMACfragNum, by_fb_option,
 				    p_device->wCurrentRate, is_pspoll);
 
-- 
2.34.1

