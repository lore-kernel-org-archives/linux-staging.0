Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C84A207B
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289501; cv=none; b=WKht9Ua52CP6oMk18FhyvvOZx0I6YWC607od/6uhnj6tjSEG1aE5vpAORi5GZazv0KIIarEKeQhbjzVXQTC0ZGx50ctza2D50tNL0bNSpZD/88ZCT2Z7lHnGY2ZheF+xv2PFFxcSeraZ6USNKmkWm0OwKHp2wGeR/i6Aa3VZqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289501; c=relaxed/simple;
	bh=4JjOP6xA1fWJTzg0nGLviFM/abTCFakLq0J+yMqID+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uH2CgZ3CjtlZ2veiyq9QiZLdak5WideUrLia/B90ttx7VqeLQBtWbqx+Djf6KJTR9tUDXUwWQ4TniAT4UTOANod3fIjRRRyaBWIwpmLlJAZcVPelMVRqimaXo/9lqoQ4Sho5ZD1/+NhAFYPh4RZOnfDvoqb1E8CGIZwEMCJagls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvJiepX3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvJiepX3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so1199705e9.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289496; x=1788894296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=WvJiepX3PLPS31wzTPwkpvV18RxRAAfn5jQKlyH1X+xXnU9ln8+suJiGAtmMKON3iV
         8vdXI5K+1mhiJV3Kswy7AtXVQN/Y3cFydCuKOHPALG7eyF51fOqqYqyI818EY2jz/CDF
         XSgorQW7RH+DIuveab27sdDi76dk7hPUkBJtkotzNvpEg1nS5Bm3CATXf6J0c28n7PBS
         p+Dm3h2LoXtcL5n+Z6oHtiLxTfpzJAnnRucgYXLYE0m9F+bibEdVSi6lX4YeddGW/MFd
         L1GGPA8BWWfvXaP1ulucWSunA/mZxcCba9nvBgkx+KOB/EgGqk9lHmlaSoQUkxltK4pQ
         sROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289496; x=1788894296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=XzYMCMCaN7Lm3qoxBqou3HcMKVFyWaDMkfIXAuh1OuAZK/bNilhBuopuR2UN10PjzI
         /W8qFlSIgppakwpd11lEtjNqDJHYz0XsvqeX0b4MQeu781li/FoTm8BOHmmGso/Rr5cW
         Rjq1ERiStwG+a0+cPc+7pX4SACpN8m9Bus3O+3H14sPM5foDD2h2ErsrsHs36o5Wasiv
         LCtOPfns/zSnKkl+oSGMASFPxZgOPm/IV67nyjxPD024xSbc8ZxqHHA/N2aAoON5aJb3
         DGY4RAD0B8QZ5QTvjjeaQe86v8unG3r8dVzLE0jYeaNMp8rvv/JzouOTtY9Q6lxwAHFl
         wwCw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2fXXiexhS8Wh5Mlbwa7dDpEvj5hAAGqhvJs0gXFqZMAv6OSgyAxro+fCxn4VBrPmsKrNCUhNF5ISd3DvL@lists.linux.dev
X-Gm-Message-State: AFuF++mUe2JAQ3377iB3thE89RMlKVrw4SnKHSdDurT8t6nBIF7O62c2
	RSTB5tyIjZ/WuQZppieTCeTowuP8c3UI3qDAJDA1x+5U9asLSh10v8F9
X-Gm-Gg: AR+sD13AYrNUL9yaqRbdcLmuygWdKeD8Z3LZQt/XNlC9VG9AUaGm60Q+LybmGTzr4Sl
	8BHWroxeuAT/V0iuj2eZfyw+bPITigTa+rw7fbyYWBqelucGULerXOO2A6vjDn1CnbswxMXQTTj
	ub87LJ3O09oRhzMykORKIN/oPBedkmu5CJobE7g1aSF5aHZQNKA2t+aYJqY4uX5lv/PNJnOFMen
	gX8sfCfr9SxgmtzSRX0O35udj7ntJME/W9OjfGSHKGawXhXyqwbsvOpYvCQ2j+NW3foto7nEm4N
	Bt5unFKKCtmGQd/086jDZnH8kUgBj9g9r9xT+zo8W1d1frZt9itE/PdJW9dcOpTU7myqwsFu1uB
	t7oh10mNJOrYcx2H2xLF9OP5MQ/7ZYAynywJNutOC9qgK9NjJ0CkbkPLxmcGoUAEmBLrsXH73oz
	XT3Y5sC+JDrT4cXNwcxBlbAr1gWVDsje8Ev2RnDoQdkqpDnDMKF/7m8KNhydLqOIgoNa6Y6pfvL
	PFQ+zg9SeRrSDKJrPvySXo9li/Vawqx15KZYby+wQ==
