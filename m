Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36C639FCE
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774715689; cv=none; b=eDLFPLkyZCaCk9WGRtXczpnHKJBo2wx3AOQpa6hrTpoYr3Idf/Eq1Y5Do+RsL14FZ+ZWez5rzWKd91UP7iKePYHAbkU/QERpljpyopNGQpE95TQJv8nzvpok+ZpmsQX0yckkG3INKTNPMsS66bsFmk5e0M0PYV4KFDKjxyorJx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774715689; c=relaxed/simple;
	bh=H51MSAyGbbc81Asz9U/00ugrqL9E2Zvwgh93ExrY+QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DqAW7WW2VdB9mDM/P8FHOgbnGewwEr+ndyo4JgPIeHZoF1gIo6FAbdidI/KF3rFGh4W2NTGxxHayHiQYwyHDNrn3Ic++Em8C9BjMqKvHAhilrxk6s2kTP5OuRAldji7DlidfuhpDwmlxrTQVRgPvpGYmJZMAOKvMX4D2CCD5qOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFk7OZk9; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFk7OZk9"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-439d8df7620so2197755f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774715686; x=1775320486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+bpalMsRBepXYB/c8U7VCyKszPbZw7ZBfSrt+Ycym0=;
        b=LFk7OZk9ld+z98lVrIFhYwK8jT/sA/kIM4V/PiHgIpk1te3XcoOyC5bT3X1fbnD6Z3
         VhRl4kW9n2/kZcLvN5oC7/tluAaiAwUE738oQx7BqP5khgdoLz0siSN0UXf1GQyzVcel
         uSP4bvKyAYJSqTRQIHgWSDD7dtSHeCE2AobfnlIhDcM/k6b2OAsjFHNBni0xDSg+FGLm
         LCHKloirHRulQgpBXsZ59NeDynqwJLFKsNX+7tXRVoUr/m7haESk+45eNl7ABlXasL/f
         W10nbl4SpOcM9Y1kkvZ4uXIwyJMzL2FVfJTVUI7NrtpkfNTbx5rlJ1SqMa5exrEL8uUN
         HSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774715686; x=1775320486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+bpalMsRBepXYB/c8U7VCyKszPbZw7ZBfSrt+Ycym0=;
        b=nqSJCr5Rslf+xiBjPSMxR5H+cusiwHM+8vaSNayIiu3c+aC/dysCNlfS3dCs4/+fXp
         Tyk38UXM/Fflu7KacjG0Y0hupdrRsxhObvB96G71e3pmt9agZEJolkhCi88O1MuinzEU
         uIrCWNrhggyfaGWfL0lYdp9sR+8bfy3sBC8BNGKpkA+/BoTMSS31R1JFP59DwzLHRkJX
         Y2N1pFgFHiyb4wdLlSg3YOzlE+xPosCOluc55os/dtOQQc/LrRzEW7e2NkN3bQj01aDD
         aTQwB4Mw+QIW+54eJQU6U1lukPImAA5ImTLzg+gNE5l4LOBsA3zOSbNQD7QM4HxR1hKl
         i2jA==
X-Forwarded-Encrypted: i=1; AJvYcCV/i5jbb+4uhwK1dru8SR0qHPy9wH1qwg1QQbDzNMbRLF6MQZgPG6ohG5th7Xia0BsWu9Ya/UArUcak7zxR@lists.linux.dev
X-Gm-Message-State: AOJu0Ywimqeamk1nAzPuhlXShs++7pncEYZSYZpnMFvfZWtxFBsqMYTH
	61k8AYDlwFIvba6TLP4DTrVlxlc86PuMCcZblVckZBnbIAiHBdPFjlDj
X-Gm-Gg: ATEYQzzUOHPhVImyFeG94pfO5InuFlYUtVHL+nIO3tLs0qA+wz5UdCS1P4x5lelqzD+
	3EzaWiGJ1dR64y+iUemy6BGt9kkS4liGyKlxu1EYzBkH++6N1E7PuGuUZZQLOeF2mSxg5r++io8
	Jxv2L/D3dIiQTfMYn+jZGYJDzOifLGR42JDrx+SMMe3UzYNeKnlasR5C21rD/QP+todDcjXbro/
	RF3k7Oyia99jUuYdq1PCFZpou4Tzgo65W8suKpt9CTp6H/7UAWXwc/Y0x+LrquBhOaAnT0L/ZND
	vh0b+68Q7uOtTIO38Clhf/n3b88KHr6K3QVmbItCBCfLAWFXB6rw1tx6HQELK95KfbYB71Cad44
	KhS4Wb6ZH6+IxAsUwC2aeBOdzsfpBUfnNQs2jPVsO+TMe4zpiGb9zTk4y0Zkhzf3J7XYhyJLphl
	CmEVqlIppH61w5fU0jleSl
