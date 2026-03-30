Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C93D1CA4
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875139; cv=none; b=WrA9PyxiN+ajCr6NBQR+6k1Oumy0vjTRNLTeN4DE82TOe7+8ZTXPqqyTpNVqS2yrB0ssgpMuzDCfj+Lr1z7ZT5fTE7xRzjj/gTv3izUWxKpjsilA8TXW6/Dz8YDD+g8aOXD0xUA8oU6+ZZ+ihTLwwv+WqmFvnGwUwl18ApFB0E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875139; c=relaxed/simple;
	bh=X0XeqVk1okPDExPdxveHKfJoDl26uOIaeLMRZyIoG0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hA2CddFRCTDz6ARhiRa0C9qs+uMxh90842FhKng+MQpDIu8rlIAsBp8UVvIHz48nVrcvZrxJst6oyjgX8NOe44o0Nut/RRIi7wNPkTKDiH9hdME/42R7ZkpWPtK0YYEnTkElDb+Rt9Fvpwn8FlCGa5uPniTaZ0Us4HVf/2UDcw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2MfrlAM; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2MfrlAM"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-604fc147b7cso990387137.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774875137; x=1775479937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2T5sC1X4d4lvAdzHYW3GejS6hGTQduK0sRiN708dk4s=;
        b=U2MfrlAMRdsc+LcWK5rwOfSUsm4S9+bghivqPnsX0MxIu6q1zD8GKojUsWszLjAAGG
         8ssrgl2DNlX+aYuiinm2owbLgy8HeUClrT7Xe8nss6ykzvOqyT0GSTxem/vNSHen0RMJ
         Rmo0h0HWJMU6oMAXQN4ktmh6ze9UgX4RDzbvepa+5r8czE9zTMbwVMvrWbjTOCrP+FLf
         qo2Zo+w3rlazlIpN7Xu90cO9NHzQouSsXlb1NZxU2RNPdlrcMpddUe8ATg5lPsmtL0ui
         dtk03ETMMERWYSoLfjS9WrGJ+Um2sYTYcKSeI1b2bsvuyy3etPLLjLf5baFHOya/W6U1
         GWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875137; x=1775479937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T5sC1X4d4lvAdzHYW3GejS6hGTQduK0sRiN708dk4s=;
        b=iXzENC8AHOCtGMROkUOADYavZ5bDD/e/mT7GXgGKZU3BiAmnhWLkl5dFChTm7eiDCZ
         ChDnZacIzEEPcoWxyCozbM/Au/63y+Y76yGOrKKBiTsnH1/6wiNTYp9couyOmXTEu3ph
         k0TxvAQnrfaaawB0MJ/EdTRwWO4Eww1YqhH59n0iea9zeNaE7Mt42nYd2kLwyJVM3C/Z
         cLlb1UepsTeaI0ojf7pBfWbYJw1GuGsQRUNYmKDIyVLguDiMUtsUMCwC98FClJHq1VBD
         vwgxso7USkbP/AuE3sNtb9BIiy7y0b9VkYB0BzzjyHlnLGSwenL6/1vKNz//KvN4A1dp
         OqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd9VW/tQ3dl8xa65kPjCHwQqGps5rSsRlDdMLIdnDMF0jLG0b6K5VKf7AWiLvlU1qXYUx7oe2jTy+6u6Y1@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8wnNSpsrD71fFHKfLMIszTJXscVdAeGBaKCfhjqSjuobVhYqS
	r68QQmxc2NSgcHfrNg1M83RHH4m6pUcdfAC0VKswEFVRf9c9mDJpEzBD
X-Gm-Gg: ATEYQzyFk/BGCeY82ltKw21pvU/Rn6pTKJ0u2Y80YJjT4ZflsKcrnLzigeT64fnBRaZ
	CF/n+VSbJI2tHF1uMpigs6VPsHXfC357potaRzYlmIE5pfLPUbFvQ9Q3FFCe2MZx7Onb4U9qeVF
	nfLLYHeLYb9NZ4vvWL7er+Gc4pBCxlq67ejqCzSAe4lDTW/uVleYsOdOLd2m4qRtkR5JNSDt0ZI
	FEyokFPMsE9rEiNkiDLAIjVaGNxEad4HaRtRRk3bausWk6KX7f871uRIq8q5QIA4vhWBBDihQgB
	pnKQHssmw1neP9zZtKO7/ZXup5CzSxjGS6jqQXtUWMqHhZs8mp4PFOa1JoF8sQb+ggRlM6HsbbF
	8lRmVIZp3zfFQTRK++0AB10+gUj2nBIoR9iY8aWWYW1iPYR3xT3nDg9xGenL+l8LzlwiHTTjgJX
	9CnULoaLyRH75/nXC9uIvgbU5Z
