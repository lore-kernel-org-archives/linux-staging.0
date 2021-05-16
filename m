Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A471
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:30:37 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id lj11-20020a17090b344bb029015bc3073608so2248781pjb.3
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I6WhL1PpTCyWACZgwSEwTO4odDW7Vfe+3XlFCiuIyHg=;
        b=Itrqwyv9Q1NKvkvTocagH9e2hB520j0pJ1FyNmOBE0NzIZlB1W+of/x9pap6N07dOB
         bsxMulGPIeDKDXw3VajxKof6zyNoaqyijoQrL+lOn3PHogn3WrgiZ2OG8Cd6rHdrR8WG
         XLbVItMeN2ZPxOgqlekn4AfVJpbrOkZqWtcW/Ghn3NKTCQnbvMANHKnWuk77KLR2dWNO
         K551e43oRgygXTIUGeEWmSXUdxRGT7IsOY/w1n+Ps+Tp17XgDtfjEND96Lbgaq07NQIQ
         LIX4Kdkur0wQsBCA6kzQ2DoXKsZyk0XDf39FvK6VeiJde06bcqJIHFPuA6eqKDoolYEG
         iVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I6WhL1PpTCyWACZgwSEwTO4odDW7Vfe+3XlFCiuIyHg=;
        b=eVMk+nqLXuCGZaTmMWG1sIcjluCyriLmDG8GtURW07Q7Ft5rQQVVLZVDyA8+cNDY15
         x2I9MF7Zi46DQuSgrUpC9+FjqHrDBtohZ4N5esROwlvZgzmYzKF9tad4j1v7W3o42fcp
         XXU2zwXVjpvIZw0H9XHMfZiXasF44G/shU1O3n63UNND9PqKHyYaZl9i+0xi9nB9po5p
         dz0g70NCXos6jRAI/77VQDFC/AFwE9jg2b+F0R2hwJJGoU25yWxCOZS+wxi1/JEZxq2B
         SLOf1Me9TgvWrFXC+yNCdvPTz8piA+unQWRA1bpv3scawJcFRW6EGDfCOI7gYKk46jgh
         qNOw==
X-Gm-Message-State: AOAM531UBDVP4a6UyeqJfLN9DMTWG8YPGNJ/2xMVORHNtM22MjMSFfKD
	wCLoifgFf7//D9c6K6YcxZ8=
X-Google-Smtp-Source: ABdhPJwfOir+XjFUxEPh6ep0IE4kU926wBpVZVC/DvuQ+YXcjnTrWiaVFLktDjSoNi73DalIhuQ9CA==
X-Received: by 2002:a17:90a:d909:: with SMTP id c9mr12647509pjv.190.1621168237068;
        Sun, 16 May 2021 05:30:37 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
        by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 05:30:36 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	fabioaiuto83@gmail.com,
	fmdefrancesco@gmail.com,
	eantoranz@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH 2/7] Staging: rtl8723bs: fix spaces in HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:22 -0400
Message-Id: <20210516122927.1132356-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
References: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes the following checkpatch.pl errors:

WARNING: please, no space before tabs
+^I/* ^IRx Aggregation related setting */$

WARNING: please, no space before tabs
+^Iu8 ^IH2C_Parameter[1] = {0};$

WARNING: please, no space before tabs
+^Iu8 ^IH2C_Parameter[6] = {0};$

WARNING: please, no space before tabs
+^I/* u32 ^I^IfwVer = 0; */$

WARNING: please, no space before tabs
+/* ^ISoftware Coex Mechanism start */$

WARNING: please, no space before tabs
+/* ^INon-Software Coex Mechanism start */$

WARNING: please, no space before tabs
+^I/* ^IBIT0: "0" for no antenna inverse; "1" for antenna inverse */$

WARNING: please, no space before tabs
+^I/* ^IBIT1: "0" for internal switch; "1" for external switch */$

WARNING: please, no space before tabs
+^I/* ^IBIT2: "0" for one antenna; "1" for two antenna */$

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 85bf45cabecd..49f37aa16cc4 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -231,7 +231,7 @@ static void halbtc8723b1ant_LimitedRx(
 	u8 rxAggSize = aggBufSize;
 
 	/*  */
-	/* 	Rx Aggregation related setting */
+	/*	Rx Aggregation related setting */
 	/*  */
 	pBtCoexist->fBtcSet(
 		pBtCoexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg
@@ -250,7 +250,7 @@ static void halbtc8723b1ant_LimitedRx(
 
 static void halbtc8723b1ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8 H2C_Parameter[1] = {0};
 
 	pCoexSta->bC2hBtInfoReqSent = true;
 
@@ -606,7 +606,7 @@ static void halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(
 	struct btc_coexist *pBtCoexist, bool bLowPenaltyRa
 )
 {
-	u8 	H2C_Parameter[6] = {0};
+	u8 H2C_Parameter[6] = {0};
 
 	H2C_Parameter[0] = 0x6;	/*  opCode, 0x6 = Retry_Penalty */
 
@@ -1038,7 +1038,7 @@ static void halbtc8723b1ant_PsTdma(
 	u8 rssiAdjustVal = 0;
 	u8 psTdmaByte4Val = 0x50, psTdmaByte0Val = 0x51, psTdmaByte3Val =  0x10;
 	s8 nWiFiDurationAdjust = 0x0;
-	/* u32 		fwVer = 0; */
+	/* u32 fwVer = 0; */
 
 	pCoexDm->bCurPsTdmaOn = bTurnOn;
 	pCoexDm->curPsTdma = type;
@@ -1575,13 +1575,13 @@ static void halbtc8723b1ant_PowerSaveState(
 
 /*  */
 /*  */
-/* 	Software Coex Mechanism start */
+/*	Software Coex Mechanism start */
 /*  */
 /*  */
 
 /*  */
 /*  */
-/* 	Non-Software Coex Mechanism start */
+/*	Non-Software Coex Mechanism start */
 /*  */
 /*  */
 static void halbtc8723b1ant_ActionWifiMultiPort(struct btc_coexist *pBtCoexist)
@@ -2166,9 +2166,9 @@ void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 	/*  */
 	/*  S0 or S1 setting and Local register setting(By the setting fw can get ant number, S0/S1, ... info) */
 	/*  Local setting bit define */
-	/* 	BIT0: "0" for no antenna inverse; "1" for antenna inverse */
-	/* 	BIT1: "0" for internal switch; "1" for external switch */
-	/* 	BIT2: "0" for one antenna; "1" for two antenna */
+	/*	BIT0: "0" for no antenna inverse; "1" for antenna inverse */
+	/*	BIT1: "0" for internal switch; "1" for external switch */
+	/*	BIT2: "0" for one antenna; "1" for two antenna */
 	/*  NOTE: here default all internal switch and 1-antenna ==> BIT1 = 0 and BIT2 = 0 */
 	if (pBtCoexist->chipInterface == BTC_INTF_USB) {
 		/*  fixed at S0 for USB interface */
-- 
2.25.1

