Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFAF2C08AC
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 17:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779645258; cv=none; b=eWR1tehkEl7UiIKHX90Ek0GBflaOyYkJnMwPjnYCMjiEwm+KC1FQTXsI/9ZPxWmvoyK+ZnsMD2pizejteMQEe0Gyjd5r3dcH8iHt89MR5+e9plfAYnZ4VDWt+2Bk5KSiHYmV8KJSP/rV2UvqT5VKIi6cGmcAHDj43UOpL0/m6LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779645258; c=relaxed/simple;
	bh=uTDZeOWxTPM+GNNtzzEtRf6sJL+OwLU4yzH3Jf0zNF8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ee2z3/0XvB7BTcvagM5Q7evET8OjIYNq0alHSr8jR9y1eXqzw+nqoGRUWFn3T8InF8MiNGNkrrANMWw/hYFGZ2ytlRe/3oBbUBHMWnqjQAELF1mBInilDWrmexxKQyDnBF3ksfslf+G3UlCSC4CYMf4Egi8ijtG+bGMiIPAK1PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoV4owf5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoV4owf5"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8fbe18b1dso14327415e87.2
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779645255; x=1780250055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbLLXCXNn6VFpLnI3+nNFBeyREDtV8wIWSNIdrNVhhg=;
        b=VoV4owf5rxeBtRsN5D20Amm1rQS6DL0AFOR36RtUg2Ny9IYEfhAvhxlLT0+zoYl3FT
         SgiigAAsc+bRA+1kj9G/XWcxCKcexPcGVDvlT8BaJ6IXfbk9DpWcl4Zd4BSgGH3T8WEk
         2x+z/l0DuVefmB7Xxe6TIuvD+nzq/dDsJhWRkQ6rwAdxqH6sm7Z7cv+joWvagRWGOBR3
         Pv8ml7pIMAQ7Gn+sfmt5yqBH3eGjei34fXXrWOLjZEr/VP2QdO84ZTJDR5KoxOXGXgQH
         wIcn5jKys1nIyOr2P0pKXWvYl1UZXnYuTb4io8NyLV2PsMn0bjRe8QCc/DkKcg+0Nw5L
         Y4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779645255; x=1780250055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbLLXCXNn6VFpLnI3+nNFBeyREDtV8wIWSNIdrNVhhg=;
        b=hpKHoba+Zdlum3eu7DOhOw+dMl2KoP8I+ZPINjCtWICN+41ketNVRZsCT63Ooi2hMZ
         /o+3+gWCebt2Ji1KCHAQgqoKgqhE2U+Q1XQwvuxx4AAm+CtDEkuTSVjmm5orxq71uZsd
         r7pNAQcnlIipR5zOPg2MTfHqQL1dydhPux21psv+TgIoQ+7HcLYCX8rGHSTnXyEn1tGJ
         Z8qMMfV9NS5v+apdjIo+M57+9fU7nDVna6Qc8zSuHlfuprGRxu9Z/qEdez4ZpqpUAhXN
         eRoeFzpXB4CWW9SjEhu6zUhJiZu3jQm5TpqbiPfpAxlrmu6P1LM3BlWGNethkYLEK9wp
         ksLA==
X-Gm-Message-State: AOJu0YwitZnXj3Fwflb0RbxkNGeD0GOr5SRDuehj/UGh7ESDdm3Eielk
	802CxgyoC+neYyoZhmvSydHujmI5480t3tVAfiMvAg5q6aG3tyCPiyjT
X-Gm-Gg: Acq92OGrOGwAVSRa7YiDIZVqAYNsQOMiUvoD+NwUCD/eCubmACUk/Mgl7+AP9OeEsZt
	d9ugvSSegVW+B5bE0ZZWpWWx85atgJFisloDRQlaAhBdg4CTuxSnd2Z/MHnarLiYcAioAnx3hV5
	F42fj6lnvl52OWFpXWc1nxSBbcEm7ptJw6v2Ma6PwDEJvPZHzueyjN8kfc3xNH+Ys8GLncAmQyh
	VguliSg2deCnb/77MJ7rxGd6kLjDINwRQF+w9oDcpVxKGyOcFCQPLRIOP2ILHgWqDWs66pwTUv0
	/E/ObbApP75snfhvr5wi8ezm4WwzTAfeJZpJkh9c/s4U/2EYFJ+m65XPoBEexEd63Cffg1Olq/S
	b+VMCeJSCdF0szhl5vf3lZH4M3/MCkNkPx7Fb6EGwmPxrX6jv+USpj60SkXfSGt235w4f6dzQCw
	MenqiYA10MpobSCf6lD0jWQMThCb2S5pVv3NwQNRQFwDglAkRvKFUjZA==
X-Received: by 2002:a05:6512:318d:b0:5a8:ecfa:aaa4 with SMTP id 2adb3069b0e04-5aa32382c03mr3341438e87.35.1779645254519;
        Sun, 24 May 2026 10:54:14 -0700 (PDT)
Received: from g.lan (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf2d45sm2064341e87.57.2026.05.24.10.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 10:54:14 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces and fix indentation in HalPhyRf.c
Date: Sun, 24 May 2026 20:52:47 +0300
Message-Id: <20260524175247.5229-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed braces around single statement blocks and corrected indentation
to follow the Linux kernel coding style.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 7bef05a9a..3b81bc2e2 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -118,9 +118,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	}
 
 	/* Calculate Average ThermalValue after average enough times */
-	if (ThermalValue_AVG_count) {
+	if (ThermalValue_AVG_count)
 		ThermalValue = (u8)(ThermalValue_AVG / ThermalValue_AVG_count);
-	}
 
 	/* 4 5. Calculate delta, delta_LCK */
 	/* delta" here is used to determine whether thermal value changes or not. */
@@ -230,14 +229,11 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 		/* else if (pDM_Odm->RFCalibrateInfo.CCK_index < 0) */
 			/* pDM_Odm->RFCalibrateInfo.CCK_index = 0; */
 	} else {
-			for (p = RF_PATH_A; p < c.RfPathCount; p++)
-				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
+		for (p = RF_PATH_A; p < c.RfPathCount; p++)
+			pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
 	}
 
 	/* Print Swing base & current */
-	for (p = RF_PATH_A; p < c.RfPathCount; p++) {
-	}
-
 	if (
 		(pDM_Odm->RFCalibrateInfo.PowerIndexOffset[RF_PATH_A] != 0 ||
 		 pDM_Odm->RFCalibrateInfo.PowerIndexOffset[RF_PATH_B] != 0) &&
@@ -254,7 +250,7 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 
 		if (ThermalValue > pHalData->EEPROMThermalMeter) {
 			for (p = RF_PATH_A; p < c.RfPathCount; p++)
-					(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, 0);
+				(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, 0);
 		} else {
 			for (p = RF_PATH_A; p < c.RfPathCount; p++)
 				(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, Indexforchannel);
-- 
2.34.1

