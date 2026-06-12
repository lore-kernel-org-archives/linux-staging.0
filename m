Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602A368D6D
	for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260124; cv=none; b=IQzKO2qRvLeRJhQO47ivRGTZLSPS/7q+8K2GQdIOCugG4ymYeMi4w2mzOV9Wv3vAZcDlNNYshMhBu2Nhy7WvX7p8Wj5pGEEAHTCbS78obgHN/wtmN0fa7qezZimkXUoDZP+yQreIbCbVkvaGEcZUXeD+8i4kg1VE8bL71nZEfqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260124; c=relaxed/simple;
	bh=5P/DUwNCqKO3gZUGTzgR/Gs0ljOBKW5thHYEmfsXGBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxNq3t1Xd/DCwsfrGOc/oL9bN5jzclLnBojQyt91EISIXC0rpQcCDL+IpsubMs7O7iWd3Y2oD38if4TjL6tWkzIOeyAv1uGnjWYe6CWgHC2Z893xei/wfd+/hmREXhbdRHNOdRPwCaR+55oyTFqmwNjUx1qQYtNypj6mseanKdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZ72KhjD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZ72KhjD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eeba68948so601981f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 03:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260121; x=1781864921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQth9iT21hGuqFZGlfhkVO1FJ68WUUAGfrLWWYeB9gY=;
        b=oZ72KhjDmWqN9yRG1aHDsMjCOSfvg+qv2GJUc2R6zNtw3Wh6bFeIA0vWCT5xM6zI4M
         0NkS74J4dSietZUs2QDwAHVkt4XILwaSJCoq+Gw5pVfOx7rHLI7oWldADj3XC/h8+jt1
         kD441YUtYJvseaYEfARimyxDdy5YcoK8t8pgH7p8uMGGwGfUZyeDb9UFA+rE4dPzXg6T
         EzJaKY9t3C2IbKIbsxz1zsjhSpee4FGikEmz7LuSHgMtNZDBGgUG0YAT86OB5RkxJc9a
         G+mHer7yN9VdIwARDWkBjONVPcevKLDry9VPixc25x+fBp/Lvq1y1s1neDdzvF7uJRZi
         C+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260121; x=1781864921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LQth9iT21hGuqFZGlfhkVO1FJ68WUUAGfrLWWYeB9gY=;
        b=YKrpmy/JSKSJYf0CSE9+fLe8MQ3ufkLPQ1KgEjgQxZbRV04QoAb0DtrQ4G/wq8NgvT
         cQQxSRdgRwadm1ARX+yGxtQDrOFm+sI3uFANGVWVqc74dZyF1eLXwKjd17nU1aL6dcP0
         tVaIWakoRUlOE40OQCighHSNPl9ZpBel94dTZtoUk1UFytdH6swJmbIEzbF1EP7j2v1+
         6V5Gmarl1feULmj81dz9wjbuEbWOKkUAlBhnNzj1jwcBAGw8zhl0eYtEmePqC8aa6QmB
         b64ipa+LJiHIKi4QXJwidmHNgOIh14tELRiXlElEVLVxJXNrdC5jIWwG5UlTMX/iKlr3
         RMFw==
X-Gm-Message-State: AOJu0YwooGetLLKHy9Tp8dIMO8bgx7T836UBqLTI9LhV7ozjrCgV0Dm3
	q5CqPXdLdHomLCP3OEd9SbwsDL7ksZ55EJGtvHdpux3nPYzQTBR1SCpS
X-Gm-Gg: Acq92OGRPDhlehPxaODvWkEIEhHt0JAu8uxaRJQGWHcb7Rn3F6iSntgItQ1DSPE5F5c
	fZL77gLo6dhyiRDDJpMdZsVE+OsX1dXvrkCoaFt+TLR1vVVrFR/wvF/Z83tnStyiVX1vl3+H+Ez
	MD/kh5MMbvz2TNa5/UyN+CG9fhLBMlTIkR5CnHlbRLKAsNN3EJWBqpeh4lXCBOEbBDsRzVSZ5/B
	T+/pOX8ISx86MbmbYm5jyhV93j4o5I7fyBUkQ9OP0s+fBKQg/UDlbQpaPlX6SVHRwkPZc+C+/KK
	DMz4zypQagFC7b7OCEMte52j8ZGURIXh9D1KaECXE7/sw0LgLyubQ4+mdVyr1HuKRL/FDh29ioC
	Fz4Zvout7pTUeck11Ro2eAQVGH1P3Fl6OpCzy4FfgMTOQy8/dnSD1coz2TmykmLW2/K17hV7b5F
	W1uwASLKPJxJtn49/xRW0qU6PO8g==
