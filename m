Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CECB2CA0
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 17:14:37 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id o20so33389993eds.10
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 09:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DwRLv5H29GbAV6Kv9MVr4Rdwt+uLpu89Tpr+vCGYYpQ=;
        b=j1CPpLEkuliVU7NxMjE3+goGmyEf8DX0sJG0tkKIFX96p5IlHbNzXC/fsJ+9RPhNtA
         CbPp6fTjtaicZuqNBzI3eXLIgJjoui7+OcUTJQbCspMuNwBEsoaeaLwBWo9iK6CKbuGA
         64LOflnMEWBc345CEL2VsoxfLE539hG+KZtjnQS9mXWeCtK4jmsr7/sGbsu3FlsAE5Og
         0mYA6LPHXteXcR9wH9sdHKhZ9/q/Ng0U5sWMyCBjfVhWuz97ukMYJOOIfO57aOJWY5vR
         1hKxLdV7iKcYp2YDStdoi3aD6sz/KPiAlPscOi1aRxF4f4vqtO49Uf5IgYC25bksdnmD
         QNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DwRLv5H29GbAV6Kv9MVr4Rdwt+uLpu89Tpr+vCGYYpQ=;
        b=OS6YkCgDy6q9/vDJQJ7eS18nsnAhjWFP6UNtR5vnY0cVKtH4s+THONax07Z+z0XLCM
         Gwc+ZxdfvHF3iW3w01fBDg1+BNxZpVI9Wos1McoXCtzHHtPoUlp/noMOLX3jAzQ0RjZg
         3NqAUxpzdaxtVKQXo06gCp7o4wZS/S42SXL+n1CNqeJ8J3CWNIPZ9NFv0a8DimdGhNuR
         6uwhVKYRue2NgbHHba39rLmL3VbVYa599OygzaS7B4lVHb/H4DuF20wu8+lVDAwzPR/l
         etdv2b4RvYypZXena78aLJvcRMgvdvtQV2DWxrOpVjxUmGJYBEawQugkxkRqxPtVcfMK
         wuTw==
X-Gm-Message-State: AOAM532Env84tNm1+X1r1ZM+SA6Z7Q8nhxrXNRPpvB894Tdx83aMN+zU
	kgE5JbVSH73rNaJuYObL/fc=
X-Google-Smtp-Source: ABdhPJzwuoACsnDRuBh1aqAdibFzKDKKVRzUA0IjvIjdLyaYu0ggrsaw9HcqghV5Mu1/paOYSqBNzQ==
X-Received: by 2002:a17:906:b88f:: with SMTP id hb15mr39663359ejb.91.1638724475512;
        Sun, 05 Dec 2021 09:14:35 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id ch28sm6071773edb.72.2021.12.05.09.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 09:14:35 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 03/10] staging: r8188eu: remove macro PHY_SetRFReg
Date: Sun,  5 Dec 2021 18:13:35 +0100
Message-Id: <20211205171342.20551-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205171342.20551-1-straube.linux@gmail.com>
References: <20211205171342.20551-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro PHY_SetRFReg just re-defines rtl8188e_PHY_SetRFReg().
Call rtl8188e_PHY_SetRFReg() directly and remove the macro.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c                | 2 +-
 drivers/staging/r8188eu/hal/odm_interface.c      | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c    | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c    | 4 ++--
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 2 --
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 4cce9bf215f4..8779d5accf52 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -890,7 +890,7 @@ void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm)
 		return;
 
 	if (!pDM_Odm->RFCalibrateInfo.TM_Trigger) {		/* at least delay 1 sec */
-		PHY_SetRFReg(Adapter, RF_PATH_A, RF_T_METER_88E, BIT(17) | BIT(16), 0x03);
+		rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, RF_T_METER_88E, BIT(17) | BIT(16), 0x03);
 
 		pDM_Odm->RFCalibrateInfo.TM_Trigger = 1;
 		return;
diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 966712bd3bcb..b6f55709df9f 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -31,7 +31,7 @@ u32 ODM_GetBBReg(struct odm_dm_struct *pDM_Odm, u32 RegAddr, u32 BitMask)
 void ODM_SetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path	eRFPath, u32 RegAddr, u32 BitMask, u32 Data)
 {
 	struct adapter *Adapter = pDM_Odm->Adapter;
-	PHY_SetRFReg(Adapter, (enum rf_radio_path)eRFPath, RegAddr, BitMask, Data);
+	rtl8188e_PHY_SetRFReg(Adapter, (enum rf_radio_path)eRFPath, RegAddr, BitMask, Data);
 }
 
 u32 ODM_GetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path	eRFPath, u32 RegAddr, u32 BitMask)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 3d921767db91..99096a5d3041 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -771,7 +771,7 @@ static void _PHY_SwChnl8192C(struct adapter *Adapter, u8 channel)
 	param1 = RF_CHNLBW;
 	param2 = channel;
 	pHalData->RfRegChnlVal[eRFPath] = ((pHalData->RfRegChnlVal[eRFPath] & 0xfffffc00) | param2);
-	PHY_SetRFReg(Adapter, (enum rf_radio_path)eRFPath, param1, bRFRegOffsetMask, pHalData->RfRegChnlVal[eRFPath]);
+	rtl8188e_PHY_SetRFReg(Adapter, (enum rf_radio_path)eRFPath, param1, bRFRegOffsetMask, pHalData->RfRegChnlVal[eRFPath]);
 }
 
 void PHY_SwChnl8188E(struct adapter *Adapter, u8 channel)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 813dd938c817..45ab988e9be7 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -51,11 +51,11 @@ void rtl8188e_PHY_RF6052SetBandwidth(struct adapter *Adapter,
 	switch (Bandwidth) {
 	case HT_CHANNEL_WIDTH_20:
 		pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffff3ff) | BIT(10) | BIT(11));
-		PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
+		rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
 		break;
 	case HT_CHANNEL_WIDTH_40:
 		pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffff3ff) | BIT(10));
-		PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
+		rtl8188e_PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
 		break;
 	default:
 		break;
diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index 6b108800d8d2..467ee48fa49c 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -140,7 +140,5 @@ void storePwrIndexDiffRateOffset(struct adapter *adapter, u32 regaddr,
 	 rtl8188e_PHY_SetBBReg((adapt), (regaddr), (bitmask), (data))
 #define PHY_QueryRFReg(adapt, rfpath, regaddr, bitmask)	\
 	rtl8188e_PHY_QueryRFReg((adapt), (rfpath), (regaddr), (bitmask))
-#define PHY_SetRFReg(adapt, rfpath, regaddr, bitmask, data)	\
-	rtl8188e_PHY_SetRFReg((adapt), (rfpath), (regaddr), (bitmask), (data))
 
 #endif	/*  __INC_HAL8192CPHYCFG_H */
-- 
2.34.1

