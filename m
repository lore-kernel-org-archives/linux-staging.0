Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF8BA47
	for <linux-staging@lists.linux.dev>; Sun, 30 Mar 2025 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743342854; cv=none; b=btbZWYmpDQ3a7Rseh5QmzB4DVPzgbpGHiFmP4CGeao4YbG6iJlBeZxMxGEXXzsM3xETqA8938Cu2p/kH0vHPLg6ZtIsG/q1l3KREp68GYF/kJRY70eIBOPrnUUC1hi2HaOQvbbDWG83Rocvi6NB8ycFJ373d10xaePI8ASQnPhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743342854; c=relaxed/simple;
	bh=DXt+GXeV4mp0WRGLCUGBLPVEPVQcKyAxaH7Wq8tfIJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lnJSZbw5K8mUuuNbSvjchS2xUis3pazrr2x7KnbipzeiZMuxW3GKo8+yPPzc84COC8hY5yawKo543wLQUZCTyjs4ZhQlWq2MAHzHi3EjT+PVyL6742KSiPGhDfQVOAJ9G793zr8ZuuZcmENxCdwxlIBtpi7FGygKdD3Q8QhoRy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nllD3XWK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nllD3XWK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301c4850194so4927224a91.2
        for <linux-staging@lists.linux.dev>; Sun, 30 Mar 2025 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743342852; x=1743947652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cja7WXf88weQH2Ms3egRtRNJB0hV1hLf9dov+aKpUCA=;
        b=nllD3XWKhTsD0//T3a+KmME8wpwzuxAK+dKehIAda2bNjaMkpGjXMYerHPQK6/OW5C
         OeKL/C9Ke0qB/JUu3FCm2jTdYx6Gc22WGFrGHS/WTNjgBK9HJy04k/QNqWXx6Z9HmBqJ
         lcd0XSwmNSJuHEu3ooy6JGNt2p6tuK7gVbGk7WrRXV4d0xHquAGtYKJm8qkD0MIAZjGI
         1T+thT88ZqA0V/SA9kJatzphBBkynELnIELV2CgxckCiRs9knUKh22OK7Wjy79/pMMuK
         2YDhG0o9DjXOgC2PrEWtg+lZkLTGWnB90gH9b7QXZrwXNuJnMOBg8pwzQh3kbBChom8X
         axlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743342852; x=1743947652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cja7WXf88weQH2Ms3egRtRNJB0hV1hLf9dov+aKpUCA=;
        b=hJmFTft4Ypg17/Htf93/+a6e8XZttcNV6SOVNfpOt0M6Jbxqv1IVPp096FTQM+vPyO
         h2bsd3aFYN2I0W2d8mXmQo3UqM0kGQPENlEJC5/CzQ112XFO80vorIg7kajj2LWYEFIL
         l5E4vaekuTtBS6naj2Lsn/fVKCj9L1+htJucdtpjphMHOsXILQxRcLBjdGeHBuNe/552
         Tdf9gOJGh0ntMaCzSF8OPXE95faays7FKvh9kMGzXFAoK4sq3eJXKavIPcbT89S5CJGD
         rOiNRA2iSyACbj1cjVbAI9LqcUuqStwWxcLVsUvMSVP+9/1fnxkjTtN8dPi/e/CjKsnn
         /uHg==
X-Forwarded-Encrypted: i=1; AJvYcCUjwQITxsjCVtlgt9N8kGwII9Alq7xVFsIZQiKi8JFmRCKn1yhumB1y77acpCfQqcbiHbpMroHnY2XsRZh7@lists.linux.dev
X-Gm-Message-State: AOJu0Ywouirqs61Q0ZvYAgl+Mz219/CFCqJlOO7m6xpYw68Gaag4NffU
	7ilPadn9egq3vzFfY0NuAMxCQiRG2xNYe2fR3dJf+81glFg5on2FePjAGZ4lM1E=
