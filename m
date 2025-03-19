Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E1D18E25
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742359946; cv=none; b=f//fSBcFq27Tu6PjPQ/9cPCcIiN5oFrFC9PxiRnXwhx0V6EXhdTpoNbSfP30jQmy4tVWTBnKqXhQEu92O6jqoyDkCr0VgP410xTnPm0ss0cYnfSr5XmOAfUn5VqCQ68GPxWgxPPwq6Ftoum8k2swVC9P0Gyl4qpriQcuNwYydPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742359946; c=relaxed/simple;
	bh=Iy2Fi78748Gkenm398s+hnw7QUv7zgXAa5cKzu1Rzvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dRrtaS8CUa6xrWWTPW0fAc2C7BHG172KFqHKJUqdBUZdP9uJbEJWkLDwIfWm4J28vFQW/c0OJDHQa/Tm3KDatSJ2lFKugdvKZQg4ZGdu+3HGkIFYtASdNZ1+4wAup9X2mcgpH7IDBd+iL6+hsxyqJDaM8XQxOTFHYHaST+1IB+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em3LSdDZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em3LSdDZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223a7065ff8so33340565ad.0
        for <linux-staging@lists.linux.dev>; Tue, 18 Mar 2025 21:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742359944; x=1742964744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViI9oxgTgNJdDe24WqEO5GfQVLS8soxzJZzaX0YdAjE=;
        b=Em3LSdDZHYIi7U7MS3lxXq/hKyJhi7prH8OQMVpy9mfaIUycnblRyqsPRvjq94Fmdk
         v1mDfJ8UC6VCqT53sHw8EAViplmsH8+QRD4tMix/muR3hLF12iwlen+ZZ+QDPV+jBN1e
         cht/VgzAmO/hgNjJ211JQLR3YYfyJyb8XYGQa/B0XPtqvTyx43v93dNMx9vRo+wvUTpq
         HYbHQWpl7NAS92R/RnAYHqsMatQF26E8tIOKlzLOkHxKadLFbBttR4+OyuGVKIYYf1w9
         BXV9rIl79NuVm9jBrdGRBqpVp5SV+LtsRpD2aunfPQxlYoey0WKGh544h2SeFImdFF5R
         weCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742359944; x=1742964744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViI9oxgTgNJdDe24WqEO5GfQVLS8soxzJZzaX0YdAjE=;
        b=mOZDKt8tsVz20+H5k+EOfQRbnU0/MIix35jgWxyMGhTu4dfbUtZqCj4CAe+R/U/c66
         OJkw4Tck+rOctVEP++S0ZusPbAeRIR/qnIgTQAezI7aVbQeVs9M4MLN505fn8QTtbAdi
         msopNj7X0W8xmDRStXBLwTxSRftYZiDnD6ZJWP/32d6XuAhPiOnhCFqyVfMmf9flFQGF
         7SbZ/Rw3R6BnxLR5zBJ0mBwI8cHGo8bR1xhS7J51Y72AeKAnFL9YmJT4jY5RX+5GsyfL
         KJZegtYI6Z+d505jV4uCnO9VdvdOhqUUsaCcXGR5S9g7vzNkky3brIwyl4BXdenJGodV
         Us7w==
X-Forwarded-Encrypted: i=1; AJvYcCWWfMUF17f4Heg74tCdZpS0CfQWCEkGWdNlo+8P1rt2YXZUWwphC9/gdIEEA9vmPt2QWJ2FioQTrPtBxqe7@lists.linux.dev
X-Gm-Message-State: AOJu0YwJx1OiswZGh3JmpFjNSImTGnXaf73r/AjuQivjEU1jt8oPl2wM
	xZlDQnA8jqyDd1m1mUderT9GBofETuMF2Ksx5BO4ah9fUEDXabUg
X-Gm-Gg: ASbGnctrjGIGRrDWCQbfKT4SmG83jm5e1cNIY1CD2M6eXA62KSaULsv8AgH8j45lG3C
	/HwjN7V0oK6VNDQ9OF4W9p9jOpjDMwTpsuqNinj/5RNIjngyyqt3tLYmZMFpOIKCYcCb2WM5pe3
	CIV1j6l6AK4AsNc6cUBJ6bVWKH+wq6GX1N7GPrVSFUrW8wzz/tY1YVeJQIJ0WSrYx8f6tqMo8XD
	tJYyiA2CGi/FrBtM0S8cgRRH2uz1QL4uQ0zm5tDQSGSTdplmcOMe7Rj3I2H/QtThuKhfr3FBti3
	bckuiR4dcuSqb1D43ZGB4wf9Ln01FaVn7hN4xZ0=
