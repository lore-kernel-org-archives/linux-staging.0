Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5C7B;
	Tue, 25 Oct 2022 23:38:55 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id bx35so13445189ljb.2;
        Tue, 25 Oct 2022 16:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQhShKhvS/+oh7sUIgvlgzVYDBBWcRkOByOCMCkM4bY=;
        b=K1XJ5QSKOcw0J6F5+EbA4VLES15MWEwPg7xBGqBZOqyU16Lis5D8BqIXTe+jdpp4Hn
         N9i5u1qbmtACjsFk1AY2h+Pv5Fah+53WjqaC/p9hd5WahD0M4gCvMAmf7ezZbi+X4w97
         tntdzGoxV/mf0z10t1Qlwi6tsxYEo5qameKn9VENyPVjo9H55WXtymWUNerUXG7R/TgA
         7YdqhSpv4WRoxWR7+0y4nYMuYsPXDO6EZ1hD76a0JkBftpUW3MuROXgucKmF/cXTiBQZ
         Eg0Zd2EXuTarw5f/KeWqmGxCl9N7uss3ZP9b0uzeaeNy1O7tmZ4VhIILgb6ubzzSVv9X
         +TDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQhShKhvS/+oh7sUIgvlgzVYDBBWcRkOByOCMCkM4bY=;
        b=kvIBdqBoOxs5wo2M/UAJDS5VwPDh2Dkt7xy/7AWng6MqAK4hfiCMJUZ7rXpfWFFgHy
         bk2cVp757qe+1UrM8qOJenLuhKGEBvF1zUvz3UQt0ThjkrSBWL1Q8s13hZzbhtf9u00M
         lbpJVTIFowgOkmBGG1/cQ8QDflycKdbJEnnazz4bWot0d9BwG2NTIkX40r3auem9PNTQ
         XjH0qfDbOGR7aB1GEr6exJZ5xQ8e5NQMg7KJXirRs6BUU/S93A31QMMlnP5W4GKt+j8M
         5/ksYK0D+HyKlblqrwWSTmdFMUviC5blB9Q5xYKEyKuyNU1OM1qpFoF6n+2CqK8EJPco
         G9ow==
X-Gm-Message-State: ACrzQf2TrP+NTVQGU9g29qB6owwMPJMLXv7cbOX08dhoQIaci4US9/fo
	vFtZikr1B6oN/09Pgki83iHqAUCyWdA45Q==
X-Google-Smtp-Source: AMsMyM4bS3i6ryub5rHwNMHGTrDUdundTDbq2f+u2NAQPYqGqLKlD3DC/3shqFXGiIs4AzNmpqwMpg==
X-Received: by 2002:a2e:3a12:0:b0:277:a6b:b919 with SMTP id h18-20020a2e3a12000000b002770a6bb919mr5462167lja.191.1666741133690;
        Tue, 25 Oct 2022 16:38:53 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:38:49 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 12/17] staging: vt6655: changed variable name: cbFrameSize
Date: Tue, 25 Oct 2022 23:37:08 +0000
Message-Id: <1be63d32bee244e0259a81b0c463efe98952aacd.1666740522.git.tanjubrunostar0@gmail.com>
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

change variable names cbFrameSize to meet the
linux coding standard, as it says to avoid using camelCase naming
style. Cought by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 58 +++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 819080b14d5d..cc3b642ef8af 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -101,7 +101,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     void *pv_rrv_time,
 				     void *pv_rts,
 				     void *pv_cts,
-				     unsigned int	cbFrameSize,
+				     unsigned int	cb_frame_size,
 				     bool bNeedACK,
 				     unsigned int	uDMAIdx,
 				     void *psEthHeader,
@@ -926,7 +926,7 @@ static void s_vFillCTSHead(struct vnt_private *p_device,
  *      pv_rrv_time        - pv_rrv_time
  *      pv_rts            - RTS Buffer
  *      pCTS            - CTS Buffer
- *      cbFrameSize     - Transmit Data Length (Hdr+Payload+FCS)
+ *      cb_frame_size     - Transmit Data Length (Hdr+Payload+FCS)
  *      bNeedACK        - If need ACK
  *      uDescIdx        - Desc Index
  *  Out:
@@ -935,7 +935,7 @@ static void s_vFillCTSHead(struct vnt_private *p_device,
  * Return Value: none
  *
  -
- * unsigned int cbFrameSize, Hdr+Payload+FCS
+ * unsigned int cb_frame_size, Hdr+Payload+FCS
  */
 static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     unsigned char by_pkt_type,
@@ -943,7 +943,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     void *pv_rrv_time,
 				     void *pv_rts,
 				     void *pv_cts,
-				     unsigned int cbFrameSize,
+				     unsigned int cb_frame_size,
 				     bool bNeedACK,
 				     unsigned int uDMAIdx,
 				     void *psEthHeader,
@@ -972,68 +972,72 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 			struct vnt_rrv_time_rts *buf = pv_rrv_time;
 
 			buf->rts_rrv_time_aa = get_rtscts_time(p_device, 2, by_pkt_type,
-							       cbFrameSize, wCurrentRate);
+							       cb_frame_size, wCurrentRate);
 			buf->rts_rrv_time_ba = get_rtscts_time(p_device, 1, by_pkt_type,
-							       cbFrameSize, wCurrentRate);
+							       cb_frame_size, wCurrentRate);
 			buf->rts_rrv_time_bb = get_rtscts_time(p_device, 0, by_pkt_type,
-							       cbFrameSize, wCurrentRate);
-			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(p_device, by_pkt_type, cbFrameSize,
+							       cb_frame_size, wCurrentRate);
+			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(p_device, by_pkt_type,
+								cb_frame_size,
 								wCurrentRate, bNeedACK);
