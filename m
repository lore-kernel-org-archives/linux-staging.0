Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864120CCE3;
	Sun, 20 Apr 2025 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745171665; cv=none; b=peQkM6SljRknyWt41x6EVLswRCqwM51DXhZ5vWuXoQ3tuM6VAMj7hAVRcWqYwyjFPjzT4MFjEU78am3AFGw79Mft+ShPCaaS6agaFZ2GrmFrFo0IBbgY/VNeQ6w9RmpOp09jAKK8nMOIZ2Gh2GlM91xJlgsSGEJmY1LX/pF/eLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745171665; c=relaxed/simple;
	bh=2Vf/9v9oV3MQq5OTBU53RUwRdOhIL5//2e1Ab5etr2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSTTLfIELHsOj2qm/sC7qSQvPz34odTFkV8Tfv1ajYYw9wx5XSv569v/r/nMP4Hb1Z1LWKSLZg/62vOP5Qnrnrf35M6pz0gGp8prFmeb/vsbnyy0GsnlpItoVs5de2qjqJLaC0fudo8vhbjn0QNey32LT6cm7MDbPuCYEtUdbBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2JmmRS/; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2JmmRS/"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so36255406d6.1;
        Sun, 20 Apr 2025 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745171663; x=1745776463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h24RgFyCcH7lzHlvjgR3evkgjumfAagNsNMPftg8pkw=;
        b=R2JmmRS/WmVGGE8yOAKondYUNy0XRxV9fkT+QyaPF1wmf2fd3Um+o66K/QOfChmv8a
         Nqxw5MFGwfaj0hSmB/+LGO5wZI9eH3ZobisIovV3PwipOHmmdAy0slKHwv1CjeSNUyHb
         +ebJfzQLmzD511gPQIgxQfGUh8czmuRErcVRhPakTiBfhmNVcJJ7BLrz785G0nAFmNFv
         K6wvQb/tbjxlzJi2Vw9vlbZzIaiZodKfjmN/AHm9m5qGn9Qm5pGI3WnQmvfHXI2hL4Z+
         6UCfCdI7a8GqTRubtwThI1FixdkxOpyAErvjqOTxxiMGfgASuZgrivAuH4Mvf9OmoXdt
         V7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745171663; x=1745776463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h24RgFyCcH7lzHlvjgR3evkgjumfAagNsNMPftg8pkw=;
        b=FiDALGPYtcNR1WSXV1zDx/JZbx1GSPXEHSZ2Cs+Gqn3ZQFOZbckEA5Y6mlaxyTpdEQ
         ZIiHdDno2wtYduGUb0PF12haNuLiJAGDPykZSflLXCOKjG2qiUEpRbig+AocCRsSNQa8
         QQSfJD8X639+30uemBwhN3navkhCl1/BkgEQW11jjfSmslRkjg81quaMA5vj0hIYblAL
         J9fOAsuEa2JihcMFgywvUPDt50rlKMHn1IYxkRrxLPCOn3VjhJ4GTnnDmBkjqgB/qwUL
         SaV4IoGE+LF/Ydq6OnZ1VbvGeaGRTS+7l0oxp7ZLSiyx0nip1aSLjBpabfDkYVlONaJJ
         PqQw==
X-Forwarded-Encrypted: i=1; AJvYcCV8VgQ1fJ2mhU8GQN6NTY8zi/XMb/B1/fY639dnUxwfyhZT5G862BwARSsFcaVDYwCBy14g3iAuoiDAI4tVXA==@lists.linux.dev, AJvYcCWnrtPEBG8MqJWXFdtkcERVOHsYzAqlM8cl5lRbhSh4/S+jqKBSyNQO8gisJf6DypaJRPaNo6ZC47bIaN9aZEJsEqXAgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4rDkNXypJdryKyA6/jCAbAgmAhJqckv8hLLourmLDgp+zoypd
	bw4rV4hggCVzIGWsLwVAyUWXhZAIqMk9t87Lqj/tc1P0qViKXAs6