X-Received: by 2002:a05:600c:3b20:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49b91bd78cdmr481597865e9.0.1788289496316;
        Tue, 01 Sep 2026 12:04:56 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:55 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/16] media: ov2740: support 288 MHz link frequency
Date: Tue,  1 Sep 2026 21:04:30 +0200
Message-ID: <f274b7459e890f05015483804cab62ae0647ae12.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91 front camera uses two CSI-2 lanes at a
288 MHz link frequency. Add the matching PLL configuration and mode
timing.

Reuse the existing 1932x1092 crop and mode register list so the Bayer
order remains SGRBG across link frequencies. Cropping the CSI-2
receiver output to a smaller processed frame is a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 18bb3ac9701f..f3d91c87b3d5 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,12 +12,14 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 
-#define OV2740_LINK_FREQ_360MHZ		360000000ULL
-#define OV2740_LINK_FREQ_180MHZ		180000000ULL
+#define OV2740_LINK_FREQ_360MHZ		(360 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_288MHZ		(288 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_180MHZ		(180 * HZ_PER_MHZ)
 #define OV2740_SCLK			72000000LL
 #define OV2740_MCLK			19200000
 #define OV2740_DATA_LANES		2
@@ -91,6 +93,7 @@ struct nvm_data {
 
 enum {
 	OV2740_LINK_FREQ_360MHZ_INDEX,
+	OV2740_LINK_FREQ_288MHZ_INDEX,
 	OV2740_LINK_FREQ_180MHZ_INDEX,
 };
 
@@ -142,6 +145,14 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
 	{0x0312, 0x11},
 };
 
+static const struct ov2740_reg mipi_data_rate_576mbps[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x030d, 0x1e},
+	{0x030e, 0x02},
+	{0x0312, 0x01},
+};
+
 static const struct ov2740_reg mipi_data_rate_360mbps[] = {
 	{0x0302, 0x4b},
 	{0x0303, 0x01},
@@ -468,6 +479,7 @@ static const char * const ov2740_test_pattern_menu[] = {
 
 static const s64 link_freq_menu_items[] = {
 	OV2740_LINK_FREQ_360MHZ,
+	OV2740_LINK_FREQ_288MHZ,
 	OV2740_LINK_FREQ_180MHZ,
 };
 
@@ -478,6 +490,12 @@ static const struct ov2740_link_freq_config link_freq_configs[] = {
 			.regs = mipi_data_rate_720mbps,
 		}
 	},
+	[OV2740_LINK_FREQ_288MHZ_INDEX] = {
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_data_rate_576mbps),
+			.regs = mipi_data_rate_576mbps,
+		}
+	},
 	[OV2740_LINK_FREQ_180MHZ_INDEX] = {
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
@@ -502,6 +520,22 @@ static const struct ov2740_mode supported_modes_360mhz[] = {
 	},
 };
 
+static const struct ov2740_mode supported_modes_288mhz[] = {
+	{
+		.width = 1932,
+		.height = 1092,
+		.hts = 2160,
+		.vts_min = 1776,
+		.vts_def = 1776,
+		.vts_max = 32767,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_360mhz),
+			.regs = mode_1932x1092_regs_360mhz,
+		},
+		.link_freq_index = OV2740_LINK_FREQ_288MHZ_INDEX,
+	},
+};
+
 static const struct ov2740_mode supported_modes_180mhz[] = {
 	{
 		.width = 1932,
@@ -1178,6 +1212,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 			ov2740->supported_modes_count =
 				ARRAY_SIZE(supported_modes_360mhz);
 			break;
+		case OV2740_LINK_FREQ_288MHZ_INDEX:
+			ov2740->supported_modes = supported_modes_288mhz;
+			ov2740->supported_modes_count =
+				ARRAY_SIZE(supported_modes_288mhz);
+			break;
 		case OV2740_LINK_FREQ_180MHZ_INDEX:
 			ov2740->supported_modes = supported_modes_180mhz;
 			ov2740->supported_modes_count =
-- 
2.53.0

