Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FA73FCC
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:20 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id mf2so14927226ejb.9
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=if2TfGl2pzTfpu2/Rwle744t3sR/+uE3qCTkrfC7NJo=;
        b=n8uSipS1k4vOTHYAQZQ5emmZFH8j+gWglDhfTCcXvNruqeayVTaHYnasW5GaXJJjkd
         JmkVGI+VWFOi3ccKtyfIEfkeQCkobgb25m6fmVYu+ZNEnFHEJ5LS6Y/PytRal1L7YwkV
         jcPSUuQqYlLp2SdrAiEAoZCrfXjVYgen3EP4m2Rg0H6jFJqbWSmYibx/J14Rve2eVfrC
         6/vReRQSdoxng/SYFa/b0ORAGO23ISoeppZPTRwOTbtXPw25fTlxZCQNB9T8CseEgazk
         2hBuQwJfJdaMagHD1dye9F5FZtHB2CXCK51oXSN4hnOApY2VyIjwQM0tPBxt6dq5D5PS
         4ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=if2TfGl2pzTfpu2/Rwle744t3sR/+uE3qCTkrfC7NJo=;
        b=OAIcaiIgnnXrAqDCXnIBR6DQA6I7KbCaefrn4XZEOi9kZAFsHfYOJPNqdNV9EgRqzI
         zFLOsuOZT3cocZ5/QcgqV6KvteyXdRXWjrCPvpwrf2ag/B/25YprJtkfoum8eNoc8/XI
         RdzMtHVcDx50gsNVQWnWIRXwVPfMDMyS/omzrZm+9K2zWh/iMEiiRvqp3xZUc7a1ZPCT
         Ro2J7jQKLsyfFBUD6r8xNYOgvQLQY8T/53rCP1gudId+CgUOUCF5Om8E61cihngf127D
         6LEbuGVA3fMSzDezMDFQ04cdqs6oCYfYokDvM3KhSWjFR+tzxrm/RHzHpef+MtZ/racy
         Uq9w==
X-Gm-Message-State: AOAM532mAiA1csqZpZZTG3K3wDcgQyHrN7iz0M5QtNymsXFczIhWuyRs
	t62OxhE4BjoOyejdeMgWPAOE6lDP9OljOg==
X-Google-Smtp-Source: ABdhPJy2huPP1hz72MPSNMMJjcVn0sACAZvn9PHe5CNUSc5dZ2KDq9m0vLnJjDLc4WL5bXUe0V5diA==
X-Received: by 2002:a17:906:c416:: with SMTP id u22mr14781400ejz.543.1630952719099;
        Mon, 06 Sep 2021 11:25:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 24/40] staging: r8188eu: remove ReadEFuse from hal_ops
