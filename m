Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A17C;
	Sat, 22 Oct 2022 07:07:06 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id c22so6482804lja.6;
        Sat, 22 Oct 2022 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUcnHka9cEFND38RVcaT3dPsvb6aA2f6d8+vfWmfqXo=;
        b=ltQ4tV1cKnxgxRDwEakd+9ToQ47KwJKvwUIvDyKglIEh5FMCyoQrtGhZu9pSOYFmn5
         4mDiNJ898IM5qdonqBdZWoDqV5oZdqZ0z6aXo52rUPl3v4O7fKZuQZrv972Qqkm5Wr2L
         6WVXvC631Paq330rDpSDL5JWUxtQ4MpiAbGq7i2VQXD/jtqgTgw/dhaYj2HKLnuhNrlC
         ClQnNePbquhT0jdIGKzZqUDf+UvIN0xYVlASno/q8ghcR7PVPVGBnnulecbkUAkbr+gu
         HFqWg0AvuOsbM/6afI5L4TFMZSIRzfAAWW3PUqhbRskpW8N8I0wFLXFiysNyfQQWX2G6
         ORCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUcnHka9cEFND38RVcaT3dPsvb6aA2f6d8+vfWmfqXo=;
        b=Zzgj7xlcCxeEwTqDvDDn2q4MrzmwPt+aMeeh6nJlSKEzGRVi3K27l5il7Bs6IG+gqM
         UNFjfhYhZLRTSV2wjPNPovA+xDIhnwJNYxjF2QYLawrB/dr2dImhgxOfVN65gyY33BlL
         PFFOd6/yp184DVMrYXYQCC66UKlmmPhYjZbXrE4NirtJUtvuWinMocCYbu/+Wh5vPng5
         1RsK1hx442BaJhroljhbC6XQRASO+/caSqntE2KACw/fWQp0Ole++ZVdE2qh7DGVdcYm
         V7s3ceryoaN2mO9McwKASwiAmLrWUy62u94oj9d7j5MuobePpMbXcAv/4vETMdzwCHyQ
         5w7g==
X-Gm-Message-State: ACrzQf0/e+FdpayjlM2wrEk3muFx5FPoNHX6L0yqPJDF7LyeB/2kywAI
	JF546UuvspaYYBGwob7n38M=
X-Google-Smtp-Source: AMsMyM6YT+LLOd/QxWeE+yhboA7lVbJHLbo9730Pl1cEzdFR6SZiOcNzh4axsVmkL47lKPh1GcMy4w==
X-Received: by 2002:a05:651c:54e:b0:26f:df91:ba27 with SMTP id q14-20020a05651c054e00b0026fdf91ba27mr7776490ljp.414.1666422424252;
        Sat, 22 Oct 2022 00:07:04 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s5-20020a2e1505000000b00276d2537921sm390404ljd.59.2022.10.22.00.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 00:07:03 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v3 4/6] staging: vt6655: refactor long lines of code in s_vGenerateTxParameter
