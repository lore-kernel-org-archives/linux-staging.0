Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB46B45091D
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 20:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222860; cv=none; b=I/jSw+OBD70VS/QeOZl0F+495n1umuhxZm4Ditr/7JXG2OxpJIcxawlTKPOcRyyXfNGoJnEw91tmM6Lsf61UwPjxz+i3IDtmxczA3U4TgwmixtBSTf2W4Me9FKIAYIoTSBACkF8qUD1KiCXHkCNDFVfvmjf1K+rB6KI9nzYo2Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222860; c=relaxed/simple;
	bh=HDor/PBZ2JeNLNdh+Uqn6EAndE6TwQGCM87QxWeBZ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kfMsGqM3+lSorS4Ym+YZVhAtplmsTEF3QWj6UPl4DDNeEXdUm0l3Gm7+Y/J9A+VjxOuzwhQb3fDMx38paJvw2EI1CvmlYEAR3fQriD9bYZ9TB18IOhFrj3E5Oi4gL91yGxwBbIOUm6pm9n1ccppRo66kQd3n0HIWMkggAJMD8AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPrtj4O9; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPrtj4O9"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-483a2338616so15230705e9.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 12:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772222857; x=1772827657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qv/8o16ZJyxqWqCxAnZXzWbbfeTw2X9izfBMExBRzt4=;
        b=cPrtj4O99Oc41EuCVRB+IoAeUnIWxDTAc3xHgl1cs5nfRnNjZCpifdusWKDkk9vaZv
         +I9SJPF7qjkdM5IpKuYXaeWqLYAgZmtGyLdzKA0Ke8kOWoGXpqtuhCkY1gwjLVFscT/s
         qkPOzb0D+M2hTw+FlXZWKW0e0XclCY2M42Wz11rHtcW15SMRhf21BTwVLgvf1P0MFuc3
         ik9j6AhWyT3srXcbz/3oOE65+7YGt/cocyPp+sQNkONIoZax3AXfMpnWx4XU9OioBB4s
         Z9EziWA4YJyRtOSsdAjYk3c3xjl1MwOMihI5J8po4WxONywNQEqEwuvgjL2UEc47i+pL
         QsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222857; x=1772827657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qv/8o16ZJyxqWqCxAnZXzWbbfeTw2X9izfBMExBRzt4=;
        b=HfEetyvfuAERukl1siA1KyZYco+SxApuoQciGw6A2toQfTRv6YfmVOggXj+UFydVT0
         iDdoDdemwlbhKrTFmQH2bF9zbEtYUHBP1xOEdRgY9En33sRmtFflSLj0y8gQXKM/QtT5
         lkdonfbezzbRQN4DZ9If+U1u7bypUge5dnmf0IaNmW0GI1hLRJcy+2J1Hnv5SOET0z8h
         fXt4Es+freqhiOhBFUpJV2frDnoJXnjRAJ7TotKEnL6Usn5Io9ALWFrupt6jnzJ3gMwR
         RyupqVsPRxO+Vo5DqlrOvMpO8PpxMVm1EXIaAa6ooC0aXeIV43aDimQm8AvSBxdNrRia
         99qA==
X-Forwarded-Encrypted: i=1; AJvYcCURAlXabIGn22dX5yBiuQHvwntVg+ydZxUI5gBND0bFQ6Q3ZOJse431fpuirt5DwPUkuJJWVCsZWn4TF+jv@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/sTq3FQOypZx52SpuZYkj5KzoD3OTtdF5r9pcy+96+0s/kl+E
	/ZIMfRtDtW2BPztwhXNi8o0p7jXQ1D3sRMoC3oJver+pMVj/fc6ybmzr
X-Gm-Gg: ATEYQzzn7hLTz+lfA1d8vyEV1IGEW2XS0j1vBk5y3dx9DKVxs7qnlWSLTzPTTC58m72
	desx2JDNVNYQRqHKdpIcLH6kdGjBf5WNyfuN7sI8OvgQ5NSc3Ez6exGS3BorHYlCbmgQ79hDlkg
	UN7B8QWihltYsxbmD/Uj2qsKpq82hl7kssoOgZ2u9SmMru0Y/WOnLmPLjfcAFSKa5brmHrZ9hhu
	SYC1RzGrmmB/Fj58X1GngWa9C3SGDUppsH4bJGJeh+WxnKZLHi/b5bUA3EhC3BNyfajPGPuoRTS
	RTBtjfae6WZywt6vuNAv+NcJXSkAaRqgGgjQM9hZUZy4I3/7Z6MDvkaUazsE18ykqSKduMFwRXG
	B4Lf8147hEeIcuupQQoGY5YgKvxUGXUGota6stWc620lILIl2KaqzIZ3kkCtpEoaBujg6TiNpC9
	FALyoShuNTgZwTcA9oSmbAJMQwHAn6J+lGsUz0
