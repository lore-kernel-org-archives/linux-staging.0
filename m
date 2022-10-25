Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2418464;
	Tue, 25 Oct 2022 23:37:52 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id bn35so10731100ljb.5;
        Tue, 25 Oct 2022 16:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28Kkq5ITo1dNRgDi7dXE3iCd3I8xo6zdByktxBrcm6c=;
        b=dqrCAkPJ7HVGRUwV+j9rE3Er3CLOGNXuOtgcuCIvy0lyFutsWYgGdoyUlG166bbbZZ
         4Yuj3BV9MgTrQQJv+GXlMe43YOstNBe62hC28S59Fw7IOKWBc6fFh5n4IJEPiGCSTbA0
         zvKnBYX6ai3GHBylKhbU0o9l316lejVYWXcv4WdYA92F5o7/SQfjLmtmFN6yFkPa52Pi
         AHl+efg39EmGMLkyftraqc2t3JIS1ZGkhPQwZJL9Cf/Njg95+ths2j6zURExzpB4oStn
         klrtp/G90mJ9MgrPG3JfrqfC4gnVO0cGNjKdR8zvrnJOnWAJW78nTTG9oRNDiory1bTw
         7aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28Kkq5ITo1dNRgDi7dXE3iCd3I8xo6zdByktxBrcm6c=;
        b=LcZNJB9isiPMWhandrMT6iHO+qNiNbBPTfnpQikGjhFslkMcaQY6SGbwQCKckIes/b
         29XN3WTsWxwymxF4k29FYk1Ronci32DFKonYFOLuKSRzuHRb1K/zk/R+SikZWadhL70T
         kFA/1zy4pEYYyf97gzONrl8Xh5+eK3Fr45C3LOwCjQ61FzIuQLCU7E/YZV4vzB9ngNGA
         srN03dWIBBowiitVpRuFWiSPx6ag/b6LRm15Gpf0AsN7Q7D8sZ3Hhr0gfkl+ODTJ9PKR
         n+BWv3BkKYQ8i1XfMTCblA1opnOUeB5Rusirk2/gMQT+pLyo1PwZFZVrH6uVE334W/qy
         jVTQ==
X-Gm-Message-State: ACrzQf2LPGxxB4NNtqXKsgJ/GbhsS/PfMctjm97OKVy8z4pnyzLv2/VZ
	Rw6MtyHkz1Tz1vpQosM2qY4=
X-Google-Smtp-Source: AMsMyM5STbFGr1Laqst3i21MteVbIaafq4qu1jyv4KKItWTLJl8fwSBzjgmH/BPHpVaMRcnBqyiDmg==
X-Received: by 2002:a2e:b892:0:b0:26f:ec13:e712 with SMTP id r18-20020a2eb892000000b0026fec13e712mr15135399ljp.50.1666741070794;
        Tue, 25 Oct 2022 16:37:50 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:37:50 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 06/17] staging: vt6655: changed variable name: cbFrameLength
Date: Tue, 25 Oct 2022 23:37:02 +0000
Message-Id: <cb182dd3f4288a82bc5d3e74e1607c6d9e04836c.1666740522.git.tanjubrunostar0@gmail.com>
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