X-Received: by 2002:a05:6000:26c2:b0:439:c279:32df with SMTP id ffacd0b85a97d-43b9ea4aa73mr10748910f8f.35.1774715685824;
        Sat, 28 Mar 2026 09:34:45 -0700 (PDT)
Received: from bera-arch ([2a02:ff0:c13:2eeb:2e7c:3a4f:2bc2:f78a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257cbc3sm5778321f8f.35.2026.03.28.09.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 09:34:45 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: filippo.muschera@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH] staging: rtl8723bs: refactor switch-case
Date: Sat, 28 Mar 2026 19:33:58 +0300
Message-ID: <20260328163357.163332-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refactored huge switch-case to lookup table. Used if-else for dynamic
values.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 269 +++++-------------
 1 file changed, 69 insertions(+), 200 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3e34f97cfc6..c02df8e3c398 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -989,6 +989,51 @@ static void halbtc8723b1ant_SetFwPstdma(
 	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x60, 5, H2C_Parameter);
 }
 
+static const u32 FwPstdma_table[41][5] = {
+	{0, 0, 0, 0, 0}, // 0
+	{0, 0, 0, 0, 0},
+	{0, 0, 0, 0, 0},
+	{0x51, 0x1d, 0x1d, 0x0, 0x10},
+	{0x93, 0x15, 0x3, 0x14, 0x0},
+	{0x61, 0x15, 0x3, 0x11, 0x10}, // 5
+	{0x61, 0x20, 0x3, 0x11, 0x11},
+	{0x13, 0xc, 0x5, 0x0, 0x0},
+	{0x93, 0x25, 0x3, 0x10, 0x0},
+	{0, 0, 0, 0, 0},
+	{0x13, 0xa, 0xa, 0x0, 0x40}, // 10
+	{0, 0, 0, 0, 0},
+	{0x51, 0x0a, 0x0a, 0x0, 0x50},
+	{0x51, 0x12, 0x12, 0x0, 0x10},
+	{0, 0, 0, 0, 0},
+	{0x13, 0xa, 0x3, 0x8, 0x0}, // 15
+	{0x93, 0x15, 0x3, 0x10, 0x0},
+	{0, 0, 0, 0, 0},
+	{0x93, 0x25, 0x3, 0x10, 0x0},
+	{0, 0, 0, 0, 0},
+	{0x61, 0x3f, 0x03, 0x11, 0x10}, // 20
+	{0x61, 0x25, 0x03, 0x11, 0x11},
+	{0x61, 0x25, 0x03, 0x11, 0x10},
+	{0xe3, 0x25, 0x3, 0x31, 0x18},
+	{0xe3, 0x15, 0x3, 0x31, 0x18},
+	{0xe3, 0xa, 0x3, 0x31, 0x18}, // 25
+	{0xe3, 0xa, 0x3, 0x31, 0x18},
+	{0xe3, 0x25, 0x3, 0x31, 0x98},
+	{0x69, 0x25, 0x3, 0x31, 0x0},
+	{0xab, 0x1a, 0x1a, 0x1, 0x10},
+	{0x51, 0x30, 0x3, 0x10, 0x10}, // 30
+	{0xd3, 0x1a, 0x1a, 0x0, 0x58},
+	{0x61, 0x35, 0x3, 0x11, 0x11},
+	{0xa3, 0x25, 0x3, 0x30, 0x90},
+	{0x53, 0x1a, 0x1a, 0x0, 0x10},
+	{0x63, 0x1a, 0x1a, 0x0, 0x10}, // 35
+	{0xd3, 0x12, 0x3, 0x14, 0x50},
+	{0, 0, 0, 0, 0},
+	{0, 0, 0, 0, 0},
+	{0, 0, 0, 0, 0},
+	/*  SoftAP only with no sta associated, BT disable , TDMA mode for power saving */
+	/* here softap mode screen off will cost 70-80mA for phone */
+	{0x23, 0x18, 0x00, 0x10, 0x24}, // 40
+};
 
 static void halbtc8723b1ant_PsTdma(
 	struct btc_coexist *pBtCoexist, bool bForceExec, bool bTurnOn, u8 type
@@ -1032,207 +1077,31 @@ static void halbtc8723b1ant_PsTdma(
 		if (pBtLinkInfo->bSlaveRole)
 			psTdmaByte4Val = psTdmaByte4Val | 0x1;  /* 0x778 = 0x1 at wifi slot (no blocking BT Low-Pri pkts) */
 
+		if (type == 1)
+			halbtc8723b1ant_SetFwPstdma(pBtCoexist, psTdmaByte0Val,
+						    0x3a + nWiFiDurationAdjust, 0x03,
+						    psTdmaByte3Val, psTdmaByte4Val);
+		else if (type == 2)
+			halbtc8723b1ant_SetFwPstdma(pBtCoexist, psTdmaByte0Val,
+						    0x2d + nWiFiDurationAdjust, 0x03,
+						    psTdmaByte3Val, psTdmaByte4Val);
+		else if (type == 9 || type == 11)
+			halbtc8723b1ant_SetFwPstdma(pBtCoexist, psTdmaByte0Val,
+						    0x21, 0x3,
+						    psTdmaByte3Val, psTdmaByte4Val);
+		else if (type == 14)
+			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x51,
+						    0x21, 0x3,
+						    0x10, psTdmaByte4Val);
+		else if (type == 0 || type == 17 || type == 19 || type == 37 || type == 38 || type == 39)
+			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x51,
+						    0x1a, 0x1a,
+						    0x0, psTdmaByte4Val);
+		else if (type < 41)
+			halbtc8723b1ant_SetFwPstdma(pBtCoexist, FwPstdma_table[type][0],
+						    FwPstdma_table[type][1], FwPstdma_table[type][2],
+						    FwPstdma_table[type][3], FwPstdma_table[type][4]);
 
