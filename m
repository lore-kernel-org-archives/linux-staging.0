Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C52A939
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:44:03 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id r11so14342588edd.5
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JhOP8mQ5Z2Gmq+/y1PXXgLvgLODRnQ4GFaonYd0lOUw=;
        b=P50FfZweqLtcGAFr2+JlKgYeryjXgIlvdsMCvh5JHJoPL0gmt/q99CFhc7rbMf5qGz
         4OKMzRnfJRGF23e0mWtSuKYq9H2nW1VpqAFkiz6z73oBKGliCngPb23O7Na46Xo1jzA3
         7O4RiCzA53HUDeWeEkd5EhIG8twELC+dJHFgi18fQYuF82IJw9GBgIdZkgOMLY18ZoAk
         BzJSzkyyaZGoCJb/92S/C8iHrOhrMeevtIYEvBbmkO5T3rQZ/Vmh/TunCaUcmMxrzf8W
         /LxJvR+abewzFVk7Nc7Al0l2qGyPN7aPxMTkm875GNqemo35z4gExnAVB803Q/vEXT8P
         msvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhOP8mQ5Z2Gmq+/y1PXXgLvgLODRnQ4GFaonYd0lOUw=;
        b=eicWflXtPulT2bFQDnM8NP2m+t7wVwRLtHeU2ESXuTE2gggcMvQSCDAFGpwo07DzR4
         UuOfOK2RnkivFZrK1uQ1JzCkbOIxZtAI6wTYiyP+JV5wMi4LD04BvDnvhks/IDhux2CJ
         RZHKIH+RvYCy636z93jCi48+o/J2Kv6K5Cxd0EwwPFkCq/lleo/Cr0hCYjOFyNlFjudk
         3bo9Wh8kQNqw1m5uaTFVp/YHOT8QJBtEUpvniSymW6PtWEigvppnfw8Er1Sqcdz/wn7M
         00Rku28o6fUnQhgUgJVUHOuoIaZHrMdzWnJqZT/u1lNHcXZ0HzuB+lgwKfsnWIE+f6rG
         9DrQ==
X-Gm-Message-State: AO0yUKUKHH73wYOvAbV7EqU05sGODrHqRSZdcmhl+c/iyPufakah2tbw
	MV6YMclgJYMqDLNChJxvWLE=
X-Google-Smtp-Source: AK7set+PIEkUWxnQhJUd8f+NTLDRwkt0ZG5GMGUpPCOPKVWm4UA0JFomM0lf53w2mVprSlZBPioedw==
X-Received: by 2002:a05:6402:1d54:b0:4fb:ac81:49bf with SMTP id dz20-20020a0564021d5400b004fbac8149bfmr11012979edb.4.1678819441658;
        Tue, 14 Mar 2023 11:44:01 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id e20-20020a50d4d4000000b004fbf6b35a56sm1404258edj.76.2023.03.14.11.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:44:01 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:43:59 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] staging: rtl8192e: Join constants Rtl819XRadioA_..
 with ..RadioA_..
Message-ID: <0ce85e55fd9ddd5459590d756a951809b6a1b9ee.1678814935.git.philipp.g.hortmann@gmail.com>
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

Join constants Rtl819XRadioA_Array with Rtl8192PciERadioA_Array to
RTL8192E_RADIO_A_ARR to improve readability. Fix spaces around '+' to
improve coding style.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/table.c      | 2 +-
 drivers/staging/rtl8192e/rtl8192e/table.h      | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index bf4fec83d316..49fdaacb788a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -543,13 +543,13 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 	switch (eRFPath) {
 	case RF90_PATH_A:
 		for (i = 0; i < RTL8192E_RADIO_A_ARR_LEN; i += 2) {
-			if (Rtl819XRadioA_Array[i] == 0xfe) {
+			if (RTL8192E_RADIO_A_ARR[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioA_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIO_A_ARR[i],
 					  bMask12Bits,
-					  Rtl819XRadioA_Array[i+1]);
+					  RTL8192E_RADIO_A_ARR[i + 1]);
 
 		}
 		break;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 2d2b80bc1f21..74c7850e514c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,7 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define Rtl819XRadioA_Array			Rtl8192PciERadioA_Array
 #define Rtl819XRadioB_Array			Rtl8192PciERadioB_Array
 #define Rtl819XAGCTAB_Array			Rtl8192PciEAGCTAB_Array
 #define Rtl819XPHY_REG_1T2RArray		Rtl8192PciEPHY_REG_1T2RArray
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index 0ab786d35682..4f36a480f6f2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -157,7 +157,7 @@ u32 Rtl8192PciEPHY_REG_1T2RArray[RTL8192E_PHY_REG_1T2R_ARR_LEN] = {
 	0xe1c, 0x12121416,
 };
 
-u32 Rtl8192PciERadioA_Array[RTL8192E_RADIO_A_ARR_LEN] = {
+u32 RTL8192E_RADIO_A_ARR[RTL8192E_RADIO_A_ARR_LEN] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x00000ee0,
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index c6c7d4cd313e..60917c95842b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -14,7 +14,7 @@
 #define RTL8192E_PHY_REG_1T2R_ARR_LEN 296
 extern u32 Rtl8192PciEPHY_REG_1T2RArray[RTL8192E_PHY_REG_1T2R_ARR_LEN];
 #define RTL8192E_RADIO_A_ARR_LEN 246
-extern u32 Rtl8192PciERadioA_Array[RTL8192E_RADIO_A_ARR_LEN];
+extern u32 RTL8192E_RADIO_A_ARR[RTL8192E_RADIO_A_ARR_LEN];
 #define RTL8192E_RADIO_B_ARR_LEN 78
 extern u32 Rtl8192PciERadioB_Array[RTL8192E_RADIO_B_ARR_LEN];
 #define RTL8192E_MACPHY_ARR_LEN 18
-- 
2.39.2

