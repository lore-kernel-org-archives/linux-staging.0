Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9634A341D
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194964; cv=none; b=sSXxjcfne/ega9nIwyzYeYSyRaLe2Omg/c+8U8vfDJaxaDeeMfvuH43QsxCqkhEGoOJak0wmai5EZ+pObjJ22ET6GJJ5FahKL4M7P9wIduawiMAwzGx8Lc4rPWTpAlQxuZ353tfgTUS+g+MaUYMAnDiHUz8x71ntfG5lFIovLpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194964; c=relaxed/simple;
	bh=rLqVdqYU4kgNlAqyfhoYLzvi7HV0gUMMcJn9xIwoYAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCZPf/+/EV2idLDugkGKVN3QKa+nbOX1L8pKxJ6JFrarJ7TG5o217sdlwOKwWwBH0GNe9qLzZ7bCBa5I4p/MoTV4hg/y3QshoHdw2dkFqHMOdazDZmDHeSsYu03PH0aPYXdqVq46VcIBd7c2jUnWkCuvuX1TfViEEvYmXybURqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gf8XP3dK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf8XP3dK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b613a17bso79389095e9.3
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194961; x=1781799761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEiB0XmALcOnAEYUYtjRH2eJbYZlUAjUMlAq8bx/wzg=;
        b=Gf8XP3dK3X6UHO0Jk7BROfe65YZHfkJ/PnDwp51nJZ6f6QLAnfwuMKZVPEA+fq8d0U
         Lm1ekEfpyjQ27q/A1LOvkUrxDtJ974BdfDkwdE+u+CxI6CsTqnmIrexLhlHahbGCj/ZQ
         AJ+OazdMSsykc4p3Yc5cVfwNbtY1t4q4In7Vf887R64RlRY4CLBLokWTrx7UGfyLQoGy
         GKSV75XZFYllucfd17FtpBT5aInhwoSczExz4M3avHd/VeaF8J9if1O01OKqQp5NmulM
         Z3JYROzCGLTFTrfoOdeEvbI2m+wUXoelPqiOceZ0PbdemKIPwZA/kD8/1PRuQe/S3s+a
         +DJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194961; x=1781799761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WEiB0XmALcOnAEYUYtjRH2eJbYZlUAjUMlAq8bx/wzg=;
        b=K3R/CCi1a+7DdNwow4jeNPEf54SxhWrTaO9sXRK+8Fb4bx0prIwidhGHcnFmD5vsDo
         0mcCAQhQh2PEErF5c4x5m5l+Q7LIg/huIP0PWLDPRI72IodU6Z4qCzZebD4majtUYi+N
         4R99xnJMC4ovSnCc+lWp6O4bWjw4oQd7q1dR57YEcb/65+/enkfl4LBjmpvN4q6mkPLr
         GG6arx71LtVsh2ML1t01e2Kef/PUa4zd6c2BVNPJZSs3v0sPK7BnPp+x3te5eSJQR9V/
         QQkdDyURQ2Z8wiyRXDCkO9q39TxJjO0orkNiiyIdXxV/vpRBV0rvkSgSB028Klh5lqMr
         /zVA==
X-Gm-Message-State: AOJu0YzLKwwXZb/qNga9djlYBdi0bCJpy3yk/ftPceITwKH66eBJD7rK
	Cfe8QRprZPGrkiiMfl2zpM80bZGOosslJo0UG2vmxOezzBXnPoj5CeD8YSrOVc4k
X-Gm-Gg: Acq92OFhmnWiFTXPI8s5iFtQ4k48smECv7c+30w/u9hPlHVp60el1cGO6TeHJ9hYPZZ
	7bBo5R8JSP051MV39jLiRSN2KcoO/vFnb3iuIU3WgLeHF8mQDBDy7nbBsVTkyMehxvrf11nu3T1
	+LrvAhcAJXGL6OC3F9znkGPuTWwxiH/aKs5wSxr80GyzmxGCKwWmS0jgZaHkJu6RHZJ4gaePQjL
	jA2tPJQ9uIMk5JU7fU00MkYjKNrVd0Nzqs9s2Lj0kSMimAi5I2T3cyORFAJcXr3628t6OefnNT1
	m1kFpJk27TuDEqueP0ASlEs5klt/n8a2EmTWHLVCR3oJFaahdNc2KkHY836Mv/zy9NFC6OnyIfZ
	5994oAmraGVte+1l/JqQaUOOEbwPMybjJwJSWTa2caJqrYLx+CY5iKyiIXZE34rfdvqLnFfF0xb
	LCvC1Ca7GJ3hMfNdnrfTaR98mW6g==
X-Received: by 2002:a05:600d:844e:20b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-490e5617b6amr36938585e9.24.1781194961280;
        Thu, 11 Jun 2026 09:22:41 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:ac27:e02b:2f26:8695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e46a75c8sm70344585e9.2.2026.06.11.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:22:40 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH 7/9] staging: rtl8723bs: hal: fix whitespace in rtl8723b_dm.c
Date: Thu, 11 Jun 2026 17:21:26 +0100
Message-ID: <20260611162128.57870-7-qstrydom0@gmail.com>
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
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 928226679ab4..c5f9f6a76294 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -42,7 +42,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
 
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
-	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
+	/*	ODM_CMNINFO_BINHCT_TEST only for MP Team */
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
 
 	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
@@ -80,7 +80,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	/*  Pointer reference */
 	/*  */
 	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
-	/* 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
+	/*	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
 
 	ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
-- 
2.43.0

