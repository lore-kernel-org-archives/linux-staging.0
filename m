Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158122CA3
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:30 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v7so46496322wrv.12
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=db2QjV6BwCz+v1VxPsNmHOvJO2uVgbYB/DpowETnxnc=;
        b=k4wD0apR7MaJzbZeGXlwqLey3O9QcLMzN+9l0F6W6/MVnsWwEwtpVofErtEbv6Rqgp
         Ld7FzcnA8xvj1PNJFde78PebL7y/PWmUFfRu4Vb0IZTsolnfIiNgWORFc4JgwhSSQ/gj
         8tv9wyJLn5fbTYztiQUNVJ51bMiDEjG4KGE9xivCMiKsdvbbg91Z09thZQ1OdeATMoCR
         2jSUWxwkpfChNS+gQ3fsrIPVNOQw1KjV9QAFtcMc5E78akYtlH9BDnATQcVNQ6a1TeHI
         neRLAYTIfer7EBDjhBCrup+TaZ1ldXDCELzamKwQqQu9TZqTE2Qh8Q061SISPeiH/5eo
         1xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=db2QjV6BwCz+v1VxPsNmHOvJO2uVgbYB/DpowETnxnc=;
        b=YiSuDdrh4ZIuYM2Jgp9PKip9p1rAqIi+9TEilkxibX3In8gxQGikBmZKcbEVIusSin
         6jDpAzVs/yf7YWEuYP262pi9UW+0x8UwVnodlyf/1SBIW4IF3nxyTD+LaDgVCdbbXrEy
         yv7y6RnPIL1NVUEbkvKEbLDl4cZUBZ+oKIc0R8uUB03uE98TRXXOftnmgFTTS6qQdll5
         tBsDirEKgOTBP50XFStso2KEW0ugfT1IV/ak8Sm7bPwDvvkwhRo9H7YlfZE48sBCqKyk
         fIhDwO79L3NLGSXcagAqebMuEEnGz8Idw3G5Z7tjimyNWE5TcG/ILMAwWTINzlgC6l1f
         h3VQ==
X-Gm-Message-State: AOAM531E8iTaR+XsBoIG/iZ/9mKaCDf99JJWlrxO8p5IeV55MteyzvlW
	jkblai1SRw6z5XEJKMBX9HikPhCC/3Y=
X-Google-Smtp-Source: ABdhPJwcmSixa2+MyNljhjCs+g83TJjcBvV7MF11Rz4TQGr4PxPCtLk1HNIMpBR5lJRJBCc9obMPOA==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr21748530wrt.161.1640811088439;
        Wed, 29 Dec 2021 12:51:28 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:28 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/32] staging: r8188eu: remove ODM_GetRFReg()
Date: Wed, 29 Dec 2021 21:50:39 +0100
Message-Id: <20211229205108.26373-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ODM_GetRFReg() is just a wrapper around rtl8188e_PHY_QueryRFReg().
Remove ODM_GetRFReg() and call rtl8188e_PHY_QueryRFReg() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c    | 2 +-
 drivers/staging/r8188eu/hal/odm_interface.c     | 6 ------
 drivers/staging/r8188eu/include/odm_interface.h | 3 ---
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 9694893fadcc..f6f99b2acc01 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -137,7 +137,7 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 	/*  <Kordan> RFCalibrateInfo.RegA24 will be initialized when ODM HW configuring, but MP configures with para files. */
 	dm_odm->RFCalibrateInfo.RegA24 = 0x090e1317;
 
-	ThermalValue = (u8)ODM_GetRFReg(dm_odm, RF_PATH_A, RF_T_METER_88E, 0xfc00);	/* 0x42: RF Reg[15:10] 88E */
+	ThermalValue = (u8)rtl8188e_PHY_QueryRFReg(Adapter, RF_PATH_A, RF_T_METER_88E, 0xfc00); /* 0x42: RF Reg[15:10] 88E */
 
 	if (is2t)
 		rf = 2;
diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 6c29122553b5..bf82f40cca24 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -22,12 +22,6 @@ void ODM_SetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path	eRFPath, u32
 	rtl8188e_PHY_SetRFReg(Adapter, (enum rf_radio_path)eRFPath, RegAddr, BitMask, Data);
 }
 
-u32 ODM_GetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path	eRFPath, u32 RegAddr, u32 BitMask)
-{
-	struct adapter *Adapter = pDM_Odm->Adapter;
-	return rtl8188e_PHY_QueryRFReg(Adapter, (enum rf_radio_path)eRFPath, RegAddr, BitMask);
-}
-
 /*  ODM Memory relative API. */
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u32 length)
 {
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index b4af86ac5bd4..aabc33927a30 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -20,9 +20,6 @@ u32 ODM_GetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask);
 void ODM_SetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path eRFPath,
 		  u32 RegAddr, u32 BitMask, u32 Data);
 
-u32 ODM_GetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path eRFPath,
-		 u32 RegAddr, u32 BitMask);
-
 /*  Memory Relative Function. */
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
-- 
2.34.1