Date: Mon,  6 Sep 2021 20:24:22 +0200
Message-Id: <20210906182438.5417-25-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ReadEFuse hal_ops and remove its wrapper efuse_ReadEFuse().
Call rtl8188e_ReadEFuse() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c        | 11 +++--------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c |  7 +++----
 drivers/staging/r8188eu/include/hal_intf.h      |  5 +++--
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 1aeddfa2f14d..faf6cefaa4f0 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -175,11 +175,6 @@ ReadEFuseByte(
 /* 					write addr must be after sec5. */
 /*  */
 
-static void efuse_ReadEFuse(struct adapter *Adapter, u8 efuseType, u16 _offset, u16 _size_byte, u8 *pbuf, bool pseudo)
-{
-	Adapter->HalFunc.ReadEFuse(Adapter, efuseType, _offset, _size_byte, pbuf, pseudo);
-}
-
 void EFUSE_GetEfuseDefinition(struct adapter *pAdapter, u8 efuseType, u8 type, void *pOut, bool pseudo
 	)
 {
@@ -450,7 +445,7 @@ u8 rtw_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 
 	rtl8188e_EfusePowerSwitch(padapter, false, true);
 
-	efuse_ReadEFuse(padapter, EFUSE_WIFI, addr, cnts, data, false);
+	rtl8188e_ReadEFuse(padapter, EFUSE_WIFI, addr, cnts, data, false);
 
 	rtl8188e_EfusePowerSwitch(padapter, false, false);
 
@@ -468,7 +463,7 @@ u8 rtw_BT_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 
 	rtl8188e_EfusePowerSwitch(padapter, false, true);
 
-	efuse_ReadEFuse(padapter, EFUSE_BT, addr, cnts, data, false);
+	rtl8188e_ReadEFuse(padapter, EFUSE_BT, addr, cnts, data, false);
 
 	rtl8188e_EfusePowerSwitch(padapter, false, false);
 
@@ -745,7 +740,7 @@ static void Efuse_ReadAllMap(struct adapter *pAdapter, u8 efuseType, u8 *Efuse,
 
 	EFUSE_GetEfuseDefinition(pAdapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, pseudo);
 
-	efuse_ReadEFuse(pAdapter, efuseType, 0, mapLen, Efuse, pseudo);
+	rtl8188e_ReadEFuse(pAdapter, efuseType, 0, mapLen, Efuse, pseudo);
 
 	rtl8188e_EfusePowerSwitch(pAdapter, false, false);
 }
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index b5d0cd332165..eed32dd6ee28 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -912,9 +912,9 @@ static void ReadEFuse_Pseudo(struct adapter *Adapter, u8 efuseType, u16 _offset,
 	Hal_EfuseReadEFuse88E(Adapter, _offset, _size_byte, pbuf, bPseudoTest);
 }
 
-static void rtl8188e_ReadEFuse(struct adapter *Adapter, u8 efuseType,
-			       u16 _offset, u16 _size_byte, u8 *pbuf,
-			       bool bPseudoTest)
+void rtl8188e_ReadEFuse(struct adapter *Adapter, u8 efuseType,
+			u16 _offset, u16 _size_byte, u8 *pbuf,
+			bool bPseudoTest)
 {
 	if (bPseudoTest)
 		ReadEFuse_Pseudo(Adapter, efuseType, _offset, _size_byte, pbuf, bPseudoTest);
@@ -1782,7 +1782,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->write_rfreg = &rtl8188e_PHY_SetRFReg;
 
 	/*  Efuse related function */
-	pHalFunc->ReadEFuse = &rtl8188e_ReadEFuse;
 	pHalFunc->EFUSEGetEfuseDefinition = &rtl8188e_EFUSE_GetEfuseDefinition;
 	pHalFunc->EfuseGetCurrentSize = &rtl8188e_EfuseGetCurrentSize;
 	pHalFunc->Efuse_PgPacketRead = &rtl8188e_Efuse_PgPacketRead;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 86456bac3a5a..e1bb1f30c7e9 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -177,8 +177,6 @@ struct hal_ops {
 			       enum rf_radio_path eRFPath, u32 RegAddr,
 			       u32 BitMask, u32 Data);
 
-	void (*ReadEFuse)(struct adapter *padapter, u8 efuseType, u16 _offset,
-			  u16 _size_byte, u8 *pbuf, bool bPseudoTest);
 	void (*EFUSEGetEfuseDefinition)(struct adapter *padapter, u8 efuseType,
 					u8 type, void *pOut, bool bPseudoTest);
 	u16	(*EfuseGetCurrentSize)(struct adapter *padapter, u8 efuseType,
@@ -220,6 +218,9 @@ void rtl8188e_SetHalODMVar(struct adapter *Adapter,
 u32 rtl8188eu_InitPowerOn(struct adapter *adapt);
 
 void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState);
+void rtl8188e_ReadEFuse(struct adapter *Adapter, u8 efuseType,
+			u16 _offset, u16 _size_byte, u8 *pbuf,
+			bool bPseudoTest);
 
 void	rtw_hal_free_data(struct adapter *padapter);
 uint rtw_hal_init(struct adapter *padapter);
-- 
2.33.0

