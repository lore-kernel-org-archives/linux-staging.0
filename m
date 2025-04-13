Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84324188CB1
	for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744545850; cv=none; b=XTxWaD4B/+WPJuLDwuiq0vT5muBYF3dFIdeNwT3pO9WLELr820YNP2IIprJ/tx8aiB1nNsS1ervwopNDYgcR8JEJUjKvzNXlGgJ3YdOH7xJM6mEORLNVM8XMnCoPZMEzO90MuPQKGpAuOAwokAwH20uGn1eP4KbEyfdBX6HLQeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744545850; c=relaxed/simple;
	bh=fpZdPZZm+2ktYrurYWmcig3+Cd/pQF+gLXoKrv0KSYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=puA3o9SLaZx+nu47+F/2UMMpknV0Ahhj2kjeZv+UWQxXGFL96tA8YoPyTkc/mgtVLT2iIC8/rLZSrM4k0ddUeKZ6lL2MujXf4e33gyYgIAUBpF6odeUi5o6GUBxm35Erwk6vaqeEjgO+Umjl50hkYDnOmV+4bnMr1Z6x2hc+DJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQ6RKK8k; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQ6RKK8k"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7370a2d1981so2612308b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744545848; x=1745150648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsmAlfCRzyGmechmgg5qWPZv83qkNivGO06jWmaWuoE=;
        b=fQ6RKK8kzHVxRsZI5Y3vpjBclCIpnGlhzfdU6UpRhSHRZ7wJKcNHt3jNMgPk42D+WE
         yDqqLX3X8d+xKLJHCnLUpNLZMaM2gKGq3pz16/WElbe3FwdAvyqWoRIhIncT4Tx2MKes
         DKGCMbc2rRGUnmIZQeZpJg2JkPwsfi5kNaueBvekJ/c918OJ4y3maMOtsc9euqccMeko
         x5LV2Ps5HlqkrhciaGr7DpFDpCbtD/Xmp1b8vvRhbJA0Vy8h82WKjSxhth6RN0oCUEIe
         Sx2nkbvl+AJotKBaolKUW65ZtHgHosPct98O0K8koJ4HNCF9a/+1OgB5cM+U8wAsb47F
         Jb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744545848; x=1745150648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsmAlfCRzyGmechmgg5qWPZv83qkNivGO06jWmaWuoE=;
        b=DJ2WEyx3OGNZX62Ap4+Ne7Pb/KV6QwkkXQSlIPXYEsXCEdG+d19Ht7X0Q7G7k6bxG/
         IanS2doul16qkCWkNE4Tyt52ZutRkUM6IQ5usIIbI+thG7l++0QIPxx4ArrA3UADpiPy
         TddtxATv4HGTeEn0nud4LMQnxT2nanBQRdaYhbhNjyzY0/8h5g9S+NByeaTO4wOibRH9
         ieu6/7LWxV3RYBjIAeLtJLNZXvsgExhg1mEnwBIfqLZ8v1BWn9/o9pazk35t2ImpO4iI
         sMHBW9gC7evzxmTVkqACGe3xj0jsbjD9SK302Fv02RbvcA8MS219Y0QCe8q7WPcgeEyx
         96hg==
X-Forwarded-Encrypted: i=1; AJvYcCX7s1bs1X7gouKecE4qv7MmAH47tCvSBkcxxT667tYsVX+k9rZYibY4U81mzyn8rhnNNCnmlfLeoRnls2Kl@lists.linux.dev
X-Gm-Message-State: AOJu0Yyid+GSTrGkVXl2+GZaLjp34FnZhnyDdky+Q52PH456lCJ8VxFG
	d7Sv4fgtoCjw8+JF6VEK4GlOL4qo7UrHiLae7HbXjJGFtY2Wl0sK
X-Gm-Gg: ASbGncvz3seN77fSC7Ni7fpxe9MWhy08Vt3viZCxQoM0Nrq2kIegX4f6PqvrT1c1qwD
	j48Mryxy5/nvjNZOf6lmcxhOhYIXZGBnfgTAs89tI0WIQvwniblgCFmbEBkSry9yZ8Cje6M/i/Y
	N5FynN7+2WYRZvcj7VTvChBbxvm6y0IfvWhc79wglJ33cLKsw/91ZD1JF+CM/7a1VxidbNF8+t1
	026gf5S9pIFBM1BCKkzMqUEV71k6iTtflHPM3VsY1iLIeIpE5iLmyAaJcL2JXGyRVCt6tVoiqoK
	eIazxRXyFCNJRYYcfYlblKmsmPY0HseGNORzfA==
