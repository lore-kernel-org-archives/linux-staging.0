Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEC524F
	for <linux-staging@lists.linux.dev>; Sun,  5 Mar 2023 22:33:21 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id da10so31421584edb.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Mar 2023 14:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678055600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+faGcyrcjggVSJi7hxIupggyB5hed7usIcPhK71OdM=;
        b=I33mrdbRoDE/yTqiYTUaY2x6eBs/13PiCZUxAndrAZB+YE4HL54bVw/a30JnKaDW5I
         NGtstuPKrROarY5efhla6aDmBTp6wYF4IaqTzds/7qxdlVyZC3autjctZdmetbGZtCqo
         31cS8KDu8L4NG+Uw4+kuHOAtB9pkyH21cwv1nGs53bU7ytqt+3uOZ/Wvf5uQB1cxhvd5
         svFXVlcehn155CwKL7cnMnCDrng60KDtTGJH+uaayvh7F0iwP1YOSFvv3T+MEbBVUwHz
         qzMAMLMdCe88ie1Ep7gG0sWl5g5rFLNUbfUv/7PBHgUrwVhLgJT4EMe2iTAamitytS74
         NQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678055600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+faGcyrcjggVSJi7hxIupggyB5hed7usIcPhK71OdM=;
        b=AATa5R/4h9/05oWQF+Of0yK818IEEN1xY8LbEXH4qZvmjr48bpj2setcMqPX9dqBDG
         mUouxd1hRsDNLK9bTBxYlcL85R8h/dT5YyGFoGISIdxCbQFiSQHBDpMU7IKtu5+DIRcE
         mJw4XrVoa8hZmDmm7nEd2bNt3lw6rgtWSW4Lf0TmZbQk1iDeIrvDKluYEQardkehvijQ
         AttzOUFIYTmIHRshzRxFSRhnj30P53TOb4nhmsDzb/+NkgEP2qJ1dS4NKQj8piMQNkcu
         xhgNX3T1LdXXGdghm3DlBtq2cp5BCY/C+Aqd3Tv8EzqrtAUnNHVWY2bIo/efQkJgEGTy
         3LAQ==
X-Gm-Message-State: AO0yUKVWH/WTJW1oM6re7koIneBF58nGMfU0klSexuN8cxarlfmRtw6+
	fRYVLgbDGFgVz9WLd5DaJTWgr0svFMs=
X-Google-Smtp-Source: AK7set8O1hWoozyZKnBPsG4nR4jDb1QQApe+/6ptnoJKYW0YDJlaT2Hh0XhOZisU40zu4GaqNNaW5w==
X-Received: by 2002:a17:906:154:b0:8ae:cd8e:3957 with SMTP id 20-20020a170906015400b008aecd8e3957mr7785048ejh.4.1678055600291;
        Sun, 05 Mar 2023 14:33:20 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id p23-20020a170906615700b008d5d721f8a4sm3676089ejl.197.2023.03.05.14.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 14:33:19 -0800 (PST)
Date: Sun, 5 Mar 2023 23:33:18 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8192e: Remove empty Array
 Rtl8192PciERadioD_Array
Message-ID: <e8842422d34fd19592047ad821c0dbe2eb4bcdc9.1678051461.git.philipp.g.hortmann@gmail.com>
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

Remove empty array Rtl8192PciERadioD_Array and the code where it is used
because it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 12 ------------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h |  2 --
 drivers/staging/rtl8192e/rtl8192e/table.c      |  3 ---
 drivers/staging/rtl8192e/rtl8192e/table.h      |  2 --
 4 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index fe0ef52c163a..a9e83ba811b0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -649,18 +649,6 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 					  bMask12Bits,
 					  Rtl819XRadioB_Array[i+1]);
 
-		}
-		break;
-	case RF90_PATH_D:
-		for (i = 0; i < RadioD_ArrayLength; i += 2) {
-			if (Rtl819XRadioD_Array[i] == 0xfe) {
-				msleep(100);
-				continue;
-			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioD_Array[i],
-					  bMask12Bits,
-					  Rtl819XRadioD_Array[i+1]);
-
 		}
 		break;
 	default:
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 6772ed300591..ac640033e843 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -14,14 +14,12 @@
 #define RadioA_ArrayLength			RadioA_ArrayLengthPciE
 #define RadioB_ArrayLength			RadioB_ArrayLengthPciE
 #define MACPHY_Array_PGLength			MACPHY_Array_PGLengthPciE
-#define RadioD_ArrayLength			RadioD_ArrayLengthPciE
 #define PHY_REG_1T2RArrayLength			PHY_REG_1T2RArrayLengthPciE
 
 #define Rtl819XMACPHY_Array_PG			Rtl8192PciEMACPHY_Array_PG
 #define Rtl819XMACPHY_Array			Rtl8192PciEMACPHY_Array
 #define Rtl819XRadioA_Array			Rtl8192PciERadioA_Array
 #define Rtl819XRadioB_Array			Rtl8192PciERadioB_Array
-#define Rtl819XRadioD_Array			Rtl8192PciERadioD_Array
 #define Rtl819XAGCTAB_Array			Rtl8192PciEAGCTAB_Array
 #define Rtl819XPHY_REG_1T2RArray		Rtl8192PciEPHY_REG_1T2RArray
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index 4e97ad4b8fd7..7101061e3519 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -325,9 +325,6 @@ u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE] = {
 	0x007, 0x00000700,
 };
 
-u32 Rtl8192PciERadioD_Array[RadioD_ArrayLengthPciE] = {
-	0x0, };
-
 u32 Rtl8192PciEMACPHY_Array[] = {
 	0x03c, 0xffff0000, 0x00000f0f,
 	0x340, 0xffffffff, 0x161a1a1a,
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index 981e8b57d3de..b6d4e9696452 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -17,8 +17,6 @@ extern u32 Rtl8192PciEPHY_REG_1T2RArray[PHY_REG_1T2RArrayLengthPciE];
 extern u32 Rtl8192PciERadioA_Array[RadioA_ArrayLengthPciE];
 #define RadioB_ArrayLengthPciE 78
 extern u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE];
-#define RadioD_ArrayLengthPciE 2
-extern u32 Rtl8192PciERadioD_Array[RadioD_ArrayLengthPciE];
 #define MACPHY_ArrayLengthPciE 18
 extern u32 Rtl8192PciEMACPHY_Array[MACPHY_ArrayLengthPciE];
 #define MACPHY_Array_PGLengthPciE 30
-- 
2.39.2

