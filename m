Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD202ED870
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 06:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774851014; cv=none; b=YncSrK9UNJVgPk/5Ut8oltnaRpTk1ks6a9y6ngw5t7Oo7AMfyzUjYGcdSyVs9+3hVodLaLKTWKRgFPklI3YW97tzanpfxioC6SPuEhK8XC+IMcocn/VZjEyzGETtv6RfHkdC+crx2deClaaPROonXdNa8L3v9c+1YXOL+p/HKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774851014; c=relaxed/simple;
	bh=57DrXeQnUGc6iR/CXOWyyyVZBnQ5MkHIKUWHPpAsMcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J5bs9h6GuYun5A5FBRZq74E65n6SpgmiHnZBjpOl9mmjZ1fBotbLRFdY9E0uzimez5pxlnsL4nvRQMeUR3k6kvYys9SzxOhgLy7T0QvsFhiARw1Kuu2t3IzTuw3+bj+YqfBpL4NjCwq9VWH14dC0E6/YiKnRERsHbY5UqOiL2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2VGNUYa; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2VGNUYa"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-605048a9c94so719952137.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 23:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774851011; x=1775455811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVkfdJP2KulZKEM0URtofZekmehI6WAdAhgF+udGJlg=;
        b=m2VGNUYajQ1guPBpdGWb6LX8NnLj25b50p1c23ipNQ6RzsbSat7mkPCfph5nOwgWA4
         BSnQA6erQ0o40qYyOzUOzwHedbBKah/RbbFr1g8plaPB+i5VqJcQwm4aGNNILbbFeVxz
         9TWx7ezlUnbkBjrBNlm7Gk3q850p/37U6hO3akpX+DIAaIFmQrOIU4lSjQuF10pxelCf
         2tOQ4y75/DcdIW20rrpgzPKkV/0Xqptau6PynhI7sPFhqcieE8vIGmxpIjwnT8M6SmDb
         c2Op8b0D86gSHPXt7cEEk6bNAO9fi4+Yqk/Q7q2IGtYEIMIVtWJE/Ol2ETko15SnyVWh
         J12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851011; x=1775455811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVkfdJP2KulZKEM0URtofZekmehI6WAdAhgF+udGJlg=;
        b=iL+gHkkotzuYEYeVIWihq9xVT3MYHu2paeagXxyGu/lHobS+UGMCa38F3wzijM1MUT
         /9ZNOiBR1+njUGPurpFROBbZsye1Nr4z1vyB3rEO4xqeP1IrzI0P0YYUbO35QJ1ABSfA
         6cTlWTifmV/VcHm+EHhKT6sTHimWPITp/2JOKzw5I+pDXyrgL39Y7mt0hZKUQWRjWeK3
         20/rbWTGvtw/x00sXWFZAqGtcPi6Y9MpGVYWhL+qPgxs1jbHYK8P+KpSO4A3pO1TBSBz
         d/uml1HrYs5YDJKWA+xd2fE7XNbLj2M4TECLf8RRoqYR0CXB0yqmXL53iL9D3QMnm8QB
         tnaw==
X-Forwarded-Encrypted: i=1; AJvYcCUtf/66kpQGRipXbPwCYBcLcoC4XqPwL4Y75JXM+C7wu8Cra/89s6o7Ov/M4bJuun5tdwnDBTjUmeycXmag@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1CBEU/vD6VsV165ZE7bLLKZYiREkhddrD9DYE0ziSnZnrhLMX
	kHFxucRJvyj1N4ufLFse71wNdWHIFOJRHywzBk04xWgpW0L4I1+n9mqN
X-Gm-Gg: ATEYQzy+wHWh3ktEGc9xrW8BqOUgmQuR8FAS90GTkZNsYpjGs0ve+36mKBx50Wb7HX/
	L9g0SQhEPX2is+3ju84/v5DF72/Lg1f0Wc0oS9SHRb3I4Yq58+RHJJDxiE8qpaRzs3BuSZ37cai
	HkQDBBdu7aY1FW9+g/+msRw/G1rFntQwI47BNilXmEiVl3LSEhg/bO4JMv+DjwUZodK4V5Pzbde
	f8t/PZmDPkThv1GU+sWvICt49IIo+7xilVspnOGaZXMRQB6deDRKDYCbKDUSh/YK/Hxm/bpNyJi
	5qHZHeLlOCY53iGwOv7VVN9ppCot0xvHk53WAdyuQrswaaJd/zMrXe+mEdnfykW69ykakyAtBw7
	TK8LLPzCecO1beP8QNj8ulppbjs8hSerHkXnyRWaTC2M9rtKs0jA+h4N+rWVU/x3ou160oxuwgp
	aDDZSqlu7T1DH1yelis7ewHIql
X-Received: by 2002:a05:6102:cd0:b0:603:2173:d75e with SMTP id ada2fe7eead31-604f8d8b751mr3805351137.0.1774851010812;
        Sun, 29 Mar 2026 23:10:10 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6d9:aa::11:1d6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm7133561137.9.2026.03.29.23.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 23:10:10 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: gregkh@linuxfoundation.org
Cc: marvin24@gmx.de,
	linux-staging@lists.linux.dev,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH v2] staging: nvec: validate battery response length before memcpy
Date: Mon, 30 Mar 2026 00:09:26 -0600
Message-ID: <20260330060926.751031-1-sebasjosue84@gmail.com>
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

Tested-by: Marc Dietrich <marvin24@gmx.de>
Cc: stable@vger.kernel.org
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
v2:
  - Introduce NVEC_BAT_STRING_SIZE constant to replace hardcoded
    buffer size (Marc Dietrich)
  - Store res->length - 2 in local copy_len variable for clarity
    (Marc Dietrich)
  - Use NVEC_BAT_STRING_SIZE in strncmp call for consistency
 drivers/staging/nvec/nvec_power.c | 41 +++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fde..7b7980127 100644
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
@@ -192,22 +193,36 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
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
-- 
2.43.0

