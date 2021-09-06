Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35272
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:18 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id h9so14988340ejs.4
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PVe23R/MXbj1EQT1mw68UyAT1IyBFb9u3qdj7C6pqzY=;
        b=G4ov2cRPgl9DbjjTw5kDYo66aYKMQdjNzo0knh7SIW4R1uXyF8X7FTp059VLf7NkjE
         AOQgZPvtbcEocNjG7as/CbAOO9Kz/UJ7Z6aI/S83gCu1GD+qnnEuAH1irlVdIQ4r4ZM2
         aBs9AhEpxBGOKSnacQbEEQPlZkzHMTGZ/PdlAIBDMNNW6KXXksqFRa7hvLCuHW2K4JIo
         EdbacqMviUouO8eoDC0/vJPcuzRPCxwcvRsu3agIuL9Uh1JGHyEh3sEwRSGVfOlDH/Nm
         hpHbmfrjyH7HE0lQhobXRYsZSoF8k8crLPhp2KDLotEp30imOyGxLq3xhJHeSLi/j+GW
         VAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PVe23R/MXbj1EQT1mw68UyAT1IyBFb9u3qdj7C6pqzY=;
        b=bFXmY3oo8cndkf/MyYIn0Cb31w50ZZAKjBHqgLhXboe/T3CTpjCTA7PCX5nkRjXwft
         7Ho8PgEviOe//tUDc9KUKBFVJDLJ99SHwzCYS44l3a3Cn+U9n5i5LVW/Y8aVpwemW0dk
         A8bN/qA64kVpE7Oao1DZr9k0Rt7h8YHRTWfgTz6ABrlI+inbB6gsr1MGu8U7s4AEJzCm
         xvkmuWVvRyh+1338GrzNn/171VwdjrjYY+8YUy35v4nqWlGUrOBMIAF/ixato/FV9nLm
         iwstgVg5rdCV5nerx6PsA/XdGxJv3fqKg2C6XN50EE7Aa3Pz2OFdWwCcjKbnePtgat0K
         Pt0g==
X-Gm-Message-State: AOAM532tq9HdaU0q67YymbQnE4yTL48lSX2hSgH8DRY+9nBhRzc6BEz3
	pCcsSRn7IiVQK1E9FSSmomw=
X-Google-Smtp-Source: ABdhPJwRSLhP/uXLWasxU0qLhtkSgfY5KmaslI5IBDlGkLn4xC97s4fpGhRk/XO6UnSevEp9Cpsobg==
X-Received: by 2002:a17:906:608e:: with SMTP id t14mr14848952ejj.441.1630952716846;
        Mon, 06 Sep 2021 11:25:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:16 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 21/40] staging: r8188eu: remove EfusePowerSwitch from hal_ops
Date: Mon,  6 Sep 2021 20:24:19 +0200
Message-Id: <20210906182438.5417-22-straube.linux@gmail.com>
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

Remove EfusePowerSwitch hal_ops and call rtl8188e_EfusePowerSwitch()
directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c        | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 7 +------
 drivers/staging/r8188eu/include/hal_intf.h      | 4 ++--
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index e1a9c031435b..8388ec60d21d 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -82,7 +82,7 @@ Efuse_PowerSwitch(
 		u8 write,
 		u8 PwrState)
 {
-	pAdapter->HalFunc.EfusePowerSwitch(pAdapter, write, PwrState);
+	rtl8188e_EfusePowerSwitch(pAdapter, write, PwrState);
 }
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 04c382e698f9..c7edb9ba4085 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -757,11 +757,7 @@ hal_EfusePowerSwitch_RTL8188E(
 	}
 }
 
-static void
-rtl8188e_EfusePowerSwitch(
-		struct adapter *pAdapter,
-		u8 bWrite,
-		u8 PwrState)
+void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
 {
 	hal_EfusePowerSwitch_RTL8188E(pAdapter, bWrite, PwrState);
 }
@@ -1795,7 +1791,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->write_rfreg = &rtl8188e_PHY_SetRFReg;
 
 	/*  Efuse related function */
-	pHalFunc->EfusePowerSwitch = &rtl8188e_EfusePowerSwitch;
 	pHalFunc->ReadEFuse = &rtl8188e_ReadEFuse;
 	pHalFunc->EFUSEGetEfuseDefinition = &rtl8188e_EFUSE_GetEfuseDefinition;
 	pHalFunc->EfuseGetCurrentSize = &rtl8188e_EfuseGetCurrentSize;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index f85385cc9288..86456bac3a5a 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -177,8 +177,6 @@ struct hal_ops {
 			       enum rf_radio_path eRFPath, u32 RegAddr,
 			       u32 BitMask, u32 Data);
 
-	void (*EfusePowerSwitch)(struct adapter *padapter, u8 bWrite,
-				 u8 PwrState);
 	void (*ReadEFuse)(struct adapter *padapter, u8 efuseType, u16 _offset,
 			  u16 _size_byte, u8 *pbuf, bool bPseudoTest);
 	void (*EFUSEGetEfuseDefinition)(struct adapter *padapter, u8 efuseType,
@@ -221,6 +219,8 @@ void rtl8188e_SetHalODMVar(struct adapter *Adapter,
 			   enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 u32 rtl8188eu_InitPowerOn(struct adapter *adapt);
 
+void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState);
+
 void	rtw_hal_free_data(struct adapter *padapter);
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
-- 
2.33.0

