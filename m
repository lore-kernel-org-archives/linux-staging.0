Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E975809
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774089630; cv=none; b=CmgkTX2/Jki4AnpNCu5nID1ISwQF36QM5FyTY/WYkBV/m3nzu3ForRjY1F3XF7mvTOeTlaW+s/aw3tt7vNIXvA8pQGrOhWCJ48yf7fu4YurzlHK4gY3Dou+GC3WcTNcwqXjqttUz7cP5PciMwnDaEl68Cril58Kmf7fwaT+PzGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774089630; c=relaxed/simple;
	bh=BYig1v1UB0ekdgI7eZWkr0JYIqw+F/dIegZQ0gbIXVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i1Qjoh6k/KM3PkDzwtepLiy7EZT11iSYfIT5Uaf6Kq7v7FklrytXKn5ykS8O+RgY8ZsORjNamhii4Ev1zluRmFgxAECW18v30YIUgrT2+FzzyKNfSZPyVO9PmerKD2ClZLU1S2tZ0/4lkF7A6zaEPI9719ZTUtW9Rgm6ZMKrsyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/qeovC5; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/qeovC5"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-439fe4985efso1122838f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774089627; x=1774694427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1ugOMNYrLcyPD/ERWBI5HFPpNjUZlBaVZDvD60s26c=;
        b=m/qeovC5C8DBe+FPihh4q/f9YMIgwb4/1I2jLHmdPD5gxEdmk3tsfZxP5QFC2ODR8J
         nXvGoz6aVEeNMb+nt9cyvD+zT0hg6IC29mkfnpYuNwzRE6eGPUCSO1X3nUjiiJWZypzI
         uIulLgHDx3XUPyAWn7ZuAcJx6AK2ueyhiUqOaMBBVgtsAaxvtVWXFEdLJlbkjHLmFAeS
         /HgImOorQS5rVrEX+Z16L5DcYOETmkQWJMxRHxHjZ47R8El8CA+lorS3KDUz5FKSxK4w
         AUsBXHPimXVJ0IHf6DMTansawkl0ze/SkSt1NmwyBrzddlqW+7twvdu3uU7EdHhIes+O
         jn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774089627; x=1774694427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1ugOMNYrLcyPD/ERWBI5HFPpNjUZlBaVZDvD60s26c=;
        b=q7QB0LhBCBDZBjiKHexEwbvJRvhfaC4yrwPFT9il2E0hKGxoZ3v6fj2MBedJqmxXLH
         /t6SPmH84rQ0duFyOnUhD0uGmc2Ah45aXUwAlwo7hZLQF3k+TSw2gqykZ1Nz4I58ubRj
         PVRcLqM0ntrCFdDfWcbd7zKeNy5M6tkw1q8mn15qagPsxSyRgCvo92tCn7gLICu/VaXC
         Esd5BBoVtxYUhXm0BPRK1+o9TUDOMrMqlowEH5Pf37gy2Wx7cYsTkoJRCbS41P86qJto
         5fEvX/17TgBscgFCP9wjWQ4+QTD2A+fYeDRJEX5WxaKnxyfISXtSKSv5dEZg5v+CVk+w
         So2w==
X-Forwarded-Encrypted: i=1; AJvYcCVB91q4zkeoAhSUd1ckqSZBhHmlTMCk95LDf7H3qXOPdv1VZRzuN0KqlUFUkrtZrxb1M1/3pOyFBoxirsA1@lists.linux.dev
X-Gm-Message-State: AOJu0YxBYUlpDeOcE56kWVod8DQD8nocrmQmhUKLXh3+55d06dvgMkSD
	3uVHdHkgypZAWMX6Pivx78RdPcwToMtwc0KWRL0f1WwzErTSYigAfOxD
