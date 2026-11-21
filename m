Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267983;
	b=nFzdzw2Ocv408L7lcEsDU+3do3Y+XXoxStpatq3Hxab+O65QwcrKRcrobGUocjooDesd
	 6uHeKQ/5jDm1IAXeqHgjtlZ/LQUZscbK+8TAsqc7mCgMyflXVkxjxcvEnNzD8xNeY0qaG
	 4zkP5bzGrPpu8nd/WHMZ2QgBUQuucKpqFDvMj+42eKlD0Qav0/V9A24pze+rGK8RUGQ+I
	 SjDj+Ji2WUOyunYtsLtKfAHBRf9D7i/vD/eNLpWMzTuzAH/PSu4sstv8aJW0smZGxirBT
	 ifcdi2WGsTO8SOYzL6G2FY2rploi1dykjMEnZ2nLCP1wDyUqL5S9zgiO6S+Qu+nubEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zwpdxzq/WcfSOjL57zIT4PrpsEc3o3kmbfQWvILYAxU=;
	b=nynK+GpAG3jKL5ccASXPltW/+jiGTV6u4zkJWk8kN8XVF14c8WPZSp4kj+uomfd0hHAX
	 54vFwAD8dDPAvo9liSbcju6zRUXAYoJrxhYYNlwzRtA1HyjRomc58XcEAGLF4qa2A+5g8
	 oBSpCbcWLsFLQOxvEUhWk/t+7VutUQt0CCef4mD13Q18SkXNW8uok3kv3fP8Lkhyc0qY3
	 4Z1PXPLBxCaPFblNSALblHBaelmPDiDufsc9VYZXQNoEB5ovFORQXIqMCi3REwLMENWqQ
	 +LpPjlijubYF8UURAd37UKrt2xBeW9Yt5yCGbHZK+5Fq3YcY7I7wCpbJoYwU6hu4F7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2D7Ao0Z;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673B606A6BC
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D673B606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2D7Ao0Z
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so16893155e9.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267981; x=1795872781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwpdxzq/WcfSOjL57zIT4PrpsEc3o3kmbfQWvILYAxU=;
        b=k2D7Ao0ZgWfXm4DyWUpZZ7/va0usqqFYBu56d34x/chkafnp4BFx7WQPIyF+WALkFG
         cWc6c1bv/8XFNox0jnDYbSyFYUkoSS+12jyJIPtM5en2/V6+bSY5sDJwkqZzhC+/KI//
         os5KlOIHaLyaVzQ3Tz62YtCkn0GEZA/oMI+2dUWLMlCPMBD5fJY6WV55VYlawB5tHpau
         RzQ+pM6pd23i0tpW+D3BB+j/LC3qtQbI62oOz/o8cu39FyfYgvtlJO3Z/uciK38kttqM
         VFGC0/6fKrezOO0LszgXfDWZA+9nPRWM+RkB+/N6es52AGx2XwOUqSFwzlZrUtv1YXQY
         kRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267981; x=1795872781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwpdxzq/WcfSOjL57zIT4PrpsEc3o3kmbfQWvILYAxU=;
        b=Sb5yQrfyUIsyBPMC1J2bP0rJc89CbgGM2IuRJSwncEDBju+53iDQt8t+cTv7OIX+si
         YWyS3FydtKteuwHtvtAHsOMhnIAPGSpLRHRRlpqz2F3Gptr7jTxQDdkldWZgAngfySC6
         rvdGEj2+hCOaH1W36U7UBOu7BKvSeJB08khKg8ENjLJqpFpA1v1IyPqGX1rXc7e81fdO
         q5PbtzOLzzfojEuE3qos0WdxICU2a7c66ClNuR1Pd+10CzE52L80/uo0DZIknMLprIHg
         //MA4dteNig/GUDl6j8fzZIJT2dFNB16YrfDiQMOxJXlk9aarZcp1Rq3ouGB4dM8LTrs
         rrMg==
X-Forwarded-Encrypted: i=1; AL+hErHIuLa/6RWjyPjjgs392GtDMQAzMhjTtjs4LoAu3i67gSy4c1PMwxwkUBdAJU6Op0S3avft97sQ85ZJljsV@lists.linux.dev
X-Gm-Message-State: APuU4Z+0wKgLllnsvnqL4zY/uIczOq1BYIeNTOzFg5NfYrAs/2VmjhFT
	D6H1+FjTof+z16YjEFI3gDD35YGBJ5P6bQkRffVzW4aPMeWEvgS+7Trq
X-Gm-Gg: AZFdTZdmKLBtnlPNJp3bkd6/o6P8S8gzaVPQrZ7rSHR9yZLsNHAhXsEIanpvPLFiBbo
	YCUbuDIyXWsfgkrhy5TYJMZxYfJyUPmTZ84IyDHXesIyz6zKmJeSZmPg2r3LOIqWiY1A98xPRFz
	2JmJ7BxIfJSwdc+9eispT/TkbtsnkgO135a0CiRyq4JRDKjBA16Ow/ZSAWGtKzXZB4IvrAFBoWg
	VLwor9eArqUqHIfd/jR5AxDMsjdpYW+zVnc2iNGDBwnwCEnWTt7kPa3WsoilU2pZfTkGJl1FWTx
	Zmxto8c17NAh28Sd1nbbUXcl7ujbC0i8CaGlm/XUtazpxF1Qm9SYVWE7BM2aTpjfXHCK2rdbPA1
	PShAvI/wh7SlgROi0i3YDIwD13Yp5/4PDxvj5lCnmxVMW1s0pTmUsUnicR9M0rsIqe6GJ34kRBr
	CPHUw2jBraThbT6tP3l7WHhKFe1ZRHutd1LWWyM77AtSxYJ9NapJD0W4sMurtZDpRiMbp5acgom
	BjchYsguPbVBvDk2Bfr0Seu8QpR1XvccKJ4WvUbwNktb7bDAKKH2/3qWnbiVdeYgeYs7LF7h3HK
	LKCfozsfE8XHrKe5iEEJ9YrF4sRhcQG9xf3VY1NZWFkbx9lrGjUstS/KyZr5eCjZ+2nZUioaBhQ
	o0hoW6V2WnPxC
X-Received: by 2002:a05:600c:4e87:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb88938d38mr144837645e9.30.1795267981193;
        Sat, 21 Nov 2026 05:33:01 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:00 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 07/14] media: ov2740: support 288 MHz link frequency
Date: Sat, 21 Nov 2026 14:31:37 +0100
Message-ID: <3885fc22c2a195125139d5d748a65e739acf0871.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
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
---
 drivers/media/i2c/ov2740.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 7d786d09f..30eb58eed 100644
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
@@ -1179,6 +1213,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
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