X-Gm-Gg: ASbGncsR5s8Wsj9ANjabAz0Yni+26mHG+kWHNIJBAP78X2RNJ25PMeUfOZpS6xHaI/N
	P2dc55b8k5RXgF+E1SudzPoHpHTzOqYkGdVbXhZLBlJHgcDBuwcQvq5v4o50vwihkbMy+zdfxlg
	bRqBKdZAkskwZJGUUGNr0llbOuPFaDcfpxJS7nvViJpUZSRBDmsfh2qFqRxQ7xOxu8ULKqTWE+h
	tFcIvGn/evmaymYZj48655cly15IuduWxtV9cfyvGZjcPhzsmK2VofXcXyTVo9nkARMpbocQtIo
	lO/+ojIsyvHkAxm1mo6yjPFziR83bXxvh/Kmq+1YKEUg1FzFGR88KprLhJYpgAC3eb8=
X-Google-Smtp-Source: AGHT+IGJRRD5SUgH1BoqMZGKNSNNsdWWHJiTdd51Gyk8ADVMgC2QcXtjhGAmxE4p//k5Ni8tp81dJQ==
X-Received: by 2002:a17:90a:fc46:b0:2ff:52e1:c4b4 with SMTP id 98e67ed59e1d1-3053216eb64mr8498809a91.32.1743342851805;
        Sun, 30 Mar 2025 06:54:11 -0700 (PDT)
Received: from fedora.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cdfbbsm51889505ad.146.2025.03.30.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 06:54:11 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	Michael.Hennerich@analog.com,
	lars@metafoo.de,
	marcelo.schmitt1@gmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH v5] iio: frequency: ad9832: Use FIELD_PREP macro to set bit fields
Date: Sun, 30 Mar 2025 19:19:51 +0530
Message-ID: <20250330135402.105418-1-simeddon@gmail.com>
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
 drivers/staging/iio/frequency/ad9832.c | 85 +++++++++++++-------------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 140ee4f9c137..e74d085fb4f2 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -16,6 +16,9 @@
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/unaligned.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -59,17 +62,18 @@
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
+#define RES_MASK(bits)		GENMASK((bits) - 1, 0)
+#define AD9832_CMD_MSK		GENMASK(15, 12)
+#define AD9832_ADD_MSK		GENMASK(11, 8)
+#define AD9832_DAT_MSK		GENMASK(7, 0)
 
 /**
  * struct ad9832_state - driver instance specific data
@@ -131,6 +135,8 @@ static int ad9832_write_frequency(struct ad9832_state *st,
 {
 	unsigned long clk_freq;
 	unsigned long regval;
+	u8 regval_bytes[4];
+	u16 freq_cmd;
 
 	clk_freq = clk_get_rate(st->mclk);
 
@@ -138,19 +144,15 @@ static int ad9832_write_frequency(struct ad9832_state *st,
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
@@ -158,15 +160,21 @@ static int ad9832_write_frequency(struct ad9832_state *st,
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
@@ -197,24 +205,22 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
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
+			st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 0 : 1);
 		} else {
 			ret = -EINVAL;
 			break;
 		}
-		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
 					st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
@@ -224,21 +230,18 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			break;
 		}
 
-		st->ctrl_fp &= ~AD9832_PHASE(3);
-		st->ctrl_fp |= AD9832_PHASE(val);
+		st->ctrl_fp &= ~FIELD_PREP(AD9832_PHASE_MASK, 3);
+		st->ctrl_fp |= FIELD_PREP(AD9832_PHASE_MASK, val);
 
-		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
 					st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
 	case AD9832_OUTPUT_EN:
-		if (val)
-			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
-					AD9832_CLR);
-		else
-			st->ctrl_src |= AD9832_RESET;
+		st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP | AD9832_CLR);
+		st->ctrl_src |= FIELD_PREP(AD9832_RESET, val ? 0 : 1);
 
-		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
 					st->ctrl_src);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
@@ -396,7 +399,7 @@ static int ad9832_probe(struct spi_device *spi)
 	spi_message_add_tail(&st->phase_xfer[1], &st->phase_msg);
 
 	st->ctrl_src = AD9832_SLEEP | AD9832_RESET | AD9832_CLR;
-	st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
+	st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
 					st->ctrl_src);
 	ret = spi_sync(st->spi, &st->msg);
 	if (ret) {
-- 
2.49.0