X-Gm-Gg: ATEYQzw4NGmXfDJycUtlxPJ77rPIB+QnGCDivWyzgbhp+QSIr7XM0DWdYhWbbgwLcsG
	nWNjdSZE3nvIR9bVA03IC8M5TYk9F9RtClAAfUYdsTn7TI6NafgjVvMnDAMKIq1wRm4eKqJlCsX
	rcco/T4vEGql6rYx69ZdsHm+lM204W5X5AcDsKJ9TeTtlmGrINxsAcwzQmmU8dgsT5PmjMjnfA4
	I1QivPbJSIOazoavbBEvMQcp8s89dVZC+j67Vny+owqR6mkTDFy1ubjE8nMbZNWCid/QteKTuBp
	vgFV0RLhjVC22I6FhQ6S+84QMGUaF1ea4Z29mRg4myylz5UaJ7DR0geDYPSW9GNZBILk0JsePCT
	DRD+SHhDf0j8Z0I0ZkpsMGfDWdW1YksH9xiBbG73wYr/Ar1Q9pN6LJb2v/IYRBizsSPNRmBpVtF
	+yGwoTGRfWh82UzLeCfAwVipg4
X-Received: by 2002:a05:6000:1841:b0:43b:54c9:7d25 with SMTP id ffacd0b85a97d-43b64270abdmr9668826f8f.38.1774089626930;
        Sat, 21 Mar 2026 03:40:26 -0700 (PDT)
Received: from bera-arch ([46.154.44.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b243sm13047281f8f.26.2026.03.21.03.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:40:26 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Yeking@Red54.com,
	andriy.shevchenko@linux.intel.com,
	ethantidmore06@gmail.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	rayfraytech@gmail.com,
	straube.linux@gmail.com,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove reduntant functions
Date: Sat, 21 Mar 2026 13:40:02 +0300
Message-ID: <20260321104001.46968-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GetU1ByteIntegerFromStringInDecimal() is a copy of kstrtou8().
But its only called by PHY_SetTxPowerLimit() which is only
called by odm_ConfigBB_TXPWR_LMT_8723B() which is only called
by ODM_ReadAndConfig_MP_8723B_TXPWR_LMT().
But ODM_ReadAndConfig_MP_8723B_TXPWR_LMT() didn't called anywhere
so removed:
GetU1ByteIntegerFromStringInDecimal()
PHY_SetTxPowerLimit()
odm_ConfigBB_TXPWR_LMT_8723B()
ODM_ReadAndConfig_MP_8723B_TXPWR_LMT()

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
V2: Removed others
V1: Removed only GetU1ByteIntegerFromStringInDecimal()
V1 link: https://lore.kernel.org/linux-staging/ab2fZaBu_5EJieMq@ashevche-desk.local/T/#u

 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  | 200 ------------------
 drivers/staging/rtl8723bs/hal/hal_com.c       |  19 --
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  53 -----
 .../rtl8723bs/hal/odm_RegConfig8723B.c        |  21 --
 .../rtl8723bs/hal/odm_RegConfig8723B.h        |   9 -
 drivers/staging/rtl8723bs/include/hal_com.h   |   2 -
 .../rtl8723bs/include/hal_com_phycfg.h        |   3 -
 7 files changed, 307 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
index 0c7d0307b822..0fb1751970d9 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
@@ -353,203 +353,3 @@ void ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(struct dm_odm_t *pDM_Odm)
 		DELTA_SWINGIDX_SIZE
 	);
 }
