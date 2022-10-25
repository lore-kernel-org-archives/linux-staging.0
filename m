Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCE47B;
	Tue, 25 Oct 2022 23:39:01 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id r22so19438717ljn.10;
        Tue, 25 Oct 2022 16:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zbs1vdQmiigLvQ3VvOjQt4juPolJu9r7kj9YMM+BCuw=;
        b=NGGj1EZTA4a4FcTTnQKW9KHL1pqKgIDEiWhDE4hi1Ey4SgonsFSUwaMYcDWPIoxqhe
         YCpWJxCg1M55KAz8p6jqDu5+7pxZ+Cx6W9qapjoteC6XDMTKaAfQPAXEieIvF2O7IZG4
         tSd/sKZOKHolv6CUJbje8MFNcs0E4XWZOKax3G79OdSWqFES6OuYMJ5WQ34zhNxYbSPt
         BAT5z0esFRGdQ7l9b9D7fcooSfiJaN65yWAUPqEhlkTQg6yXwOkImF1+ZOBVEt0jtyVw
         RQh2iOywYvPEZFWWjlMvAmfk1m0e2LUWpulbXOsPF2Vl0cOPpeaRybOsd7nS3WeKum8e
         Eq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zbs1vdQmiigLvQ3VvOjQt4juPolJu9r7kj9YMM+BCuw=;
        b=Y7Z+omQHc420i5g88fj2RFRv50X5A9MO1dWz5upEKs79MG4FKPtLouq2kJvmfMxJIz
         u5htbO5FGJAh+qv9J92Gcw6Es3DwU+i23uQeE6SSFIF0TzfUU9GmO8SVOs4moWJ0qtBZ
         Ghb+j7AFVP5W+vgYd5yUtpme9EaG1RWV5gVG+4Uj+3gbhOo5pXdEJ6X/6KoEQ6DaWeig
         VlB3C9vUjpfpVaPoaVof8NYau9jcyQyhclzMEBfBLHSNfz5p8FAG/w+X3+g99fMYOf4E
         NaD/WB4Rrfv3tpH6eaJLxsoF9xYVbbkj37wYqM6Swj7N8IdYDWfjjaH1q39ySb94ho6c
         x90Q==
X-Gm-Message-State: ACrzQf13LUo4k0Iuw8q7sCpowl1pej3OjLHWxp6UikgUg+A+gthp+cGM
	vgBZ4ze0F/oNzLyyrT/6/ej3mIdMWvdPlA==
X-Google-Smtp-Source: AMsMyM7mXecyr92BeBSXLrQzK/Rv3qWMmq4SmvN+zIhRShjfY3ljYeZSnuGsFUjAFASXDuiNkkgBSA==
X-Received: by 2002:a2e:b626:0:b0:277:249:c1d9 with SMTP id s6-20020a2eb626000000b002770249c1d9mr7679370ljn.514.1666741140048;
        Tue, 25 Oct 2022 16:39:00 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:38:56 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 13/17] staging: vt6655: changed variable name: bNeedACK
Date: Tue, 25 Oct 2022 23:37:09 +0000
Message-Id: <c41b74ed595c33c4d3385aa2ae638e337b26337e.1666740522.git.tanjubrunostar0@gmail.com>
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

change variable names bDisCRC to meet the
linux coding standard, as it says to avoid using camelCase naming
style. Cought by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index cc3b642ef8af..1704b63da2cd 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -102,7 +102,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     void *pv_rts,
 				     void *pv_cts,
 				     unsigned int	cb_frame_size,
-				     bool bNeedACK,
+				     bool b_need_ack,
 				     unsigned int	uDMAIdx,
 				     void *psEthHeader,
 				     unsigned short wCurrentRate);
@@ -927,7 +927,7 @@ static void s_vFillCTSHead(struct vnt_private *p_device,
  *      pv_rts            - RTS Buffer
  *      pCTS            - CTS Buffer
  *      cb_frame_size     - Transmit Data Length (Hdr+Payload+FCS)
- *      bNeedACK        - If need ACK
+ *      b_need_ack        - If need ACK
  *      uDescIdx        - Desc Index
  *  Out:
  *      none
@@ -944,7 +944,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     void *pv_rts,
 				     void *pv_cts,
 				     unsigned int cb_frame_size,
-				     bool bNeedACK,
+				     bool b_need_ack,
 				     unsigned int uDMAIdx,
 				     void *psEthHeader,
 				     unsigned short wCurrentRate)