-		switch (type) {
-		default:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x1a, 0x1a, 0x0, psTdmaByte4Val
-			);
-			break;
-		case 1:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist,
-				psTdmaByte0Val,
-				0x3a + nWiFiDurationAdjust,
-				0x03,
-				psTdmaByte3Val,
-				psTdmaByte4Val
-			);
-			break;
-		case 2:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist,
-				psTdmaByte0Val,
-				0x2d + nWiFiDurationAdjust,
-				0x03,
-				psTdmaByte3Val,
-				psTdmaByte4Val
-			);
-			break;
-		case 3:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x1d, 0x1d, 0x0, 0x10
-			);
-			break;
-		case 4:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x93, 0x15, 0x3, 0x14, 0x0
-			);
-			break;
-		case 5:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x15, 0x3, 0x11, 0x10
-			);
-			break;
-		case 6:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x20, 0x3, 0x11, 0x11
-			);
-			break;
-		case 7:
-			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x13, 0xc, 0x5, 0x0, 0x0);
-			break;
-		case 8:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x93, 0x25, 0x3, 0x10, 0x0
-			);
-			break;
-		case 9:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist,
-				psTdmaByte0Val,
-				0x21,
-				0x3,
-				psTdmaByte3Val,
-				psTdmaByte4Val
-			);
-			break;
-		case 10:
-			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x13, 0xa, 0xa, 0x0, 0x40);
-			break;
-		case 11:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist,
-				psTdmaByte0Val,
-				0x21,
-				0x03,
-				psTdmaByte3Val,
-				psTdmaByte4Val
-			);
-			break;
-		case 12:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x0a, 0x0a, 0x0, 0x50
-			);
-			break;
-		case 13:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x12, 0x12, 0x0, 0x10
-			);
-			break;
-		case 14:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x21, 0x3, 0x10, psTdmaByte4Val
-			);
-			break;
-		case 15:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x13, 0xa, 0x3, 0x8, 0x0
-			);
-			break;
-		case 16:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x93, 0x15, 0x3, 0x10, 0x0
-			);
-			break;
-		case 18:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x93, 0x25, 0x3, 0x10, 0x0
-			);
-			break;
-		case 20:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x3f, 0x03, 0x11, 0x10
-
-			);
-			break;
-		case 21:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x25, 0x03, 0x11, 0x11
-			);
-			break;
-		case 22:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x25, 0x03, 0x11, 0x10
-			);
-			break;
-		case 23:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0x25, 0x3, 0x31, 0x18
-			);
-			break;
-		case 24:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0x15, 0x3, 0x31, 0x18
-			);
-			break;
-		case 25:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0xa, 0x3, 0x31, 0x18
-			);
-			break;
-		case 26:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0xa, 0x3, 0x31, 0x18
-			);
-			break;
-		case 27:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0x25, 0x3, 0x31, 0x98
-			);
-			break;
-		case 28:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x69, 0x25, 0x3, 0x31, 0x0
-			);
-			break;
-		case 29:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xab, 0x1a, 0x1a, 0x1, 0x10
-			);
-			break;
-		case 30:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x30, 0x3, 0x10, 0x10
-			);
-			break;
-		case 31:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xd3, 0x1a, 0x1a, 0x0, 0x58
-			);
-			break;
-		case 32:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x35, 0x3, 0x11, 0x11
-			);
-			break;
-		case 33:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xa3, 0x25, 0x3, 0x30, 0x90
-			);
-			break;
-		case 34:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x53, 0x1a, 0x1a, 0x0, 0x10
-			);
-			break;
-		case 35:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x63, 0x1a, 0x1a, 0x0, 0x10
-			);
-			break;
-		case 36:
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xd3, 0x12, 0x3, 0x14, 0x50
-			);
-			break;
-		case 40: /*  SoftAP only with no sta associated, BT disable , TDMA mode for power saving */
-			/* here softap mode screen off will cost 70-80mA for phone */
-			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x23, 0x18, 0x00, 0x10, 0x24
-			);
-			break;
-		}
 	} else {
 
 		/*  disable PS tdma */
-- 
2.53.0

