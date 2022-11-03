Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACBEA31;
	Thu,  3 Nov 2022 07:34:25 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id u11so1172293ljk.6;
        Thu, 03 Nov 2022 00:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pMsnIlxrHTKewrvqBfBaUbdtqXq0+QudSb0ilV7J70s=;
        b=bfZVqfzJt7+3WWzrupgOYiKBx40xWHs44FUt8HY2NmDM2HhsLR/0dTfMXqKl3Re2xY
         zsogZiJLnkI1IlzQv8w7U37A5sfFm0IOGtvVYj3UN0KeBQTNNlFrG208zVAhQJSrVZiM
         Pepdp31ZsliXEtIwe9iqMfgsp1JIrNhdkvvCHeghh8Wupizmy5Ku+MkRMSF+beyTSOKR
         SyFdtExrXPXWKQ2vgBicCeLVRCdRK8TI/2lCERxYpC0aNSMffgtrXyZR6fJNfyX/at/5
         Xx2PHrm37lxRBSCwesLs7vxjF1kWGtYkV0jBV5lXF9G8ntLDrwkxmxGMC0SZp8LCHFx6
         qOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMsnIlxrHTKewrvqBfBaUbdtqXq0+QudSb0ilV7J70s=;
        b=lGroaHxyMh44NN+KMFuNS8TFzApajgd/ChNI9qqdvn7fgDr+G66VIeYRXPx0vWMEiV
         V5q+Q+klupOQ65stBfVHTYJPaCFOwsF7sil1dSpRdNcibZPohV+bNhEJUOX38wke8ANi
         iq77JOxTRSIW0tWxcTKiArxu/oi2iccMuqTvYUTMjjE4dU66yDgltl4fPQTPPj46c6Cf
         V+jNC3GaFSQ6v9DoBF+XiGwHAgCrwPZjG2MFQbf6m8aY/98Fh69YOZHIJc/NC9jc2dbq
         LcX3p3+yCzObaYWnY10Ccg5aVE/+AxtiBL2yiGppW5+4MK57Ied8ugmOLlnRmc9ULMwC
         yYlQ==
X-Gm-Message-State: ACrzQf1Kg4vjVBQXDRLPQViycJvDtrqhTHKT0cEk9yyDuTIjRbvaXMdR
	796YtekrwWpYv0pHdkvn+R6ZAxX8cH+T3Q==
X-Google-Smtp-Source: AMsMyM4B0h4DQNwfUHDjjpouwvK5DcbIX7Sy6m7FV8teN3E4pboyUXPLXAoSDx5mH9uXE4fEQCGARg==
X-Received: by 2002:a2e:bea9:0:b0:26f:df23:b04f with SMTP id a41-20020a2ebea9000000b0026fdf23b04fmr11012772ljr.395.1667460863311;
        Thu, 03 Nov 2022 00:34:23 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id bi10-20020a0565120e8a00b004aa95889063sm27213lfb.43.2022.11.03.00.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:34:22 -0700 (PDT)
Date: Thu, 3 Nov 2022 07:34:22 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v3] staging: vt6655: change 2 variable names wFB_Opt0 and
 wFB_Opt1
Message-ID: <Y2Nu/i957Ill7r+d@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These variables are named using Hungarian notation, which is not used
in the Linux kernel.

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---

v3: added a detailed change log to this patch

v2: corrected errors on the subject line of this patch

 drivers/staging/vt6655/rxtx.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 9bdcf2337235..31ae99b3cb35 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -59,12 +59,12 @@ static const unsigned short time_stamp_off[2][MAX_RATE] = {
 	{384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
 };
 
-static const unsigned short wFB_Opt0[2][5] = {
+static const unsigned short fb_opt0[2][5] = {
 	{RATE_12M, RATE_18M, RATE_24M, RATE_36M, RATE_48M}, /* fallback_rate0 */
 	{RATE_12M, RATE_12M, RATE_18M, RATE_24M, RATE_36M}, /* fallback_rate1 */
 };
 
-static const unsigned short wFB_Opt1[2][5] = {
+static const unsigned short fb_opt1[2][5] = {
 	{RATE_12M, RATE_18M, RATE_24M, RATE_24M, RATE_36M}, /* fallback_rate0 */
 	{RATE_6M,  RATE_6M,  RATE_12M, RATE_12M, RATE_18M}, /* fallback_rate1 */
 };
@@ -298,9 +298,9 @@ s_uGetDataDuration(
 			wRate -= RATE_18M;
 
 			if (byFBOption == AUTO_FB_0)
-				wRate = wFB_Opt0[FB_RATE0][wRate];
+				wRate = fb_opt0[FB_RATE0][wRate];
 			else
-				wRate = wFB_Opt1[FB_RATE0][wRate];
+				wRate = fb_opt1[FB_RATE0][wRate];
 
 			uNextPktTime = s_uGetTxRsvTime(pDevice, byPktType,
 						       len, wRate, bNeedAck);
@@ -353,52 +353,52 @@ s_uGetRTSCTSDuration(
 	case RTSDUR_BA_F0: /* RTSDuration_ba_f0 */
 		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case RTSDUR_AA_F0: /* RTSDuration_aa_f0 */
 		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopOFDMBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case RTSDUR_BA_F1: /* RTSDuration_ba_f1 */
 		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case RTSDUR_AA_F1: /* RTSDuration_aa_f1 */
 		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopOFDMBasicRate);
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case CTSDUR_BA_F0: /* CTSDuration_ba_f0 */
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
+			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
 
 		break;
 
 	case CTSDUR_BA_F1: /* CTSDuration_ba_f1 */
 		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
 		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
-			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
+			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
 
 		break;
 
-- 
2.34.1

