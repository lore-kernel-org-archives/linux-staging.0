Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589FE7F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 01:12:02 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id k7so8142387pll.6
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 18:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JToYLUSSy/i5m9Py7IH/T54uqRiJj7SvKEgsJsBwYtc=;
        b=nXbPp/AMh7o0Q2A0+X5NJgL3T9bThZY7/7i7HS8rVo6kKjLjTn/FSRcAhYvB3W6jJH
         rNhQ5aHEiPF9TcpWiwnAa30VBvULLkG8uoOTt7BNVZ6jIL9lJrYnONOKH/qhA3J8Dxv8
         9F+e3+Eeg+ukNXv5WAQZbljbSgvm4yqLTtPzv3mgjeU6vMfsWTFvmZEdppoY+KazwO1T
         KnebfvHO0Fm87p4RAOykSEyZdFJX8c+hKpX1ub8vHqBUxBH2c3bex04JO8j4XJCr9uqD
         dSCUWuPLFZU2GUPiLsEjs73vMCUyItsG5GYZl9qR5r8TaGsBsrZ4LM2ZpA+DN79rEyiK
         Y+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JToYLUSSy/i5m9Py7IH/T54uqRiJj7SvKEgsJsBwYtc=;
        b=f6ZjGgTy8RoGn0PwQVRA8/cLRE40druEDdOeHeH5lwD9cENxGKRXkZ2+OzKRNeDFEY
         LZ/DHRkY72ZYQxB/6YXJ73/dGe5DKHb5XoCRqZDMoWshNaPEO4fCKDxnG8vbhO6bbaPC
         Ze9cvdx8Yid+/Ze/RPKqfZ7acc1L4TlqYW7W7KxYLAnH5ZiuGWwlgDYfd6E+YuimPFXf
         mU/SSKrjuY5eU1vRQ/Q3ZPMzfvtE0DobPtZGwratHC4RrimMnQdKyPMUuQbWluDh6Ac3
         tOYTPVBoDSr2ae5+BAft2EhjCFe4zSPGKwf5JbNLNvEfFqTyaXvfbGEwUQ2LeFN2/Vbe
         sU5Q==
X-Gm-Message-State: ACrzQf3m6gT36dGE6mvP5l/4MNS8KeS6i1EWIJZ98iKmbgF/hGgqAoTj
	HpAaFT4lWYIl+BmY1fD24y/PQkonrvHSUPI6
X-Google-Smtp-Source: AMsMyM6pfzTMbdLeJ3m1kBuqAWSCuJdA1Hc1ItS0EElk/2wtXM/xgyCmbaFQbLZJaxYRJS2E3lRisw==
X-Received: by 2002:a17:902:d4c3:b0:187:2b8:a4fa with SMTP id o3-20020a170902d4c300b0018702b8a4famr44532801plg.134.1667697121817;
        Sat, 05 Nov 2022 18:12:01 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id p27-20020aa79e9b000000b0052d4cb47339sm1823223pfq.151.2022.11.05.18.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 18:12:01 -0700 (PDT)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Bai <jacob.bai.au@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8192e: remove unnecesscary macro defines