X-Google-Smtp-Source: AGHT+IHpoO9bEdJdyGhq/Gmyr1sG1NTY/9SZitQHUWXLdZKE44TeAwBmh6/LUru1W6WBPoqXD46eEA==
X-Received: by 2002:a05:6a00:3d4a:b0:736:a77d:5412 with SMTP id d2e1a72fcca58-7376d633ae0mr1940229b3a.12.1742359944131;
        Tue, 18 Mar 2025 21:52:24 -0700 (PDT)
Received: from fedora.. ([2409:40f3:29:9d3:cbd3:8af4:f398:31a2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b103asm10595512b3a.162.2025.03.18.21.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 21:52:23 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Siddharth Menon <simeddon@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Subject: [PATCH v3] iio: frequency: ad9832: Use FIELD_PREP macro to set bit fields
Date: Wed, 19 Mar 2025 10:04:29 +0530
Message-ID: <20250319045212.72650-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor code to use the FIELD_PREP macro for setting bit fields
instead of manual bit manipulation.

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 This one compiles and loads without issue
 Should I eliminate the use of FIELD_PREP to avoid bit shifting
 alltogether?
 v1->v2:
 - removed CMD_SHIFT and ADD_SHIFT
 - use GENMASK
 - store regval in an array and iterate through it
 v2->v3:
 - add missing header
 - refactor code in the previously introduced loops
 drivers/staging/iio/frequency/ad9832.c | 58 +++++++++++++++-----------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 140ee4f9c137..9a27acd88926 100644
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
@@ -65,11 +68,12 @@
 #define AD9832_SLEEP		BIT(13)
 #define AD9832_RESET		BIT(12)
 #define AD9832_CLR		BIT(11)
-#define CMD_SHIFT		12
-#define ADD_SHIFT		8
 #define AD9832_FREQ_BITS	32
 #define AD9832_PHASE_BITS	12
 #define RES_MASK(bits)		((1 << (bits)) - 1)
+#define AD9832_CMD_MSK   GENMASK(15, 12)
+#define AD9832_ADD_MSK   GENMASK(11, 8)
+#define AD9832_DAT_MSK  GENMASK(7, 0)
 
 /**
  * struct ad9832_state - driver instance specific data
@@ -131,6 +135,8 @@ static int ad9832_write_frequency(struct ad9832_state *st,
 {
 	unsigned long clk_freq;
 	unsigned long regval;
+	u16 freq_cmd;
+	u8 regval_bytes[4];
 
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
+	for (int i = 0; i < 4; i++) {
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
+	for (int i = 0; i < 2; i++) {
+		phase_cmd = (i % 2 == 0) ? AD9832_CMD_PHA8BITSW : AD9832_CMD_PHA16BITSW;
+
+		st->phase_data[i] = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, phase_cmd) |
+			FIELD_PREP(AD9832_ADD_MSK, addr - i) |
+			FIELD_PREP(AD9832_DAT_MSK, phase_bytes[i]));
+	}
 
 	return spi_sync(st->spi, &st->phase_msg);
 }
@@ -201,7 +209,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			st->ctrl_ss &= ~AD9832_SELSRC;
 		else
 			st->ctrl_ss |= AD9832_SELSRC;
-		st->data = cpu_to_be16((AD9832_CMD_SYNCSELSRC << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
 					st->ctrl_ss);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
@@ -214,7 +222,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			ret = -EINVAL;
 			break;
 		}
-		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
 					st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
@@ -227,7 +235,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		st->ctrl_fp &= ~AD9832_PHASE(3);
 		st->ctrl_fp |= AD9832_PHASE(val);
 
-		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
 					st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
@@ -238,7 +246,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		else
 			st->ctrl_src |= AD9832_RESET;
 
-		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
+		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
 					st->ctrl_src);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
@@ -396,7 +404,7 @@ static int ad9832_probe(struct spi_device *spi)
 	spi_message_add_tail(&st->phase_xfer[1], &st->phase_msg);
 
 	st->ctrl_src = AD9832_SLEEP | AD9832_RESET | AD9832_CLR;
-	st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
+	st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
 					st->ctrl_src);
 	ret = spi_sync(st->spi, &st->msg);
 	if (ret) {
-- 
2.48.1

