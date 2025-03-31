Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F8215F63;
	Mon, 31 Mar 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435539; cv=none; b=YijEhs5vAEdjTQ4zfh+eTw3DyaUfZ3OljnWZHygzYjolszJyuusxKulrXnmjLid7OZcwCWcpDogy2i/SwAAiKK1B4yqd3OYwvODlaxUo53Auw+eQsjLihG5WvizGB36cArOBASEwYuZR4BOL+cwgKV4mgkfj2Gu6IxXHsfjTROU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435539; c=relaxed/simple;
	bh=XSmVkVeZdRqAgRBh6fbVg6tdGfHaB+Oq9/dh6pVnsnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7amXlO093LbtEBxkWudFfUYlfXiBpRQJ0MibRZro/9AswDUMNvvyg5ORuX3XKUXRgAD0rQFgcFyBAYHeWgfBTPCDbOtYnnyfq4C9AO8PchPcUWGjL45wiJhiCBI8W7/lzVSIK9WtKLisXnfdR9wP32MEg5fGyrjVneTbfgJZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jybOCf6b; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jybOCf6b"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39143200ddaso2994784f8f.1;
        Mon, 31 Mar 2025 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435534; x=1744040334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cV2X3A/AFNmBG0lPkf6t+LeaV66zSVbYS9oBEkGpMY=;
        b=jybOCf6b1Ze8Wk7LBIKo/YCD3tp0hoqzgGtcn3qWoTbOq3TPZ/APwB4UDC6wEaQFCh
         GyY4OyzjhTk+SNp4G2HopQspW9k3P51xaHD7ldrmlX2uzHLqcimNaYyHxRnLEX+wtOQl
         N/eD3t6rbndNAQi7JyTm4XaqvsPhv4RZV5jfa5eFGYBnmgoegUAU71B2dVj7k/nt1nl4
         g9JgC/lM6SNA0Fh4WTeuA1LuQK7YQqAS9kbxQOHZjRcnJR3FlqeaLuWMxZHlNrgkh0+V
         UPK6ysmw4s8PnpPp3wFuVATg5PFlG1jX4HbSuR3KsuDwKRJ4zsGB4BQB5QK3kOO3HCmF
         wObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435534; x=1744040334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cV2X3A/AFNmBG0lPkf6t+LeaV66zSVbYS9oBEkGpMY=;
        b=lOZGUA54Gh+TH0UtnWxk92OmVG0P+Ee0TjBuAgosr9zBzrocdFMKpDNhS2/FAIW0i/
         xk/+6oNZTXDzUoHxGwefEE1LdsDNy9i1ePZHgOwolPUyFm+K1svRYdvXIF0tT3oJdaxE
         NfwXm86xYEmDm6gAW8u+CH6P/PdODuAwVmuzg/GCUHChIJHoqZGAPyYv4tIymWn3prTZ
         5gMySOdIi/qqi54vV636NgI5ON85b0tLZgytqzgvuUQQhfqZUEfRLB4/PvojU7T5Dc2f
         3e7O0KBfFRsqzyAI1pL/Yx9Bx38uz8zIhX4pZPxOVkejDivlQGEvQWLiQuOFGwXn0Lzp
         Mh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOcRFLXGEwUOpXYdXjvMT4vf8hPk5eO4XnGuOaSOr2d70hoJoFxQ9s583y7U83tRW2dHIhCXjRlC/A@lists.linux.dev, AJvYcCW3GmeijNIUokhfHqKxPA4HhScCa0s2ojzqrMmPwXqOVFNyaRThqSdxZtey0Ci4vJV0aMNuL2MLp8m4uxYW@lists.linux.dev
X-Gm-Message-State: AOJu0YxEvro3Lnh3//3cD13bWEsUEmqqCG4UZBT2d0FNhXCdhmkyq1cP
	xrKqzvzBx3M9l1NPI7ZT9HtVPvuRRM7HxU0v/67HuQEqgF71PDwwb9+xXthckRM=