X-Gm-Gg: ASbGncuuDy6KYi09kWpzHDRaYt/NTyIBxl2Iie4uCeVpVveDGT+iFC4hoZSbKD5YCXb
	0Q73kj6YsTSlWJpOoYFKSYF4LUz5q3W+PAdBC0i7ZeikTvC1+hkfhDIPFOEviQ55+wlyfpXz/a4
	ik4qrnmRgwoCYXrxB09HiAojajQ6Yc0QM4hIVUdywaiQQYkjrDscemYPLN+TqXnUWD+LcnxvRWj
	5vaA/wWjnZtLqXDWxaNQM5dusS/g/6axzNS6UrIkfbjkYyBIdCGgrjJXKLPKQem9R2T+61/Mk1c
	CT6BNvx39fc1t4LNQYRPiNCIXsCM6HCMrYDidTFyrVE7QafCfJdScvc=
X-Google-Smtp-Source: AGHT+IHL6GPjHZhPOvVwBwkyUv2IPgNtiGrMl108lh5c8K9FjJIX/sgeA87cxOW4bmHk+/oux5sNlw==
X-Received: by 2002:a05:6214:1243:b0:6f0:e2e1:3f7b with SMTP id 6a1803df08f44-6f2c4d6a401mr122624846d6.3.1745171663104;
        Sun, 20 Apr 2025 10:54:23 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0c1bcsm34801286d6.26.2025.04.20.10.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:54:22 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 2/3] staging: iio: ad9832: Refactor powerdown control
Date: Sun, 20 Apr 2025 13:54:18 -0400
Message-ID: <20250420175419.889544-3-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420175419.889544-1-gshahrouzi@gmail.com>
References: <20250420175419.889544-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom implementation with out_altvoltage_powerdown ABI. The
attribute's logic is inverted (1 now enables powerdown) to match the
standard. Modernize driver by using the standard IIO interface.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 44 ++++++++++++++++++--------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 0872ff4ec4896..a8fc20379efed 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -167,6 +167,34 @@ static int ad9832_write_phase(struct ad9832_state *st,
 	return spi_sync(st->spi, &st->phase_msg);
 }
 
+static ssize_t ad9832_write_powerdown(struct device *dev, struct device_attribute *attr,
+				      const char *buf, size_t len)
+{
+	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
+	struct ad9832_state *st = iio_priv(indio_dev);
+	int ret;
+	unsigned long val;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		goto error_ret;
+
+	mutex_lock(&st->lock);
+	if (val)
+		st->ctrl_src |= AD9832_SLEEP;
+	else
+		st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
+				 AD9832_CLR);
+
+	st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
+				st->ctrl_src);
+	ret = spi_sync(st->spi, &st->msg);
+	mutex_unlock(&st->lock);
+
+error_ret:
+	return ret ? ret : len;
+}
+
 static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t len)
 {
@@ -227,17 +255,6 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 					st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
-	case AD9832_OUTPUT_EN:
-		if (val)
-			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
-					AD9832_CLR);
-		else
-			st->ctrl_src |= AD9832_SLEEP;
-
-		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
-					st->ctrl_src);
-		ret = spi_sync(st->spi, &st->msg);
-		break;
 	default:
 		ret = -ENODEV;
 	}
@@ -266,8 +283,7 @@ static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
 
 static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
 				ad9832_write, AD9832_PINCTRL_EN);
-static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
-				ad9832_write, AD9832_OUTPUT_EN);
+static IIO_DEVICE_ATTR(out_altvoltage_powerdown, 0200, NULL, ad9832_write_powerdown, 0);
 
 static struct attribute *ad9832_attributes[] = {
 	&iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
@@ -281,7 +297,7 @@ static struct attribute *ad9832_attributes[] = {
 	&iio_dev_attr_out_altvoltage0_pincontrol_en.dev_attr.attr,
 	&iio_dev_attr_out_altvoltage0_frequencysymbol.dev_attr.attr,
 	&iio_dev_attr_out_altvoltage0_phasesymbol.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_out_enable.dev_attr.attr,
+	&iio_dev_attr_out_altvoltage_powerdown.dev_attr.attr,
 	NULL,
 };
 
-- 
2.43.0