-			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B, cbFrameSize,
+			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B,
+								cb_frame_size,
 								p_device->byTopCCKBasicRate,
 								bNeedACK);
 
-			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cbFrameSize, bNeedACK,
+			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, bNeedACK,
 					  b_dis_crc, psEthHeader, wCurrentRate, by_fb_option);
 		} else {/* RTS_needless, PCF mode */
 			struct vnt_rrv_time_cts *buf = pv_rrv_time;
 
-			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(p_device, by_pkt_type, cbFrameSize,
+			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(p_device, by_pkt_type,
+								cb_frame_size,
 								wCurrentRate, bNeedACK);
-			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B, cbFrameSize,
+			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B,
+								cb_frame_size,
 								p_device->byTopCCKBasicRate,
 								bNeedACK);
 			buf->cts_rrv_time_ba = get_rtscts_time(p_device, 3, by_pkt_type,
-							       cbFrameSize, wCurrentRate);
+							       cb_frame_size, wCurrentRate);
 
 			/* Fill CTS */
-			s_vFillCTSHead(p_device, uDMAIdx, by_pkt_type, pv_cts, cbFrameSize,
+			s_vFillCTSHead(p_device, uDMAIdx, by_pkt_type, pv_cts, cb_frame_size,
 				       bNeedACK, b_dis_crc, wCurrentRate, by_fb_option);
 		}
 	} else if (by_pkt_type == PK_TYPE_11A) {
 		if (pv_rts) {/* RTS_need, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pv_rrv_time;
 
-			buf->rts_rrv_time = get_rtscts_time(p_device, 2, by_pkt_type, cbFrameSize,
+			buf->rts_rrv_time = get_rtscts_time(p_device, 2, by_pkt_type, cb_frame_size,
 							    wCurrentRate);
-			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, by_pkt_type, cbFrameSize,
+			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, by_pkt_type, cb_frame_size,
 							      wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cbFrameSize, bNeedACK,
+			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, bNeedACK,
 					  b_dis_crc, psEthHeader, wCurrentRate, by_fb_option);
 		} else if (!pv_rts) {/* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pv_rrv_time;
 
-			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11A, cbFrameSize,
+			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11A, cb_frame_size,
 							      wCurrentRate, bNeedACK);
 		}
 	} else if (by_pkt_type == PK_TYPE_11B) {
 		if (pv_rts) {/* RTS_need, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pv_rrv_time;
 
-			buf->rts_rrv_time = get_rtscts_time(p_device, 0, by_pkt_type, cbFrameSize,
+			buf->rts_rrv_time = get_rtscts_time(p_device, 0, by_pkt_type, cb_frame_size,
 							    wCurrentRate);
-			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B, cbFrameSize,
+			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B, cb_frame_size,
 							      wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cbFrameSize, bNeedACK,
+			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, bNeedACK,
 					  b_dis_crc, psEthHeader, wCurrentRate, by_fb_option);
 		} else { /* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pv_rrv_time;
 
-			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B, cbFrameSize,
+			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B, cb_frame_size,
 							      wCurrentRate, bNeedACK);
 		}
 	}
@@ -1053,7 +1057,7 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 	struct vnt_tx_fifo_head *tx_buffer_head =
 			(struct vnt_tx_fifo_head *)td_info->buf;
 	u16 fifo_ctl = le16_to_cpu(tx_buffer_head->fifo_ctl);
-	unsigned int cbFrameSize;
+	unsigned int cb_frame_size;
 	__le16 uDuration;
 	unsigned char *pbyBuffer;
 	unsigned int uLength = 0;
@@ -1073,7 +1077,7 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 	unsigned short wTxBufSize;   /* FFinfo size */
 	unsigned char by_fb_option = AUTO_FB_NONE;
 
-	cbFrameSize = skb->len + 4;
+	cb_frame_size = skb->len + 4;
 
 	if (info->control.hw_key) {
 		switch (info->control.hw_key->cipher) {
@@ -1084,7 +1088,7 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 			break;
 		}
 
-		cbFrameSize += info->control.hw_key->icv_len;
+		cb_frame_size += info->control.hw_key->icv_len;
 
 		if (p_device->local_id > REV_ID_VT3253_A1) {
 			/* MAC Header should be padding 0 to DW alignment. */
@@ -1225,9 +1229,9 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 
 	/* Fill FIFO,RrvTime,RTS,and CTS */
 	s_vgenerate_tx_parameter(p_device, by_pkt_type, tx_buffer_head, pv_rrv_time, pv_rts, pv_cts,
-				 cbFrameSize, bNeedACK, uDMAIdx, hdr, p_device->wCurrentRate);
+				 cb_frame_size, bNeedACK, uDMAIdx, hdr, p_device->wCurrentRate);
 	/* Fill DataHead */
-	uDuration = s_uFillDataHead(p_device, by_pkt_type, pvTxDataHd, cbFrameSize, uDMAIdx,
+	uDuration = s_uFillDataHead(p_device, by_pkt_type, pvTxDataHd, cb_frame_size, uDMAIdx,
 				    bNeedACK, 0, 0, uMACfragNum, by_fb_option,
 				    p_device->wCurrentRate, is_pspoll);
 
-- 
2.34.1

