Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E6E2CA0
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 23:01:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id r9-20020a7bc089000000b00332f4abf43fso11751817wmh.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 15:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o/dlIZ2W9ErrYeXmNmX8JFAF4ieV2UL7KTfq7myAV3g=;
        b=cNgssUGA+LHF93gzzIh/6Mxl5v+Xa1PvcSI7QpLPmSkgTavA7hXStqGM/Dzg5qJAzi
         crOlIgF0k/vNBr4Eg5nxIzrExwDmONTRGj6JxzAEFbMPy/nJzd6ANDGoV95Ki8A9Q4M0
         oHYAqGMSgTSlXSdGMk2cGIOuRNOELpR2qcuoauSXPuq6mEuh6xxsfU0aABW8TISB5LbJ
         bjufzFOxwQ0+XL/X49FKA34FzajHIQzsWyqId/4vDzOJODiVn3q1unm15DTbn4ifBf2R
         ES37PUNhdOGtgb0zg/piqZSnZNm9DfkM5xUtANkLJgcRLccE4b/ym/71XlzPFGuKkfvq
         F91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o/dlIZ2W9ErrYeXmNmX8JFAF4ieV2UL7KTfq7myAV3g=;
        b=U08ZSZXVuDBHl00qM1CGssl2KcDmcKJ7UYEZ3Tndn1SmA5FR5eN2YnbC7KZa9nWH00
         6+f0SqB29cmfL+LZZmZ8mC/yykI1mle4JNcIbLndEtVx2J5iFBpF7fg045l6L0D3nYLF
         Rei+XAAfADBarP18m4KomLFZE8fu/hkKRcx37RKvGD8Q6TUSsXVJY2//vZdOJY+ZEzc9
         e7gnzI+Dw/aUFMeUvcEomojZg1KfBdFiTqkQvjr51nwf8fPTsTV5P/zBb17aPm+Fvzh9
         rdTfpYTTfdnHbFz06akeU6oMyEIZRTiQ8DviaOIHPfNYTokLz6qydYBsgrZmjl7AH3rJ
         CaWQ==
X-Gm-Message-State: AOAM532e5Z2r6CoxdC3zNrTYM53JNJmJF+n4y0fuY0jvqt4YfbJe1P5x
	M+rrggiqR2yf8zw8IzOqYdg=
X-Google-Smtp-Source: ABdhPJxQNEhggO2g/vl4YZFmMLuWfB/s4jkYy1tm5zCmPajRGYNagQqnq7O9NFzVO1So9LralSnLLg==
X-Received: by 2002:a05:600c:1c1a:: with SMTP id j26mr987750wms.28.1638226891538;
        Mon, 29 Nov 2021 15:01:31 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8754])
        by smtp.gmail.com with ESMTPSA id n4sm17204891wri.41.2021.11.29.15.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 15:01:31 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: RFType is set but never used
Date: Tue, 30 Nov 2021 00:01:25 +0100
Message-Id: <20211129230125.27247-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RFType is set but never used. Remove it from struct HAL_VERSION and
remove the now unused enum HAL_RF_TYPE.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c |  1 -
 drivers/staging/r8188eu/include/HalVerDef.h     | 12 ------------
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index eeb5f46687e2..9ef73b62f94e 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -846,7 +846,6 @@ void rtl8188e_read_chip_version(struct adapter *padapter)
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
 	ChipVersion.ChipType = ((value32 & RTL_ID) ? TEST_CHIP : NORMAL_CHIP);
 
-	ChipVersion.RFType = RF_TYPE_1T1R;
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
 	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK) >> CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
 	ChipVersion.ROMVer = 0;	/*  ROM code version. */
diff --git a/drivers/staging/r8188eu/include/HalVerDef.h b/drivers/staging/r8188eu/include/HalVerDef.h
index 796a44a1e697..1d96657e6a98 100644
--- a/drivers/staging/r8188eu/include/HalVerDef.h
+++ b/drivers/staging/r8188eu/include/HalVerDef.h
@@ -24,22 +24,10 @@ enum HAL_VENDOR {
 	CHIP_VENDOR_UMC		=	1,
 };
 
-enum HAL_RF_TYPE {
-	RF_TYPE_1T1R	=	0,
-	RF_TYPE_1T2R	=	1,
-	RF_TYPE_2T2R	=	2,
-	RF_TYPE_2T3R	=	3,
-	RF_TYPE_2T4R	=	4,
-	RF_TYPE_3T3R	=	5,
-	RF_TYPE_3T4R	=	6,
-	RF_TYPE_4T4R	=	7,
-};
-
 struct HAL_VERSION {
 	enum HAL_CHIP_TYPE	ChipType;
 	enum HAL_CUT_VERSION	CUTVersion;
 	enum HAL_VENDOR		VendorType;
-	enum HAL_RF_TYPE	RFType;
 	u8			ROMVer;
 };
 
-- 
2.34.0