@@ -979,30 +979,30 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 							       cb_frame_size, wCurrentRate);
 			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(p_device, by_pkt_type,
 								cb_frame_size,
-								wCurrentRate, bNeedACK);
+								wCurrentRate, b_need_ack);
 			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B,
 								cb_frame_size,
 								p_device->byTopCCKBasicRate,
-								bNeedACK);
+								b_need_ack);
 
-			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, bNeedACK,
+			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, b_need_ack,
 					  b_dis_crc, psEthHeader, wCurrentRate, by_fb_option);
 		} else {/* RTS_needless, PCF mode */
 			struct vnt_rrv_time_cts *buf = pv_rrv_time;
 
 			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(p_device, by_pkt_type,
 								cb_frame_size,
-								wCurrentRate, bNeedACK);
+								wCurrentRate, b_need_ack);
 			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B,
 								cb_frame_size,
 								p_device->byTopCCKBasicRate,
-								bNeedACK);
+								b_need_ack);
 			buf->cts_rrv_time_ba = get_rtscts_time(p_device, 3, by_pkt_type,
 							       cb_frame_size, wCurrentRate);
 
 			/* Fill CTS */
 			s_vFillCTSHead(p_device, uDMAIdx, by_pkt_type, pv_cts, cb_frame_size,
-				       bNeedACK, b_dis_crc, wCurrentRate, by_fb_option);
+				       b_need_ack, b_dis_crc, wCurrentRate, by_fb_option);
 		}
 	} else if (by_pkt_type == PK_TYPE_11A) {
 		if (pv_rts) {/* RTS_need, non PCF mode */
@@ -1011,16 +1011,16 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 			buf->rts_rrv_time = get_rtscts_time(p_device, 2, by_pkt_type, cb_frame_size,
 							    wCurrentRate);
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, by_pkt_type, cb_frame_size,
-							      wCurrentRate, bNeedACK);
+							      wCurrentRate, b_need_ack);
 
 			/* Fill RTS */
-			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, bNeedACK,
+			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, b_need_ack,
 					  b_dis_crc, psEthHeader, wCurrentRate, by_fb_option);
 		} else if (!pv_rts) {/* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pv_rrv_time;
 
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11A, cb_frame_size,
-							      wCurrentRate, bNeedACK);
+							      wCurrentRate, b_need_ack);
 		}
 	} else if (by_pkt_type == PK_TYPE_11B) {
 		if (pv_rts) {/* RTS_need, non PCF mode */
@@ -1029,16 +1029,16 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 			buf->rts_rrv_time = get_rtscts_time(p_device, 0, by_pkt_type, cb_frame_size,
 							    wCurrentRate);
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B, cb_frame_size,
-							      wCurrentRate, bNeedACK);
+							      wCurrentRate, b_need_ack);
 
 			/* Fill RTS */
-			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, bNeedACK,
+			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, b_need_ack,
 					  b_dis_crc, psEthHeader, wCurrentRate, by_fb_option);
 		} else { /* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pv_rrv_time;
 
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(p_device, PK_TYPE_11B, cb_frame_size,
-							      wCurrentRate, bNeedACK);
+							      wCurrentRate, b_need_ack);
 		}
 	}
 }
@@ -1065,7 +1065,7 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 	unsigned int uMACfragNum = 1;
 	unsigned int uPadding = 0;
 	unsigned int cbReqCount = 0;
-	bool bNeedACK = (bool)(fifo_ctl & FIFOCTL_NEEDACK);
+	bool b_need_ack = (bool)(fifo_ctl & FIFOCTL_NEEDACK);
 	bool bRTS = (bool)(fifo_ctl & FIFOCTL_RTS);
 	struct vnt_tx_desc *ptdCurr;
 	unsigned int cbHeaderLength = 0;
@@ -1229,10 +1229,10 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 
 	/* Fill FIFO,RrvTime,RTS,and CTS */
 	s_vgenerate_tx_parameter(p_device, by_pkt_type, tx_buffer_head, pv_rrv_time, pv_rts, pv_cts,
-				 cb_frame_size, bNeedACK, uDMAIdx, hdr, p_device->wCurrentRate);
+				 cb_frame_size, b_need_ack, uDMAIdx, hdr, p_device->wCurrentRate);
 	/* Fill DataHead */
 	uDuration = s_uFillDataHead(p_device, by_pkt_type, pvTxDataHd, cb_frame_size, uDMAIdx,
-				    bNeedACK, 0, 0, uMACfragNum, by_fb_option,
+				    b_need_ack, 0, 0, uMACfragNum, by_fb_option,
 				    p_device->wCurrentRate, is_pspoll);
 
 	hdr->duration_id = uDuration;
-- 
2.34.1

