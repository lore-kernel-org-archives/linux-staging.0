Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02649A939
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:43:27 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cy23so65851457edb.12
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819406; x=1681411406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1s6Yk/yWtlCX9fg4ML/GfDhv7pAqeBZ0tu9hAhPDEqY=;
        b=fxAhfQl45raltob89lwevzlkzxHc89XaRkIphYOQFCnW/fkSqzg+EJH+8r2f1xLm+B
         aB+umYoqB796rSd+OCFc6L0IswAK+oCzrig1Ite3NT9CF2af9Me3LIMsRSig7lsjK+St
         n/n6/1OiBGo9g/T6RAwMNypNlFs4FILhRGcz/Nsc7tEEOBR/D3Uj8iislEhyN8gHJpqx
         EahkBi9XYGpg7ASvV8pPCseGtSdsseeMMMyEk6BFVnB4rS9YuSzyNvXZ0pGv2WyW1d8S
         pF1WaDFN/fI7fdSsU5NrOhRFXkwanVCIKv5w76vwlaxcKYG+FuaE2Y0DDGD0fNy5uWB5
         Bfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819406; x=1681411406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s6Yk/yWtlCX9fg4ML/GfDhv7pAqeBZ0tu9hAhPDEqY=;
        b=Jd3wtR5kQP6901dPybXmTli9y+O+/BqALKl4JrRQRdVsIBSUAh8o5MrAZnIG3NOXey
         iFWcFxAmD3r9k12vinJqEWPcWbKlj++vhcfR3DZuez8ZCPeAnTXzdCE1m6Hf8g2CZ70P
         m7IHPo/WfgMnaOvbTgJPkXTmglNZgYtBtfXB8tERFJxrvzAxaHl9L5dkSuH4wZneFlfa
         q8OMlcje9lkDzXXPy5hUPtMRibouL/xNvg2epmtRno1S94rN8lCq62Nd0vCf5gUBEOtZ
         QOhe5cb0WJeR+GtrdKr1TpFkwxonLL541holjo1FIj8Ooyjbm+JNz+d/lM5l8DT6pzXa
         cpaA==
X-Gm-Message-State: AO0yUKVr/2nILBXhdR9RdVm2TuZ4R35u35ujDuzBkRB/bZLE6tIv5BEb
	RwegaXgbnxxseud0njctdhE=
X-Google-Smtp-Source: AK7set9zNMSHSq9eFpUG0x2uaPc2fZJ+86vcuIt/Y2t9FqHX52cMclEswWh2d2W/wCo9f0RMemQO/A==
X-Received: by 2002:a17:906:5c:b0:88c:f97c:7c87 with SMTP id 28-20020a170906005c00b0088cf97c7c87mr14743490ejg.2.1678819406565;
        Tue, 14 Mar 2023 11:43:26 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id br7-20020a170906d14700b008c979c74732sm1446505ejb.156.2023.03.14.11.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:43:26 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:43:24 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] staging: rtl8192e: Join constants
 MACPHY_Array_PGLength with ..LengthPciE
Message-ID: <6d86257ddf3fecbf2bb104f1eeedbf09a56e0861.1678814935.git.philipp.g.hortmann@gmail.com>
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

Join constants MACPHY_Array_PGLength with MACPHY_Array_PGLengthPciE to
RTL8192E_MACPHY_ARR_PG_LEN to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/table.h      | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index e42b77f91528..86d51eb7af17 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -287,7 +287,7 @@ void rtl92e_config_mac(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	if (priv->tx_pwr_data_read_from_eeprom) {
-		dwArrayLen = MACPHY_Array_PGLength;
+		dwArrayLen = RTL8192E_MACPHY_ARR_PG_LEN;
 		pdwArray = Rtl819XMACPHY_Array_PG;
 
 	} else {
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index e9ff224953f9..73a532b96777 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,7 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define MACPHY_Array_PGLength			MACPHY_Array_PGLengthPciE
 #define PHY_REG_1T2RArrayLength			PHY_REG_1T2RArrayLengthPciE
 
 #define Rtl819XMACPHY_Array_PG			Rtl8192PciEMACPHY_Array_PG
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index 174a4dfb1855..70c31d56ea14 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -19,8 +19,8 @@ extern u32 Rtl8192PciERadioA_Array[RTL8192E_RADIO_A_ARR_LEN];
 extern u32 Rtl8192PciERadioB_Array[RTL8192E_RADIO_B_ARR_LEN];
 #define RTL8192E_MACPHY_ARR_LEN 18
 extern u32 Rtl8192PciEMACPHY_Array[RTL8192E_MACPHY_ARR_LEN];
-#define MACPHY_Array_PGLengthPciE 30
-extern u32 Rtl8192PciEMACPHY_Array_PG[MACPHY_Array_PGLengthPciE];
+#define RTL8192E_MACPHY_ARR_PG_LEN 30
+extern u32 Rtl8192PciEMACPHY_Array_PG[RTL8192E_MACPHY_ARR_PG_LEN];
 #define RTL8192E_AGCTAB_ARR_LEN 384
 extern u32 Rtl8192PciEAGCTAB_Array[RTL8192E_AGCTAB_ARR_LEN];
 
-- 
2.39.2

