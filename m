Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BCE46BF
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773991145; cv=none; b=AFuXBaprLh8VtBZ9I46T7oS4aHhRmk8X2DMSO1NMXffT0qBL8IPt77VAmKQTq6birlzheGbKjGU89Mtsh3jeTRciylCD8E+vg3GU3stFuvadw6I5WggbbafIJ4fmrpWM5OwZCW1ZEAzj1ZAmyVcx7ClUSdrJKf6j25zB6U3VTqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773991145; c=relaxed/simple;
	bh=oHi3xT9LrOP0HbQ0Iy7BrowcVeMjdIQxJxdnmbUYn1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TnuD+Vh5CI9jgXT74im3+ymBsOYrEY9VqN59iTP4GS4350SbxBdn05k6MDfaWkYUqdIlELblT6HtaIpzvOrXgpFBmCeI/PhM1NsX8wivMgNWY4Un3BH0/zA4bcJ3GHbJX1LRxJ4d1IsKnOP5hh/R+oA8q43o40jx2c3hOnokOzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvirL14g; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvirL14g"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so11853735e9.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773991142; x=1774595942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mkpT7FRro2B0nIIi8uBJzPYh9VjK5QgSvYEjTmCKl0Y=;
        b=PvirL14gBN1Notgn+rOrZydibUsK1+jb6H62NEMWtygxYhEc5qG/02xRz0HKjZY+VA
         QX7ChLP5SBc4kgNvX6mUZFW/UUu7iHkQGNSljU3q5u6FsisUcnfNUsGQJ2cCKirlNING
         vE49fmVtbuh4kaYk3DpMO9mepLRnvuIjdvaeBH7wxxkNLxJrEdkhr8D7dSL5jUpTg1DW
         ghR7qqD01FFaoFNk0mxnTDEDoSWWbhstw1bTMxXhBHcWJOh85SYDhSFaLoGLHKkmq4CD
         Q0l0bbp4T6yikgf6PiIWMz9EDz9yGXRxL6cCHyWUk5IkSdtbXpCiRvhKt8wgtqEdFDrQ
         DtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991142; x=1774595942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkpT7FRro2B0nIIi8uBJzPYh9VjK5QgSvYEjTmCKl0Y=;
        b=doYuh5ASC4vstyixPaJzs6ysaYil0hkXBXOZCGtTNgADLWEZB9Um6CKu4j/9iPXP4+
         OTn8nBOfphB1L56bsYmOJOKFqeG7OPNiV7O1cj+EQ5fyRSH/x4G3JZW/Um/12KX4Wwiw
         roD7XpJi8W3ewo9oQ8tq2hBoM8Tvtg5nmUSlSxmgYRFlHPa21b9XTkrDr31kCpCFzene
         GWTIQSneB20pUg0oglKp+vv1eOF2NvurMktFwPcsdDKozlA19wGlM62l3zn9zajU7lpv
         +u1sg6OKNSI0PhDamE49ROqirwAjtkRCtc4DR9GXa8iweCFnC8mfreHnltgLDe7oWdP0
         P0iA==
X-Forwarded-Encrypted: i=1; AJvYcCWfWsLz8E+zJYpo1PI2dFXmxGwW7GFVH4PgCiXnM8/mU4iT4AKiF0NSHpL0ZEqImQ3ltZGAP+6wvQqYSwfd@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5PdQT73knBMUM6tWKoiuCIeSeCi5Txgrk0y7Embs8NsoyfFsi
	2alUmItGfAMkBNZOjncS4ScI7Hun9+fcI4RdCZhNUjuNhG9ZDCYa6f2D
X-Gm-Gg: ATEYQzxbiEGqtknmeg+VWnpjMx3pEpxNO9zu0vzkUSwqGaTSlvW6QOXKkuzAhhdFkMA
	R5nny9oDh9ulDtlNlgmSe9h6vXSUJ5/tIHb7P6CXT9ybDNm77Tt61LddDY8uFjZUUgq3Wup5p+F
	V9HAf93030g8TFktiyxY1CmdvM73nnlpwz7LAtmNDDDTYhdCKIUr5eEmhP74XzQ+oQ+C7fBAjnL
	yPRvCxuwSOA6cLzpyAde9audC4NzSyhYFVQmsuXryCoJ2WVOoXEnG480hjy1nkzs+CRL1gEdk0p
	ZiZg0/jUYrs7K3D0Df6muavNc0Tnw8+PDQUyqeRMYwMUqk5Wv7LteSQXKQ8oWSntIwS1lNcUVn6
	Z7nx9yFokz1w3PyuBV+ZF7gaRBqXTP63N5wANJpZdbph7q998rIe5aizMEKaMrMFp9BzZbHXk5V
	aTyhNmczOJL28GzJtzxuUG4jGfVy4=
X-Received: by 2002:a05:600c:a4a:b0:485:4eaf:eb14 with SMTP id 5b1f17b1804b1-486fee0fbf6mr25951625e9.21.1773991141982;
        Fri, 20 Mar 2026 00:19:01 -0700 (PDT)
Received: from bera-arch ([176.216.244.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm41070205e9.3.2026.03.20.00.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:19:01 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	andriy.shevchenko@linux.intel.com,
	ethantidmore06@gmail.com,
	hansg@kernel.org,
	Yeking@Red54.com,
	rayfraytech@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove copy function
Date: Fri, 20 Mar 2026 10:18:31 +0300
Message-ID: <20260320071830.28713-2-b9788213@gmail.com>
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
Remove its usages to kstrtou8() and check the return value.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c       | 19 -------------------
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 14 ++++++++++----
 drivers/staging/rtl8723bs/include/hal_com.h   |  2 --
 3 files changed, 10 insertions(+), 25 deletions(-)

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
index bdd595a99b98..447b72954804 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -816,11 +816,17 @@ void PHY_SetTxPowerLimit(
 )
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
-	u8 regulation = 0, bandwidth = 0, rateSection = 0, channel;
-	s8 powerLimit = 0, prevPowerLimit, channelIndex;
+	u8 regulation = 0, bandwidth = 0, rateSection = 0, channel, powerLimit;
+	s8 prevPowerLimit, channelIndex;
+	int ret;
 
-	GetU1ByteIntegerFromStringInDecimal((s8 *)Channel, &channel);
-	GetU1ByteIntegerFromStringInDecimal((s8 *)PowerLimit, &powerLimit);
+	ret = kstrtou8((const char *)Channel, 10, &channel);
+	if (ret)
+		return;
+
+	ret = kstrtou8((const char *)PowerLimit, 10, &powerLimit);
+	if (ret)
+		return;
 
 	powerLimit = powerLimit > MAX_POWER_INDEX ? MAX_POWER_INDEX : powerLimit;
 
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
-- 
2.53.0

