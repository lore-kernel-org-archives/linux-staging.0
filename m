Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D672
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 12:40:54 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so1068959wmh.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 05:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rFOg8bqZyRLA4mRQrxSLmG6Io/0U0jui7FnvueE0nGg=;
        b=atn2Km+ysspAX3kg8P23bi4eQJ+Bi0fvQ8zdDv4dzmsD8pDEHahEilNjg+lJHTOLTB
         VG9oK8DVzSE8E2KuKxamaAtnssD8W1FDilTt21wEGy+f4mDual4tJpEMtVOuIaSCIvWI
         N7Ipu/CbFe3RrsYitz3lQa3f6mNhTzndyELVwnvpUlhDfQTriQ3O2HabWxqGrERyJyW2
         2J034zi8n27zpIU9QbeecZfyRfuEOTA9H0FPMdtIamgt85SwITKnvVwTzdORChQnipju
         PUcqw4Jnjnkv3XNnfKvyaeozjcwX2ZTvtu8IJD4uFQ3Q9VMZxJYI2Olq2fv4f53mP6wY
         93Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFOg8bqZyRLA4mRQrxSLmG6Io/0U0jui7FnvueE0nGg=;
        b=DJncdrjH3GgLjlM2chOOP27yHBD+35/sxSwxJIrp8NGxiwjUNfDq576YHLcHtIS4Tq
         TIrfchWhxks4eYzXdxlKnzmUwl02xjvw/BO6YHsLSRZ6hO+ZII1192xjbykJq3aX/oM7
         3NeiZmpGmSAzQTT6QAS8GPE5JVhN13S0AMUhPbY/VzXtwFKGHq8mIVfUm3AiqbkLqe2w
         CGeBvkvT5a1M3xNMCIC6B3X0QBciZMKcJiy7E2Ei8ghP2TMEH1YqlUIMxViapljF4L3m
         ZI9L2RvisCQvqOV+LVmIv4xbw01P2VmOtgEslfxh6N94cYV7QO1iYBhChkSfoCSYr/xW
         9aog==
X-Gm-Message-State: AOAM5313Hq+Cp/eOlyrpek09FtkJvqM8ZsmWYSiOAXwLKNIFQtvrjE+l
	5e2Xs+U4wDiAGJCR06NabEIzrztxWDfMaQ==
X-Google-Smtp-Source: ABdhPJysSfhayVZobpyRzLRCPp2GZkBDh/8tCFBhc5VJOwtqWBeTlDI5Hxl0bCwn5VKsk106zWhmHg==
X-Received: by 2002:a05:600c:1c11:: with SMTP id j17mr3204791wms.138.1630759252945;
        Sat, 04 Sep 2021 05:40:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id j207sm2094071wmj.40.2021.09.04.05.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 05:40:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/6] staging: r8188eu: remove read_adapter_info from hal_ops
Date: Sat,  4 Sep 2021 14:40:29 +0200
Message-Id: <20210904124033.14244-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904124033.14244-1-straube.linux@gmail.com>
References: <20210904124033.14244-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove read_adapter_info from hal_ops and remove its wrapper
rtw_hal_read_chip_info(). Call ReadAdapterInfo8188EU() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 6 ------
 drivers/staging/r8188eu/hal/usb_halinit.c  | 3 +--
 drivers/staging/r8188eu/include/hal_intf.h | 4 +---
 drivers/staging/r8188eu/os_dep/usb_intf.c  | 2 +-
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index f52c77279f3d..f58dd3da6c13 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -6,12 +6,6 @@
 #include "../include/drv_types.h"
 #include "../include/hal_intf.h"
 
-void rtw_hal_read_chip_info(struct adapter *adapt)
-{
-	if (adapt->HalFunc.read_adapter_info)
-		adapt->HalFunc.read_adapter_info(adapt);
-}
-
 void rtw_hal_read_chip_version(struct adapter *adapt)
 {
 	if (adapt->HalFunc.read_chip_version)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index df1887bf29eb..d34d26de69d9 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1215,7 +1215,7 @@ static int _ReadAdapterInfo8188EU(struct adapter *Adapter)
 	return _SUCCESS;
 }
 
-static void ReadAdapterInfo8188EU(struct adapter *Adapter)
+void ReadAdapterInfo8188EU(struct adapter *Adapter)
 {
 	/*  Read EEPROM size before call any EEPROM function */
 	Adapter->EepromAddressSize = GetEEPROMSize8188E(Adapter);
@@ -2250,7 +2250,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->DeInitSwLeds = &rtl8188eu_DeInitSwLeds;
 
 	halfunc->init_default_value = &rtl8188eu_init_default_value;
-	halfunc->read_adapter_info = &ReadAdapterInfo8188EU;
 
 	halfunc->SetHwRegHandler = &SetHwReg8188EU;
 	halfunc->GetHwRegHandler = &GetHwReg8188EU;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 6740a6570e6a..9845b6f7378e 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -152,8 +152,6 @@ struct hal_ops {
 
 	void	(*init_default_value)(struct adapter *padapter);
 
-	void	(*read_adapter_info)(struct adapter *padapter);
-
 	void	(*enable_interrupt)(struct adapter *padapter);
 	void	(*disable_interrupt)(struct adapter *padapter);
 	s32	(*interrupt_handler)(struct adapter *padapter);
@@ -267,6 +265,7 @@ struct hal_ops {
 void rtl8188eu_set_hal_ops(struct adapter *padapter);
 
 void rtl8188eu_interface_configure(struct adapter *adapt);
+void ReadAdapterInfo8188EU(struct adapter *Adapter);
 
 void rtw_hal_def_value_init(struct adapter *padapter);
 
@@ -284,7 +283,6 @@ void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 
-void rtw_hal_read_chip_info(struct adapter *padapter);
 void rtw_hal_read_chip_version(struct adapter *padapter);
 
 u8 rtw_hal_set_def_var(struct adapter *padapter,
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index d4765205ae26..bf7ef56d12e3 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -605,7 +605,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	rtl8188eu_interface_configure(padapter);
 
 	/* step read efuse/eeprom data and get mac_addr */
-	rtw_hal_read_chip_info(padapter);
+	ReadAdapterInfo8188EU(padapter);
 
 	/* step 5. */
 	if (rtw_init_drv_sw(padapter) == _FAIL)
-- 
2.33.0