X-Received: by 2002:a05:6102:26d5:b0:602:87b9:89ba with SMTP id ada2fe7eead31-604f925ae38mr3523377137.19.1774875136516;
        Mon, 30 Mar 2026 05:52:16 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6da:aa::11:1d6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e4420d9sm6888389241.8.2026.03.30.05.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:52:15 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: gregkh@linuxfoundation.org
Cc: marvin24@gmx.de,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] staging: nvec: validate battery response length before memcpy
Date: Mon, 30 Mar 2026 06:52:00 -0600
Message-ID: <20260330125200.820693-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

In nvec_power_notifier(), the response length from the embedded
controller is used directly as the size argument to memcpy() when
copying battery manufacturer, model, and type strings. The
destination buffers (bat_manu, bat_model, bat_type) are fixed at
30 bytes, but res->length is a u8 that can be up to 255, allowing
a heap buffer overflow.

Additionally, if res->length is less than 2, the subtraction
res->length - 2 wraps around as an unsigned value, resulting in a
large copy that corrupts kernel heap memory.

Introduce NVEC_BAT_STRING_SIZE to replace the hardcoded buffer
size, store res->length - 2 in a local copy_len variable for
clarity, and add bounds checks before each memcpy to ensure the
copy length does not exceed the destination buffer and that
res->length is at least 2 to prevent unsigned integer underflow.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603301722.axpoITcy-lkp@intel.com/
Tested-by: Marc Dietrich <marvin24@gmx.de>
Cc: stable@vger.kernel.org
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
v3:
  - Fix build error: add missing closing brace for TYPE case
    compound statement (kernel test robot)
v2:
  - Introduce NVEC_BAT_STRING_SIZE constant (Marc Dietrich)
  - Store res->length - 2 in local copy_len variable (Marc Dietrich)
  - Use NVEC_BAT_STRING_SIZE in strncmp call for consistency
 drivers/staging/nvec/nvec_power.c | 42 +++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fde..30719e142 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -19,6 +19,7 @@
 #include "nvec.h"
 
 #define GET_SYSTEM_STATUS 0x00
+#define NVEC_BAT_STRING_SIZE 30
 
 struct nvec_power {
 	struct notifier_block notifier;
@@ -38,9 +39,9 @@ struct nvec_power {
 	int bat_temperature;
 	int bat_cap;
 	int bat_type_enum;
-	char bat_manu[30];
-	char bat_model[30];
-	char bat_type[30];
+	char bat_manu[NVEC_BAT_STRING_SIZE];
+	char bat_model[NVEC_BAT_STRING_SIZE];
+	char bat_type[NVEC_BAT_STRING_SIZE];
 };
 
 enum {
@@ -192,26 +193,41 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 	case TEMPERATURE:
 		power->bat_temperature = res->plu - 2732;
 		break;
-	case MANUFACTURER:
-		memcpy(power->bat_manu, &res->plc, res->length - 2);
-		power->bat_manu[res->length - 2] = '\0';
+	case MANUFACTURER: {
+		size_t copy_len = res->length - 2;
+
+		if (res->length < 2 || copy_len > NVEC_BAT_STRING_SIZE - 1)
+			break;
+		memcpy(power->bat_manu, &res->plc, copy_len);
+		power->bat_manu[copy_len] = '\0';
 		break;
-	case MODEL:
-		memcpy(power->bat_model, &res->plc, res->length - 2);
-		power->bat_model[res->length - 2] = '\0';
+	}
+	case MODEL: {
+		size_t copy_len = res->length - 2;
+
+		if (res->length < 2 || copy_len > NVEC_BAT_STRING_SIZE - 1)
+			break;
+		memcpy(power->bat_model, &res->plc, copy_len);
+		power->bat_model[copy_len] = '\0';
 		break;
-	case TYPE:
-		memcpy(power->bat_type, &res->plc, res->length - 2);
-		power->bat_type[res->length - 2] = '\0';
+	}
+	case TYPE: {
+		size_t copy_len = res->length - 2;
+
+		if (res->length < 2 || copy_len > NVEC_BAT_STRING_SIZE - 1)
+			break;
+		memcpy(power->bat_type, &res->plc, copy_len);
+		power->bat_type[copy_len] = '\0';
 		/*
 		 * This differs a little from the spec fill in more if you find
 		 * some.
 		 */
-		if (!strncmp(power->bat_type, "Li", 30))
+		if (!strncmp(power->bat_type, "Li", NVEC_BAT_STRING_SIZE))
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_LION;
 		else
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_UNKNOWN;
 		break;
+	}
 	default:
 		return NOTIFY_STOP;
 	}
-- 
2.43.0

