Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504A66E
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:49 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g20so13451543wmk.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H55WDptEiQrv8TXT9gk29mPs/nM5LM8qRFLo61JtfMc=;
        b=bICMFBknSRpI4JPAn/2sdYhJut2sNfhp2na/BLxtJhf0GpGlZMYy9+hB6XI0rXg9y4
         liA2THfsLB3Qm+TX9cj8Mr1xr+WYNZIoY5vwH4bsqPq9+zsuGsJO0ZjsgwLQofkhImnU
         0rz2NA/RP+FLSTdHJWvDgb/h50mX2CYHlfE/NpYRPXwSY/o2jci2CiT7/RMWgqDl3Ryq
         /HrCVf8tuben9/h8ED3d1nI31fvao408V8xEOEhcEnDG/UVoJE03JFqmk8hiSMXvpcGe
         6TL7u5Cx1lB/QyX5OkoDa1N2cD/zcT2qdQBATx36UGDIL1HpoauBeVAujg585POeFx/E
         o/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H55WDptEiQrv8TXT9gk29mPs/nM5LM8qRFLo61JtfMc=;
        b=Xx2JNybsG7EG2Mj8FgoguaeMlv//QATRvx8Ed014kYxb2rujPH0Gkw+UiLBbGg1NUv
         jn7oEnHB+fxoqjrtnPQD7VTHBx+WY9RdXoIxABDMlgIVwkOjQVGdYqF4Y5IkMbPxFRay
         4sGC6OUsGDffkabs/lSgAKIlI8BGcD7lFXZZsaT6mTuSA9XI9CfvohSusvtpY9jRDiWJ
         5n26MtzPFaLz8loOmiPy2B8IgVzmcwt3TYkwNWBs5otcyvVdpnk06Ed6ljCrIPbx1jEf
         71+ObMG2fb+ffAa15pN38p/rMvLwFPDccICfBEEoIKrRJvcZ78k2gJDEVH0mAO+XiEgt
         bnxA==
X-Gm-Message-State: AOAM5330KHFK4rVAzheTi+7/6G+KUMpb8Fv0524PPF/rzJIkoLGEpLjN
	SHT9N9Pi+pM4hT1WF4r5pH4/rkr7E4I=
X-Google-Smtp-Source: ABdhPJwzi2FR9CnZApTCwQsH2bZKWC7S6Urj2ndCIm6Tplvqr110Mgr/Z/ProeT1h72Fm+uHJsdqyQ==
X-Received: by 2002:a1c:9817:: with SMTP id a23mr4200076wme.57.1616611127771;
        Wed, 24 Mar 2021 11:38:47 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:47 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 11/21] Staging: rtl8723bs: remove enums in hal_phy.h
Date: Wed, 24 Mar 2021 19:38:37 +0100
Message-Id: <20210324183847.5595-12-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/hal_phy.h:

	enum antenna_path
	enum rf_content
	enum BaseBand_Config_Type
	enum hw_block

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_phy.h | 42 ---------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index 90bb5d784674..2e94c14e45da 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -74,48 +74,6 @@ enum rf_path {
 #define	RF_PATH_MAX_92C_88E		2
 #define	RF_PATH_MAX_90_8812		4	/* Max RF number 90 support */
 
-enum antenna_path {
-       ANTENNA_NONE	= 0,
-	ANTENNA_D	= 1,
-	ANTENNA_C	= 2,
-	ANTENNA_CD	= 3,
-	ANTENNA_B	= 4,
-	ANTENNA_BD	= 5,
-	ANTENNA_BC	= 6,
-	ANTENNA_BCD	= 7,
-	ANTENNA_A	= 8,
-	ANTENNA_AD	= 9,
-	ANTENNA_AC	= 10,
-	ANTENNA_ACD	= 11,
-	ANTENNA_AB	= 12,
-	ANTENNA_ABD	= 13,
-	ANTENNA_ABC	= 14,
-	ANTENNA_ABCD	= 15
-};
-
-enum rf_content {
-	radioa_txt = 0x1000,
-	radiob_txt = 0x1001,
-	radioc_txt = 0x1002,
-	radiod_txt = 0x1003
-};
-
-enum BaseBand_Config_Type {
-	BaseBand_Config_PHY_REG = 0,			/* Radio Path A */
-	BaseBand_Config_AGC_TAB = 1,			/* Radio Path B */
-	BaseBand_Config_AGC_TAB_2G = 2,
-	BaseBand_Config_AGC_TAB_5G = 3,
-	BaseBand_Config_PHY_REG_PG
-};
-
-enum hw_block {
-	HW_BLOCK_MAC = 0,
-	HW_BLOCK_PHY0 = 1,
-	HW_BLOCK_PHY1 = 2,
-	HW_BLOCK_RF = 3,
-	HW_BLOCK_MAXIMUM = 4, /*  Never use this */
-};
-
 enum wireless_mode {
 	WIRELESS_MODE_UNKNOWN = 0x00,
 	WIRELESS_MODE_A = 0x01,
-- 
2.30.2

