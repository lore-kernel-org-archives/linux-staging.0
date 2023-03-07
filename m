Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820E10790
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 21:01:10 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id da10so57771785edb.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 13:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678222869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+laKuP5cAVSNtPYHlxeAmSs0nLf7ZBBLqCdQZgZeOuw=;
        b=pP8JZTf/ySfxULNY/h6PvVv+THp2rayv+OJYRT4KQh4uQhrRgyCfIuSlGzJWfC5WAw
         iL1sUouNGDPhFTUtxIR5InIUZ6jBKsTGAG+C8KrXDV5mb/LDAS3RUqkDhlfZNiWk+etX
         883/y1oRQz0BpS5IBX8xbImf7iKLQFuy0zKE/0UOm3RBXaSlu6DPmib5/2aN5FLyK+zj
         wyc07QcbQXzOxZm1VsxcCwIPZk/ELGXByKhoSqosjVDYe4nQ4IDnzb9Fy5ERXB10pJo1
         KkmOzXXnqFvZXjKRfBxox6Kcl7Hkh+PSybG0kmJWpB2BlTIi+UPvOSYHbTdERNNnXfu8
         ticQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+laKuP5cAVSNtPYHlxeAmSs0nLf7ZBBLqCdQZgZeOuw=;
        b=Ajbo4eLXTvNmQa5wltLbN3vitwk6L7i3JMcxl5pVkcQaRveHnrk6hE+oiAc0t2MJZf
         d68OPyDd2w7l+Zp0rSLzXsWGhovVVDs0Z7c0/XkI8HWQA6lN2TkKdpS1V8Sidk52L3FG
         xINqj0oLp9ExLChQUdtttMG1R7qKEYBFAB4R33WjCreBEF7wPlx3eCdp6qZWFDKL0Gxh
         Rp4WYDBWcojykdCZvr+VQhOA0QE8Vfw50KZaEm2Z970ox6sZvg+NmIVkkpsMXJX/A1gy
         KEIItjqbYAyDSxYS20ApJlxZpEemEMnzaym+DBUvNkl/bcCPq+oSkPdkWo7yyHa/Z4DJ
         G/tQ==
X-Gm-Message-State: AO0yUKX7gUX5I2/0EPFRUfsDNrfdAjsXyHxkGQZmIj/3C3Kel2MC9Lxj
	XU4Xl/Waau72jOrCqAd7pwU=
X-Google-Smtp-Source: AK7set/FUB119mWbKzYcHi8ScWt6wwPseoHRsgkIPsjCex7BdjgyMe6HiZ3+12nBTjyhKl8UDuOIiA==
X-Received: by 2002:a05:6402:274d:b0:4af:7bdc:18a5 with SMTP id z13-20020a056402274d00b004af7bdc18a5mr20098565edd.0.1678222868751;
        Tue, 07 Mar 2023 13:01:08 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id d5-20020a170906640500b008be0b7242d5sm6640808ejm.90.2023.03.07.13.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 13:01:08 -0800 (PST)
Date: Tue, 7 Mar 2023 22:01:06 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: rtl8192e: Remove unused Array
 Rtl8192PciERadioC_Array
Message-ID: <ed1e0df7ed677c335340f42c1108e7b5c0f18462.1678222487.git.philipp.g.hortmann@gmail.com>
References: <cover.1678222487.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678222487.git.philipp.g.hortmann@gmail.com>

The array Rtl8192PciERadioC_Array is only used in function
rtl92e_config_rf_path which is only called in function rtl92e_config_rf.
In function rtl92e_config_rf a termination condition for the loop is set
to priv->num_total_rf_path = RTL819X_TOTAL_RF_PATH = 2. The loop is only
executed with numbers 0 and 1 for eRFPath. So the function
rtl92e_config_rf_path is only called with eRFPath for 0 and 1 and never
with 2 that would make the "case RF90_PATH_C:" be called. Remove
resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: Changed argumentation in the description and subject
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 12 ------------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h |  2 --
 drivers/staging/rtl8192e/rtl8192e/table.c      |  3 ---
 drivers/staging/rtl8192e/rtl8192e/table.h      |  2 --
 4 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 35ca01ab65ff..fe0ef52c163a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -649,18 +649,6 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 					  bMask12Bits,
 					  Rtl819XRadioB_Array[i+1]);
 
-		}
-		break;
-	case RF90_PATH_C:
-		for (i = 0; i < RadioC_ArrayLength; i += 2) {
-			if (Rtl819XRadioC_Array[i] == 0xfe) {
-				msleep(100);
-				continue;
-			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioC_Array[i],
-					  bMask12Bits,
-					  Rtl819XRadioC_Array[i+1]);
-
 		}
 		break;
 	case RF90_PATH_D:
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 561a4c874fe3..6772ed300591 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -14,7 +14,6 @@
 #define RadioA_ArrayLength			RadioA_ArrayLengthPciE
 #define RadioB_ArrayLength			RadioB_ArrayLengthPciE
 #define MACPHY_Array_PGLength			MACPHY_Array_PGLengthPciE
-#define RadioC_ArrayLength			RadioC_ArrayLengthPciE
 #define RadioD_ArrayLength			RadioD_ArrayLengthPciE
 #define PHY_REG_1T2RArrayLength			PHY_REG_1T2RArrayLengthPciE
 
@@ -22,7 +21,6 @@
 #define Rtl819XMACPHY_Array			Rtl8192PciEMACPHY_Array
 #define Rtl819XRadioA_Array			Rtl8192PciERadioA_Array
 #define Rtl819XRadioB_Array			Rtl8192PciERadioB_Array
-#define Rtl819XRadioC_Array			Rtl8192PciERadioC_Array
 #define Rtl819XRadioD_Array			Rtl8192PciERadioD_Array
 #define Rtl819XAGCTAB_Array			Rtl8192PciEAGCTAB_Array
 #define Rtl819XPHY_REG_1T2RArray		Rtl8192PciEPHY_REG_1T2RArray
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index d04608d99cbf..4e97ad4b8fd7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -325,9 +325,6 @@ u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE] = {
 	0x007, 0x00000700,
 };
 
-u32 Rtl8192PciERadioC_Array[RadioC_ArrayLengthPciE] = {
-	0x0,  };
-
 u32 Rtl8192PciERadioD_Array[RadioD_ArrayLengthPciE] = {
 	0x0, };
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index 177fe2173430..981e8b57d3de 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -17,8 +17,6 @@ extern u32 Rtl8192PciEPHY_REG_1T2RArray[PHY_REG_1T2RArrayLengthPciE];
 extern u32 Rtl8192PciERadioA_Array[RadioA_ArrayLengthPciE];
 #define RadioB_ArrayLengthPciE 78
 extern u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE];
-#define RadioC_ArrayLengthPciE 2
-extern u32 Rtl8192PciERadioC_Array[RadioC_ArrayLengthPciE];
 #define RadioD_ArrayLengthPciE 2
 extern u32 Rtl8192PciERadioD_Array[RadioD_ArrayLengthPciE];
 #define MACPHY_ArrayLengthPciE 18
-- 
2.39.2

