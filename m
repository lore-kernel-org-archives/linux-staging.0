Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329242;
	b=c/7M0rx/ytYNpMn0mEZNf9Uz8Nyuy/OVWwWUNz7fdtN7ZFvDjg+elbTo1MpotR5ZliM/
	 RQ1UHw1QwhLat9zD+MaoRYELwAStYHZ9BNDog6t6oKYdP06Nza1JjsTXgnSWr9Xlz6mY/
	 GQf7YRdpHGQoBq8bIA5fL7BI6KS/A0FGZXmYa6iQFpDLo3//nUKSON7oZLxV4Wb53yXgb
	 OEvChh2mK5DQ/HRk0rSpnYp+hvkZR1EY/OVScGEJ2vTNREFFCYTCLiMNWiVaFK7M7yGzg
	 r9Y6fmD6Swu0tCWemoqtVsvEs0vo9wbsg/RPj5uiiXi+9zvsPi2J4C3ViQzSlKmCGsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UDRMQaN490Igz0plCrZ/DYl/p/Z4M+tLu42qQn9xGzM=;
	b=KV9elh3CvozhPAE0Lsw+pXXmozr/RGpNAaYczYbecrmtDtUr6FfkB67wx7qJcpLLxPOz
	 4mULpGSMU1lfIKhbcwV1apm9HSjoRSD6cOPv212LaEN7PSoti6fpZlMqsQ8l8xsmUuWfJ
	 zaCMAr8+jkod+K6nNTIfSDqdqGSEHqbByefQ7UyIly2HmGdbjAJiMdudLg4cQ3TAdIbR6
	 rdo8FyULpk2htrrQkZ6smKc6jzIbXF50EXp8Atm5zwYaRELJKdpe1KqKfubOxeQr16v0w
	 ABSzHCf0wHGZNLqxwz3maMFzzpcidMHWnCkGmLSKGpcpmiDVctEHJ06m8nXzUWJ1nUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=frD+eKgh;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0CF606A33B
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 16:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0CF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=frD+eKgh
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so3484817c88.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 08:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329241; x=1794934041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UDRMQaN490Igz0plCrZ/DYl/p/Z4M+tLu42qQn9xGzM=;
        b=frD+eKghZtgQYY0XJiDwIG9+bA4/icNiMVbJ8scGPK0qEH9VBafE4JKiWDrY0zueXz
         f82M5fSb7hmsKgSobMtXvNQtn/1HlVIpv1n06GiT7EduYVATw91oxOfCy5CT0xBpi0Im
         YIDN0Pvy5dSPm/TOgRRg7/ENZZK+acksOQgY96lfHeO1iDxKaZKwr550Os6oUA4kjDm0
         l0wLedKD76zKF6VcY+LzdK6Kzmn8rJDhwU9rI5OCHJ3hq7zruDzRTPRsb0WcgwgUmh11
         sYqfFBgSDsHFWMx3D6aIqLTAtcvQZHGsJD+tJoRaiitYk8WAH/7SdWQwTOsrjYXcyMrn
         a5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329241; x=1794934041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDRMQaN490Igz0plCrZ/DYl/p/Z4M+tLu42qQn9xGzM=;
        b=O8OmWwFNlhUpQnwqyutT4miSXOfgiDrKCjW8t7zS+QF7n0grjRxMSw5iqQnU/LcOD7
         0ueQneF2myoKbUMlbt6nsvO1LXKGshU0F8SKYo6GbQ3l9TTJ4HXB47BZRgBQaV/BPwMI
         8Orv+RG1ElE3nuTxCdSryA0yIEyTwLnOV/APSuQYixo++o8K+NnOrUHNvmdpYuOnJkMa
         kFtSTHeCGVorqEOv1gwNumJrw3R2u2qXxYHLME0+Tl+O56woCRw2tXRDsvMA+WcoBScd
         0uyUrRwtR8wGmL+GzQxYl3nra+kKbD1PGUIDkyr5uK0E8y5nxMSkPH11xxpph9jrsiXv
         YAug==
X-Forwarded-Encrypted: i=1; AL+hErFQn+uY13HOqfG0jFxfgjaJNuJ+mm4xwLbgZYedpoW7Jh72yl6dJVCi0QuWwJmeIDiXZConwzo++DgPGxH2@lists.linux.dev
X-Gm-Message-State: APuU4Z9InaiLWa5kQCO2las2nab9pFRnl9i0YYcodK9YKBvC78DIv1Go
	TXu8AXwPYH2CcnwXSY7sfJCUYWvUI4+HWC7SiK7vJP3hcg7ECkGNlJ5k
