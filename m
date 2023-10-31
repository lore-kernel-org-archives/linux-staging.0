Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65BDD507
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLesaeqD"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc0e78ec92so32328845ad.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730495; x=1699335295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G104GsQN9SGsp6hJmguf5vfKPskMi7nlpROtr8cSfdI=;
        b=VLesaeqDoFnXz1qYYBFuv1kq8BCwRTa3aVXtxsdIf6EcDvvBTy3X9U4LGj3vODfztY
         gIO2qPDIEI/rVvHCqrqIKrulmVpjbFZGoAQwy3Pmxx5zw9/aLj0ega/+ldsFmIUYdxAU
         jFn3YwGUOXcpQpUv2FncG6Xjnfu+epl1mr5XmTCCZZqdFmjP2ETLDfENEfXw4RkxUgRI
         Bg2Ok6OuiLmRq6hgz3T0RGYtq3hABc+QStHTlMpTP9wJUDxyMrveLKP9yD5DtvZSVhS1
         f/auxgpfp7SClFT2Cqfzr+qXsEAkuP6uLkEnNyQ6vFzA6MuW6nJSfWzjni0pNQoD+GM3
         5L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730495; x=1699335295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G104GsQN9SGsp6hJmguf5vfKPskMi7nlpROtr8cSfdI=;
        b=fdJO4b2HNnmtfX88Zpca6w9QVsxiyuiMm42txbLJBf8nBP9HOzCiUDoE+b40dRgBqn
         4Ony+u8MPtOFl7F32tMdAptoDfcui4V1Z5q/lvzLGOZ/yp9g6ou79cDdXpanbfB+aj4Q
         txD/WGrGPTMwOHWwR8Lj3bbupVPDhiiL/LHldAF0eTMvmfgcfP7Rc+qi+oOmDClzxCUs
         ImXAq37uM0/66/5nmK9DOGM2fPakc2ZSI/d9fg0+9yWSbbBWwLalFpTbZ+ulKoXmLmNR
         QVpO30IOH+6KjQnXvvF7AlDV3iHnfQ0ipjnzH+NQcQWnk5rujVDeYZVn61Vw4Uqru1Ny
         GjTQ==
X-Gm-Message-State: AOJu0YwTjTPx4XBpH7TnvhPZB/87JeaHpudPMtZm+1bQrVHisVc6rfut
	8E05Mxl+mmBL3lNtS6e0At4=
X-Google-Smtp-Source: AGHT+IH9/yJcBmPwdhclpwrea7KIAb6q18lJkHULMiD5VW3kVUkEYsUTqaEDl1tidEC9v0Xi0mL48Q==
X-Received: by 2002:a17:902:f213:b0:1c9:da1a:8b14 with SMTP id m19-20020a170902f21300b001c9da1a8b14mr8310243plc.1.1698730495171;
        Mon, 30 Oct 2023 22:34:55 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:54 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 07/11] staging: vt6655: Type encoding info dropped from function name "CARDqGetNextTBTT"
Date: Tue, 31 Oct 2023 11:04:30 +0530
Message-Id: <8e142b33245e6933fb178080b0b14371939a84e6.1698730318.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698730318.git.opensource206@gmail.com>
References: <cover.1698730318.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

function name "CARDqGetNextTBTT" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 10 +++++-----
 drivers/staging/vt6655/card.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index e4b40125b094..716fd3632508 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -12,7 +12,7 @@
  *      CARDbIsOFDMinBasicRate - Check if any OFDM rate is in BasicRateSet
  *      card_get_tsf_offset - Calculate TSFOffset
  *      vt6655_get_current_tsf - Read Current NIC TSF counter
- *      CARDqGetNextTBTT - Calculate Next Beacon TSF counter
+ *      card_get_next_tbtt - Calculate Next Beacon TSF counter
  *      CARDvSetFirstNextTBTT - Set NIC Beacon time
  *      CARDvUpdateNextTBTT - Sync. NIC Beacon time
  *      CARDbRadioPowerOff - Turn Off NIC Radio Power
@@ -327,7 +327,7 @@ bool card_set_beacon_period(struct vnt_private *priv,
 
 	next_tbtt = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
-	next_tbtt = CARDqGetNextTBTT(next_tbtt, beacon_interval);
+	next_tbtt = card_get_next_tbtt(next_tbtt, beacon_interval);
 
 	/* set HW beacon interval */
 	iowrite16(beacon_interval, priv->port_offset + MAC_REG_BI);
@@ -764,7 +764,7 @@ u64 vt6655_get_current_tsf(struct vnt_private *priv)
  *
  * Return Value: TSF value of next Beacon
  */
-u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short beacon_interval)
+u64 card_get_next_tbtt(u64 qwTSF, unsigned short beacon_interval)
 {
 	u32 beacon_int;
 
@@ -799,7 +799,7 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 
 	next_tbtt = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
-	next_tbtt = CARDqGetNextTBTT(next_tbtt, beacon_interval);
+	next_tbtt = card_get_next_tbtt(next_tbtt, beacon_interval);
 	/* Set NextTBTT */
 	next_tbtt =  le64_to_cpu(next_tbtt);
 	iowrite32((u32)next_tbtt, iobase + MAC_REG_NEXTTBTT);
@@ -826,7 +826,7 @@ void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
 {
 	void __iomem *iobase = priv->port_offset;
 
-	qwTSF = CARDqGetNextTBTT(qwTSF, beacon_interval);
+	qwTSF = card_get_next_tbtt(qwTSF, beacon_interval);
 	/* Set NextTBTT */
 	qwTSF =  le64_to_cpu(qwTSF);
 	iowrite32((u32)qwTSF, iobase + MAC_REG_NEXTTBTT);
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index 1758a95f3ab0..ab1193799239 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -47,7 +47,7 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
 			 unsigned short beacon_interval);
 u64 vt6655_get_current_tsf(struct vnt_private *priv);
-u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short beacon_interval);
+u64 card_get_next_tbtt(u64 qwTSF, unsigned short beacon_interval);
 u64 card_get_tsf_offset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2);
 unsigned char card_get_pkt_type(struct vnt_private *priv);
 void CARDvSafeResetTx(struct vnt_private *priv);
-- 
2.34.1