-
-/******************************************************************************
- *                           TXPWR_LMT.TXT
- ******************************************************************************/
-
-static u8 *Array_MP_8723B_TXPWR_LMT[] = {
-	"FCC", "20M", "CCK", "1T", "01", "32",
-	"ETSI", "20M", "CCK", "1T", "01", "32",
-	"MKK", "20M", "CCK", "1T", "01", "32",
-	"FCC", "20M", "CCK", "1T", "02", "32",
-	"ETSI", "20M", "CCK", "1T", "02", "32",
-	"MKK", "20M", "CCK", "1T", "02", "32",
-	"FCC", "20M", "CCK", "1T", "03", "32",
-	"ETSI", "20M", "CCK", "1T", "03", "32",
-	"MKK", "20M", "CCK", "1T", "03", "32",
-	"FCC", "20M", "CCK", "1T", "04", "32",
-	"ETSI", "20M", "CCK", "1T", "04", "32",
-	"MKK", "20M", "CCK", "1T", "04", "32",
-	"FCC", "20M", "CCK", "1T", "05", "32",
-	"ETSI", "20M", "CCK", "1T", "05", "32",
-	"MKK", "20M", "CCK", "1T", "05", "32",
-	"FCC", "20M", "CCK", "1T", "06", "32",
-	"ETSI", "20M", "CCK", "1T", "06", "32",
-	"MKK", "20M", "CCK", "1T", "06", "32",
-	"FCC", "20M", "CCK", "1T", "07", "32",
-	"ETSI", "20M", "CCK", "1T", "07", "32",
-	"MKK", "20M", "CCK", "1T", "07", "32",
-	"FCC", "20M", "CCK", "1T", "08", "32",
-	"ETSI", "20M", "CCK", "1T", "08", "32",
-	"MKK", "20M", "CCK", "1T", "08", "32",
-	"FCC", "20M", "CCK", "1T", "09", "32",
-	"ETSI", "20M", "CCK", "1T", "09", "32",
-	"MKK", "20M", "CCK", "1T", "09", "32",
-	"FCC", "20M", "CCK", "1T", "10", "32",
-	"ETSI", "20M", "CCK", "1T", "10", "32",
-	"MKK", "20M", "CCK", "1T", "10", "32",
-	"FCC", "20M", "CCK", "1T", "11", "32",
-	"ETSI", "20M", "CCK", "1T", "11", "32",
-	"MKK", "20M", "CCK", "1T", "11", "32",
-	"FCC", "20M", "CCK", "1T", "12", "63",
-	"ETSI", "20M", "CCK", "1T", "12", "32",
-	"MKK", "20M", "CCK", "1T", "12", "32",
-	"FCC", "20M", "CCK", "1T", "13", "63",
-	"ETSI", "20M", "CCK", "1T", "13", "32",
-	"MKK", "20M", "CCK", "1T", "13", "32",
-	"FCC", "20M", "CCK", "1T", "14", "63",
-	"ETSI", "20M", "CCK", "1T", "14", "63",
-	"MKK", "20M", "CCK", "1T", "14", "32",
-	"FCC", "20M", "OFDM", "1T", "01", "28",
-	"ETSI", "20M", "OFDM", "1T", "01", "32",
-	"MKK", "20M", "OFDM", "1T", "01", "32",
-	"FCC", "20M", "OFDM", "1T", "02", "28",
-	"ETSI", "20M", "OFDM", "1T", "02", "32",
-	"MKK", "20M", "OFDM", "1T", "02", "32",
-	"FCC", "20M", "OFDM", "1T", "03", "32",
-	"ETSI", "20M", "OFDM", "1T", "03", "32",
-	"MKK", "20M", "OFDM", "1T", "03", "32",
-	"FCC", "20M", "OFDM", "1T", "04", "32",
-	"ETSI", "20M", "OFDM", "1T", "04", "32",
-	"MKK", "20M", "OFDM", "1T", "04", "32",
-	"FCC", "20M", "OFDM", "1T", "05", "32",
-	"ETSI", "20M", "OFDM", "1T", "05", "32",
-	"MKK", "20M", "OFDM", "1T", "05", "32",
-	"FCC", "20M", "OFDM", "1T", "06", "32",
-	"ETSI", "20M", "OFDM", "1T", "06", "32",
-	"MKK", "20M", "OFDM", "1T", "06", "32",
-	"FCC", "20M", "OFDM", "1T", "07", "32",
-	"ETSI", "20M", "OFDM", "1T", "07", "32",
-	"MKK", "20M", "OFDM", "1T", "07", "32",
-	"FCC", "20M", "OFDM", "1T", "08", "32",
-	"ETSI", "20M", "OFDM", "1T", "08", "32",
-	"MKK", "20M", "OFDM", "1T", "08", "32",
-	"FCC", "20M", "OFDM", "1T", "09", "32",
-	"ETSI", "20M", "OFDM", "1T", "09", "32",
-	"MKK", "20M", "OFDM", "1T", "09", "32",
-	"FCC", "20M", "OFDM", "1T", "10", "28",
-	"ETSI", "20M", "OFDM", "1T", "10", "32",
-	"MKK", "20M", "OFDM", "1T", "10", "32",
-	"FCC", "20M", "OFDM", "1T", "11", "28",
-	"ETSI", "20M", "OFDM", "1T", "11", "32",
-	"MKK", "20M", "OFDM", "1T", "11", "32",
-	"FCC", "20M", "OFDM", "1T", "12", "63",
-	"ETSI", "20M", "OFDM", "1T", "12", "32",
-	"MKK", "20M", "OFDM", "1T", "12", "32",
-	"FCC", "20M", "OFDM", "1T", "13", "63",
-	"ETSI", "20M", "OFDM", "1T", "13", "32",
-	"MKK", "20M", "OFDM", "1T", "13", "32",
-	"FCC", "20M", "OFDM", "1T", "14", "63",
-	"ETSI", "20M", "OFDM", "1T", "14", "63",
-	"MKK", "20M", "OFDM", "1T", "14", "63",
-	"FCC", "20M", "HT", "1T", "01", "26",
-	"ETSI", "20M", "HT", "1T", "01", "32",
-	"MKK", "20M", "HT", "1T", "01", "32",
-	"FCC", "20M", "HT", "1T", "02", "26",
-	"ETSI", "20M", "HT", "1T", "02", "32",
-	"MKK", "20M", "HT", "1T", "02", "32",
-	"FCC", "20M", "HT", "1T", "03", "32",
-	"ETSI", "20M", "HT", "1T", "03", "32",
-	"MKK", "20M", "HT", "1T", "03", "32",
-	"FCC", "20M", "HT", "1T", "04", "32",
-	"ETSI", "20M", "HT", "1T", "04", "32",
-	"MKK", "20M", "HT", "1T", "04", "32",
-	"FCC", "20M", "HT", "1T", "05", "32",
-	"ETSI", "20M", "HT", "1T", "05", "32",
-	"MKK", "20M", "HT", "1T", "05", "32",
-	"FCC", "20M", "HT", "1T", "06", "32",
-	"ETSI", "20M", "HT", "1T", "06", "32",
-	"MKK", "20M", "HT", "1T", "06", "32",
-	"FCC", "20M", "HT", "1T", "07", "32",
-	"ETSI", "20M", "HT", "1T", "07", "32",
-	"MKK", "20M", "HT", "1T", "07", "32",
-	"FCC", "20M", "HT", "1T", "08", "32",
-	"ETSI", "20M", "HT", "1T", "08", "32",
-	"MKK", "20M", "HT", "1T", "08", "32",
-	"FCC", "20M", "HT", "1T", "09", "32",
-	"ETSI", "20M", "HT", "1T", "09", "32",
-	"MKK", "20M", "HT", "1T", "09", "32",
-	"FCC", "20M", "HT", "1T", "10", "26",
-	"ETSI", "20M", "HT", "1T", "10", "32",
-	"MKK", "20M", "HT", "1T", "10", "32",
-	"FCC", "20M", "HT", "1T", "11", "26",
-	"ETSI", "20M", "HT", "1T", "11", "32",
-	"MKK", "20M", "HT", "1T", "11", "32",
-	"FCC", "20M", "HT", "1T", "12", "63",
-	"ETSI", "20M", "HT", "1T", "12", "32",
-	"MKK", "20M", "HT", "1T", "12", "32",
-	"FCC", "20M", "HT", "1T", "13", "63",
-	"ETSI", "20M", "HT", "1T", "13", "32",
-	"MKK", "20M", "HT", "1T", "13", "32",
-	"FCC", "20M", "HT", "1T", "14", "63",
-	"ETSI", "20M", "HT", "1T", "14", "63",
-	"MKK", "20M", "HT", "1T", "14", "63",
-	"FCC", "40M", "HT", "1T", "01", "63",
-	"ETSI", "40M", "HT", "1T", "01", "63",
-	"MKK", "40M", "HT", "1T", "01", "63",
-	"FCC", "40M", "HT", "1T", "02", "63",
-	"ETSI", "40M", "HT", "1T", "02", "63",
-	"MKK", "40M", "HT", "1T", "02", "63",
-	"FCC", "40M", "HT", "1T", "03", "26",
-	"ETSI", "40M", "HT", "1T", "03", "32",
-	"MKK", "40M", "HT", "1T", "03", "32",
-	"FCC", "40M", "HT", "1T", "04", "26",
-	"ETSI", "40M", "HT", "1T", "04", "32",
-	"MKK", "40M", "HT", "1T", "04", "32",
-	"FCC", "40M", "HT", "1T", "05", "32",
-	"ETSI", "40M", "HT", "1T", "05", "32",
-	"MKK", "40M", "HT", "1T", "05", "32",
-	"FCC", "40M", "HT", "1T", "06", "32",
-	"ETSI", "40M", "HT", "1T", "06", "32",
-	"MKK", "40M", "HT", "1T", "06", "32",
-	"FCC", "40M", "HT", "1T", "07", "32",
-	"ETSI", "40M", "HT", "1T", "07", "32",
-	"MKK", "40M", "HT", "1T", "07", "32",
-	"FCC", "40M", "HT", "1T", "08", "26",
-	"ETSI", "40M", "HT", "1T", "08", "32",
-	"MKK", "40M", "HT", "1T", "08", "32",
-	"FCC", "40M", "HT", "1T", "09", "26",
-	"ETSI", "40M", "HT", "1T", "09", "32",
-	"MKK", "40M", "HT", "1T", "09", "32",
-	"FCC", "40M", "HT", "1T", "10", "26",
-	"ETSI", "40M", "HT", "1T", "10", "32",
-	"MKK", "40M", "HT", "1T", "10", "32",
-	"FCC", "40M", "HT", "1T", "11", "26",
-	"ETSI", "40M", "HT", "1T", "11", "32",
-	"MKK", "40M", "HT", "1T", "11", "32",
-	"FCC", "40M", "HT", "1T", "12", "63",
-	"ETSI", "40M", "HT", "1T", "12", "32",
-	"MKK", "40M", "HT", "1T", "12", "32",
-	"FCC", "40M", "HT", "1T", "13", "63",
-	"ETSI", "40M", "HT", "1T", "13", "32",
-	"MKK", "40M", "HT", "1T", "13", "32",
-	"FCC", "40M", "HT", "1T", "14", "63",
-	"ETSI", "40M", "HT", "1T", "14", "63",
-	"MKK", "40M", "HT", "1T", "14", "63"
-};
-
-void ODM_ReadAndConfig_MP_8723B_TXPWR_LMT(struct dm_odm_t *pDM_Odm)
-{
-	u32 i = 0;
-	u8 **Array = Array_MP_8723B_TXPWR_LMT;
-
-	for (i = 0; i < ARRAY_SIZE(Array_MP_8723B_TXPWR_LMT); i += 6) {
-		u8 *regulation = Array[i];
-		u8 *bandwidth = Array[i+1];
-		u8 *rate = Array[i+2];
-		u8 *rfPath = Array[i+3];
-		u8 *chnl = Array[i+4];
-		u8 *val = Array[i+5];
-
-		odm_ConfigBB_TXPWR_LMT_8723B(
-			pDM_Odm,
-			regulation,
-			bandwidth,
-			rate,
-			rfPath,
-			chnl,
-			val
-		);
-	}
-}
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 50370b14ce7c..4f4a430c9f87 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -751,25 +751,6 @@ void SetHalODMVar(
 	}
 }
 
