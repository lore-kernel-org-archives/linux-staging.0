Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E06A939
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:43:21 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z21so664438edb.4
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bBloYsUXJ4nsR8iknh3IyaxMJy5tm/ZnRPS+e2A2ehg=;
        b=Cc+eiJJbpaK++5Rpay8c+vgf1LlAgiCX3DI4PS/aI4YE9gO9ZLvjBJdjjJF+6BJBay
         y7DHAPVpDsbfVF7IBWbaPIfLIiqPLnZij93vd7in/ZCRDqTBV2cP+uCVx3ozwKiWmGGz
         nQGigmOZrgg/Qprns29T/XF2w2nY4UabatJ36iE9S6qy/T/+SMaTL7sgkGt94w8NqAjh
         uGoTdde8s4SNhw5PdK9mg1syzSZ/vUTdTGb1xMsZA2ETSbc86JfvRmqyYX4+KgkAUl5d
         lWm9GewyPRP+4KHEPdMMTvScR02t3BmGqd9QRYhIsY0OfkHhbnxcxz8b0mPnck9zL3Jo
         R2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBloYsUXJ4nsR8iknh3IyaxMJy5tm/ZnRPS+e2A2ehg=;
        b=tal+5VudAfaea2xBgY52ipTF+ax3m+1UThJ2ojxrV7SW0RQJ2akBDeo5diXh46oqIj
         rXA58ggbWtdYh2HgMoHE2tTNF49ZbCADHpRR6UUU3d4O7E7MB+p4E6W/eitLGggFTBND
         Tjp9oKk2/WGa2beZkm8CQCVFpu/Gxw/iW+zh2eP4StMdx1JOwsi0lHEjF0Dck1NrfPGW
         4t6TVaSUtWCF2Zyc4yNWpLqH7/ti1v/aKeyO4RfTJ3PSCHHUFxdbiOIoM+vW9iytoY2t
         0lj/lX+JKjFZuTZRFXv0yxJ0Chj+ildH/WmpTD6D4J85R1CksG/L8Vdpp8HRlHMlGe5t
         N9MQ==
X-Gm-Message-State: AO0yUKU8yk5phF8GRSAESWuPbxM9lbeqVQNTpdSktwgHc/Cb11yzpLI9
	HGk4wCqFQLY4+sb7ZDuq+MA=
X-Google-Smtp-Source: AK7set82crYoVByFkf/r3suirXAZgQUEAOMpVghg/agMHrlHAptZNl24Mv+kHQaXhJNVPNF8oAJr1g==
X-Received: by 2002:a05:6402:3490:b0:4fb:886:c9d9 with SMTP id v16-20020a056402349000b004fb0886c9d9mr13419798edc.1.1678819400803;
        Tue, 14 Mar 2023 11:43:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id r23-20020a50aad7000000b004f9e6495f94sm1435311edc.50.2023.03.14.11.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:43:20 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:43:18 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] staging: rtl8192e: Join constants RadioB_ArrayLength
 with ..LengthPciE
Message-ID: <1f48c0691eb4627be81fc39d08762617a6c58a08.1678814935.git.philipp.g.hortmann@gmail.com>
References: <cover.1678814935.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678814935.git.philipp.g.hortmann@gmail.com>

Join constants RadioB_ArrayLength with RadioB_ArrayLengthPciE to
RTL8192E_RADIO_B_ARR_LEN to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/table.c      | 2 +-
 drivers/staging/rtl8192e/rtl8192e/table.h      | 4 ++--
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index e4d1b7ad64ac..e42b77f91528 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -554,7 +554,7 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 		}
 		break;
 	case RF90_PATH_B:
-		for (i = 0; i < RadioB_ArrayLength; i += 2) {
+		for (i = 0; i < RTL8192E_RADIO_B_ARR_LEN; i += 2) {
 			if (Rtl819XRadioB_Array[i] == 0xfe) {
 				msleep(100);
 				continue;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 8f9200bed456..e9ff224953f9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,7 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define RadioB_ArrayLength			RadioB_ArrayLengthPciE
 #define MACPHY_Array_PGLength			MACPHY_Array_PGLengthPciE
 #define PHY_REG_1T2RArrayLength			PHY_REG_1T2RArrayLengthPciE
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index 5820c47f4e14..5c9844f4d117 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -283,7 +283,7 @@ u32 Rtl8192PciERadioA_Array[RTL8192E_RADIO_A_ARR_LEN] = {
 	0x007, 0x00000700,
 };
 
-u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE] = {
+u32 Rtl8192PciERadioB_Array[RTL8192E_RADIO_B_ARR_LEN] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x000006e0,
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index d177b7b17b19..174a4dfb1855 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -15,8 +15,8 @@
 extern u32 Rtl8192PciEPHY_REG_1T2RArray[PHY_REG_1T2RArrayLengthPciE];
 #define RTL8192E_RADIO_A_ARR_LEN 246
 extern u32 Rtl8192PciERadioA_Array[RTL8192E_RADIO_A_ARR_LEN];
-#define RadioB_ArrayLengthPciE 78
-extern u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE];
+#define RTL8192E_RADIO_B_ARR_LEN 78
+extern u32 Rtl8192PciERadioB_Array[RTL8192E_RADIO_B_ARR_LEN];
 #define RTL8192E_MACPHY_ARR_LEN 18
 extern u32 Rtl8192PciEMACPHY_Array[RTL8192E_MACPHY_ARR_LEN];
 #define MACPHY_Array_PGLengthPciE 30
-- 
2.39.2