Date: Sun,  6 Nov 2022 12:11:45 +1100
Message-Id: <6cdf838429ca9b553fb572f55a53ec25fa4e5f6a.1667694826.git.jacob.bai.au@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667694826.git.jacob.bai.au@gmail.com>
References: <cover.1667694826.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove useless macro defines

Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 52 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 20 -------
 2 files changed, 26 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index eabb4187d907..aad1842857c0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -307,12 +307,12 @@ void rtl92e_config_mac(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	if (priv->bTXPowerDataReadFromEEPORM) {
-		dwArrayLen = MACPHY_Array_PGLength;
-		pdwArray = Rtl819XMACPHY_Array_PG;
+		dwArrayLen = RTL8192E_MAC_ARRAY_PG_LEN;
+		pdwArray = RTL8192E_MAC_ARRAY_PG;
 
 	} else {
-		dwArrayLen = MACPHY_ArrayLength;
-		pdwArray = Rtl819XMACPHY_Array;
+		dwArrayLen = RTL8192E_MAC_ARRAY_LEN;
+		pdwArray = RTL8192E_MAC_ARRAY;
 	}
 	for (i = 0; i < dwArrayLen; i += 3) {
 		if (pdwArray[i] == 0x318)
@@ -332,14 +332,14 @@ static void _rtl92e_phy_config_bb(struct net_device *dev, u8 ConfigType)
 	u16 AGCTAB_ArrayLen, PHY_REGArrayLen = 0;
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	AGCTAB_ArrayLen = AGCTAB_ArrayLength;
-	Rtl819XAGCTAB_Array_Table = Rtl819XAGCTAB_Array;
+	AGCTAB_ArrayLen = RTL8192E_AGC_TAB_ARRAY_LEN;
+	Rtl819XAGCTAB_Array_Table = RTL8192E_AGC_TAB_ARRAY;
 	if (priv->rf_type == RF_2T4R) {
-		PHY_REGArrayLen = PHY_REGArrayLength;
-		Rtl819XPHY_REGArray_Table = Rtl819XPHY_REGArray;
+		PHY_REGArrayLen = RTL8192E_PHY_REG_ARRAY_LEN;
+		Rtl819XPHY_REGArray_Table = RTL8192E_PHY_REG_ARRAY;
 	} else if (priv->rf_type == RF_1T2R) {
-		PHY_REGArrayLen = PHY_REG_1T2RArrayLength;
-		Rtl819XPHY_REGArray_Table = Rtl819XPHY_REG_1T2RArray;
+		PHY_REGArrayLen = RTL8192E_PHY_REG_1T2R_ARRAY_LEN;
+		Rtl819XPHY_REGArray_Table = RTL8192E_PHY_REG_1T2R_ARRAY;
 	}
 
 	if (ConfigType == BaseBand_Config_PHY_REG) {
@@ -668,50 +668,50 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 
 	switch (eRFPath) {
 	case RF90_PATH_A:
-		for (i = 0; i < RadioA_ArrayLength; i += 2) {
-			if (Rtl819XRadioA_Array[i] == 0xfe) {
+		for (i = 0; i < RTL8192E_RADIOA_ARRAY_LEN; i += 2) {
+			if (RTL8192E_RADIOA_ARRAY[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioA_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIOA_ARRAY[i],
 					  bMask12Bits,
-					  Rtl819XRadioA_Array[i+1]);
+					  RTL8192E_RADIOA_ARRAY[i+1]);
 
 		}
 		break;
 	case RF90_PATH_B:
-		for (i = 0; i < RadioB_ArrayLength; i += 2) {
-			if (Rtl819XRadioB_Array[i] == 0xfe) {
+		for (i = 0; i < RTL8192E_RADIOB_ARRAY_LEN; i += 2) {
+			if (RTL8192E_RADIOB_ARRAY[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioB_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIOB_ARRAY[i],
 					  bMask12Bits,
-					  Rtl819XRadioB_Array[i+1]);
+					  RTL8192E_RADIOB_ARRAY[i+1]);
 
 		}
 		break;
 	case RF90_PATH_C:
-		for (i = 0; i < RadioC_ArrayLength; i += 2) {
-			if (Rtl819XRadioC_Array[i] == 0xfe) {
+		for (i = 0; i < RTL8192E_RADIOC_ARRAY_LEN; i += 2) {
+			if (RTL8192E_RADIOC_ARRAY[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioC_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIOC_ARRAY[i],
 					  bMask12Bits,
-					  Rtl819XRadioC_Array[i+1]);
+					  RTL8192E_RADIOC_ARRAY[i+1]);
 
 		}
 		break;
 	case RF90_PATH_D:
-		for (i = 0; i < RadioD_ArrayLength; i += 2) {
-			if (Rtl819XRadioD_Array[i] == 0xfe) {
+		for (i = 0; i < RTL8192E_RADIOD_ARRAY_LEN; i += 2) {
+			if (RTL8192E_RADIOD_ARRAY[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioD_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIOD_ARRAY[i],
 					  bMask12Bits,
-					  Rtl819XRadioD_Array[i+1]);
+					  RTL8192E_RADIOD_ARRAY[i+1]);
 
 		}
 		break;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index e1c1f19b71a3..5e6527e835db 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,26 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define AGCTAB_ArrayLength			RTL8192E_AGC_TAB_ARRAY_LEN
-#define MACPHY_ArrayLength			RTL8192E_MAC_ARRAY_LEN
-#define RadioA_ArrayLength			RTL8192E_RADIOA_ARRAY_LEN
-#define RadioB_ArrayLength			RTL8192E_RADIOB_ARRAY_LEN
-#define MACPHY_Array_PGLength			RTL8192E_MAC_ARRAY_PG_LEN
-#define RadioC_ArrayLength			RTL8192E_RADIOC_ARRAY_LEN
-#define RadioD_ArrayLength			RTL8192E_RADIOD_ARRAY_LEN
-#define PHY_REGArrayLength			RTL8192E_PHY_REG_ARRAY_LEN
-#define PHY_REG_1T2RArrayLength			RTL8192E_PHY_REG_1T2R_ARRAY_LEN
-
-#define Rtl819XMACPHY_Array_PG			RTL8192E_MAC_ARRAY_PG
-#define Rtl819XMACPHY_Array			RTL8192E_MAC_ARRAY
-#define Rtl819XRadioA_Array			RTL8192E_RADIOA_ARRAY
-#define Rtl819XRadioB_Array			RTL8192E_RADIOB_ARRAY
-#define Rtl819XRadioC_Array			RTL8192E_RADIOC_ARRAY
-#define Rtl819XRadioD_Array			RTL8192E_RADIOD_ARRAY
-#define Rtl819XAGCTAB_Array			RTL8192E_AGC_TAB_ARRAY
-#define Rtl819XPHY_REGArray			RTL8192E_PHY_REG_ARRAY
-#define Rtl819XPHY_REG_1T2RArray		RTL8192E_PHY_REG_1T2R_ARRAY
-
 extern u32 rtl819XAGCTAB_Array[];
 
 enum hw90_block {
-- 
2.34.1