change variable names cbFrameLength to meet the
linux coding standard, as it says to avoid using camelCase naming
style. Cought by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 128 +++++++++++++++++-----------------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index e97cba014adf..699ca2685052 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -88,7 +88,7 @@ static const unsigned short w_fb_opt_1[2][5] = {
 static void s_v_fill_rts_head(struct vnt_private *p_device,
 			      unsigned char by_pkt_type,
 			      void *pv_rts,
-			      unsigned int	cbFrameLength,
+			      unsigned int	cb_frame_length,
 			      bool bNeedAck,
 			      bool bDisCRC,
 			      struct ieee80211_hdr *hdr,
@@ -116,7 +116,7 @@ s_cbFillTxBufHead(struct vnt_private *p_device, unsigned char by_pkt_type,
 static __le16 s_uFillDataHead(struct vnt_private *p_device,
 			      unsigned char by_pkt_type,
 			      void *pTxDataHead,
-			      unsigned int cbFrameLength,
+			      unsigned int cb_frame_length,
 			      unsigned int uDMAIdx,
 			      bool bNeedAck,
 			      unsigned int uFragIdx,
@@ -141,13 +141,13 @@ static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
  */
 static unsigned int s_uGetTxRsvTime(struct vnt_private *p_device,
 				    unsigned char by_pkt_type,
-				    unsigned int cbFrameLength,
+				    unsigned int cb_frame_length,
 				    unsigned short wRate,
 				    bool bNeedAck)
 {
 	unsigned int uDataTime, uAckTime;
 
-	uDataTime = bb_get_frame_time(p_device->preamble_type, by_pkt_type, cbFrameLength, wRate);
+	uDataTime = bb_get_frame_time(p_device->preamble_type, by_pkt_type, cb_frame_length, wRate);
 
 	if (!bNeedAck)
 		return uDataTime;
@@ -221,7 +221,7 @@ static __le16 get_rtscts_time(struct vnt_private *priv,
 /* byFreqType 0: 5GHz, 1:2.4Ghz */
 static unsigned int s_uGetDataDuration(struct vnt_private *p_device,
 				       unsigned char byDurType,
-				       unsigned int cbFrameLength,
+				       unsigned int cb_frame_length,
 				       unsigned char by_pkt_type,
 				       unsigned short wRate,
 				       bool bNeedAck,
@@ -239,7 +239,7 @@ static unsigned int s_uGetDataDuration(struct vnt_private *p_device,
 	if (uFragIdx == (uMACfragNum - 2))
 		len = cbLastFragmentSize;
 	else
-		len = cbFrameLength;
+		len = cb_frame_length;
 
 	switch (byDurType) {
 	case DATADUR_B:    /* DATADUR_B */
@@ -319,7 +319,7 @@ static unsigned int s_uGetDataDuration(struct vnt_private *p_device,
 /* byFreqType: 0=>5GHZ 1=>2.4GHZ */
 static __le16 s_uGetRTSCTSDuration(struct vnt_private *p_device,
 				   unsigned char byDurType,
-				   unsigned int cbFrameLength,
+				   unsigned int cb_frame_length,
 				   unsigned char by_pkt_type,
 				   unsigned short wRate,
 				   bool bNeedAck,
@@ -332,26 +332,26 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *p_device,
 		uCTSTime = bb_get_frame_time(p_device->preamble_type, by_pkt_type, 14,
 					     p_device->byTopCCKBasicRate);
 		uDurTime = uCTSTime + 2 * p_device->uSIFS +
-			s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength, wRate, bNeedAck);
+			s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length, wRate, bNeedAck);
 		break;
 
 	case RTSDUR_BA:    /* RTSDuration_ba */
 		uCTSTime = bb_get_frame_time(p_device->preamble_type, by_pkt_type, 14,
 					     p_device->byTopCCKBasicRate);
 		uDurTime = uCTSTime + 2 * p_device->uSIFS +
-			s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength, wRate, bNeedAck);
+			s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length, wRate, bNeedAck);
 		break;
 
 	case RTSDUR_AA:    /* RTSDuration_aa */
 		uCTSTime = bb_get_frame_time(p_device->preamble_type, by_pkt_type, 14,
 					     p_device->byTopOFDMBasicRate);
 		uDurTime = uCTSTime + 2 * p_device->uSIFS +
-			s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength, wRate, bNeedAck);
+			s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length, wRate, bNeedAck);
 		break;
 
 	case CTSDUR_BA:    /* CTSDuration_ba */
 		uDurTime = p_device->uSIFS + s_uGetTxRsvTime(p_device, by_pkt_type,
-							    cbFrameLength, wRate, bNeedAck);
+							    cb_frame_length, wRate, bNeedAck);
 		break;
 
 	case RTSDUR_BA_F0: /* RTSDuration_ba_f0 */
@@ -359,11 +359,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *p_device,
 					     p_device->byTopCCKBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
@@ -373,11 +373,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *p_device,
 					     p_device->byTopOFDMBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
@@ -387,11 +387,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *p_device,
 					     p_device->byTopCCKBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
@@ -401,11 +401,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *p_device,
 					     p_device->byTopOFDMBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
@@ -413,11 +413,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *p_device,
 	case CTSDUR_BA_F0: /* CTSDuration_ba_f0 */
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
@@ -425,11 +425,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *p_device,
 	case CTSDUR_BA_F1: /* CTSDuration_ba_f1 */
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = p_device->uSIFS +
-				s_uGetTxRsvTime(p_device, by_pkt_type, cbFrameLength,
+				s_uGetTxRsvTime(p_device, by_pkt_type, cb_frame_length,
 						w_fb_opt_1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
@@ -444,7 +444,7 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *p_device,
 static __le16 s_uFillDataHead(struct vnt_private *p_device,
 			      unsigned char by_pkt_type,
 			      void *pTxDataHead,
-			      unsigned int cbFrameLength,
+			      unsigned int cb_frame_length,
 			      unsigned int uDMAIdx,
 			      bool bNeedAck,
 			      unsigned int uFragIdx,
@@ -466,10 +466,10 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 		if (byFBOption == AUTO_FB_NONE) {
 			struct vnt_tx_datahead_g *buf = pTxDataHead;
 			/* Get SignalField, ServiceField & Length */
-			vnt_get_phy_field(p_device, cbFrameLength, wCurrentRate,
+			vnt_get_phy_field(p_device, cb_frame_length, wCurrentRate,
 					  by_pkt_type, &buf->a);
 
-			vnt_get_phy_field(p_device, cbFrameLength,
+			vnt_get_phy_field(p_device, cb_frame_length,
 					  p_device->byTopCCKBasicRate,
 					  PK_TYPE_11B, &buf->b);
 
@@ -482,7 +482,7 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 				/* Get Duration and TimeStamp */
 				buf->duration_a =
 					cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_A,
-									    cbFrameLength,
+									    cb_frame_length,
 									    by_pkt_type,
 									    wCurrentRate, bNeedAck,
 									    uFragIdx,
@@ -491,7 +491,7 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 									    byFBOption));
 				buf->duration_b =
 					cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_B,
-									    cbFrameLength,
+									    cb_frame_length,
 									    PK_TYPE_11B,
 									    p_device->byTopCCKBasicRate,
 									    bNeedAck, uFragIdx,
@@ -508,32 +508,34 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 		}
 
 		/* Get SignalField, ServiceField & Length */
-		vnt_get_phy_field(p_device, cbFrameLength, wCurrentRate,
+		vnt_get_phy_field(p_device, cb_frame_length, wCurrentRate,
 				  by_pkt_type, &buf->a);
 
-		vnt_get_phy_field(p_device, cbFrameLength,
+		vnt_get_phy_field(p_device, cb_frame_length,
 				  p_device->byTopCCKBasicRate,
 				  PK_TYPE_11B, &buf->b);
 		/* Get Duration and TimeStamp */
 		buf->duration_a = cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_A,
-								      cbFrameLength, by_pkt_type,
+								      cb_frame_length, by_pkt_type,
 								      wCurrentRate, bNeedAck,
 								      uFragIdx, cbLastFragmentSize,
 								      uMACfragNum, byFBOption));
 		buf->duration_b = cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_B,
-								      cbFrameLength, PK_TYPE_11B,
+								      cb_frame_length, PK_TYPE_11B,
 								      p_device->byTopCCKBasicRate,
 								      bNeedAck, uFragIdx,
 								      cbLastFragmentSize,
 								      uMACfragNum, byFBOption));
 		buf->duration_a_f0 = cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_A_F0,
-									 cbFrameLength, by_pkt_type,
+									 cb_frame_length,
+									 by_pkt_type,
 									 wCurrentRate, bNeedAck,
 									 uFragIdx,
 									 cbLastFragmentSize,
 									 uMACfragNum, byFBOption));
 		buf->duration_a_f1 = cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_A_F1,
-									 cbFrameLength, by_pkt_type,
+									 cb_frame_length,
+									 by_pkt_type,
 									 wCurrentRate, bNeedAck,
 									 uFragIdx,
 									 cbLastFragmentSize,
@@ -551,25 +553,25 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 			/* Auto Fallback */
 			struct vnt_tx_datahead_a_fb *buf = pTxDataHead;
 			/* Get SignalField, ServiceField & Length */
-			vnt_get_phy_field(p_device, cbFrameLength, wCurrentRate,
+			vnt_get_phy_field(p_device, cb_frame_length, wCurrentRate,
 					  by_pkt_type, &buf->a);
 
 			/* Get Duration and TimeStampOff */
 			buf->duration =
 				cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_A,
-								    cbFrameLength, by_pkt_type,
+								    cb_frame_length, by_pkt_type,
 								    wCurrentRate, bNeedAck,
 								    uFragIdx, cbLastFragmentSize,
 								    uMACfragNum, byFBOption));
 			buf->duration_f0 =
 				cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_A_F0,
-								    cbFrameLength, by_pkt_type,
+								    cb_frame_length, by_pkt_type,
 								    wCurrentRate, bNeedAck,
 								    uFragIdx, cbLastFragmentSize,
 								    uMACfragNum, byFBOption));
 			buf->duration_f1 =
 				cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_A_F1,