X-Received: by 2002:a05:600c:3b9f:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-483c9ba7e4dmr62806435e9.6.1772222857080;
        Fri, 27 Feb 2026 12:07:37 -0800 (PST)
Received: from BERA.localdomain ([31.223.72.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3addb3asm133845525e9.0.2026.02.27.12.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:07:36 -0800 (PST)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	Yeking@Red54.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ethantidmore06@gmail.com,
	weibu@redadmin.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH] staging: rtl8723bs: change custom comparing function to memcmp()
Date: Fri, 27 Feb 2026 23:06:37 +0300
Message-ID: <20260227200637.47130-1-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

eqNByte() function is a redundant reimplementation of memcmp().
Remove eqNByte() and switch its usages to memcmp().
No functional change.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c       | 12 ------------
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 19 ++++++++++---------
 drivers/staging/rtl8723bs/include/hal_com.h   |  2 --
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 31b3e880ae6a..a7720f821823 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -750,18 +750,6 @@ void SetHalODMVar(
 }
 
 
-bool eqNByte(u8 *str1, u8 *str2, u32 num)
-{
-	if (num == 0)
-		return false;
-	while (num > 0) {
-		num--;
-		if (str1[num] != str2[num])
-			return false;
-	}
-	return true;
-}
-
 bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 {
 	u16 i = 0;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index dc2da49e6738..b5ba3eba597b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -8,6 +8,7 @@
 #include <drv_types.h>
 #include <hal_data.h>
 #include <linux/kernel.h>
+#include <linux/string.h>
 
 u8 PHY_GetTxPowerByRateBase(struct adapter *Adapter, u8 RfPath,
 			    enum rate_section RateSection)
@@ -819,27 +820,27 @@ void PHY_SetTxPowerLimit(
 
 	powerLimit = powerLimit > MAX_POWER_INDEX ? MAX_POWER_INDEX : powerLimit;
 
-	if (eqNByte(Regulation, (u8 *)("FCC"), 3))
+	if (memcmp(Regulation, "FCC", 3) == 0)
 		regulation = 0;
-	else if (eqNByte(Regulation, (u8 *)("MKK"), 3))
+	else if (memcmp(Regulation, "MKK", 3) == 0)
 		regulation = 1;
-	else if (eqNByte(Regulation, (u8 *)("ETSI"), 4))
+	else if (memcmp(Regulation, "ETSI", 4) == 0)
 		regulation = 2;
-	else if (eqNByte(Regulation, (u8 *)("WW13"), 4))
+	else if (memcmp(Regulation, "WW13", 4) == 0)
 		regulation = 3;
 
-	if (eqNByte(RateSection, (u8 *)("CCK"), 3) && eqNByte(RfPath, (u8 *)("1T"), 2))
+	if (memcmp(RateSection, "CCK", 3) == 0 && memcmp(RfPath, "1T", 2) == 0)
 		rateSection = 0;
-	else if (eqNByte(RateSection, (u8 *)("OFDM"), 4) && eqNByte(RfPath, (u8 *)("1T"), 2))
+	else if (memcmp(RateSection, "OFDM", 4) == 0 && memcmp(RfPath, "1T", 2) == 0)
 		rateSection = 1;
-	else if (eqNByte(RateSection, (u8 *)("HT"), 2) && eqNByte(RfPath, (u8 *)("1T"), 2))
+	else if (memcmp(RateSection, "HT", 2) == 0 && memcmp(RfPath, "1T", 2) == 0)
 		rateSection = 2;
 	else
 		return;
 
-	if (eqNByte(Bandwidth, (u8 *)("20M"), 3))
+	if (memcmp(Bandwidth, "20M", 3) == 0)
 		bandwidth = 0;
-	else if (eqNByte(Bandwidth, (u8 *)("40M"), 3))
+	else if (memcmp(Bandwidth, "40M", 3) == 0)
 		bandwidth = 1;
 
 	channelIndex = phy_GetChannelIndexOfTxPowerLimit(channel);
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 74d6c892c401..483f0390addc 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -141,8 +141,6 @@ void rtw_hal_check_rxfifo_full(struct adapter *adapter);
 u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
 		void *value);
 
-bool eqNByte(u8 *str1, u8 *str2, u32 num);
-
 bool GetU1ByteIntegerFromStringInDecimal(char *str, u8 *in);
 
 #define		HWSET_MAX_SIZE			512
-- 
2.43.0

