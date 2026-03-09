Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425303CE4B3
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 18:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082028; cv=none; b=qvM/dYQE4ZEJoPgIMpgRnjrdwyFpEv2dNOK2m97b/wqAyOsN1whDcrEjK4eTsgUgZQDwDte5Yi1w8zMjSN4xGy5Ihibsq6oEEIK3OlKCRnnMazlahMrhxesa/3EbBrdLk/WdT9b6vJpBF6zsD0afncikMknB5fAk2lxUoojHSAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082028; c=relaxed/simple;
	bh=YUwDKVuaod6e/PKMa3LFkP3fBK1rG/UFWBdQt4zgyd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sRvZNLKzViy6nQFI123q8aFPYaUgX8YSdHPWGIZfJqJVakMiHYxX0JYfkg4LrJy0b/fneO8fwjTf7F90NPU/dzdmDFL34Ee6PZ4eNNvQwGatLBJ5Pm+kyGXglVO/S5hYJuljw4hwCYmxMvmwb2pp+/AqtiwcU/ln6N7WMpmUvCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBVhp8BA; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBVhp8BA"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-439c5b40f60so4971208f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773082025; x=1773686825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2c1e+cr1MK5fkAIaVFhuig+jMcTHc2i1DpO1ijKNSs=;
        b=cBVhp8BAsmON9KSo9sDqJupvgUMD/QDWaK515Qfr9nbTNBPoC8DPZCJASH7Ih4C3mC
         ZNds8Vms8uOVL7PUQjGEeMu3FOa/XaEjZaQ61ZK+7rTkP86Wy13BYIvbis+l7eCtiLC0
         2Z+NJGMgutgXQpz6Ol4Bnz3as/0LryGm5lyWWHt2zpqEwEMiqMcKda6Fe/hf0f1wNnVL
         3c2NRoQx2e3qOHs3xKAxybj1DfDkFaGosv9Oeu1gdxYoRoxBa0KeCBqhVygAHEXkH9Z4
         G133PQLTiEYOROZ/YssBxuGvdMNHi7kePuRTcqMQRRaYXg0B41IcG7Q3TFdOab8Z906G
         JbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773082025; x=1773686825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2c1e+cr1MK5fkAIaVFhuig+jMcTHc2i1DpO1ijKNSs=;
        b=QxGY8IiyQSXUDCYa1CmeM3IQgoKCbzmg0j/PLtbw+zjkXHd9K4fQWHiKL79w42Dgqh
         gxf5Hz04mgfSgK4E3TdhRT4g7I6rZUEqLCJpGmK7Z2QJCnUYF/SeKi98dRaaJQ7qnpCy
         GwsWEJPTNJCauC8RowRWKPMkWJW+mWSX0Ds/GMsO55zbSZhMqem1lQCZLG5nb1RRnpq7
         NISenhm59UibhhW/xsf77tG9HfKSwfjE0s3iXjSJRvZDMFM0dNuS+tZG0iCxTl4LFgcz
         EUX+rGDmHGDF9hhtfoIRhtvQhrkjWuI+vzgiPrMU5+bNo9G6/DX6gFCvW/OwJepeZZRD
         ecuw==
X-Forwarded-Encrypted: i=1; AJvYcCVuCu4jWhjCnDApGKBmQuPwt4cA62U4yK6mIvMbUgPfUfC8/pIgRvDXUqE5YMnq7uog+wqh03w2x34Je5kR@lists.linux.dev
X-Gm-Message-State: AOJu0YwuSdc05YWqdo7d3g98KoA8mQ3rPwvmfi8X8m2ifZInUQCAkCAX
	vFhkxXCALDJhfzbkbuid58jP3WJqL1ZNAhn4BzZzri94kLRTMWNUf/+QeNXuC21G
