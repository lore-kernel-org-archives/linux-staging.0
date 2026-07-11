Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A08F264A9D
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783790743; cv=none; b=puk9nOhnBGAvNIkbEE59BFXSM5uMPgd3V0UeJHicjyZoPuzI6waaD07OSVzRXKbPpJxYfVsWKXs0HgMsAIgen9bneCvc3dM5Lyn4uaQ4aje+G6+9LO5fxpV6dG42r0DTIxEqdEtnur11JV2BYdZC22V6YQ8+Mm23E5olsTP0fs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783790743; c=relaxed/simple;
	bh=IMGTHZAuQ96K3ZEJbOh62JlUTRLR+aYiPSJEacCzS68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c/uvAhG+PizaTooUQKw2K+1lJxoEMe9Pd0w17khCWN15RyGicvgmYBVvRk5yTtugyBhp+SChO04C/39veGd9A+u3qOQo2KcyYKLq6Hsi7vZ5TOUpII6atW+6gWKCprqwdYvg7NpgbaCH6i/OVew83Ny8gXMyQOpukZdEDYVleiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjxlijdC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjxlijdC"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1644597a91.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783790742; x=1784395542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugZB/i0KODz7LjVxpNS2o9+IsebvBDh1j00dDHmDRsg=;
        b=rjxlijdCSywAB6Eef1qqa9tbO3rGMjbwaeE/YMsgfazxzG2K9f1/nu+sa5VMXEIzWt
         FnqZA0enGiocLS2hxoShlJ1tE1AYkDztDC/h2TeSuN818XrORvr8WbN3Fv8CwQdFnFVj
         I4NYSrw1elFWWW0ibzpZvj2UsF/YNC8NdAsj4xeGtGKnf7iblyE+p/pVpYxdlN0LxCZ8
         4lu8OzsIzvyz1THrgs5ZhTazlssfHuxZwp0+c1f23lwH/4foDUqKdvGGka62oNmG1bDp
         0i6sK6gM2IP9a2t8jTAwldR2QJuv8PRADPe4bpkdRG+/+dZiUZRIRixZrVsn0UXBVtvP
         eJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783790742; x=1784395542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugZB/i0KODz7LjVxpNS2o9+IsebvBDh1j00dDHmDRsg=;
        b=lwVc476MfsQV7xE1Tsg679gWZZpqXoDsHbG/pRIB63QdpLG0JFc0pl/jzOMc1hZBoj
         QfVnIaD73BUzwP4BTk/He07hyZxvenGbP9mNu1qO4xUnLnDr1H9KXBLAfwXhETHNH1ba
         pQ4eL8owjqtc15PWBPkBxoqkHEUsBmdhdqifiALtqzwS1AM3EsD3qfX9sXSfyfbyXw9s
         P55doYzFLITgwRR0cyjqoZE72y2Lyn0YzXNkJ3ZoA4xvvnRnJ0fV3BCfUQ5GfUtbXyph
         IQVC01qn/O+9YMKziq0tqC0Zb/NiM53S0ZmbQO1xqVWmqQqak+I646G898UP2+H81vHO
         9NHQ==
X-Gm-Message-State: AOJu0Yw2rRd9W5QFkcXWwxRcR6PxM2RBxf9bW2eY3zOKA4Y8NTbHq007
	n45i7oyEGPIdCRFkyuMhz1deBNVd8tbjVOsfJZ1g4YHWURw6d/UwcIhk
X-Gm-Gg: AfdE7cnJIvfD2WDZmZ75exACsK6nhvkz1ZlbMfHg0oPyIfHxqjwjtK7KyKD1xQjsiTb
	bG7d5os4qxr6a/9QUW5ph/d5QmJPoJveqNxdHizkMmCMeBuLiQR649mlEmcX+UJjGbbFw6ngKi8
	ch4rTz6k5c+Nfv+2niQLEYhSD+3cYUpUMzIZwHQqmRcXvYTpDvBGrZdkHeotL700Q/ko0xTLszv
	wW6YVXwNRTvUxnIn8jmCssifpiCRJZg4tFO71VG4VT+Ubt3etNqdGjTm3sON0bEiQyO0UM4smru
	TD4pyV2KSz8UjEKeRA4GDlm1HnfGqY14sq+fFqDO4erkSx5Jgr0UHlMtKPKkJAZuGcBrpMie/3I
	LYn3+e5fP4GP7gXUKc/4Iliw2qWb+Hau0kVbx0tFHm7ojjfw1Wmd7170m/f6OM95c3KA/gc47SF
	cSlC2nyjGvyr09E35Bkx8MQQ/D
X-Received: by 2002:a17:90b:28c3:b0:36d:8f51:fe29 with SMTP id 98e67ed59e1d1-38dc7a4072cmr3222385a91.17.1783790741645;
        Sat, 11 Jul 2026 10:25:41 -0700 (PDT)
Received: from omarchy ([110.235.219.201])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm20965789eec.16.2026.07.11.10.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:25:40 -0700 (PDT)
From: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix space before tab in comments
Date: Sat, 11 Jul 2026 22:54:01 +0530
Message-ID: <20260711172401.243212-1-pratapyashkulshrestha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a stray space before a tab in two comments in
rtl8723b_dm.c, fixing a checkpatch.pl warning.

Signed-off-by: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
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

