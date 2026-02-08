Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1053C35E541
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770565698; cv=none; b=hrXSqbggEpDkXJe7dJLT5FrJ1R3wjj1hk7PZPTuLJVA6hxLsyAbp69GbJEJa6COr9ipVHVQQci+wJNywk4pdgxtKqYb+EVPBn2dVxPiQIClobvLnH2JNr6/ChBliRcMM7x4+QXJThx7T6elIY4lRaWg0hGMpMaAIFectrEQDg1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770565698; c=relaxed/simple;
	bh=clGOr1vJl5pvYSZxFU4/aTQ5c1WlxArEaxFDvXvtFTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b9D185YFHdYv4kIB1iCKSTOwIy5mIr4P2O4RxNa2xVuo7LJq9Wj9fREPanC7BzP5VteA8k3l/PY0CBie9UWevgHLzMsIljbPTA0Vcc1H5DcCMXk4TEup+qsSZOeYex+3jpeJEIhjJwF+DIgkSZucxy84d7U65YS/ym6/ppcLVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMrRVkSi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMrRVkSi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so56443115e9.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 07:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770565696; x=1771170496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9aHXyPLdorWVafvKnJpvEZ+EI/JN4bX6VA1z8eW8y8=;
        b=RMrRVkSiK9XI7o2VhGbhxPZRkjYNpwHjShNvGtMg8jGY0zd+bVXHMqSBDcXELJlSji
         O/6TJuGMxHzIZoaAo5DRcFUuASxFV8TiLRNKY3TedCUhoN/b5QE6zUbVjMrL1p8pPcum
         NoHkFPCV9HbglyDThfV/qoKaT5vK9Meb8iuSNBf/PNLcLdvV1J+iG5PFG1a7zW3dmsRW
         UAWgGk3IkGmjBKt2QgesCkNQStJKHJb+5Sz4FqTHZG5Dm/udw9HfpSPlrCPEv+H9OIhj
         AkCPl+0jyadbjkgb4rab+ktpf/lHjjWyKexAuwswE4UCeNEQXeceJZKEXSsly+MjptZl
         Fw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770565696; x=1771170496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9aHXyPLdorWVafvKnJpvEZ+EI/JN4bX6VA1z8eW8y8=;
        b=ubjCgXoE439Qks6tEOkDmccRNlp2MoJIAA4EDBvqk8djkv5xPUukD8HFF/x8KZoHqw
         1VvtkXulfaey84HtBR80RShd7z15hLcthtju/NeG9+y6fPLBpDXBZaA5ppta7eVeLD3I
         rfSHtDGVBzzbvZi2kigOwKWbc9aaN4VkmKixaDZ/4FBvXcqc0M5bHzMQxmThDg19KJeC
         WdePf6onqMfTCG7XUm4R0z+m78U3JvN8Q8KIpJMod9ZUPbXCTS3ET7NIZAH1A6ECy3tI
         f9SFBtayU5f3KZO5biLav77ueuFX5R974c2d20Hup6e1CjlPkE4bVrRS4S49a6kGe+Jh
         93IA==
X-Gm-Message-State: AOJu0YyXLfDrHQLKgtvfIILvzkxgWz+ZLQNRWqltUBjsQVnBht8vzsnT
	+IOVs4HLllKZtTE9X85f3qFzS3X+GhZE2MG5LpUReef/EBhkO8uguhpw
X-Gm-Gg: AZuq6aIuNpgaVZXMlsx5h13ClBFsa8FJJGskUMY8A1GtkYPGhDThFu/kLrAC4nOoaIG
	iH/9CcnB3Bo+i/MYcU3ZGw1+FEP78lbxx1ZJ4XV+rR2hlciVYvEqQR7pQgD/oMyI2X/e5kD03gh
	wPO1AZjQMVXh3Gxc67ctZExTQIv47EqL/Du4WqsurBbSGnAo/DiyyXdc+ssoLqyP93EJVnV+L1s
	824dU1RVoESRwHRgPp5NhgAO/9UW1I66rQAIQr1iYyoVh0RkCuQfkRllQRHtmCuNr0pMYwPnaVS
	1YpAwD1ePPPXCRou2TzrdoIbNFF4uq1TBGbiaXfkq8OZApQxgXPT3nDbEl/ggpvajZB2LdxhGbe
	uGVPBVXTZykIEs1geOCqab4sCBBjch4O/gIk7zCueaOQqGxZTChlQuN3xyiHvv8kGr3Lum7td77
	UhDzQYZYQSQVKkXXej02uigaA=
X-Received: by 2002:a05:600c:64c6:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-483201fffeamr119467975e9.3.1770565696138;
        Sun, 08 Feb 2026 07:48:16 -0800 (PST)
Received: from fedora ([179.43.189.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206d87c7sm167625045e9.7.2026.02.08.07.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 07:48:15 -0800 (PST)
From: =?UTF-8?q?Filippo=20Muscher=C3=A0?= <filippo.muschera@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	=?UTF-8?q?Filippo=20Muscher=C3=A0?= <filippo.muschera@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix inconsistent indentation detected by smatch
Date: Sun,  8 Feb 2026 16:47:34 +0100
Message-ID: <20260208154734.12747-1-filippo.muschera@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following inconsistent indentation warnings reported by Smatch:

drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2319
  EXhalbtc8723b1ant_ConnectNotify(): inconsistent indenting
drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c:1410
  phy_IQCalibrate_8723B(): inconsistent indenting

The affected code used a mix of tabs and spaces or excessive
indentation, making it misleading to read. Align the lines with the
surrounding code using tabs.

While at it, wrap long lines in HalPhyRf_8723B.c to silence checkpatch
warnings.

Signed-off-by: Filippo Muscherà <filippo.muschera@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 2 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c  | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

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
index 9df3274c1048..efa5faf9ffdf 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1407,8 +1407,10 @@ static void phy_IQCalibrate_8723B(
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
 
-				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+			result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, 
+										   bMaskDWord) & 0x3FF0000) >> 16;
+			result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, 
+										   bMaskDWord) & 0x3FF0000) >> 16;
 			break;
 		}
 	}
-- 
2.52.0

