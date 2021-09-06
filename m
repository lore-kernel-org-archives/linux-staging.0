Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F413FCC
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:19 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id dm15so10596546edb.10
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0JLjw1LG1EqFWNQ8nBF3vVHD63NcJfn88butHEvinAA=;
        b=DJTGOYKHQ6MYP/TqXBx1jxyCH//7WBHt8GoLzIGJaa9HKqqf+hD3TxD5rmxaCNO5W1
         PMQvg6BJE77H3VRcVTqPQ5Cz1v8VdDyWpvTC0/6vcJlDa1jD5K2xGQGjzgE+cb4DXKUk
         pM3zRBY0Gzz0HBs8Akl/r974TmvBnhlUzhy/DH3zB5arymvax6NKJrA+TPy/pvHn4Kin
         MRCF5TneXD3/xoNdU0qaate+uLP11oscWnrld+VAUGwWjlCj+HJULGdNU1bGa8H6PJt/
         1MBlaihVnA4SRqmGlG5zLeDOy1CQGZ2itstyv/TVOYvjwXgDDfikGK+zY9sxRFW9Dt8o
         OmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0JLjw1LG1EqFWNQ8nBF3vVHD63NcJfn88butHEvinAA=;
        b=MhMC/rVGUGiEZ6UEk0CDDNByObwVeYN/N4vxknUcfSJU+8NWPYSUS2PDw2H33W6yx0
         ncK/OrlnspWIHub2twgjWPhhN1Is8vh1TZQQcEOmBdx6/s+4N9CCbDQbJBWeJ0qQxPiV
         /J5fQNTI4bF0WrZOgLDVZLflFfbrCxlnFEdTw8dNudYtSdTovr8Q/a1Z0wJOmlDprb9E
         M+DVxCAqaZTk6UnGSZLJOz5MJita78zwyup8qh36POTfhNXvNOZLSQ97hesDS8NeSiHr
         FWIxKE0h3Dub4fHuMIOgcve5N7VnPH4v/UMA3CkOzvJk+2CthZSBo9KkamyyNzQV559v
         ZZeA==
X-Gm-Message-State: AOAM5338gm9vmnpneNf9LQTgbRly5wyrMGT/zk0dau02D/DXFpMybRrQ
	NyjGUXk2my9kxI1f4kWgAAk=
X-Google-Smtp-Source: ABdhPJwy1kGZY+hwygDqCZEKBsPOnUTAyc6cToJRjJS3jkHzhibkd9JmtUCKwY+2CNvxbKZvDQBPqw==
X-Received: by 2002:aa7:d9c9:: with SMTP id v9mr14363322eds.270.1630954458023;
        Mon, 06 Sep 2021 11:54:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 21/40] staging: r8188eu: remove EfusePowerSwitch from hal_ops
Date: Mon,  6 Sep 2021 20:53:08 +0200
Message-Id: <20210906185327.10326-22-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove EfusePowerSwitch from hal_ops and call
rtl8188e_EfusePowerSwitch() directly instead.

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

