Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF39E349AF5
	for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766515792; cv=none; b=ZQ5+JgprXP/9v7xd0NL/kS2RyBUWm1Kfv9TcnQocF3f+GAUDprWaSRgWdNJua+L3DMMYv45LsBY02mNhfvIYZ0FJByplhnjUAqSBYe+qXOG1nDSc0UV0oS5VNgc95vi4/f75ObN8B33USRtxgnAXzDPmrfKtpuILm1/fjfEpRys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766515792; c=relaxed/simple;
	bh=UhHBPT1IAwkHWoSN5KtqPVfjVIOfb+YunwUE2U1el1s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SfuPB4qO8aQr9Z58SYbnULmUdU1wBq89rrMyf26CwI39emgj3yf8RsslfJW6m8HYL91v3+LpLd7/CExouDOOuxE183moy4LFV05P7MQ7er5y5GzRivnaysVHkiV+GRxsRbySYhnYWUPU5YU6chPd8OuJ8siSkkq+Z+w/1Ju6qBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdP2K/o/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdP2K/o/"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bf1b402fa3cso5354258a12.3
        for <linux-staging@lists.linux.dev>; Tue, 23 Dec 2025 10:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766515790; x=1767120590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IBPVKntXo941JgDFBt+lGwP+2uqXEniYPiSkpRKqj/4=;
        b=SdP2K/o/A34K38uqe0kWQv2b1VdyIva/hyeKr/Mlgi70ZfgPPW8kLzOF+GqY8MuWOX
         tM8P8OnCq1VZIxv/dAvg+FQCwZNgaeAeAo7C2v1eC4COYOtZxtQHVN98NyHV/SHRjaoo
         hP2KPtQjTb2H5yRcM/bgdA/ihFX8SU/ApmDGIE9t1QgxWiyrDf+sXie/Z8EVNblXb2Rh
         ov4BdJPOwQBPH4+1Uzl925ajes/19Ix95R7ime27xHzZzLd3lcwdZ3fdl/rt+WPfBoig
         D602FkapWCD8fzXaRvmc6uyXu8K58UV8cQLVVgjVdinD96u0GjmQ/p4G/nI2MP1s8u+L
         10mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766515790; x=1767120590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBPVKntXo941JgDFBt+lGwP+2uqXEniYPiSkpRKqj/4=;
        b=lXNbphGGCaM/8YvAizEhbw2Tt2Dt33fUSD1eOtQM1WcQz9Mp3Hs0CrTfov59ZWwjwm
         S/RgHrTE04TpMFPek6GNdY3pFmjFskpA89iJtFLH6ebMqH4cESASWedAosr6IdQqEgZf
         dZfaJ9Ijsw2fLB4Eb1TlY8ph5WgQjWebFi7lQfcRPJwODPWR9jF3BtvIw270UWMgEmyB
         n9XixtfG7DcbNu/MbuNUIJYBoMZKqJl1Ys+TzjQnYfhsn3AQLHwFu3vgko2TOXDsoNwX
         yl7QbhcXydr8xKg7RC37EX42oH6JQCAekPKVLdP+fWOvF+UohbMshcZvpYOGXPjkCtKU
         mCAQ==
X-Gm-Message-State: AOJu0YzDlAzrvQw0v3wSF5Ka6S0wOcvFxd0mgKHAbUKpGPkjgRGUBcBS
	pn5A3MqM/Id6wQf6q5bv8rDCbJJaRMnkuCDkIkSHDRnNQ5+bDAP/CX2AQkoF87icZsSH9A==
X-Gm-Gg: AY/fxX5Ffc3RssIhPer9i49NN+Yq2dQvIK4paVucEWgnP3icuSzl3NkpY9Zit1cZ4km
	hScjitzhEmGHaFC4hmUEhScC4/WHrXoVllomE86TmeCWrY1XLcw5un/eGk061DUgORzTT2Td4XS
	cgRMPGlaLWktOceGFlzVAlE9Tm9XZohh3dDaiESttVQa9l16SNFYh3z1AXgOE8mhzafI2W4znLw
	fMqgMqxDdoGhCiffxMK0nOUonu6/v1ICBGCmvGbsfp5tlB4HXNYq79F8r2s83YWGTqx7sWKwbSz
	1ry5ZAJmwawMEpIq3B2FpSgbO02Aq3kjUd+2lIZcLDXZ6dXKJHU+RKiIq1+PGvQl8/M0HDk77mn
	I+KzxCNnPm7aEcUGzoKF/k3KCSPEz3crk4bq5hSYftjuyFBBmikPdYeUej8dBO/SR/hJU3/uxvZ
	xaGv8SOeLAOwgP+ZIgqWYryNKXNeTtNg8GB7VE75khBVeiIKqsSw3ABuMs5x08VBqyY8+aq8c=
X-Google-Smtp-Source: AGHT+IFjeba6jDdGxUAE46Rq0RIUW+zN/QsT1BmbuGh0wlpfaVv1dO8l90OhRYBS/Y2tPDHOO1TlSg==
X-Received: by 2002:a05:7022:e01:b0:11b:40b3:c621 with SMTP id a92af1059eb24-121722e814emr21294876c88.24.1766515789457;
        Tue, 23 Dec 2025 10:49:49 -0800 (PST)
Received: from TestUbuntu22.. (c-73-231-208-80.hsd1.ca.comcast.net. [73.231.208.80])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1217254d369sm63171706c88.16.2025.12.23.10.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 10:49:48 -0800 (PST)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH] staging: rtl8723bs: fix block comment whitespace
Date: Tue, 23 Dec 2025 10:49:43 -0800
Message-Id: <20251223184943.83688-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add leading whitespace to block comments in
HalHWImg8723B_BB.h to fix a checkpatch warning.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.h  | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.h b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.h
index 186007ce5..054acfe23 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.h
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.h
@@ -1,17 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
-*
-* Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
-*
-******************************************************************************/
+ *
+ * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
+ *
+ ******************************************************************************/
 
 #ifndef __INC_MP_BB_HW_IMG_8723B_H
 #define __INC_MP_BB_HW_IMG_8723B_H
 
-
 /******************************************************************************
-*                           AGC_TAB.TXT
-******************************************************************************/
+ *                           AGC_TAB.TXT
+ ******************************************************************************/
 
 void
 ODM_ReadAndConfig_MP_8723B_AGC_TAB(/*  TC: Test Chip, MP: MP Chip */
@@ -19,8 +18,8 @@ ODM_ReadAndConfig_MP_8723B_AGC_TAB(/*  TC: Test Chip, MP: MP Chip */
 );
 
 /******************************************************************************
-*                           PHY_REG.TXT
-******************************************************************************/
+ *                           PHY_REG.TXT
+ ******************************************************************************/
 
 void
 ODM_ReadAndConfig_MP_8723B_PHY_REG(/*  TC: Test Chip, MP: MP Chip */
@@ -28,8 +27,8 @@ ODM_ReadAndConfig_MP_8723B_PHY_REG(/*  TC: Test Chip, MP: MP Chip */
 );
 
 /******************************************************************************
-*                           PHY_REG_PG.TXT
-******************************************************************************/
+ *                           PHY_REG_PG.TXT
+ ******************************************************************************/
 
 void
 ODM_ReadAndConfig_MP_8723B_PHY_REG_PG(/*  TC: Test Chip, MP: MP Chip */
-- 
2.34.1

