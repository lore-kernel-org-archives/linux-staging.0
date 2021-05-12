Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8870
	for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 13:23:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id l4so34962525ejc.10
        for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 06:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9L/68u1cOmxc9PWBYT39D8F4hV5bW23CAWhwtgNXkkA=;
        b=u+I/69D7hCd3S+JmyluCQS7OLra5DAYnjkRNJa9R3nMUSk1mhWXPAXV6KikZnbLJYk
         +kzD2oI/Gw/0eA3ijkSGl3DlW2Rp5YNNxiLuZAccg0EqTBVeVvsK2rnECPSxwXGUkzRy
         o+GFtCPtL4nr+tshFHOnLJ8MXUYKLepGTyzwM4eTF8JBZRvTX3T+07FN1tRuORxveEXk
         dp+RGCcFIPvbeReY78cvIT+a8NLxm0eh4B4MpcR32aenXCwCCtgqhPT5NWUKt3JxdLqz
         EFLjhd8oR6gLd1UIeQLit2KRwTHg6r01wckw6HZgd0f+RuDhYdycbQTZH4NS6fbGEaVP
         7G1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9L/68u1cOmxc9PWBYT39D8F4hV5bW23CAWhwtgNXkkA=;
        b=sFgoCqRXGbW3rfCCPGw7lY7TFmtYS/wxwCNyXgyF2XATxpIn8J+rt5vqVbMK7xwR+j
         cJM6/ZMabG+CaosHxcDsFKSizH+DIKT6Sjfwi+CO096OW8RvJMiE/xwqTqVCoi0k/DZ6
         ihC+m1YY4W2naBTogO8Rlc5L6FhXWNiZgxZ2RZz6LjTVGttKkYMj/HW8S0gMqTCfhQlv
         fs5I/eLnp6SWgm9i3gfmzMi1QsZmbWE60cSyY7re5UX6Kxg2nqTE3Vu2mrBJ12uMZk7L
         rTItMN2NceWxo4xbyKqLsZYNnfVx3vtUqz26seVBXrEPWPBhxjC0AhDQ1mI4ULMe6LVR
         9xSw==
X-Gm-Message-State: AOAM530pEvYBU6igS+GYdeNZUg84wOUhu5LlGTeOAD141U4VKmPmH6JY
	vR2YeCXD1Zh3i9ceP3BtWnQ=
X-Google-Smtp-Source: ABdhPJxQbPp2K0LQcED/BSJB9rGt1JG7KPy/HtLXuq5RsmvDQ6h9sOZBwTXyN1Oml0m5fgkbX5582A==
X-Received: by 2002:a17:906:8a51:: with SMTP id gx17mr37367996ejc.549.1620825833766;
        Wed, 12 May 2021 06:23:53 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id yw9sm2881705ejb.91.2021.05.12.06.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:23:53 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: hal: Remove set but unused variables
Date: Wed, 12 May 2021 15:23:44 +0200
Message-Id: <20210512132344.30225-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512132344.30225-1-fmdefrancesco@gmail.com>
References: <20210512132344.30225-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variables. Issue detected by kernel test robot
while building for target architecture PowerPC with W=1.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: Added this 2/2 to remove variables reported by KTR.

 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 3b8be8137683..8b42b19cc089 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1645,7 +1645,6 @@ void PHY_IQCalibrate_8723B(
 	};
 /* 	u32 		Path_SEL_BB = 0; */
 	u32 		GNT_BT_default;
-	u32 		StartTime;
 
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
@@ -1710,7 +1709,6 @@ void PHY_IQCalibrate_8723B(
 		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
 		return;
 	}
-	StartTime = jiffies;
 
 	/* save default GNT_BT */
 	GNT_BT_default = PHY_QueryBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord);
@@ -1846,7 +1844,6 @@ void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 {
 	bool		bSingleTone = false, bCarrierSuppression = false;
 	u32 		timeout = 2000, timecount = 0;
-	u32 		StartTime;
 
 #if DISABLE_BB_RF
 	return;
@@ -1859,7 +1856,6 @@ void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 	if (bSingleTone || bCarrierSuppression)
 		return;
 
-	StartTime = jiffies;
 	while (*(pDM_Odm->pbScanInProcess) && timecount < timeout) {
 		mdelay(50);
 		timecount += 50;
-- 
2.31.1

