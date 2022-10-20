Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B0A5CA3;
	Thu, 20 Oct 2022 18:29:40 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id j14so440575ljh.12;
        Thu, 20 Oct 2022 11:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pok2LECBNlMvrqXKyrI6aFwHhW7o05S9x0G8ryNfPC0=;
        b=l8ymFiKj1kP/UjFBIEdasfBzNKRaUp4nsQr0RD6CqBJ3fY8i7gGAXZ1Wp8fh3LpCIs
         iijlSxtUdCfGqWetE6GfI19+/T98NOMgEllD+0Kmv9d3EKlWS5N1AOPP0gmGI5AI3Vwz
         wOJ7QYbLX10xtl5bI3NyCcWyaGkPS72nfms+5sVwm2dt8eEJghHWzM54cuiIfX96ENsz
         7rcG2OEOgaaOE6utAb/qiD5eTZhtb0oQCIpv9zySvp+QNqzYPd1dKPbUoY+qo8JuKe+L
         rpOO8RC+4IVTsGPdjZTPbiWO+XEahSP5qPKH4xOUabNE255ou5HwmRNfY7GjprL4+cQG
         AEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pok2LECBNlMvrqXKyrI6aFwHhW7o05S9x0G8ryNfPC0=;
        b=3OS90hCG+1G9XZTAQOcVTsfK5CvI+Bfw4Cy4bZ0XuttS2svBojIXVeRN7HQCvqKy+v
         D2gDcCBtLs/rDwSA2+VQP7lxYMddJOxntihHz+QoM8XQxAiYj1A1rIObKOfW8dY6iUuk
         ljYNxtom2DIawP7Ydxw6Pf/YRovLz0EDzmGVoBLT1XZKX9vdp+VZY8aFXDfP1rXq6X35
         aPnX0H4gTSx/QDK3M9KIlT8jZB+t+BnI9jPhvf1/5Rwv6w61SzVOtR9itwFLYtuXavM2
         YdNP6lC6nghyU2EYSa25WE+4cfig+N8lUuwbrp0+ipxTrt2Yztuq4hqip60+qxm55dNx
         MVYA==
X-Gm-Message-State: ACrzQf1oUDmBBDuxfALyjGhn2VTBN+AW045X1Ipi+TEAPpM4syrqUcR4
	EtKxQpTibwYicXvhZKF/Piw=
X-Google-Smtp-Source: AMsMyM6j+quBbDwCyDVxQA3IeiyLmZ4JM4w+W5iObRCO1d4S23KJXTo+64fk2KDE5WOb14UqB5Y5Nw==
X-Received: by 2002:a05:651c:222a:b0:26f:dc76:a5ee with SMTP id y42-20020a05651c222a00b0026fdc76a5eemr5767436ljq.242.1666290578508;
        Thu, 20 Oct 2022 11:29:38 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id h10-20020a0565123c8a00b00497a3e11608sm2797216lfv.303.2022.10.20.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 11:29:38 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: forest@alittletooquiet.net
Cc: greg@kroah.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 2/6] staging: vt6655: refactor long lines of code in s_uGetRTSCTSDuration
Date: Thu, 20 Oct 2022 18:27:42 +0000
Message-Id: <f9a298752ebb5bd9ca7f413432bf7f288933070a.1666288416.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666288416.git.tanjubrunostar0@gmail.com>
References: <cover.1666288416.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix checkpatch errors by refactoring long lines of code in the function: s_uGetRTSCTSDuration

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 108 ++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index f9d0b00d7cff..01e72999831b 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -188,20 +188,29 @@ static __le16 get_rtscts_time(struct vnt_private *priv,
 
 	data_time = bb_get_frame_time(priv->preamble_type, pkt_type, frame_length, current_rate);
 	if (rts_rsvtype == 0) { /* RTSTxRrvTime_bb */
-		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20, priv->byTopCCKBasicRate);
-		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopCCKBasicRate);
+		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20,
+					     priv->byTopCCKBasicRate);
+		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+					     priv->byTopCCKBasicRate);
 		cts_time = ack_time;
 	} else if (rts_rsvtype == 1) { /* RTSTxRrvTime_ba, only in 2.4GHZ */
-		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20, priv->byTopCCKBasicRate);
-		cts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopCCKBasicRate);
-		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopOFDMBasicRate);
+		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20,
+					     priv->byTopCCKBasicRate);
+		cts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+					     priv->byTopCCKBasicRate);
+		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+					     priv->byTopOFDMBasicRate);
 	} else if (rts_rsvtype == 2) { /* RTSTxRrvTime_aa */
-		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20, priv->byTopOFDMBasicRate);
-		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopOFDMBasicRate);
+		rts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 20,
+					     priv->byTopOFDMBasicRate);
+		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+					     priv->byTopOFDMBasicRate);
 		cts_time = ack_time;
 	} else if (rts_rsvtype == 3) { /* CTSTxRrvTime_ba, only in 2.4GHZ */
-		cts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopCCKBasicRate);
-		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14, priv->byTopOFDMBasicRate);
+		cts_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+					     priv->byTopCCKBasicRate);
+		ack_time = bb_get_frame_time(priv->preamble_type, pkt_type, 14,
+					     priv->byTopOFDMBasicRate);
 		rrv_time = cts_time + ack_time + data_time + 2 * priv->uSIFS;
 		return cpu_to_le16((u16)rrv_time);
 	}
@@ -323,73 +332,108 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
 
 	switch (byDurType) {
 	case RTSDUR_BB:    /* RTSDuration_bb */
-		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
-		uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wRate, bNeedAck);
+		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
+					     pDevice->byTopCCKBasicRate);
+		uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+			s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wRate, bNeedAck);
 		break;
 
 	case RTSDUR_BA:    /* RTSDuration_ba */
-		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
-		uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wRate, bNeedAck);
+		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
+					     pDevice->byTopCCKBasicRate);
+		uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+			s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wRate, bNeedAck);
 		break;
 
 	case RTSDUR_AA:    /* RTSDuration_aa */
-		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopOFDMBasicRate);
-		uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wRate, bNeedAck);
+		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
+					     pDevice->byTopOFDMBasicRate);
+		uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+			s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wRate, bNeedAck);
 		break;
 
 	case CTSDUR_BA:    /* CTSDuration_ba */
-		uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wRate, bNeedAck);
+		uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType,
+							    cbFrameLength, wRate, bNeedAck);
 		break;
 
 	case RTSDUR_BA_F0: /* RTSDuration_ba_f0 */
-		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
+		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
+					     pDevice->byTopCCKBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case RTSDUR_AA_F0: /* RTSDuration_aa_f0 */
-		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopOFDMBasicRate);
+		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
+					     pDevice->byTopOFDMBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case RTSDUR_BA_F1: /* RTSDuration_ba_f1 */
-		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
+		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
+					     pDevice->byTopCCKBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case RTSDUR_AA_F1: /* RTSDuration_aa_f1 */
-		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopOFDMBasicRate);
+		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
+					     pDevice->byTopOFDMBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case CTSDUR_BA_F0: /* CTSDuration_ba_f0 */
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case CTSDUR_BA_F1: /* CTSDuration_ba_f1 */
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = pDevice->uSIFS +
+				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
+						wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
 
-- 
2.34.1

