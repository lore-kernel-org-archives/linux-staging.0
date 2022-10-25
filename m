Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34327B;
	Tue, 25 Oct 2022 23:37:43 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id r14so25375038lfm.2;
        Tue, 25 Oct 2022 16:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXPNjur9hX3brkcnEBIrqKBooU3Q3eUrz/4SzAXBpVA=;
        b=jzl5YR81A7lYG73Lf+1XMTb9CoEJEJPlwnkeCDFtkp+RHRHEdxQPxse1+hFdP8aiBg
         XzzMFi7VIzEJE6Xlc7+0pfm6HjDJkCW8qWW/cSrVWUrEyFdrFjpJxnqAOW/jmL931n38
         jBpRezQxT80yh9/PQhFaxjJrkp1HIcwV2dvrqDHGSS/2mkCz05I/yKszlAxJkYNSQdCv
         kABXCygbrACSUxeIyKlhhfrdc+sxqiNzrCgsJAOT4uhfMM/kt6/WgCm4Bed8HmSNVibG
         UnlfhUSmv4rAo+BF83Kk6YlyQ0AZjjtC5smmxBiLxmFIkpLLBv724IKBCrTHOWkFRssQ
         8W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXPNjur9hX3brkcnEBIrqKBooU3Q3eUrz/4SzAXBpVA=;
        b=qIRl2JU9KLyJQ4cQJmue6PV0dGWEEIKZYH6B+uoyouJwfAF9U7BU+jmLSCXXl+wj6c
         NyC/ZIpzIYbL0o+SCe+Z7XG7PgzXPGYUMbPgAVCR78UR4rDHXvurtMMIzHRC39CA9jXa
         qRVnO2hE/ZCesTOQeQNV0nLyhH8nvypJeIVEhqcobBK1RR2QBklLY5g2OPnCJQvkNBOo
         SeyLZ4aNbyOXm+dzuilZmVczMSLbFcCBr2mAc6cjOibNvhop7wvoy2NpAs8HcaQWuwuJ
         hniehk5QSTKCruT1KFcUCsXTeo7MLuo4CPfspNQE04Dsc+EBTV3yBCjGHFas2BDlwC7m
         3acQ==
X-Gm-Message-State: ACrzQf0lD404FVTqiaLOFSogYzf+/y6VJ28hBZ8pCUTNtmdZz9KELim1
	kC+Ga2PJU/bAuUgAo1C5L1A=
X-Google-Smtp-Source: AMsMyM7Pe031fV6dLsDcFE0Y71MlktJu3nQOGADKKYnctZQOfUBTA4Qf79fVkJ1h1EUx8GGiTuV08w==
X-Received: by 2002:a05:6512:34d4:b0:4a4:20da:7538 with SMTP id w20-20020a05651234d400b004a420da7538mr16228447lfr.371.1666741061836;
        Tue, 25 Oct 2022 16:37:41 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:37:41 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 01/17] staging: vt6655: changed variable names: wFB_Opt0
Date: Tue, 25 Oct 2022 23:36:57 +0000
Message-Id: <62f69eddc9641ac9eb045edf8a9453bf36a02b36.1666740522.git.tanjubrunostar0@gmail.com>
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

change variable names wFB_Opt0 and wFB_Opt1 to meet the
linux coding standard, as it says to avoid using camelCase naming style.
Cought by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index d585435520b3..ac9b3402be4f 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -59,12 +59,12 @@ static const unsigned short wTimeStampOff[2][MAX_RATE] = {
 	{384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
 };
 
-static const unsigned short wFB_Opt0[2][5] = {
+static const unsigned short w_fb_opt_0[2][5] = {
 	{RATE_12M, RATE_18M, RATE_24M, RATE_36M, RATE_48M}, /* fallback_rate0 */
 	{RATE_12M, RATE_12M, RATE_18M, RATE_24M, RATE_36M}, /* fallback_rate1 */
 };
 
-static const unsigned short wFB_Opt1[2][5] = {
+static const unsigned short w_fb_opt_1[2][5] = {
 	{RATE_12M, RATE_18M, RATE_24M, RATE_24M, RATE_36M}, /* fallback_rate0 */
 	{RATE_6M,  RATE_6M,  RATE_12M, RATE_12M, RATE_18M}, /* fallback_rate1 */
 };
@@ -299,9 +299,9 @@ static unsigned int s_uGetDataDuration(struct vnt_private *pDevice,
 			wRate -= RATE_18M;
 
 			if (byFBOption == AUTO_FB_0)
-				wRate = wFB_Opt0[FB_RATE0][wRate];
+				wRate = w_fb_opt_0[FB_RATE0][wRate];
 			else
-				wRate = wFB_Opt1[FB_RATE0][wRate];
+				wRate = w_fb_opt_1[FB_RATE0][wRate];
 
 			uNextPktTime = s_uGetTxRsvTime(pDevice, byPktType,
 						       len, wRate, bNeedAck);
@@ -360,11 +360,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
 
@@ -374,11 +374,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
 
@@ -388,11 +388,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
 
@@ -402,11 +402,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = uCTSTime + 2 * pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
 
@@ -414,11 +414,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
 
@@ -426,11 +426,11 @@ static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
 			uDurTime = pDevice->uSIFS +
 				s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength,
-						wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
+						w_fb_opt_1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
 
-- 
2.34.1