-
-bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
-{
-	u16 i = 0;
-	*pInt = 0;
-
-	while (Str[i] != '\0') {
-		if (Str[i] >= '0' && Str[i] <= '9') {
-			*pInt *= 10;
-			*pInt += (Str[i] - '0');
-		} else
-			return false;
-
-		++i;
-	}
-
-	return true;
-}
-
 void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 {
 	/* switch counter to RX fifo */
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index bdd595a99b98..4a3eb6d79f33 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -805,59 +805,6 @@ void PHY_InitTxPowerLimit(struct adapter *Adapter)
 	}
 }
 
-void PHY_SetTxPowerLimit(
-	struct adapter *Adapter,
-	u8 *Regulation,
-	u8 *Bandwidth,
-	u8 *RateSection,
-	u8 *RfPath,
-	u8 *Channel,
-	u8 *PowerLimit
-)
-{
-	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
-	u8 regulation = 0, bandwidth = 0, rateSection = 0, channel;
-	s8 powerLimit = 0, prevPowerLimit, channelIndex;
-
-	GetU1ByteIntegerFromStringInDecimal((s8 *)Channel, &channel);
-	GetU1ByteIntegerFromStringInDecimal((s8 *)PowerLimit, &powerLimit);
-
-	powerLimit = powerLimit > MAX_POWER_INDEX ? MAX_POWER_INDEX : powerLimit;
-
-	if (strcmp(Regulation, "FCC") == 0)
-		regulation = 0;
-	else if (strcmp(Regulation, "MKK") == 0)
-		regulation = 1;
-	else if (strcmp(Regulation, "ETSI") == 0)
-		regulation = 2;
-	else if (strcmp(Regulation, "WW13") == 0)
-		regulation = 3;
-
-	if (strcmp(RateSection, "CCK") == 0 && strcmp(RfPath, "1T") == 0)
-		rateSection = 0;
-	else if (strcmp(RateSection, "OFDM") == 0 && strcmp(RfPath, "1T") == 0)
-		rateSection = 1;
-	else if (strcmp(RateSection, "HT") == 0 && strcmp(RfPath, "1T") == 0)
-		rateSection = 2;
-	else
-		return;
-
-	if (strcmp(Bandwidth, "20M") == 0)
-		bandwidth = 0;
-	else if (strcmp(Bandwidth, "40M") == 0)
-		bandwidth = 1;
-
-	channelIndex = phy_GetChannelIndexOfTxPowerLimit(channel);
-
-	if (channelIndex == -1)
-		return;
-
-	prevPowerLimit = pHalData->TxPwrLimit_2_4G[regulation][bandwidth][rateSection][channelIndex][RF_PATH_A];
-
-	if (powerLimit < prevPowerLimit)
-		pHalData->TxPwrLimit_2_4G[regulation][bandwidth][rateSection][channelIndex][RF_PATH_A] = powerLimit;
-}
-
 void Hal_ChannelPlanToRegulation(struct adapter *Adapter, u16 ChannelPlan)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
