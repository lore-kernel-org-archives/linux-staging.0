Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1623D60
	for <linux-staging@lists.linux.dev>; Sun,  5 Mar 2023 22:33:09 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id a25so31590881edb.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Mar 2023 14:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678055588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WP9Y1Qp/ynuiCDbnGI065WOW+LZSB7xSPmQ2TQrQ8rM=;
        b=ZTtLSCTNJ4lJ2R4/LQC9kx8pMcZemEjVWin6foSdB3IaaAKKNhSk8vqmTeODaPz1wg
         OxZF05sXAf8rs+UMeCXhC+Wbhz0GXOktc52v+8ScAgQuyM1DxTTInR9QSlXCgQL67CtO
         m1B4HjeOAu6ooLRteBrgfQiu1YF0FNMbF+/iPut/jFw9fwHHvrrCm8tW1fy0uocz/761
         8DO/ZKfc3BNP/NIwqXg3zD4Ej9WFVCPAhxUSShIUYyYs197wD8ioIyM+HYsQIKb0nsSh
         DZO2lsEFtpKg9RwCHAxlQ+BvlDxP47Q/hJ1bBLMozQK/+cHfFiHWVzPRJE1VRAbJ0ubi
         EJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678055588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP9Y1Qp/ynuiCDbnGI065WOW+LZSB7xSPmQ2TQrQ8rM=;
        b=5sfDDbti13jkE6CVX1qP/9I+A8ruQY04WWUDlS7J3uI+0jEPpyL6n0+AK4TZl6bpd5
         EAwkySEWcT9QUH0TYqUJVgr990xNpPz2mO4X78vBF8C7S/wOjcQV8Gro/QmavlesMh6z
         LLFvqbIPRCuZgYIWH4DtP7c+iA3vNngSuJbp3a3KnD7zXU500uh7MrrcmHZcJeZNmSie
         T0V9aZNej+XWtzpHgt7rVzCytw/5LjGHox0GUsUH1bK4fd3Ve62PWaJJprRVvf2SPDpS
         p6cajHhKhYNYlxji+j/RFKhx+UwywOeK7RSHOfUNFBcMeRgPMeWAgzFn2DB473P4XmBt
         bdog==
X-Gm-Message-State: AO0yUKW+n/MZAiRJV+hdsjQbyT2y9kXJ4ph4tADQfTwTRrAZlOMueHGh
	96sEgLjhEURxIK2TCSszyU4=
X-Google-Smtp-Source: AK7set+F0bFgk8VMfo3c7wt2qjebd8nAFl3hQ4MxuAM2oXBNSDr7zd9mwkKbvYt0MdChNwqlongwYA==
X-Received: by 2002:a17:906:1043:b0:878:4bda:2011 with SMTP id j3-20020a170906104300b008784bda2011mr8178867ejj.4.1678055587705;
        Sun, 05 Mar 2023 14:33:07 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id k17-20020a170906a39100b008b17fe9ac6csm3753348ejz.178.2023.03.05.14.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 14:33:07 -0800 (PST)
Date: Sun, 5 Mar 2023 23:33:05 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8192e: Remove empty Array
 Rtl8192PciERadioC_Array
Message-ID: <d8f0e8c7ee6dd820b56636db8d891012aa3ab263.1678051460.git.philipp.g.hortmann@gmail.com>
References: <cover.1678051460.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678051460.git.philipp.g.hortmann@gmail.com>

Remove empty array Rtl8192PciERadioC_Array and the code where it is used
because it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
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

