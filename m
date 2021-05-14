Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF4571
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 09:04:12 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id n2so43669080ejy.7
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2Rbc7uMf2NXprKp7o09bgOfkD4GltKxQ10/U9+EYJo=;
        b=BWdFjQ8iY8avhxxBHHaIt+y7+yUx594OFEGATL8PqNAugAcQ5PNHOHaSxCxnS3/4Vg
         LH6P+LHYzm2G6lg+OH7bTVCtdgZcBOclfdadifl3s9GD4cyO+NGpNY161P+rEsZJVaLW
         MhymtUP5HyWW2OLTYcewa/NRM35yppdK7iFvR4SeYTShQzIou3bLuzFnc2E/HxVNTZZg
         C9DR78Q717QtjuRVvq1LOYf/LTeD1ipiUvoMpGZ4lEyBzzjWFXvzIt/Tvft8nnX9KPqw
         RXH4hGrtH7ebDl8hwZm3UEK+fyGyYPct+RxrReHtkrlhUNVruVdtrx4Mapc3vugOfuRr
         cW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z2Rbc7uMf2NXprKp7o09bgOfkD4GltKxQ10/U9+EYJo=;
        b=n/Epp+8q8zb5D4rCjqFrc32wK7Ld8aEB5QJGxu0u2CHgv4UsOoYnJGP+a0cmtEMJ0h
         E57JTx70ClYhab519Zh+u5TzbziG25xWTzZoZfSuphv51XjB7XcrpubadkL3AdHLk2M0
         NahDbTcsrm9IKFC0QAZ7CTnYBRG/cNH9Ow9qdj3taHUNrkNd9jIE0Rdk0JD5qZsROX/Q
         69HzzMjSaDMZEtVXCYFmJD3UTCm29sfbd8LSL+1e6QKLFcoRoE3i7mtmKCYi3G3TzWd4
         ISkHqmCxrHszCWMjBpGMc+RqIn9f9Nj3o2EPC92SfCNrS1HPyCTWR7p5ooQtLM7pH6iy
         APSA==
X-Gm-Message-State: AOAM533401i4WVLqS0ZFiejc50renkStoVQlucK1Avorfl/zQamvpVSj
	xB2p9qD42I2gjIXp5qbZHGoF76o5vTg=
X-Google-Smtp-Source: ABdhPJx/UjO9aHzezxJlUjH78mygBlhnJnHxKZGIKfig3FQDWwAD1AXKISMU8uPvMKeD97X+dyKX8Q==
X-Received: by 2002:a17:906:fccc:: with SMTP id qx12mr4107853ejb.21.1620983051466;
        Fri, 14 May 2021 02:04:11 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id cq9sm2446395edb.44.2021.05.14.02.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:04:11 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8723bs: hal: Remove set but unused variable
Date: Fri, 14 May 2021 11:04:01 +0200
Message-Id: <20210514090401.16123-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514090401.16123-1-fmdefrancesco@gmail.com>
References: <20210514090401.16123-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variable. Issue reported by kernel test robot
building with GCC W=1 for PowerPC target architecture.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v2: Rewrote the subject line.
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

