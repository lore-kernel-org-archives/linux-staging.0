Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9381F4191;
	Sat,  5 Apr 2025 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858243; cv=none; b=TrpQDKwOK7m6CxnSvJ+iwbO4WrzY2GGgVsoBYUA0b5/yz8iwdemA8fZ1rQD9k4DaH8m+b7XoJZe1VJrohLWaFL3h1MrdZeERSPW3bfUT1wAAJZ2m3omM3mETDnRYwO/FrGZ3df96xOYMMkerNUTQ2DEmR7+REKXPa6BxYFKmc/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858243; c=relaxed/simple;
	bh=beAf4oeKfEtWFFLorLb9kscpUFlq1Zo7hXzlGWUFp8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hACSOW6wMHkGRfwc+n4VERb5ai2XT29mvxQCUDNFTT4AuUWAbrSZ2cktMYWVinXyyH6IccMexGRNAhKvDYonggolEElgZA09Utf65aRNA1K3k/mgdQVzDj07PTQ85zp+eXURcXI+5nY+Qn7mcvr9zebGMH5jFuYS1L3j38HBQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFQwore4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFQwore4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so31010475e9.3;
        Sat, 05 Apr 2025 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743858240; x=1744463040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iccBNqnE1r6LyZ+rk34ys2cg+4klAtt7ZPrU0BU45c=;
        b=AFQwore4CLOv5u5fPJm2QybPSQg1XBkfOlmSfpZu26QoBE6lr45if6KItuEyDIhcbL
         6umG6AqEYjsfbyMek/5J7TAQJsjUDvSgI6xP3jpulVJDGh1tjL43OFXEn+xIL4a7Jjm4
         36HBSLpxkOMQYbC80Tb2kFmyKTTbR6AiwwIa8vzG9+mFQm56Qlb8EB9EVlrD3KxABR8t
         KoqdOP8oFhphLm45U978GTouLvxycy0ptNUdKXv68nd4GHgfTyhANo0fDcU0pM2h5Jhl
         VJivCOKrJ28bWEyxjVueqLQgVdUTaw8srkHTR55yNfKL2Fj6+312Fzt4KN/ewmQwnMmv
         oH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743858240; x=1744463040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iccBNqnE1r6LyZ+rk34ys2cg+4klAtt7ZPrU0BU45c=;
        b=mUMlu6W4oSBFvnJlNL2LUoSqnRaUPvjnSd59cLCdEW8K0u3d/APZAi/mVkv7Zrwcsz
         kTfxvv6s1SaoBAZECKZAVVAvAFADInseYruILjKHbW3nRsF8PqXLfu+nvPQ1yL9I6Xzq
         OxPnzfy78uE3LQnq7aeobbzAX8R/j5Z0VJSJR4VfxxsrqtQzUJRtnuwCOmfkjSYdAQcp
         BKjjEc00NHW5vhyvFpX2xHbYtq5znMkh33pNAWTNflmgW/kXp1SecSvLHxAphJS3gHdw
         xVaTR8SF0dG/iGy+YQGNGZhFp2iUUGTtV1BkEucy3SG3oxdwan1P+g6gUpAB5/8fxJcB
         K9hw==
X-Forwarded-Encrypted: i=1; AJvYcCW1gRssodL1oIJZb9kf56KWUsb7xxqowfYOlfKSaW4j5WfnpzFNqLLvn4h6H0QqzYNjVbS1UY7ubOjfTCsL@lists.linux.dev
X-Gm-Message-State: AOJu0YyrjCsAuRmNkLPVgiM1BTL3S37aqQlxN1D0TqQZLsybECHgFK2w
	aQ0KDrArC3T46ElHorUaEc0bOs1FTMnKT7GJ5f34+kbeQga/L7CJ
X-Gm-Gg: ASbGncuQCbh3EnSIn9lUiWQw6YGg4/rdcWqnUmXgJEeYcabMTiQxIYXu59Es+lQSV5h
	5NjjNUnxRbPaClrXINx5RGHkDAuXaLkTdgfiIeChx7eMoeNen1poNgho90CmzXO9MAZvXpZg3fY
	x1ywBCQWowVqPRPlRFHIKeyrWv7tYIGBrFtogOLr3/3XiKMquSUtJr8P1rlm93cIQTvriTG34u8
	93zBSYCVTYPzLbGiU0eb7rFM6ir/I3Y8HV35gfhGQx2uqRMAj+b6VzMtQ45jb8hP34YqZBBlIEf
	mPwlDGvoHErwcm+2BgQwmPquGQ==
X-Google-Smtp-Source: AGHT+IFIMYrd2dDMaLPVuxugXEXg6nCMoRFIoPGH971PhZ0xS2xoT+hHYBJCiyUw8ooh4kTlw3XufA==
X-Received: by 2002:a05:600c:b90:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-43ed0d6aba5mr52573875e9.25.1743858240431;
        Sat, 05 Apr 2025 06:04:00 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm72140075e9.25.2025.04.05.06.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:04:00 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH 5/8] staging: sm750fb: change sii164EnableHotPlugDetection to snake_case
Date: Sat,  5 Apr 2025 14:00:56 +0100
Message-Id: <04907f753bc0d1a2b2095ffba1d066516520fbb8.1743857160.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1743857160.git.princerichard17a@gmail.com>
References: <cover.1743857160.git.princerichard17a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change camelCase function name sii164EnableHotPlugDetection to sii164_enable_hot_plug_detection
and it's parameter enableHotPlug to enable_hot_plug
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164EnableHotPlugDetection>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 8 ++++----
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index c12df1f9fb00..1ce44c50617a 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -21,7 +21,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
-		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
+		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164IsConnected,
 		.check_interrupt = sii164CheckInterrupt,
 		.clear_interrupt = sii164ClearInterrupt,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index d0b80b86a4d7..c8db6ceee9af 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -329,12 +329,12 @@ void sii164SelectHotPlugDetectionMode(enum sii164_hot_plug_mode hotPlugMode)
 }
 
 /*
- *  sii164EnableHotPlugDetection
+ *  sii164_enable_hot_plug_detection
  *      This function enables the Hot Plug detection.
  *
- *  enableHotPlug   - Enable (=1) / disable (=0) Hot Plug detection
+ *  enable_hot_plug   - Enable (=1) / disable (=0) Hot Plug detection
  */
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
+void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug)
 {
 	unsigned char detectReg;
 
@@ -343,7 +343,7 @@ void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
 	/* Depending on each DVI controller, need to enable the hot plug based
 	 * on each individual chip design.
 	 */
-	if (enableHotPlug != 0)
+	if (enable_hot_plug != 0)
 		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_USE_MDI);
 	else
 		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_DISABLE);
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index c15cd6a5d53b..9e289bf4a78e 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -34,7 +34,7 @@ unsigned short sii164_get_device_id(void);
 void sii164_reset_chip(void);
 char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
+void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
 unsigned char sii164IsConnected(void);
 unsigned char sii164CheckInterrupt(void);
 void sii164ClearInterrupt(void);
-- 
2.39.5