diff --git a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
index b0ca46aec1a5..90296eb806cb 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
+++ b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
@@ -154,24 +154,3 @@ void odm_ConfigBB_PHY_8723B(
 	/*  Add 1us delay between BB/RF register setting. */
 	udelay(1);
 }
-
-void odm_ConfigBB_TXPWR_LMT_8723B(
-	struct dm_odm_t *pDM_Odm,
-	u8 *Regulation,
-	u8 *Bandwidth,
-	u8 *RateSection,
-	u8 *RfPath,
-	u8 *Channel,
-	u8 *PowerLimit
-)
-{
-	PHY_SetTxPowerLimit(
-		pDM_Odm->Adapter,
-		Regulation,
-		Bandwidth,
-		RateSection,
-		RfPath,
-		Channel,
-		PowerLimit
-	);
-}
diff --git a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.h b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.h
index fba7053ee3e1..c9b56d4d85c3 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.h
+++ b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.h
@@ -33,13 +33,4 @@ void odm_ConfigBB_PHY_8723B(struct dm_odm_t *pDM_Odm,
 			    u32 Data
 );
 
-void odm_ConfigBB_TXPWR_LMT_8723B(struct dm_odm_t *pDM_Odm,
-				  u8 *Regulation,
-				  u8 *Bandwidth,
-				  u8 *RateSection,
-				  u8 *RfPath,
-				  u8 *Channel,
-				  u8 *PowerLimit
-);
-
 #endif
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 483f0390addc..7c67fee148fa 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -141,8 +141,6 @@ void rtw_hal_check_rxfifo_full(struct adapter *adapter);
 u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
 		void *value);
 
-bool GetU1ByteIntegerFromStringInDecimal(char *str, u8 *in);
-
 #define		HWSET_MAX_SIZE			512
 
 void rtw_bb_rf_gain_offset(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
index cb7c7ed74146..6aac5394f1ca 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
@@ -94,9 +94,6 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 RegPwrTblSel,
 		      enum channel_width Bandwidth, u8 RfPath, u8 DataRate,
 		      u8 Channel);
 
-void PHY_SetTxPowerLimit(struct adapter *Adapter, u8 *Regulation, u8 *Bandwidth,
-			 u8 *RateSection, u8 *RfPath, u8 *Channel, u8 *PowerLimit);
-
 void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter);
 
 void PHY_InitTxPowerLimit(struct adapter *Adapter);
-- 
2.53.0