X-Gm-Gg: ATEYQzx7s1hbr4I7gOTR3y6dczV9mwbeYgiSSFBQ5NMGNPl8gthEKIHvddxQZhUPKdd
	LWU7So+cpppDn3j60OrO980pKbJTM04wUUlVs/INYNeMu4bMDhj3VW5fCNK7uJ64nNA1URS06VQ
	mbxJApPMI7bNCiZ5MoSy/2jvXWHt1hiNoBm5rKtW7bv2Zk3NgIXhdvE2pX5lsZUcQfWunAtha8/
	oXIJyeA+FroPZ6fGU0r0SVfK2QHoM8UNZGmmgbOum3It1KseFKooeYfyv3uhqw88hp7cAVRVzQ0
	rwfdngJUSou8supWCkFw8lH3PP/KBFhZdQmoCxwMz9MLgF8lvTeEOg2ShG7tkYhwrv4IafLURKS
	73rgG/dOeWUwPbote9rjGlzu4IlPJ9UmzKZ9gYCQNPXQpUOduEs1CPGfdKIMLfD0uebsNQbNpOG
	bxlFQi5uX5WqPpwb1Ip8G3ip4tIHPmrTfMv19xvk4q
X-Received: by 2002:a05:6000:2285:b0:432:5c34:fb32 with SMTP id ffacd0b85a97d-439da35c729mr20629123f8f.23.1773082025370;
        Mon, 09 Mar 2026 11:47:05 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae46353sm33212432f8f.33.2026.03.09.11.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:47:05 -0700 (PDT)
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
Subject: [PATCH v2] staging: rtl8723bs: change custom comparing function to strcmp()
Date: Mon,  9 Mar 2026 21:45:56 +0300
Message-ID: <20260309184556.846-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

eqNByte() function is a redundant reimplementation of strcmp().
Remove eqNByte() and switch its usages to strcmp().
No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
V2: Used strcmp() instead of memcmp()
V1 link: https://lore.kernel.org/linux-staging/20260227200637.47130-1-b9788213@gmail.com/
 drivers/staging/rtl8723bs/hal/hal_com.c       | 12 ------------
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 19 ++++++++++---------
 drivers/staging/rtl8723bs/include/hal_com.h   |  2 --
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 31b3e880a..a7720f821 100644
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
index dc2da49e6..61c6b6e10 100644
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
+	if (strcmp(Regulation, "FCC") == 0)
 		regulation = 0;
-	else if (eqNByte(Regulation, (u8 *)("MKK"), 3))
+	else if (strcmp(Regulation, "MKK") == 0)
 		regulation = 1;
-	else if (eqNByte(Regulation, (u8 *)("ETSI"), 4))
+	else if (strcmp(Regulation, "ETSI") == 0)
 		regulation = 2;
-	else if (eqNByte(Regulation, (u8 *)("WW13"), 4))
+	else if (strcmp(Regulation, "WW13") == 0)
 		regulation = 3;
 
-	if (eqNByte(RateSection, (u8 *)("CCK"), 3) && eqNByte(RfPath, (u8 *)("1T"), 2))
+	if (strcmp(RateSection, "CCK") == 0 && strcmp(RfPath, "1T") == 0)
 		rateSection = 0;
-	else if (eqNByte(RateSection, (u8 *)("OFDM"), 4) && eqNByte(RfPath, (u8 *)("1T"), 2))
+	else if (strcmp(RateSection, "OFDM") == 0 && strcmp(RfPath, "1T") == 0)
 		rateSection = 1;
-	else if (eqNByte(RateSection, (u8 *)("HT"), 2) && eqNByte(RfPath, (u8 *)("1T"), 2))
+	else if (strcmp(RateSection, "HT") == 0 && strcmp(RfPath, "1T") == 0)
 		rateSection = 2;
 	else
 		return;
 
-	if (eqNByte(Bandwidth, (u8 *)("20M"), 3))
+	if (strcmp(Bandwidth, "20M") == 0)
 		bandwidth = 0;
-	else if (eqNByte(Bandwidth, (u8 *)("40M"), 3))
+	else if (strcmp(Bandwidth, "40M") == 0)
 		bandwidth = 1;
 
 	channelIndex = phy_GetChannelIndexOfTxPowerLimit(channel);
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 74d6c892c..483f0390a 100644
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