X-Received: by 2002:a5d:6882:0:b0:43d:6fb7:fedb with SMTP id ffacd0b85a97d-4606dbbc479mr2547372f8f.36.1781260121033;
        Fri, 12 Jun 2026 03:28:41 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:2655:7809:9974:b326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm4358881f8f.6.2026.06.12.03.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:28:40 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH v2 1/7] staging: rtl8723bs: hal: fix space-before-tab warnings in HalBtc8723b2Ant.c
Date: Fri, 12 Jun 2026 11:28:28 +0100
Message-ID: <20260612102834.39935-1-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611162128.57870-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
v2:
 - Rebased onto staging-next as requested

 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 6da6940c9043..0220bacee181 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -168,7 +168,7 @@ static void halbtc8723b2ant_LimitedRx(
 	u8 rxAggSize = aggBufSize;
 
 	/*  */
-	/* 	Rx Aggregation related setting */
+	/*	Rx Aggregation related setting */
 	/*  */
 	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg);
 	/*  decide BT control aggregation buf size or not */
@@ -181,7 +181,7 @@ static void halbtc8723b2ant_LimitedRx(
 
 static void halbtc8723b2ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	pCoexSta->bC2hBtInfoReqSent = true;
 
@@ -417,7 +417,7 @@ static void halbtc8723b2ant_SetFwDacSwingLevel(
 	struct btc_coexist *pBtCoexist, u8 dacSwingLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	/*  There are several type of dacswing */
 	/*  0x18/ 0x10/ 0xc/ 0x8/ 0x4/ 0x6 */
@@ -430,7 +430,7 @@ static void halbtc8723b2ant_SetFwDecBtPwr(
 	struct btc_coexist *pBtCoexist, u8 decBtPwrLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	H2C_Parameter[0] = decBtPwrLvl;
 
@@ -504,7 +504,7 @@ static void halbtc8723b2ant_SetSwPenaltyTxRateAdaptive(
 	struct btc_coexist *pBtCoexist, bool bLowPenaltyRa
 )
 {
-	u8 	H2C_Parameter[6] = {0};
+	u8	H2C_Parameter[6] = {0};
 
 	H2C_Parameter[0] = 0x6;	/*  opCode, 0x6 = Retry_Penalty */
 
@@ -743,7 +743,7 @@ static void halbtc8723b2ant_SetFwIgnoreWlanAct(
 	struct btc_coexist *pBtCoexist, bool bEnable
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	if (bEnable)
 		H2C_Parameter[0] |= BIT(0);		/*  function enable */
@@ -775,7 +775,7 @@ static void halbtc8723b2ant_SetFwPstdma(
 	u8 byte5
 )
 {
-	u8 	H2C_Parameter[5] = {0};
+	u8	H2C_Parameter[5] = {0};
 
 	H2C_Parameter[0] = byte1;
 	H2C_Parameter[1] = byte2;
@@ -824,7 +824,7 @@ static void halbtc8723b2ant_SetAntPath(
 	u32 fwVer = 0, u4Tmp = 0;
 	bool bPgExtSwitch = false;
 	bool bUseExtSwitch = false;
-	u8 	H2C_Parameter[2] = {0};
+	u8	H2C_Parameter[2] = {0};
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);	/*  [31:16]=fw ver, [15:0]=fw sub ver */
@@ -2341,9 +2341,9 @@ void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
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
@@ -2460,8 +2460,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 	struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length
 )
 {
-	u8 	btInfo = 0;
-	u8 	i, rspSource = 0;
+	u8	btInfo = 0;
+	u8	i, rspSource = 0;
 	bool bBtBusy = false, bLimitedDig = false;
 	bool bWifiConnected = false;
 
-- 
2.43.0

