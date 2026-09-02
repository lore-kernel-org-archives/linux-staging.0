Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2B44A49AD
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360849; cv=none; b=TjEpWp9oyrqUmXge7LH7M3NfKTrZOs3m8xx71ipFkCR6rbF0YVrUWzR2s93CPHst4CdLDCBUVB48wYEpOaTqRo1mNXu5/wBDyc8mjoSnhg1gAVBpo+9+w+xAcka0JClnuFWuOI7BFnA5TdYxZxZ720ZNMdW5gGzTsKISoHJyTAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360849; c=relaxed/simple;
	bh=4JjOP6xA1fWJTzg0nGLviFM/abTCFakLq0J+yMqID+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnEQ9smefd0eMMK6NlC/SlhFS7uuuiUdVngLgrIq0BrE6axehAdaKrbpQV7HE08gDaUN8aW++7hRpCoCxodDzESxNWkuiJVcLFzlCdAqAuXjD2pa8ZjK1ydYupscWgOHBL2WN7mt+JVUwFabu0PP2x0W0OboJ0HUWU0DOtvCfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJGpg6lA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJGpg6lA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1164055f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360844; x=1788965644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=BJGpg6lA69pbm3gAbs5OsgkDf3s86nSNfz9oQ94BSexXrUbFSNtDim2JhsYVmmWT9D
         79WHbDul6q1s+MZ6jpWDL07ZDzoXpvAvez4XsB6jL4uqkGhX7ZZ34S03v9wdyJzv6zLl
         F2Driki0BvBnel6YTnbNvVoTMQJio+AcjsxEpdh0Gb2vcFr0YQBMg6QMTnw80PFoxlRY
         yI98wdtQMFB8gYYpye+iBgjIy1jqcxjK0Qqc6hurQ+/wbffvg98J/gmV57vp3mJTSNNz
         0MBww5lAwuie3sQrqjEMDUhz2t2hJO6QQDr8vswcCIs/dSF+lp4tfuRvD+BW5YaES6RZ
         aPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360844; x=1788965644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brlxyZ2t63L8fQignAF7hkZpVD232LlJffHWx51Zan4=;
        b=HCeEG1Du1OgY8WfhLT+hG5EzHdzsut5j6o6PtyE3Qftqqux7H2L1Jt+cSb+w/hs8OM
         B21E/FMMEHln5Hl2/b/DTeBbZz3A48wHnLnNZBsf5II1nDhcO6HV+9fvkf8y6QMjebwN
         IF6+GL6Y5rPkIUfCe0TMD+MaOJYmFrxow0hrbfdLDeV/cpve0uwujxLNhWMAinTEMw7l
         TJR7Nv/Bl+BfSb8j1oIWtgs3HfX4+BRBDKvOTC5o5uv/N70vo9ET5VfE9RTkbTyz254N
         wev2EF9xVhWE8qji/vgH+9wWLrT3fCeHovWYxkwWoWs5+fiRvpQt7eJDBl6t1wb07z1m
         MQxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK1aUJ+wXEpENBQGZ937wPwZ0PGmVS3SincUmlKcwx+NOWbMaRkFgzvZpPbFT26zQn+PMHD4kleNkaqZjS@lists.linux.dev
X-Gm-Message-State: AFuF++mhb13YTTGPpHmeEOjgYgaCBOBeCkTBzNFxfBtU7sfX9XzkxfTB
	7RFfUmupVQFY4Mmv2zQboD/+d40V0JaTS12Y0bjuz9WoLZyUniMai8Cg
X-Gm-Gg: AYBFou2noX0rWMdAb9jxbHeNGzWlockYeNSpFANCguHSf9qVApXu10PrF+fKGaNq/VY
	8+cEB94o5msVptVDJJz+15ZeW8eMF0T0gQCcEQBPfaMvPoGRUeIjV7q+0X/Vw/SFBb/jbTcqYaq
	joJvMzbyO3rvVCRB9lgF2a96oHOUgDzpI60js61YCyRtTmFixOq8MJcDVruLPE6rZyF0JvZY/tJ
	YLLw2LQxdI1YXqLJrr2goCkd6I+1Od+Y/vAi2ym5NG+6BU17CR6CTFH9mh3H3yip+pp6Gv38X8t
	wCTyWe0OkduIB24abmfVWBoen4iwGH1c77Dzft25n8j2UlZnvsRAyyhhPF00nPsOSZPm7hqKDxA
	/k4DfSKdFKO6WPimduroJJpoMVhYN3yEOt8DDg8uGCQt1X7HFgv9IGiX2k/kD85td5yuh1ehrlI
	E8qEhdvC6NtNYRRCo5cVwIGmj/baSdtgZ88u+LD4k4NwvlO/tL+5AK8imMom+/L3s5X9VORXvyp
	PV8eRFj1+iWbOuc7G7NTO5fTViuldai1VlIlnKFfqTuW3Tb5+3XgkM=
X-Received: by 2002:a05:6000:1847:b0:484:3931:c698 with SMTP id ffacd0b85a97d-48488dee004mr9537119f8f.5.1788360843914;
        Wed, 02 Sep 2026 07:54:03 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:03 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/16] media: ov2740: support 288 MHz link frequency
Date: Wed,  2 Sep 2026 16:53:37 +0200
Message-ID: <f86a0f5b228f99bc045cd019d89182021678a0f0.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

