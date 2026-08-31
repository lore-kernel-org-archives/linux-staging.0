Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582BE37C11E
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199284; cv=none; b=FPcFx96BxGYrsbHUf0Q2P8BXCXhbFXMilLN1wwhMAsN16HzFLICRr+BuRqQsVy2VBHRu03wjR1SJnE0+1kfgbIlvUQgu0EkvKSt9MfEwd4qLCfR0JcmSaZWAthnMKOAJvyviJ/SU61CpbuAbTOMZ+WyKGI8M0QHH/xxgjYwtI/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199284; c=relaxed/simple;
	bh=PlRc0R7D/QoQEzgbshE4c6VTfHtfTo0G/OsAztZl+rI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTkoQOruM9nE2GgwFzQ4vZbEkFG20ojlglAn87zH7quFaYOPCNGXD6MeL/knBo3ZIhPJeasVVfUnXVJORGvrSBXni8aPb+VKMDKY7eV3KMssTGvcqqJ6d/H/+7dYfLbVaB8njLAsfZ6ScLaslIK6evhB6OMmEIoIfxf07WcCfVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GviPk/xR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GviPk/xR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441a2ba14so119297f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199281; x=1788804081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wbAJx9PRPgYl34+g7KARtAzX1UG0zVvV4TvlX4f22Y=;
        b=GviPk/xRwFMsVgcqHi26bF6v0kWfVKqKDu+LQdfoWXjdfPEIwZjl7zBGuNjaTYWhby
         /L0Ds8kDWnDvSRcHiIfsfGNYXnXHEwbtjsbYKsyuomK7a2vFdD1ygLtnr+SkO+79GEhO
         pXh/gY/BeyIE258wC9Guh+bMg4Sb6So22Q138NqHumzT6+4PT/UikAehYpK6YSEm//Um
         cV2OoFnEOdxOraeGLgignem80D9c1eEN/UNtxX6qxFgZpjbC9nk/JHzn4MuB4Jii4T0l
         huswgziU2/cy8RfWDk6i4zgaHE74be8PVbyZ+4xqZw3Hyx3qgCISV7tcLb1e4JNsrZN3
         L2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199281; x=1788804081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wbAJx9PRPgYl34+g7KARtAzX1UG0zVvV4TvlX4f22Y=;
        b=Wmu8ZdCA6Sp0xlsv8qi87sTKv/+LaVzNgYCRdCyc+VuJXmiQLAJzcmp9Fnx0gvdCqy
         X38HMKat4D1J/74slqxdSLF7TGBqwAZlI1c5JuRyvx0fagC2L9N0gb1GUpCp5r3rqjdZ
         ivVqG1q8M92amBhM2jBofSCnqFtua1YcoY684yBUEGfQTs4153s+4YGYm6vaKVuIDequ
         srjFfiaWm+co1BfawG41H1nqC7ySAecCorw2HoFETre8xmJ5nNyVBtd9upjw/hoeU2xu
         fbAvyLYVO1VVo6QQilYIsmB4BNT9DTlySzOFqVCcOglAvTvDuqKidpeBpcIyWetHzg8y
         zjmg==
X-Forwarded-Encrypted: i=1; AKwUvByfvLlBgglVO/TqjeS9I715iWikX45WgfyKzh1hkjT88/+BfFHe/OXasalIbIq9Dwftu3/sGERxA7C7dqSV@lists.linux.dev
X-Gm-Message-State: AFuF++ne4M1drZaDRUeTP+F/0hluoJLE3EI68WkrLUgQomI6TlDXGp/m
	1XyzFbPkzQ0hYKiaMVcW1V7R/gnrL6o4jZYvhCmo3MOfF3dV9nVMH3UJ
X-Gm-Gg: AYBFou1meLhxay9gk7T/VZykr4jk0lPXgEDuQIN37gaEuT5wfDb/JdiymC0gHs1W3hy
	OAsHSUGQszx/Ihw+WTj4XgxfxDNcR3fTHFwJ3aXDRCaRT0RaNGg0HJZMW25vw2xRHpWK71w8GTh
	xtguFsFmyP3eYw/+w6zu1FbtMeRHFdaXwvMwKZRwHZJmUtamdYqmFZGlLDzV4SBaS+LuqkGE31O
	SMbSRS94UQ0WF0hZdyebu3yIyju8fApaBeVt3LzL4iLXwAx+YaMnQvBXVGZHmPlGPBvM0tBG9yx
	Z250GSiQtSZZKY9z+qY53ewO5uHNRlSr2BzRBXMjMwaXQA5KjwPaHCAx16CbAXEesWkIhuUWo/I
	+1byfJR21xikXXvw69RslKEomyP8iZzBh+oSZ4A2QVND6NnEvlHSrQjpr54O5BEOaK2DRrgkn2I
	JTntQ3GCbFov7XWBLntGbcCKSCLUSTBXOp89N88AXPHwMXf8jtOj+jRiQc2r4eaGW2oyFrZmW3K
	w6DhVMUhOobG1kjM+1W8s7TUbv5FY/6aOeig8cu6Hs=
X-Received: by 2002:a05:6000:648:b0:484:41dd:ff3c with SMTP id ffacd0b85a97d-48441de004cmr539586f8f.18.1788199281368;
        Mon, 31 Aug 2026 11:01:21 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:20 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 08/16] media: ov2740: support 288 MHz link frequency
Date: Mon, 31 Aug 2026 20:00:53 +0200
Message-ID: <20260831180101.3109854-9-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

