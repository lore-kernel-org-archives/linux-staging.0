Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2F3FC5
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:58:01 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id z2so101341wmc.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lzHnNkAh1DHRmaLR4iPYetckB/XzF4D+KKJY3oJx0yk=;
        b=CzQQhAEVoUKzXELc1NOL6Swp4HnNMU92pZSechY8fZvJlPhPqohDKeo/1gQig7eQAP
         GCUoAt425TDqys33IzcIVerqrt6b1sZCBLFaySfx85vrRjsUi2lbSX8kX8IQkPQx8QNE
         CHY+3e3SdC17KmBfbRD24RCJVZYL8TZkovz6U/ue7ByTiv41i6CO8UETcradqqTnv02F
         D+TxfUqKU9/TG/nTDI5m8NJuy1EMfRBq+p6R0b9Opu0+OLUYb0YOtgrI+hFteJooSdj2
         jCVJtwjXTXVW8xoiH9WXNhdLqykUDClzABGlHGZLz7mD+vLN3jCDZoxiLpE3hGMutzzJ
         Mk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lzHnNkAh1DHRmaLR4iPYetckB/XzF4D+KKJY3oJx0yk=;
        b=Odxz9OdjBTUOQO9A1+wUptNdVP4ret/MVhvJezsR9soWdU+Klho/GfYEra4VCQ6ENE
         0tLuJZsvfugQYxizGzECMx+N1DFP/OWyyjb3SQTP1lpWN/uyaS7cxvEYWxgp2D1vLVOn
         PWjd7ej3BUh+chynHbkt88lBBTnvVWkyXDjNigxLetNGV3szaUW1RUSZCKwoDG6PKxyd
         182GCwRHbGuU9tA7RceZTAOx1yVL6BPetYtSiBekGIqjP/oHOhj6OC4o634t4O7dHofG
         N6+lVIcn3f9xFhYu90ffqVhoFda8LcV0mz7YUO44e39pPhDEYcS2jx/XijMx7IFfkc5A
         IT0A==
X-Gm-Message-State: AOAM531qX47OwLYldLKqQ4NVs4BtzlTm0wp+YDN6cFFLAzJubtinq8Zx
	WoWe1A7yTuat5VRq6le9Rpg=
X-Google-Smtp-Source: ABdhPJwcdzBdyo6ce5Nixl2yUU0CSnvXsH9Rap/wg0J1H3/KLAKhDNdOL0wjpPyD6QTVQSyc5mRwRg==
X-Received: by 2002:a1c:1dcd:: with SMTP id d196mr14199664wmd.9.1631959080062;
        Sat, 18 Sep 2021 02:58:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id o26sm13013287wmc.17.2021.09.18.02.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:57:59 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/8] staging: r8188eu: remove HalDetectPwrDownMode88E()
Date: Sat, 18 Sep 2021 11:57:24 +0200
Message-Id: <20210918095727.13591-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918095727.13591-1-straube.linux@gmail.com>
References: <20210918095727.13591-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function HalDetectPwrDownMode88E() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 19 -------------------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  2 --
 2 files changed, 21 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 179dc209a68f..b271b2e54d0f 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -2154,22 +2154,3 @@ void Hal_ReadThermalMeter_88E(struct adapter *Adapter, u8 *PROMContent, bool Aut
 	}
 	DBG_88E("ThermalMeter = 0x%x\n", pHalData->EEPROMThermalMeter);
 }
-
-bool HalDetectPwrDownMode88E(struct adapter *Adapter)
-{
-	u8 tmpvalue = 0;
-	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
-	struct pwrctrl_priv *pwrctrlpriv = &Adapter->pwrctrlpriv;
-
-	EFUSE_ShadowRead(Adapter, 1, EEPROM_RF_FEATURE_OPTION_88E, (u32 *)&tmpvalue);
-
-	/*  2010/08/25 MH INF priority > PDN Efuse value. */
-	if (tmpvalue & BIT(4) && pwrctrlpriv->reg_pdnmode)
-		pHalData->pwrdown = true;
-	else
-		pHalData->pwrdown = false;
-
-	DBG_88E("HalDetectPwrDownMode(): PDN =%d\n", pHalData->pwrdown);
-
-	return pHalData->pwrdown;
-}	/*  HalDetectPwrDownMode */
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 94d5992cca19..24f21b1ed396 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -407,8 +407,6 @@ void Hal_EfuseParseBoardType88E(struct adapter *pAdapter, u8 *hwinfo,
 void Hal_ReadPowerSavingMode88E(struct adapter *pAdapter, u8 *hwinfo,
 				bool AutoLoadFail);
 
-bool HalDetectPwrDownMode88E(struct adapter *Adapter);
-
 void rtl8188e_read_chip_version(struct adapter *padapter);
 
 void rtw_IOL_cmd_tx_pkt_buf_dump(struct adapter  *Adapter, int len);
-- 
2.33.0