X-Google-Smtp-Source: AGHT+IFs4PjDO6xQlge22RyfBv9IzqRee4AkDklXKjBk6GKqNxaRSJVuGRq/PZ4DBbS9afT5sx/H8w==
X-Received: by 2002:a17:90b:264b:b0:2ff:7331:18bc with SMTP id 98e67ed59e1d1-308237a838fmr12125835a91.26.1744545847551;
        Sun, 13 Apr 2025 05:04:07 -0700 (PDT)
Received: from fedora.. ([2405:201:f022:f80b:bc98:df72:df5a:60fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df0823aasm9162239a91.20.2025.04.13.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 05:04:07 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	marcelo.schmitt1@gmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH v6] iio: frequency: ad9832: Use FIELD_PREP macro to set bit fields
Date: Sun, 13 Apr 2025 17:28:13 +0530
Message-ID: <20250413120354.19163-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use bitfield and bitmask macros to clearly specify AD9832 SPI
command fields to make register write code more readable.

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 The error path for AD9832_FREQ_SYM was not removed as initially
 suggested by Marcelo, since he changed his mind, considering it
 would not follow the proposed ABI
 v1->v2:
 - remove CMD_SHIFT and ADD_SHIFT
 - use GENMASK
 - store regval in an array and iterate through it
 v2->v3:
 - add missing header
 - refactor code in the previously introduced loops
 v3->v4:
 - update commit message with a better one
 - convert AD9832_PHASE and RES_MASK to masks
 - cleanup a few if else blocks
 v4->v5
 - remove unnecessary inversion (val ? 0 : 1) used
   with AD9832_PHASE_MASK introduced in v4
 - use ARRAY_SIZE instead of fixed integers
 - use reverse xmas tree order
 - align mask macros
 v5->v6
 - rearranged includes to be alphabetical
 - remove unused RES_MASK
 - corrected logical errors pointed out by Marcelo
 drivers/staging/iio/frequency/ad9832.c | 82 ++++++++++++++------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 140ee4f9c137..7893bf9f5264 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -7,6 +7,8 @@
 
 #include <asm/div64.h>
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -16,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
+#include <linux/unaligned.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -59,17 +62,17 @@
 #define AD9832_CMD_SLEEPRESCLR	0xC
 
 #define AD9832_FREQ		BIT(11)
-#define AD9832_PHASE(x)		(((x) & 3) << 9)
+#define AD9832_PHASE_MASK	GENMASK(10, 9)
 #define AD9832_SYNC		BIT(13)
 #define AD9832_SELSRC		BIT(12)
 #define AD9832_SLEEP		BIT(13)
 #define AD9832_RESET		BIT(12)
 #define AD9832_CLR		BIT(11)
-#define CMD_SHIFT		12
-#define ADD_SHIFT		8
 #define AD9832_FREQ_BITS	32
 #define AD9832_PHASE_BITS	12
-#define RES_MASK(bits)		((1 << (bits)) - 1)
+#define AD9832_CMD_MSK		GENMASK(15, 12)
+#define AD9832_ADD_MSK		GENMASK(11, 8)
+#define AD9832_DAT_MSK		GENMASK(7, 0)
 
 /**
  * struct ad9832_state - driver instance specific data
@@ -131,6 +134,8 @@ static int ad9832_write_frequency(struct ad9832_state *st,
 {
 	unsigned long clk_freq;
 	unsigned long regval;
+	u8 regval_bytes[4];
+	u16 freq_cmd;
 
 	clk_freq = clk_get_rate(st->mclk);
 
@@ -138,19 +143,15 @@ static int ad9832_write_frequency(struct ad9832_state *st,
 		return -EINVAL;
 
 	regval = ad9832_calc_freqreg(clk_freq, fout);
+	put_unaligned_be32(regval, regval_bytes);
 
-	st->freq_data[0] = cpu_to_be16((AD9832_CMD_FRE8BITSW << CMD_SHIFT) |
-					(addr << ADD_SHIFT) |
-					((regval >> 24) & 0xFF));
-	st->freq_data[1] = cpu_to_be16((AD9832_CMD_FRE16BITSW << CMD_SHIFT) |
-					((addr - 1) << ADD_SHIFT) |
-					((regval >> 16) & 0xFF));
-	st->freq_data[2] = cpu_to_be16((AD9832_CMD_FRE8BITSW << CMD_SHIFT) |
-					((addr - 2) << ADD_SHIFT) |
-					((regval >> 8) & 0xFF));
-	st->freq_data[3] = cpu_to_be16((AD9832_CMD_FRE16BITSW << CMD_SHIFT) |
-					((addr - 3) << ADD_SHIFT) |
-					((regval >> 0) & 0xFF));
+	for (int i = 0; i < ARRAY_SIZE(regval_bytes); i++) {
+		freq_cmd = (i % 2 == 0) ? AD9832_CMD_FRE8BITSW : AD9832_CMD_FRE16BITSW;
+
+		st->freq_data[i] = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, freq_cmd) |
+			FIELD_PREP(AD9832_ADD_MSK, addr - i) |
+			FIELD_PREP(AD9832_DAT_MSK, regval_bytes[i]));
+	}
 
 	return spi_sync(st->spi, &st->freq_msg);
 }
@@ -158,15 +159,21 @@ static int ad9832_write_frequency(struct ad9832_state *st,
 static int ad9832_write_phase(struct ad9832_state *st,
 			      unsigned long addr, unsigned long phase)
 {
+	u8 phase_bytes[2];
+	u16 phase_cmd;
+
 	if (phase >= BIT(AD9832_PHASE_BITS))
 		return -EINVAL;
 
-	st->phase_data[0] = cpu_to_be16((AD9832_CMD_PHA8BITSW << CMD_SHIFT) |
-					(addr << ADD_SHIFT) |
-					((phase >> 8) & 0xFF));
-	st->phase_data[1] = cpu_to_be16((AD9832_CMD_PHA16BITSW << CMD_SHIFT) |
-					((addr - 1) << ADD_SHIFT) |
-					(phase & 0xFF));
+	put_unaligned_be16(phase, phase_bytes);
+
+	for (int i = 0; i < ARRAY_SIZE(phase_bytes); i++) {
+		phase_cmd = (i % 2 == 0) ? AD9832_CMD_PHA8BITSW : AD9832_CMD_PHA16BITSW;
+
+		st->phase_data[i] = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, phase_cmd) |
+			FIELD_PREP(AD9832_ADD_MSK, addr - i) |
+			FIELD_PREP(AD9832_DAT_MSK, phase_bytes[i]));
+	}
 
 	return spi_sync(st->spi, &st->phase_msg);
 }
@@ -197,24 +204,22 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		ret = ad9832_write_phase(st, this_attr->address, val);
 		break;
 	case AD9832_PINCTRL_EN:
-		if (val)
-			st->ctrl_ss &= ~AD9832_SELSRC;
-		else
-			st->ctrl_ss |= AD9832_SELSRC;
-		st->data = cpu_to_be16((AD9832_CMD_SYNCSELSRC << CMD_SHIFT) |
+		st->ctrl_ss &= ~AD9832_SELSRC;
+		st->ctrl_ss |= FIELD_PREP(AD9832_SELSRC, val ? 0 : 1);
+
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
 					st->ctrl_ss);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
 	case AD9832_FREQ_SYM:
-		if (val == 1) {
-			st->ctrl_fp |= AD9832_FREQ;
-		} else if (val == 0) {
+		if (val == 1 || val == 0) {
 			st->ctrl_fp &= ~AD9832_FREQ;
+			st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
 		} else {
 			ret = -EINVAL;
 			break;
 		}
-		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
 					st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
@@ -224,21 +229,20 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			break;
 		}
 
-		st->ctrl_fp &= ~AD9832_PHASE(3);
-		st->ctrl_fp |= AD9832_PHASE(val);
+		st->ctrl_fp &= ~AD9832_PHASE_MASK;
+		st->ctrl_fp |= FIELD_PREP(AD9832_PHASE_MASK, val);
 
-		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
 					st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
 	case AD9832_OUTPUT_EN:
 		if (val)
-			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
-					AD9832_CLR);
+			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP | AD9832_CLR);
 		else
-			st->ctrl_src |= AD9832_RESET;
+			st->ctrl_src |= FIELD_PREP(AD9832_RESET, 1);
 
-		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
 					st->ctrl_src);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
@@ -396,7 +400,7 @@ static int ad9832_probe(struct spi_device *spi)
 	spi_message_add_tail(&st->phase_xfer[1], &st->phase_msg);
 
 	st->ctrl_src = AD9832_SLEEP | AD9832_RESET | AD9832_CLR;
-	st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
+	st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
 					st->ctrl_src);
 	ret = spi_sync(st->spi, &st->msg);
 	if (ret) {
-- 
2.49.0