X-Gm-Gg: AYBFou0XGCnocfcZ0Lz3QzzJw/S7uFpj4+dPNgx5DisfZRFtwzJA2HgThnbz82Jn+1r
	WDPshdgR378WzQIC2/vpiR7AhrnRqyvGtkOL9SUm9UKhx79k1eKJmQM4J4yCWykXjSaN06z4Uvy
	SDF6JPUZhtl/TAlZFLGaeeIZ5n6FR2sHEIXvNjr1NIls9wd3c2D1NPbpqj9FIensTF/0hvuVB8H
	0kWOWSYCqMtm6JIEKvTDIPKvg7tOsQQrFNJOAHA8u39w3+NQeG7M6LNsblaUPNopo30wow0m0+q
	zjuFr1FnIPqC0vnhPexQL1glSN5/5NDi8Pqculr95m6mO0jtHCRhuAYGXz/jsOWoijJKBt+ispY
	CIkogAdAIblgT8N/w//ibbiOFKwoC93ppevJz/82ZRp5uSsvtCQDpUVRimLNPMNwPRp3sBm86k/
	nxRQOrP9fCuj+vtVQcaoxGsqA4aTxSfVpl80uVnD2qh+GtILHI8fu+2tzlfFG/B//1qJpphD2o6
	Tg1K+66Zyofh/l32U/JwKWyn7w2CZsJl1P6PswmwyNDItQ9S0WB6PZvmYyopBKGuEF9dVCfm9HY
	B1wyYxAxP71eVeNKrpV9I79IturQVQP7/mnXpLSSJMDobl72
X-Received: by 2002:a05:701b:281c:b0:1b2:5f31:21c9 with SMTP id a92af1059eb24-1b3b5e651e9mr3703067c88.6.1794329239066;
        Tue, 10 Nov 2026 08:47:19 -0800 (PST)
Received: from NithishVelan.localdomain ([27.60.174.111])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b54431sm7882587c88.17.2026.11.10.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:47:18 -0800 (PST)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH] staging: iio: frequency: ad9832: use guard(mutex)
Date: Tue, 10 Nov 2026 16:47:11 +0000
Message-ID: <20261110164711.552-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Use guard(mutex) to automatically manage the state lock in
ad9832_write(). This simplifies error handling by allowing direct
returns from each switch case and error branch, eliminating the
manual mutex_unlock() calls and the goto error label.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 47 +++++++++++++++++---------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 35f823f24..227dcd739 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
@@ -188,52 +189,65 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 
 	ret = kstrtoul(buf, 10, &val);
 	if (ret)
-		goto error_ret;
+		return ret;
+
+	guard(mutex)(&st->lock);
 
-	mutex_lock(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD9832_FREQ0HM:
 	case AD9832_FREQ1HM:
 		ret = ad9832_write_frequency(st, this_attr->address, val);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_PHASE0H:
 	case AD9832_PHASE1H:
 	case AD9832_PHASE2H:
 	case AD9832_PHASE3H:
 		ret = ad9832_write_phase(st, this_attr->address, val);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_PINCTRL_EN:
 		st->ctrl_ss &= ~AD9832_SELSRC;
 		st->ctrl_ss |= FIELD_PREP(AD9832_SELSRC, val ? 0 : 1);
 
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
-						  st->ctrl_ss);
+				       st->ctrl_ss);
 		ret = spi_sync(st->spi, &st->msg);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_FREQ_SYM:
 		if (val == 1 || val == 0) {
 			st->ctrl_fp &= ~AD9832_FREQ;
 			st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
 		} else {
-			ret = -EINVAL;
-			break;
+			return -EINVAL;
 		}
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
-						  st->ctrl_fp);
+				       st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_PHASE_SYM:
-		if (val > 3) {
-			ret = -EINVAL;
-			break;
-		}
+		if (val > 3)
+			return -EINVAL;
 
 		st->ctrl_fp &= ~AD9832_PHASE_MASK;
 		st->ctrl_fp |= FIELD_PREP(AD9832_PHASE_MASK, val);
 
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
-						  st->ctrl_fp);
+				       st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
+		if (ret)
+			return ret;
+
 		break;
 	case AD9832_OUTPUT_EN:
 		if (val)
@@ -242,16 +256,17 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			st->ctrl_src |= FIELD_PREP(AD9832_RESET, 1);
 
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
-						  st->ctrl_src);
+				       st->ctrl_src);
 		ret = spi_sync(st->spi, &st->msg);
+		if (ret)
+			return ret;
+
 		break;
 	default:
-		ret = -ENODEV;
+		return -ENODEV;
 	}
-	mutex_unlock(&st->lock);
 
-error_ret:
-	return ret ? ret : len;
+	return len;
 }
 
 /*
-- 
2.53.0

