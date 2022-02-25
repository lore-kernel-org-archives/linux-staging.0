Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3801FD0
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 12:09:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id vz16so10552483ejb.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 04:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F/0Tpma1+c58CxkGgoTiooSWiLa2l3OoqAh72W5S0p0=;
        b=lc5tHjGwjczL0DtyLw4mzRM9otfPXURnRevfnnvFl2gbYXktOiWtqHMeoKm/OdIE7O
         qLRQ/GWAByfkZEt17l7xAKhDuYnCVjOZdpZAGB0JqhSRgVuaE/6z5BjzPeeAAep47Mno
         QXurTwms1fRtJEi0feymKflRJ977eRKWy7MKYIJqjxnrePRuhCk95lOCRx74hzgyBOFi
         krkx/C+OLd61C8LA3p2ibu2VlyRBymYDh+HI6EzzMgzYs9qjwc7YfbKEc1FiTwHGRHBp
         kSJZ7wsV4bbyAqQsPWR3BWLXLNmcWruMYD0k4U70GFpLPEKqIbqegadfb9xGTGtBCeLo
         Vgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/0Tpma1+c58CxkGgoTiooSWiLa2l3OoqAh72W5S0p0=;
        b=nJLfh+ERXem9X5f0EIf07Pu4CQ5RRhAwyP3pSSiN7wwGHCemUYDRnAmsvjhBPbgoU9
         rAUT0oRohRGOodqmvog2rkRVKRRDe2XJyBIBtw3GL2sK2nimmrhxUn4EkGnq/C88IFe1
         /34GCegemMDjhoerdku0HTw3F7iUDgS7L5JRYpYVGqOpdz0uuCMckd9rTxHzLvU517bD
         brDrK//dNVmT4hbe0oI9KCyR8iF9enY6xPMDtSsJOjM8nBUZ6CC0ju+eNRxa3s0P+RuV
         OOheTvb1lY09g3rRKSO5chGCwLCC/56OWXzuY/JSSljORM9Xb6n+bnsnuEQeC/4a44px
         /nmA==
X-Gm-Message-State: AOAM533oFxBGXnv1JsvB1SI6OQd+ZEJQ/OkPe7p2W6vRLLBlrEszc2O5
	zmEASo5YDu9bJT1DvCqLkmE=
X-Google-Smtp-Source: ABdhPJwsOET7ecJJ2Nk8Dz000sAe1IOPZ/EgNTd3A/3kk09FC2FdxWVZgIundK91V+E6tRAu+OwzPQ==
X-Received: by 2002:a17:907:3f95:b0:6d3:feb2:ef88 with SMTP id hr21-20020a1709073f9500b006d3feb2ef88mr5861463ejc.480.1645790942264;
        Fri, 25 Feb 2022 04:09:02 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8d.dynamic.kabel-deutschland.de. [95.90.187.141])
        by smtp.gmail.com with ESMTPSA id y14-20020a50eb8e000000b00410a2e7798dsm1229418edr.38.2022.02.25.04.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 04:09:01 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: EepromAddressSize is set but not used
Date: Fri, 25 Feb 2022 13:08:40 +0100
Message-Id: <20220225120843.10674-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225120843.10674-1-straube.linux@gmail.com>
References: <20220225120843.10674-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EepromAddressSize in struct adapter is set but not used. Remove it and
remove the now unused function GetEEPROMSize8188E().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 15 ---------------
 drivers/staging/r8188eu/hal/usb_halinit.c       |  3 ---
 drivers/staging/r8188eu/include/drv_types.h     |  1 -
 drivers/staging/r8188eu/include/rtl8188e_hal.h  |  1 -
 4 files changed, 20 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index cf58dfc3ff4d..fc47f1b596cc 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -535,21 +535,6 @@ void hal_notch_filter_8188e(struct adapter *adapter, bool enable)
 		rtw_write8(adapter, rOFDM0_RxDSP + 1, rtw_read8(adapter, rOFDM0_RxDSP + 1) & ~BIT(1));
 }
 
-u8 GetEEPROMSize8188E(struct adapter *padapter)
-{
-	u8 size = 0;
-	u32	cr;
-
-	cr = rtw_read16(padapter, REG_9346CR);
-	/*  6: EEPROM used is 93C46, 4: boot from E-Fuse. */
-	size = (cr & BOOT_FROM_EEPROM) ? 6 : 4;
-
-	netdev_dbg(padapter->pnetdev, "EEPROM type is %s\n",
-		   size == 4 ? "E-FUSE" : "93C46");
-
-	return size;
-}
-
 /*  */
 /*  */
 /*  LLT R/W/Init function */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 0704fa3156af..0a720fa7ca78 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -835,9 +835,6 @@ void ReadAdapterInfo8188EU(struct adapter *Adapter)
 	struct led_priv *ledpriv = &Adapter->ledpriv;
 	u8 eeValue;
 
-	/*  Read EEPROM size before call any EEPROM function */
-	Adapter->EepromAddressSize = GetEEPROMSize8188E(Adapter);
-
 	/* check system boot selection */
 	eeValue = rtw_read8(Adapter, REG_9346CR);
 	eeprom->EepromOrEfuse		= (eeValue & BOOT_FROM_EEPROM);
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 894e70a0d506..09fc27082f7c 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -177,7 +177,6 @@ struct adapter {
 	s32	bSurpriseRemoved;
 	s32	bCardDisableWOHSM;
 
-	u8	EepromAddressSize;
 	u8	hw_init_completed;
 	s8	signal_strength;
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 44321a53a345..82cb4f7f4d3e 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -176,7 +176,6 @@ struct hal_data_8188e {
 s32 InitLLTTable(struct adapter *padapter, u8 txpktbuf_bndy);
 
 /*  EFuse */
-u8 GetEEPROMSize8188E(struct adapter *padapter);
 void Hal_EfuseParseIDCode88E(struct adapter *padapter, u8 *hwinfo);
 void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *hwinfo,
 			    bool AutoLoadFail);
-- 
2.35.1

