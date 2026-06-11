Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7768443DA3C
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194958; cv=none; b=TBLxFcDw1wxHZdALL96GstvfN4NF5APpi5WvwTcn0HCd6r6puO1ZU3b7oNLkYruTONY45Ek8TZzqA6dhZqwf5OnhMZTSxejgoiwzIi6pP581KpA/Bs4Xj7sw19r1RvCv2neq6a5a99bTGhFzxU91hOHFXS4AQEZ679rKpapi8Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194958; c=relaxed/simple;
	bh=1wr4+1WRcHfU9lnWYR5eZxQUVXDXryQ1et92ZJciFWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAPRXKHn0EZFD7VO792FW+dUjzzfxzLWBEu0OJSzYgrZE7FhnmvTBNi/Wshhs/mJs6Ps39oc8MRIw8aJF0NM8cbiVHV6EW9+F7caXO88YO6MfnfXi+cfaHuOSHZskFCchUKHDOZZmKy9UMvmrmBoyK8qIkztt0I2oMFRjRsqC7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4Miw5sm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4Miw5sm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b12270b3so49713395e9.1
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194955; x=1781799755; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2enQxMy5woXkCjQF3AVUJptbNSJTlOz6EOLYvjgNNGk=;
        b=V4Miw5sm9nzOi4BM/3rvCPSuE1NvpmBaiqsFb3RXdPBU24CmppIULja1jphdIGi2HA
         zRjfrqO1dVtWr1GQxi5M+t3WYhg9MA9gDs4kuZOEt7PHfOx5OQU87SZDoJAn4bPffp7p
         xRGI1RdnP8JLiQ4cXiG+V5QlnQK3JPM94VvIomIcLFaj3QxKMwon5+93wwbbNIm1ls3K
         xcN29ijPwL4gkJJMO2lVV4pGM393altbzR0U7GRuxhsCZFkiA8otIjSsSsr62iez8BmD
         gBAHRgNhQ4Y0T1dZmiSnf/q9w2CYJeHEe1q7O1prDjo2kkin9rZWF8ochP8Okh24oHkP
         vKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194955; x=1781799755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2enQxMy5woXkCjQF3AVUJptbNSJTlOz6EOLYvjgNNGk=;
        b=rLorvRVECjH6xs27sUlxdMeESngXJv4N/fEpbW/I1jb/fNuYKc0fGTqaS7lGeiUkae
         dlt1G1WfEhYGUrUxZY/U2GHejna0PPsaOe+GafxzWoMpsxtMX7qNh5pjZqqn+uFwqVJ8
         GjvqkAb4mWc+tqoU078TZLLMktZzcsE4ZdXlZbiUVtBFf/3xhwFHyRefhJmU+SxeUmfx
         Y0pT061Jmdu3nGx3fxXq88O6aaze+nfoUlmmcjZ5Sbyz0X27DNdzyL87gtT4mnWP4E3y
         w8PQfVhZZodtvpCExUQ41M0Zg/aYTMYByZQIjnfhaxIqzun63MJa5g7WBgdB08wHlX+w
         n93Q==
X-Gm-Message-State: AOJu0YwfgHAtcELrZJtutcpWJBGUMCgeafpBo7GUIEpqOJgABkcEpk27
	AX8EKU18zrUoEVpw1xqlIcOqFJ4IvAZdCTnqzHq+SXR32aLy8zaiDz2o
X-Gm-Gg: Acq92OFajSpa9kNVzo2qybWpYIwaEpjwb0mJAsL2R3pqMXf0/oLXQJKFs5TDQ9Eqw2D
	3f9CeHTXhQDEyObmHb3gdtkvJSf3uD/PDaiqVhc3y5T9HqZa2RufedB+jc7Ol0arqasuxBFNtsW
	rQUdJPFhrmnm5jK94XLGK39yJp35LfVYEr3KDGeteu2jAXAHD1Fvqvn1aNMNQlYPMWSZnIkC32g
	6SCSAsMBCW9YR4YdzGrtfpBiWDRsPDGkAQeHTtM4lcUOK5Ttf5eybu6OF8lDjIqQDtx9x04y54u
	eC0LVVPEQHNZQcPgYRKZ4XKoZrnN0cFTIKrCVMI0/JS31jbggBnIOdSa3D19ixpKaXRENqoRa7p
	kwoD6EvyTsUoWmlnHhZtpAjQBiiakgumIY0siuXlQJrzpUk+FXi5+rqzc36HuKmfHTHsqTLGiO8
	BgXLGCC9veaBX/94/cq3u8sm0P0A==
X-Received: by 2002:a05:600c:8411:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490e55a6228mr52011245e9.2.1781194954786;
        Thu, 11 Jun 2026 09:22:34 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:ac27:e02b:2f26:8695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e46a75c8sm70344585e9.2.2026.06.11.09.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:22:33 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH 2/9] staging: rtl8723bs: hal: fix whitespace in HalBtc8723b2Ant.c
Date: Thu, 11 Jun 2026 17:21:21 +0100
Message-ID: <20260611162128.57870-2-qstrydom0@gmail.com>
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
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..fde84be96502 100644
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
 
@@ -418,7 +418,7 @@ static void halbtc8723b2ant_SetFwDacSwingLevel(
 	struct btc_coexist *pBtCoexist, u8 dacSwingLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	/*  There are several type of dacswing */
 	/*  0x18/ 0x10/ 0xc/ 0x8/ 0x4/ 0x6 */
@@ -431,7 +431,7 @@ static void halbtc8723b2ant_SetFwDecBtPwr(
 	struct btc_coexist *pBtCoexist, u8 decBtPwrLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	H2C_Parameter[0] = decBtPwrLvl;
 
@@ -505,7 +505,7 @@ static void halbtc8723b2ant_SetSwPenaltyTxRateAdaptive(
 	struct btc_coexist *pBtCoexist, bool bLowPenaltyRa
 )
 {
-	u8 	H2C_Parameter[6] = {0};
+	u8	H2C_Parameter[6] = {0};
 
 	H2C_Parameter[0] = 0x6;	/*  opCode, 0x6 = Retry_Penalty */
 
@@ -746,7 +746,7 @@ static void halbtc8723b2ant_SetFwIgnoreWlanAct(
 	struct btc_coexist *pBtCoexist, bool bEnable
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	if (bEnable)
 		H2C_Parameter[0] |= BIT0;		/*  function enable */
@@ -778,7 +778,7 @@ static void halbtc8723b2ant_SetFwPstdma(
 	u8 byte5
 )
 {
-	u8 	H2C_Parameter[5] = {0};
+	u8	H2C_Parameter[5] = {0};
 
 	H2C_Parameter[0] = byte1;
 	H2C_Parameter[1] = byte2;
@@ -827,7 +827,7 @@ static void halbtc8723b2ant_SetAntPath(
 	u32 fwVer = 0, u4Tmp = 0;
 	bool bPgExtSwitch = false;
 	bool bUseExtSwitch = false;
-	u8 	H2C_Parameter[2] = {0};
+	u8	H2C_Parameter[2] = {0};
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);	/*  [31:16]=fw ver, [15:0]=fw sub ver */
@@ -2347,9 +2347,9 @@ void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
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
@@ -2466,8 +2466,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
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

