Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9D25A640
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519763; cv=none; b=toePZkHC7lBditGWV/Va2zO4xlqrEWPtIb01Kk1LX5b+6pFxhpNdixceAxNXq3dnDZ16wmXB2zNU8rCTSErh4wHm64TvwuySydabwyb8zgvZlcS2vCASS9Jbsk+Bvcmvb4q5GbgVGCfFDojimkW7RPd1SjG6N2hQKjf7kQbQZLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519763; c=relaxed/simple;
	bh=nq9AbMXpep0uBQ/oZLXDhSC9ca9neXuSPT4hXndsRFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FdtErLnKWQp/WqKtWwJAb7TAjcLHWV01SokAUHKOoChWxmcOnWYKjhvmqpH5D9Hkg0E9Kd1gwXOTHEJXdfQPsUcARsUhhxNqlyRPFTnq5WgQMWRhqZfFZQNl/IY+AMFuUaG/MU3LPnRtgD41s4wx8mlTRLGiD2L4Leo69Z8Dw9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaVJKEXw; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaVJKEXw"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c739561f0d3so2029871a12.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519761; x=1774124561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PAFVQz9DQI/54SSgtOJp31d5mDFW3mGdAEaM5Prd9io=;
        b=DaVJKEXwbPOX3gPW2ebjaycBwKWNAFdeaHiEvnp3gjY49Hv96R0rDGOM2pwQyZxP0c
         ip27IEirVnxQVWc6jVO5y9qjPrfQLud51GngJvHGtMuVc/UDtHqtEzQrhIBLp+5pjAfs
         PxGVRyqAWzoPrDJ8xiDNrhPQWW2NC3AiAsFT5GaQ0Z+nap/u//e4pfBpsZ1ExBdD3H7e
         EX0moHk9Dmh+lVrT2IJPmeIdhglKizW72UbtAa0+4i3Cu1yCyHgxosQe4NmfEGQo2JmH
         1wixxi6Uca1w4IbohNQQ0roiOaa+7QBpIj44B54HHT5KqhyPFInzQSbMppilT61JDB8g
         TfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519761; x=1774124561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAFVQz9DQI/54SSgtOJp31d5mDFW3mGdAEaM5Prd9io=;
        b=pTvpeBBitPti6G66qgd8E8t6Jj/VB5J6i9LfZnLVkHvHLaLl4WCvUoYUOTYYWLGLQ0
         ml38xGiqey1nRRzlxeoP5t9DT7RM9SLflR5w1ffcVwI59vMSG9Bpk904Qkr9tf0t0h5h
         f/6TgGYpjWzGU2x81fqmxN4RYGuZtOWGKsBnrCasmM6TAabDvSw/22Vi7rE3W9Ln/Kdx
         AK/c0TuOU8zvIHMigJcbJXhsUo58SS+9BMFl9QYBS6kOeAP5cejELQqYMSxR+Cx+LhDe
         IRXjfNRTaxim4tzQ3hVjASq7p+D0BcBQZ+SVVgTi1N3dureve9Uxt5INKdp58myoykRQ
         6kGA==
X-Gm-Message-State: AOJu0YyvUo+x2KFGbIozFy1N91dDwhYB2h3dgj+3tJraNal5E+4hsOJE
	0tTxZPnzYKoDG1b7oibRjYa+H0YFiS6vuKSs5NXAnt3oA4qzcjNSf84w
X-Gm-Gg: ATEYQzxU+pj83B/ger2Vhl/9FD+X3yvg8Z+qFtNLUIoqW9DL4EBtbhlDN/5SxIGj7eK
	SO5qMszUpNMX362T6YMm6ey6z6LL0RfpV9kILMXYpbROQPDsrF2wK+aD5ioCZB1Z7+Q6sfle6Cd
	7sIaULUOuu282zM9q4O+FQzxC1X25Y/PAjSMGSkinHTQtBbdGh+P9akW7iKEmOTZnQt6DrCtYYT
	qPi+GsWwZ+Ko239XKk2NzZmsY0UTiWh/NCOYp7BwjxuQmR/7QZaT2Zz8n4f6cvmX13dM6TYJnYl
	XUCzkHH5hFmnVUGQXjAtk4W8Lp2XgJBk4qe5Id9IncmOqReA6xvj02BW2UVmF7TMweIznJ718MO
	KjFH0uXJGhXm5xUAUklaJWVYgKv/Y5IvuFW3WG+Ko7sAimdqVU/AyrWs2NEzvygTUqjFiRp1J+g
	Z8vhAHKEvJWg+76Pq+VS5IZfSMNGP2J82Kjz3VP/A8XlXtiIyYQKnMBJUszLUhfbVI952/a7Le5
	yRTq30PpdlrL1DAdzM=
X-Received: by 2002:a17:903:3905:b0:2ae:5464:7a4b with SMTP id d9443c01a7336-2aeca9ffe54mr89397745ad.14.1773519761312;
        Sat, 14 Mar 2026 13:22:41 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece83b35fsm65802175ad.80.2026.03.14.13.22.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Mar 2026 13:22:40 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xiongzile99@gmail.com
Subject: [PATCH] staging: rtl8723bs: fix inconsistent indentation in HAL files
Date: Sun, 15 Mar 2026 04:22:33 +0800
Message-ID: <20260314202233.55662-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix inconsistent indentation in HalBtc8723b1Ant.c and
HalPhyRf_8723B.c reported by static analysis.

The indentation of several lines does not match the surrounding
code block and makes the code harder to read. Adjust the spacing
to align with the existing indentation style.

No functional change intended.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c |  2 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c  | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3d7f50fac4c..1af101ba9752 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2316,7 +2316,7 @@ void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
 
 	if (type == BTC_ASSOCIATE_START) {
 		pCoexSta->bWiFiIsHighPriTask = true;
-		 pCoexDm->nArpCnt = 0;
+		pCoexDm->nArpCnt = 0;
 	} else {
 		pCoexSta->bWiFiIsHighPriTask = false;
 		/* pCoexDm->nArpCnt = 0; */
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1048..12aa6df0a143 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1407,8 +1407,8 @@ static void phy_IQCalibrate_8723B(
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
 
-				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+			result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+			result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
 			break;
 		}
 	}
@@ -1417,10 +1417,10 @@ static void phy_IQCalibrate_8723B(
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+/* 			result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/* 			result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+			result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+			result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 			break;
 		}
 	}
-- 
2.20.1