Date: Sat, 22 Oct 2022 07:06:10 +0000
Message-Id: <20221022070612.13009-5-tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix checkpatch errors by refactoring long lines of code in the function: s_vGenerateTxParameter

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 67 ++++++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index dc853b83459b..951d4172e9f2 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -839,7 +839,8 @@ s_vFillCTSHead(struct vnt_private *pDevice,
 	}
 
 	if (byPktType == PK_TYPE_11GB || byPktType == PK_TYPE_11GA) {
-		if (byFBOption != AUTO_FB_NONE && uDMAIdx != TYPE_ATIMDMA && uDMAIdx != TYPE_BEACONDMA) {
+		if (byFBOption != AUTO_FB_NONE && uDMAIdx !=
+		    TYPE_ATIMDMA && uDMAIdx != TYPE_BEACONDMA) {
 			/* Auto Fall back */
 			struct vnt_cts_fb *buf = pvCTS;
 			/* Get SignalField, ServiceField & Length */
@@ -878,7 +879,10 @@ s_vFillCTSHead(struct vnt_private *pDevice,
 
 			ether_addr_copy(buf->data.ra,
 					pDevice->abyCurrentNetAddr);
-		} else { /* if (byFBOption != AUTO_FB_NONE && uDMAIdx != TYPE_ATIMDMA && uDMAIdx != TYPE_BEACONDMA) */
+		} else {
+			/* if (byFBOption != AUTO_FB_NONE && uDMAIdx != TYPE_ATIMDMA &&
+			 * uDMAIdx != TYPE_BEACONDMA)
+			 */
 			struct vnt_cts *buf = pvCTS;
 			/* Get SignalField, ServiceField & Length */
 			vnt_get_phy_field(pDevice, uCTSFrameLen,
@@ -964,50 +968,71 @@ static void s_vGenerateTxParameter(struct vnt_private *pDevice,
 			/* Fill RsvTime */
 			struct vnt_rrv_time_rts *buf = pvRrvTime;
 
-			buf->rts_rrv_time_aa = get_rtscts_time(pDevice, 2, byPktType, cbFrameSize, wCurrentRate);
-			buf->rts_rrv_time_ba = get_rtscts_time(pDevice, 1, byPktType, cbFrameSize, wCurrentRate);
-			buf->rts_rrv_time_bb = get_rtscts_time(pDevice, 0, byPktType, cbFrameSize, wCurrentRate);
-			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
-			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
-
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			buf->rts_rrv_time_aa = get_rtscts_time(pDevice, 2, byPktType, cbFrameSize,
+							       wCurrentRate);
+			buf->rts_rrv_time_ba = get_rtscts_time(pDevice, 1, byPktType, cbFrameSize,
+							       wCurrentRate);
+			buf->rts_rrv_time_bb = get_rtscts_time(pDevice, 0, byPktType, cbFrameSize,
+							       wCurrentRate);
+			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize,
+								wCurrentRate, bNeedACK);
+			buf->rrv_time_b =
+				vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize,
+						      pDevice->byTopCCKBasicRate, bNeedACK);
+
+			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC,
+				       psEthHeader, wCurrentRate, byFBOption);
 		} else {/* RTS_needless, PCF mode */
 			struct vnt_rrv_time_cts *buf = pvRrvTime;
 
-			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
-			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
-			buf->cts_rrv_time_ba = get_rtscts_time(pDevice, 3, byPktType, cbFrameSize, wCurrentRate);
+			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize,
+								wCurrentRate, bNeedACK);
+			buf->rrv_time_b =
+				vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize,
+						      pDevice->byTopCCKBasicRate, bNeedACK);
+			buf->cts_rrv_time_ba = get_rtscts_time(pDevice, 3, byPktType, cbFrameSize,
+							       wCurrentRate);
 
 			/* Fill CTS */
-			s_vFillCTSHead(pDevice, uDMAIdx, byPktType, pvCTS, cbFrameSize, bNeedACK, bDisCRC, wCurrentRate, byFBOption);
+			s_vFillCTSHead(pDevice, uDMAIdx, byPktType, pvCTS, cbFrameSize, bNeedACK,
+				       bDisCRC, wCurrentRate, byFBOption);
 		}
 	} else if (byPktType == PK_TYPE_11A) {
 		if (pvRTS) {/* RTS_need, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
-			buf->rts_rrv_time = get_rtscts_time(pDevice, 2, byPktType, cbFrameSize, wCurrentRate);
-			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
+			buf->rts_rrv_time = get_rtscts_time(pDevice, 2, byPktType, cbFrameSize,
+							    wCurrentRate);
+			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize,
+							      wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC,
+				       psEthHeader, wCurrentRate, byFBOption);
 		} else if (!pvRTS) {/* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
-			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11A, cbFrameSize, wCurrentRate, bNeedACK);
+			buf->rrv_time =
+				vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11A, cbFrameSize,
+						      wCurrentRate, bNeedACK);
 		}
 	} else if (byPktType == PK_TYPE_11B) {
 		if (pvRTS) {/* RTS_need, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
-			buf->rts_rrv_time = get_rtscts_time(pDevice, 0, byPktType, cbFrameSize, wCurrentRate);
-			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
+			buf->rts_rrv_time = get_rtscts_time(pDevice, 0, byPktType, cbFrameSize,
+							    wCurrentRate);
+			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize,
+							      wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC,
+				       psEthHeader, wCurrentRate, byFBOption);
 		} else { /* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
-			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
+			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize,
+							      wCurrentRate, bNeedACK);
 		}
 	}
 }
-- 
2.34.1

