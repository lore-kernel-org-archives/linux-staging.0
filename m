Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0C3B7757
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933722; cv=none; b=sayGeiD8Rmn1PU8jN95O+SVclPaegEjPTlrsNGlSmiv0MlOK6bZslLC7Rgudy/p2sIsqJ1HpCV9UkW+6YAYAcZh3P7fH8G4lVRs3DMSQq17v9XUW4P7dmMAyBUkFaX8l6P/wTCfuH3xIaG718nzcSl3CXBU3aw2umDqudm++2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933722; c=relaxed/simple;
	bh=iCYX+cUaCtQ4bN3ALteiERNIDMz9F+FipYW2g2utSpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPeBw8rzX7zTr1OP20cGuDTeEkpwbpIj/xaAhIlKIUDCVKy8cIP+5OB8pOlRTWDJ0lOipEphTP9UCcGg2dmm9gnQEZB20jj+6jwj9R8R/yRonb4ItW84MnMqXPxSNNkVK77+TliF2yO05BPhVfujiR5nO6SHMg8ZQPJJtQ2qgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm7WQ7n2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm7WQ7n2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so682344f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933719; x=1788538519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQLeqh8HcDgzW1atthmYStR7xCvFnxlRC6GnRW5zm60=;
        b=Sm7WQ7n2dGxTruHJuRJlW23M1chUCIj5ObM/cr/uLHO43UGd/YjSfjfZZ9S8HeSWbc
         2AsU1ZDqWqWv0+CVWc6jqCbNbTRFEVfCPzbLWUCKUB1kwHsEsuhGZMa7m37Nxg0L1wXG
         3aW31RWByMfdLgXOo2IoMCqdxdpRSdsJsbgmtwRLUQS9j8/7TuD+JbU2nwO8usR6UyUu
         WXfqdS6cS9ADBvA3v2Abvljq68Cff6C+ckXl1JCu77myPXkdcYYvnG0jlxVbI646n/t/
         Jzc8Qx8d5qRD7oo69RUhm+2rpOYDUUAQpj6EUxux8HpO1JWUyS0yOFWWsePi2G9r04u7
         dpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933719; x=1788538519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQLeqh8HcDgzW1atthmYStR7xCvFnxlRC6GnRW5zm60=;
        b=HyYG8b3LyeCLrNHlwIWbF5c6p1Yjw9/k9uo9koQFZK1Wfkzc1nDRvyCOqN3ypeB2gL
         Ndn7coloETlcHwOErUO2beSMwpsf64s3XhxhIzDQ3+g95MhvSfH/1fqipT/f+ojaySlQ
         6oZGEbD/+aZTo7U1vPUdQoXO7U2VQE/UCElo28OI1IjCQsbzE/1Ra+wbhAbpiE4QQh+p
         uFKQSncuX58Ynmze4gMXZfL9evVL2wGUKWsNHEe28I7keM0BBDSlg351uW38VCso3BaU
         v/5ZNCBHjy4RAQvCXC3TSGmAnt3JD0vOxvxyxrQPsrYY3OeFw9i3d8pzIAwcHf95z1I9
         m9GQ==
X-Forwarded-Encrypted: i=1; AHgh+RoP/Potmt/+TXC3U+qtXSOkGz2/v1C5IOQrFV1cUsGPMCIA/3DAlzNoj013wiqruaDhnbl28S4cCS4RkGhz@lists.linux.dev
X-Gm-Message-State: AFuF++kaHyncyXNkPADa/3U8hS4/uQ6luphwZ06YcYpYAiyLOgLa9PUK
	qxOlzObOtYRTUihuBisgylW3bRRHR1VjGrswpbIwSggIwGGJxqSdbI4U
X-Gm-Gg: AR+sD113FPJ0+/jBS87n5XbMUqW41lfKjT0JB4L0DpTXYPdFUY5BLvly2i+AfJnzDCo
	W90iBcxFh1ZqZPIm5ImrbU5RQw8SsKYWAdg4Avpf1gK4L2HrJvHDYVbG/ucDae0ye4PfcfSa6YU
	95HbnjPDvqT+s5wIUPcCtUOtqZQhwjDQ4eeXb6rIk1QI1SgUL0LCFAjwN07pPfvezdY8ZvFZHdA
	3fAxfLtshWW1zzPLLcKLs3RB6gq9CYDJCPnfSU4QRmfUJJSmDD8g9KE0aBuVw4uRt2IUUkphDF1
	UZtcUwy3o7sVUVS9hmKLUQV4aYsjUFexvY756cUB9KFDMOWCGWzC3aUtFavgGaMpdklK8kitUDT
	PF6iN+nfUqgfKWArv4kQB68oPZLL04ZQjRq18ttJSBmkkCHUsd3P5jn+GqCjMgR/oNL3c7jIK7w
	6K00+MlYnQ5LMDJhSFznTP4gDDfwd1x0GN5j19Khq4NC+HX8cVSEMv1ez4vDJxDa9TgQgHGz0gA
	tmUtVnP3swWd+7iq8+isBJ3L0lhX+XcYOk+rnT6WA==
X-Received: by 2002:a05:6000:481a:b0:47f:f43e:f0cd with SMTP id ffacd0b85a97d-482f7977a45mr13716275f8f.4.1787933719359;
        Fri, 28 Aug 2026 09:15:19 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:19 -0700 (PDT)
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
Subject: [PATCH v4 08/15] media: ov2740: support 288 MHz link frequency
Date: Fri, 28 Aug 2026 18:14:50 +0200
Message-ID: <8ad0d4958d140486e69c05e55865df49e55cd5b9.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Link: https://lore.kernel.org/linux-media/apF0Cds9fnqQ7XRg@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c | 45 +++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 18bb3ac9701f..c67fcbad5bdb 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,14 +12,16 @@
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
-#define OV2740_MCLK			19200000
+#define OV2740_MCLK			(192 * HZ_PER_MHZ / 10)
 #define OV2740_DATA_LANES		2
 #define OV2740_RGB_DEPTH		10
 
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