-								    cbFrameLength, by_pkt_type,
+								    cb_frame_length, by_pkt_type,
 								    wCurrentRate, bNeedAck,
 								    uFragIdx, cbLastFragmentSize,
 								    uMACfragNum, byFBOption));
@@ -578,7 +580,7 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 		}
 
 		/* Get SignalField, ServiceField & Length */
-		vnt_get_phy_field(p_device, cbFrameLength, wCurrentRate,
+		vnt_get_phy_field(p_device, cb_frame_length, wCurrentRate,
 				  by_pkt_type, &buf->ab);
 
 		if (is_pspoll) {
@@ -589,7 +591,7 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 			/* Get Duration and TimeStampOff */
 			buf->duration =
 				cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_A,
-								    cbFrameLength, by_pkt_type,
+								    cb_frame_length, by_pkt_type,
 								    wCurrentRate, bNeedAck,
 								    uFragIdx, cbLastFragmentSize,
 								    uMACfragNum, byFBOption));
@@ -600,7 +602,7 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 	}
 
 	/* Get SignalField, ServiceField & Length */
-	vnt_get_phy_field(p_device, cbFrameLength, wCurrentRate,
+	vnt_get_phy_field(p_device, cb_frame_length, wCurrentRate,
 			  by_pkt_type, &buf->ab);
 
 	if (is_pspoll) {
@@ -610,7 +612,7 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 	} else {
 		/* Get Duration and TimeStampOff */
 		buf->duration =
-			cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_B, cbFrameLength,
+			cpu_to_le16((u16)s_uGetDataDuration(p_device, DATADUR_B, cb_frame_length,
 							    by_pkt_type, wCurrentRate, bNeedAck,
 							    uFragIdx, cbLastFragmentSize,
 							    uMACfragNum, byFBOption));
@@ -623,7 +625,7 @@ static __le16 s_uFillDataHead(struct vnt_private *p_device,
 static void s_v_fill_rts_head(struct vnt_private *p_device,
 			      unsigned char by_pkt_type,
 			      void *pv_rts,
-			      unsigned int cbFrameLength,
+			      unsigned int cb_frame_length,
 			      bool bNeedAck,
 			      bool bDisCRC,
 			      struct ieee80211_hdr *hdr,
@@ -660,17 +662,17 @@ static void s_v_fill_rts_head(struct vnt_private *p_device,
 			/* Get Duration */
 			buf->duration_bb =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_BB,
-						     cbFrameLength, PK_TYPE_11B,
+						     cb_frame_length, PK_TYPE_11B,
 						     p_device->byTopCCKBasicRate,
 						     bNeedAck, byFBOption);
 			buf->duration_aa =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_AA,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->duration_ba =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_BA,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 
@@ -695,37 +697,37 @@ static void s_v_fill_rts_head(struct vnt_private *p_device,
 			/* Get Duration */
 			buf->duration_bb =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_BB,
-						     cbFrameLength, PK_TYPE_11B,
+						     cb_frame_length, PK_TYPE_11B,
 						     p_device->byTopCCKBasicRate,
 						     bNeedAck, byFBOption);
 			buf->duration_aa =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_AA,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->duration_ba =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_BA,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->rts_duration_ba_f0 =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_BA_F0,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->rts_duration_aa_f0 =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_AA_F0,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->rts_duration_ba_f1 =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_BA_F1,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->rts_duration_aa_f1 =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_AA_F1,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->data.duration = buf->duration_aa;
@@ -747,7 +749,7 @@ static void s_v_fill_rts_head(struct vnt_private *p_device,
 			/* Get Duration */
 			buf->duration =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_AA,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->data.duration = buf->duration;
@@ -767,17 +769,17 @@ static void s_v_fill_rts_head(struct vnt_private *p_device,
 			/* Get Duration */
 			buf->duration =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_AA,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->rts_duration_f0 =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_AA_F0,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->rts_duration_f1 =
 				s_uGetRTSCTSDuration(p_device, RTSDUR_AA_F1,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 			buf->data.duration = buf->duration;
@@ -797,7 +799,7 @@ static void s_v_fill_rts_head(struct vnt_private *p_device,
 				  PK_TYPE_11B, &buf->ab);
 		/* Get Duration */
 		buf->duration =
-			s_uGetRTSCTSDuration(p_device, RTSDUR_BB, cbFrameLength,
+			s_uGetRTSCTSDuration(p_device, RTSDUR_BB, cb_frame_length,
 					     by_pkt_type, wCurrentRate, bNeedAck,
 					     byFBOption);
 
@@ -815,7 +817,7 @@ static void s_vFillCTSHead(struct vnt_private *p_device,
 			   unsigned int uDMAIdx,
 			   unsigned char by_pkt_type,
 			   void *pvCTS,
-			   unsigned int cbFrameLength,
+			   unsigned int cb_frame_length,
 			   bool bNeedAck,
 			   bool bDisCRC,
 			   unsigned short wCurrentRate,
@@ -846,21 +848,21 @@ static void s_vFillCTSHead(struct vnt_private *p_device,
 
 			buf->duration_ba =
 				s_uGetRTSCTSDuration(p_device, CTSDUR_BA,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 
 			/* Get CTSDuration_ba_f0 */
 			buf->cts_duration_ba_f0 =
 				s_uGetRTSCTSDuration(p_device, CTSDUR_BA_F0,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 
 			/* Get CTSDuration_ba_f1 */
 			buf->cts_duration_ba_f1 =
 				s_uGetRTSCTSDuration(p_device, CTSDUR_BA_F1,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 
@@ -889,7 +891,7 @@ static void s_vFillCTSHead(struct vnt_private *p_device,
 			/* Get CTSDuration_ba */
 			buf->duration_ba =
 				s_uGetRTSCTSDuration(p_device, CTSDUR_BA,
-						     cbFrameLength, by_pkt_type,
+						     cb_frame_length, by_pkt_type,
 						     wCurrentRate, bNeedAck,
 						     byFBOption);
 
-- 
2.34.1

