Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C872CAD
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 13:59:31 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y12so31768367eda.12
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 05:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DwRLv5H29GbAV6Kv9MVr4Rdwt+uLpu89Tpr+vCGYYpQ=;
        b=AeOJ1gDkvGtFxC5yp11D1aJE3b5pC2jHwg1z0HeKWs/kEcRbOXz7FY0m+grHnTZRQg
         9jzOxUP+EMSXUYoQUukCEr2qdpEl2rDbhRh92HKe9kAGbC5/79naS8w6oNRGBTJO0u7B
         5CZn41eC34Kq86TMEpFtYOj2MBEaDBepfNIgHCy8zLh7b8RQ/ZTHK3PLFKdJQsoT1jM7
         imLDPPJGWer2qdm+r2Hjtz1t46DXtwU+84TwSrBhNeCHvNH9wP9BqsSehNKREQQKnkEf
         7NpL26JgbwqEixoUCvD72G3cHefHi4JhOjKIurj6YtfaQR7eQK0KSCOua8ZSHu+ZZg5x
         HwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DwRLv5H29GbAV6Kv9MVr4Rdwt+uLpu89Tpr+vCGYYpQ=;
        b=CcxEFppUeHwDOSpWvl3T/g9E/lS94YUzilmDT2EO9n0abIVaW2tOKcSkWSTFjesIQj
         3VPDBPf6RzjveasftZfi72FsfqS8OHboiINPo54/PEqiwbYh1UxmWKi/BH9I75+rPdFq
         8glAqg5CECaxZ05+NH07zQB0axeHUrB53UV1QyIUwVaMQqtFCR31BeL4117ttI5kN/In
         sIQkL/WB8m1x9+3Mm1dXoutj6jyME9sNVDGpc4Kd38HviaRyE2LxuR7jXYP3RP0NCVxo
         C/Uvc1DecD+Z55AkgNiG36XfIjupxGMboki+x34BmPhZ8yiL/imB8gBW0EneyZkPVf8p
         +64Q==
X-Gm-Message-State: AOAM5314aPnGLGMagDCM7OG0RzlJuV821NROLHEmMmB3EbemqSnSftWI
	DlH+vo0QVbrMQW4UUxwqoSE=
X-Google-Smtp-Source: ABdhPJwiTEvfFy/PvMIVt1w7UD0Z+QQ7j13+kd3hFVFeNi0E3mMlh+hwLG6iO+mvJwBBszAIayrJug==
X-Received: by 2002:a17:906:d54e:: with SMTP id cr14mr38072571ejc.458.1638712769771;
        Sun, 05 Dec 2021 05:59:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id yd20sm5146451ejb.47.2021.12.05.05.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:59:29 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/12] staging: r8188eu: remove macro PHY_SetRFReg
Date: Sun,  5 Dec 2021 14:59:10 +0100
Message-Id: <20211205135919.30460-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205135919.30460-1-straube.linux@gmail.com>
References: <20211205135919.30460-1-straube.linux@gmail.com>
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

