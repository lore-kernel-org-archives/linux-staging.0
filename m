Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7EAA939
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:43:15 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z21so663222edb.4
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819393; x=1681411393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8LjbSZR0Kfj/oBrMiuwr7Jdgg7szPbhvPzSbkmPBCg=;
        b=UyM49eccXFnyBClUPyJYe3LGlGKmaxEGqwTrTg4KCv9YBDdEY6+K1zqB5J5ndkLM1O
         c+DypDpYQF+6v4bILw7mdHYgNTks84qpDz4OzOzeReTZ1/fzPtljJuMRMimcx+AvjUck
         R6Ce+b7w5Ow8giGiwTHyBAj3Vo95xRS+9zPO6cFhPLJnEM6vzHRSixz12kN8otwuBoGM
         oNOLfY3eyl/6bCuzAf5JzKZ7iV3JLYpODMQ2YlD38A/KV9tqmIfSR3Duz+m2j50fs/oF
         NAL2D75QMAM0gXh7zPdeyKh2zqA23KGm1fGFHfx03zjcIWoTwnzWC+4QFj5vG0R2Sj6q
         ajxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819393; x=1681411393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8LjbSZR0Kfj/oBrMiuwr7Jdgg7szPbhvPzSbkmPBCg=;
        b=fu1HYjhEPcBl9PxwxQRYkd8gfsB/y33B9b3DfeeBgDOALs4Aa2xWX753+gnkBe58Vf
         lV4PrcoHiSgpPFOS23JX6ab/8mBXO7Pno6dAQ8u3d3Pv8rCQYVfOrh73EZlLaRsCnza2
         h4QYWSUfhdUrKo0GNA2dFtEPYCEu8py6XzX+LsEnGnICHqv490kcXZg1IA/3CKLHJZUh
         KPIJkCeyVfJgAt7c4be5ZUQJoEiRvZq2mSPnzl0f6ajSuywgM/Y2Pda9I8k11EqRablo
         xxOXbjrvPkmLvzURJWiR+FaZOTfl/PBOQ51SBuyTxgeg7edcYtV6jx4Hh4ZaN+opvCkn
         zjgw==
X-Gm-Message-State: AO0yUKWmkYu0kBKGvwjkH+02vAob1/6ir4UsjvbKuhhuUqUZzFporJAf
	fo0Hsyc28+M86IrUGJ+tmxA=
X-Google-Smtp-Source: AK7set/ON/jpn8wtxOhWEVadk2vyaDcFBz4jPlhB1SAt4+VYDDD8bC5u24X8NA5GRjf7vxgMYQSeBA==
X-Received: by 2002:a17:906:208a:b0:889:d24e:6017 with SMTP id 10-20020a170906208a00b00889d24e6017mr15455601ejq.3.1678819393708;
        Tue, 14 Mar 2023 11:43:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id y11-20020a17090629cb00b008e17dc10decsm1491695eje.52.2023.03.14.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:43:13 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:43:11 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] staging: rtl8192e: Join constants RadioA_ArrayLength
 with ..LengthPciE
Message-ID: <a03372c15cf1489b964d48d667f39c6e231fa190.1678814935.git.philipp.g.hortmann@gmail.com>
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

Join constants RadioA_ArrayLength with RadioA_ArrayLengthPciE to
RTL8192E_RADIO_A_ARR_LEN to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/table.c      | 2 +-
 drivers/staging/rtl8192e/rtl8192e/table.h      | 4 ++--
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 29918a529f77..e4d1b7ad64ac 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -542,7 +542,7 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 
 	switch (eRFPath) {
 	case RF90_PATH_A:
-		for (i = 0; i < RadioA_ArrayLength; i += 2) {
+		for (i = 0; i < RTL8192E_RADIO_A_ARR_LEN; i += 2) {
 			if (Rtl819XRadioA_Array[i] == 0xfe) {
 				msleep(100);
 				continue;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 611756517ce6..8f9200bed456 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,7 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define RadioA_ArrayLength			RadioA_ArrayLengthPciE
 #define RadioB_ArrayLength			RadioB_ArrayLengthPciE
 #define MACPHY_Array_PGLength			MACPHY_Array_PGLengthPciE
 #define PHY_REG_1T2RArrayLength			PHY_REG_1T2RArrayLengthPciE
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index be6c4b7c0e0e..5820c47f4e14 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -157,7 +157,7 @@ u32 Rtl8192PciEPHY_REG_1T2RArray[PHY_REG_1T2RArrayLengthPciE] = {
 	0xe1c, 0x12121416,
 };
 
-u32 Rtl8192PciERadioA_Array[RadioA_ArrayLengthPciE] = {
+u32 Rtl8192PciERadioA_Array[RTL8192E_RADIO_A_ARR_LEN] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x00000ee0,
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index cb424c8fbee0..d177b7b17b19 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -13,8 +13,8 @@
 
 #define PHY_REG_1T2RArrayLengthPciE 296
 extern u32 Rtl8192PciEPHY_REG_1T2RArray[PHY_REG_1T2RArrayLengthPciE];
-#define RadioA_ArrayLengthPciE 246
-extern u32 Rtl8192PciERadioA_Array[RadioA_ArrayLengthPciE];
+#define RTL8192E_RADIO_A_ARR_LEN 246
+extern u32 Rtl8192PciERadioA_Array[RTL8192E_RADIO_A_ARR_LEN];
 #define RadioB_ArrayLengthPciE 78
 extern u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE];
 #define RTL8192E_MACPHY_ARR_LEN 18
-- 
2.39.2

