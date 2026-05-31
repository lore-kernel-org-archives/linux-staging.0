Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57F38248B
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 04:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780203329; cv=none; b=VhdNDCtEAI3j4Ci7hO5gLikrgF+S7Lqfkv48D9usV/iF161ETtsLV0psyd7Mw0BgFBnFgbS2NfVV0TAovs4UeI46XtI3/CL/wBeJGnA/JMGuL6CQ1Wgyl49mQhtuwbrtSexMyvqpwMdkC9JppU6dmBbPRZa+X4orBPghGarZ3Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780203329; c=relaxed/simple;
	bh=Q8bjIB+hWst+ohcpl3CGH0XJiGjoA6x+uvevWWRYrxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g0iAgI/M7kjVHaH/I3YFS6TCwtCu6fpBfsvtFVt1cMC3yKyQhw5LN2pdFg1sHgYaya1E/lc1fetAfyb3OBhddF/9tDsoMNdJ/bChDuKYxjV5iOQDbKYzAQWzDrZxxvOd2l5GbM/WhZtXSGDMcagUhWbidCdsGl6wG64WG6kn2tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRBkGMYJ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRBkGMYJ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85825bbc4fso801829a12.2
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 21:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780203328; x=1780808128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpaV6+gvFRoh8lnp5uUYQm83PYcJxIp7hkUs+x7OQNI=;
        b=YRBkGMYJ53FIbgnFzy0zpiLxtiRoc+ssL3MxPZa7lRP43MdkHoPnwLkRIkUamvndgV
         edWyvucM/O7bVl10ad32lgOXg/DGpqgT8elcQe9lSQXJycjoquu6E6kuXztqv+e7jjca
         tpZnI8nSsX4d5Cu/2osTBr6Nsy+Zliru9/Z7aNdgKLDpaJTRZws/n/3U+xeE2+kqiMi0
         4SZ+rpxNo/PKD/wMOCaPLHKC/k1r2ySn+WtdDIvX9/RUEAvBpZa5WIKn0kqlwB7f8rD0
         QFMr/R+SMMylkhcCiC82CzQ7mrlPHrq+U2oEEBs1CangR6tPHyVCvmgIoaLiMkqZ1JqT
         5z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780203328; x=1780808128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaV6+gvFRoh8lnp5uUYQm83PYcJxIp7hkUs+x7OQNI=;
        b=sdmHmJJD4uJOZW0GgwaPefQEqkz9EF2aTXgN2HkIkoO/BuvTxsDegMorlGJEoEEZmc
         Q3W3McnKybtXGMyLCFXQmvD8G8S12MaWsJ5jTXo8LtdY6RhqjNUqoZEu82gAGvLJYFpu
         xdJUHSSZ7GO1mUNdGOagnQlovj+2cuxpu+gU3XR0krUUgIGpuZQGFCevGUUAxynxYpCY
         IGJ4oBSpLOzer32mY81TTQ5RcJpHaVA7fi1OHFvg3+N6H7BzDttQfB6DHPd5c/A6I7KP
         0W2aRLqw3RXv2XdPg9QxvI+LM+oPbqU1tkmXD2xuDSc98Jl10Oh2UrUAAa/nLWutJLJv
         J0aA==
X-Gm-Message-State: AOJu0YwewTTvwXpZ/BT4OzjSXMJckOrlc6AqbHH1Ua6xL1w1/zbKTebq
	ccWfMZWcKR9mp1j93WAy2sz/Uz4ItDI+n4PyA0puBx+xa/Occ39BNxEH
X-Gm-Gg: Acq92OGXD42cJqHs3upLELqGPJS7fipZVC7yALT0CfEk1qS2G0pwCC2uo5YFkR7T1ZN
	0PF9+SFb8DvZD1y16VHg345GD3GbQQFcQfy2+Qjq76UbRDrpvKRU+JFRO9wLw0Km/rmWkE34Nyr
	pFi+pwfRKi1bEk7OP+t1qhH1qcJSLmjpxSgQPZ7BAYCCfDrlhUyngrDJK43B4nfTK+71HcMJp3f
	jXZO3UnXRYq/Uliyf7uSVEyVpFYznbp7vexIOkZfgm+kAbiiNCcwzVKLMWze/TzVgccUYB9zlbr
	C6L8+C+W/d0Km9PiCrDO3z5mfhl9xj4YsSsiWFFvB0BoJYXcjB8PBreDXNIVyn36VQXQnOSoEl0
	3CosIUZ23kXXzuZBcKzI7exw3q4GExnzuuOuang4POpEriYyABeyBJAUhLS2rOJHuIAOGHUy1UH
	I2G+U7UYkrm5Rc5xH5WNlyycmsRn/xUoM6qlxeZHlRvScg+KFrnbkrDUsM7wYFD2M4+NU=
X-Received: by 2002:a05:6a00:a216:b0:827:447f:7dbd with SMTP id d2e1a72fcca58-84225a0873amr5779691b3a.46.1780203327901;
        Sat, 30 May 2026 21:55:27 -0700 (PDT)
Received: from fedora ([157.50.161.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214c92fd2sm6098958b3a.38.2026.05.30.21.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 21:55:27 -0700 (PDT)
From: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: Fix space before tab in rtl8723b_dm.c
Date: Sun, 31 May 2026 10:25:11 +0530
Message-ID: <20260531045511.5774-1-praveen.pattar2022@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove tab characters that appeared after '/*' in two comment lines,
which caused 'please, no space before tabs' warnings. Replace the
space+tab combination with a single space after the comment opener.

Detected by checkpatch.pl with --strict flag.

Signed-off-by: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 2276dc1cb44a..4fdda25969f9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -42,7 +42,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
 
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
-	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
+	/* ODM_CMNINFO_BINHCT_TEST only for MP Team */
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
 
 	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
@@ -80,7 +80,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	/*  Pointer reference */
 	/*  */
 	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
-	/* 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
+	/* ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
 
 	ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
-- 
2.54.0

