Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF383FD2
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 12:14:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id d6so19820812wrc.11
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 05:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8VnZsNnr3VQCrEo0PDtrkdRH8QBVvc3Duoao6HuugeY=;
        b=TMTSsiFAB7lLVqx8XmDAGMzNBuNhOmKmNRLiBWV71JBy0EvCEF0+CSY7sqdoS90LFk
         qJ7Sl6HclkhZf4hohaZARDtA22KVSsbBfZYGJoVjaJMuUnkcs18bGYasGkMn2ftJPKkq
         JQ8dWhSVElVZIEHwypEJGbTMuuIHR3VgrjQhKYVca5MezXvSNuckPz2uv6xUw92eVKpL
         AYK4ydjz3Maz7q78+MFsDIskRUUjSCumOVHEMTUYO/4pzut3PKLOA0g+F6jpqLrkVgqj
         xAWS66uHU9+zJ8FJCTCVAnkrYc1UJpUoqCtbIGKeEX2PNZvV1wS32lbH0SDr5eZ4plaz
         MC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8VnZsNnr3VQCrEo0PDtrkdRH8QBVvc3Duoao6HuugeY=;
        b=X0GL/4lqD3g15fMaw4TS7VCDrXSoM6bsxGFDvmyGrSIJoXdxCL8BEfkQxKDSJljXwL
         ZR8iwgfMEuiQELZtJJjPpP3unMZ0lydhkgwdAf/h9Xy0PGGuwjylahrKcKaYzaUdSSdm
         JaF0aKk4HzXnudrlD+Qocmef3WH0DLUKS5/Pxyn2Z2M3828SbDUHOfx46ExJAQoIBIq3
         BiMo3wIgl9y/vJBzP9XlLZqGIkoKL37fcl4lp50XPIZW78k1dnsC/0TdmAp92rfmZRgT
         8fIer8iutIk2Z6VLYoGJe6H/O7U0WgdukQ/BtCjAHN44nzOu5bL14ligNtpG1ot3m+15
         HiOQ==
X-Gm-Message-State: AOAM53196sJBSMsAwEVM1KaiN78w4I6iqxIoh3MxByJK3N/8MiMGKWBo
	zDUIuCFpIICCcHfKkXZDr0c=
X-Google-Smtp-Source: ABdhPJxzmvTChsPMPjCRecPc0KsX4ffk2jz57QgSfIhca/hl/sHWn+AhMpTk8Vjb/Tf2ZZhKh1tIUQ==
X-Received: by 2002:adf:e643:: with SMTP id b3mr18850508wrn.67.1631621644255;
        Tue, 14 Sep 2021 05:14:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id j19sm10028100wra.92.2021.09.14.05.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 05:14:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: remove write-only fields from struct hal_data_8188e
Date: Tue, 14 Sep 2021 14:13:50 +0200
Message-Id: <20210914121352.26052-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914121352.26052-1-straube.linux@gmail.com>
References: <20210914121352.26052-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fields MultiFunc and RegulatorMode of struct hal_data_8188e are
set but never used, remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 -----
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index c1188117a5cc..5c6c62e3f6ed 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1684,12 +1684,7 @@ void rtl8188e_read_chip_version(struct adapter *padapter)
 	ChipVersion.RFType = RF_TYPE_1T1R;
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
 	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK) >> CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
-
-	/*  For regulator mode. by tynli. 2011.01.14 */
-	pHalData->RegulatorMode = ((value32 & TRP_BT_EN) ? RT_LDO_REGULATOR : RT_SWITCHING_REGULATOR);
-
 	ChipVersion.ROMVer = 0;	/*  ROM code version. */
-	pHalData->MultiFunc = RT_MULTI_FUNC_NONE;
 
 	dump_chip_info(ChipVersion);
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index f16ffd952215..7e2feb390416 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -223,8 +223,6 @@ enum rt_regulator_mode {
 
 struct hal_data_8188e {
 	struct HAL_VERSION	VersionID;
-	enum rt_multi_func MultiFunc; /*  For multi-function consideration. */
-	enum rt_regulator_mode RegulatorMode; /*  switching regulator or LDO */
 	u16	CustomerID;
 
 	u16	FirmwareVersion;
-- 
2.33.0