X-Gm-Gg: ASbGncuSIvS7x32DKWfpLRvncHKdMFAWmEjvHnkXNKsxPk7+/gfIvTGtS6xDq6m8Cty
	jv6ZKvBdwwAYBjb+MU6Z1YgQcJB8+YEO+c3aF8WphbxLvduFb/eptTEh8F14Y2PZGXkFH6yc58L
	KL2+IH2oJOU4SOVeGfrEvKfotwwX00bvy8fRZW4WODHijR/Jo+CWPAHrAxq0vrcU6NLc02sI72c
	sjDztA0Rqm1XE+flEmymVWz5Qvd2mU0h3f9siFutBOceTlJ0bV05K4OuqzfjENs6ZDBBcMXnpJu
	M7h7s7JtdY1MsNFD042kOiuiE5Q0g+QiqR4iPZA=
X-Google-Smtp-Source: AGHT+IFHxPVBCNkh80Wi3fPvpwcdrU6K0fcLb5jPOJqwVZV5BBIXRjafmwnPOTESjluqIx/0l5a7hA==
X-Received: by 2002:a05:6000:240a:b0:39c:1401:679c with SMTP id ffacd0b85a97d-39c140167cfmr6806416f8f.21.1743435534196;
        Mon, 31 Mar 2025 08:38:54 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm11419167f8f.7.2025.03.31.08.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:38:53 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: no space before tabs
Date: Mon, 31 Mar 2025 18:37:57 +0300
Message-ID: <f4e52e87e0dbaf4c728bd0d2a2c641e8d465edd2.1743434232.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743434232.git.karanja99erick@gmail.com>
References: <cover.1743434232.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs to comply with the Linux kernel coding style
guidelines. Proper indentation using tabs improves code consistency
and readability.

Reported by checkpatch:

    WARNING: please, no space before tabs

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..b0e023d0435c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -9,14 +9,14 @@
 #include <hal_btcoex.h>
 #include <Mp_Precomp.h>
 
-/* 		Global variables */
+/*Global variables */
 
 struct btc_coexist GLBtCoexist;
 static u8 GLBtcWiFiInScanState;
 static u8 GLBtcWiFiInIQKState;
 
 /*  */
-/* 		Debug related function */
+/*Debug related function */
 /*  */
 static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist)
 {
@@ -401,9 +401,9 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 
 	case BTC_GET_U1_MAC_PHY_MODE:
 		*pu8 = BTC_SMSP;
-/* 			*pU1Tmp = BTC_DMSP; */
-/* 			*pU1Tmp = BTC_DMDP; */
-/* 			*pU1Tmp = BTC_MP_UNKNOWN; */
+/* *pU1Tmp = BTC_DMSP; */
+/* *pU1Tmp = BTC_DMDP; */
+/* *pU1Tmp = BTC_MP_UNKNOWN; */
 		break;
 
 	case BTC_GET_U1_AP_NUM:
@@ -561,7 +561,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 }
 
 /*  */
-/* 		IO related function */
+/* IO related function */
 /*  */
 static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
 {
@@ -772,7 +772,7 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen,
 }
 
 /*  */
-/* 		Extern functions called by other module */
+/* Extern functions called by other module */
 /*  */
 static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
 {
@@ -900,14 +900,14 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 		ipsType = BTC_IPS_ENTER;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_IpsNotify(pBtCoexist, ipsType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_IpsNotify(pBtCoexist, ipsType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -952,14 +952,14 @@ void EXhalbtcoutsrc_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ScanNotify(pBtCoexist, scanType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ScanNotify(pBtCoexist, scanType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
@@ -978,14 +978,14 @@ void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
 		assoType = BTC_ASSOCIATE_FINISH;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ConnectNotify(pBtCoexist, assoType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ConnectNotify(pBtCoexist, assoType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
@@ -1006,14 +1006,14 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
 		mStatus = BTC_MEDIA_DISCONNECT;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, mStatus);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, mStatus);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktType)
@@ -1037,14 +1037,14 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_SpecialPacketNotify(pBtCoexist, packetType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_SpecialPacketNotify(pBtCoexist, packetType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length)
@@ -1055,14 +1055,14 @@ void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8
 	pBtCoexist->statistics.cntBtInfoNotify++;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_HaltNotify(struct btc_coexist *pBtCoexist)
@@ -1102,14 +1102,14 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
 
 	/*  Periodical should be called in cmd thread, */
 	/*  don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/*  halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_Periodical(pBtCoexist);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_Periodical(pBtCoexist);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/*  halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
-- 
2.43.0

