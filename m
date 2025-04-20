Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752935961;
	Sun, 20 Apr 2025 17:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745171252; cv=none; b=YHCb6p6oSbf90+/9om16m6xFDlw00c/Pw+dzzYNY2vWc9SbDa82fCxwV/3QT6PTKgyx+WVAfEHpfdB/OAcXedOrc4WDdbViZ1JDrcrwWQsRPJhbWdmWC9gXKf1Y7u47BbqxjsCk0mGAH8jmh07NewOML3G+C8ATk2o9gc6Z4XXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745171252; c=relaxed/simple;
	bh=2Vf/9v9oV3MQq5OTBU53RUwRdOhIL5//2e1Ab5etr2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQNkFcNaBgrxn6al5p1Z3PsE/ulAAGxZzVEVNYY4IiFNBZDDZT4sT9I3yCOTHzlFry0DyzVOC9NR3QycBwymv61DfXqzwHn/XNvRvjminmkjL2JDuQO0ui7HARqZuvgaJGtSN748j1+O9itptillJmMITgPE38YCtj7BykAivUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntP6FpNf; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntP6FpNf"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f254b875so34342616d6.1;
        Sun, 20 Apr 2025 10:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745171249; x=1745776049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h24RgFyCcH7lzHlvjgR3evkgjumfAagNsNMPftg8pkw=;
        b=ntP6FpNftUqpFTn9eFWcK9EYIeAVZ7RoFCKk43ZH51gNwgu9gcIykm5t0GeYOrTYu7
         sWOL7e3ceWEN/zSSKogTKkz+PXIYgBbMTAWi9fGe94S8YP9UWdU7/w3BGHadFEXdnveY
         C+Srlst9wgaFJNlzzttkt+lIxtYZgl5vrInqwyXCmOxBE14JHF+l+6mxao8LqVlSODdk
         eHehUY258kRsZBIx2/Rwb9ltGn9ETXgjaJFLLgyZQyaFTbMweiX5DbjC0A/oZlXu1q13
         K/ACA1xz0gttB++36ymcrrBJ4wFq+GPFKn0cScyW/42/Xiib7uKKvtHrIxF1KOgkB5V8
         /8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745171249; x=1745776049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h24RgFyCcH7lzHlvjgR3evkgjumfAagNsNMPftg8pkw=;
        b=bmTFK33fMJ3pBfmRJhITSFeswoVxmRPAVR6BbHMFg62jfLpSb3MMUuweqLFU1RD/9z
         DC4OLTd0CSaDOQnatGDCicRhNxnRVSdSSdjHYTDDpLnbI3ZPfWmCm2+rxXY1msh2ETbM
         hno7YlOZi454euccGvi1/rox34y9nozKPM3sYMXpFnv3Vhf81gnAWS3mJzVmIwi83qWz
         he1WFx/k7qJ5BZAADC3QnKDBYUZ3cYxiRwzotRanCnJSPX7XiFNZSgVZRYOLbN7j1lBa
         k5UDw4NOMh6Qw5rPDPNTRDlzIp8gDFYnndwe/ySLYL2otRzEyT5Jl+8qtGyGGrZvDRkb
         C++Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8PIxqxHkjoUtrw8Gi/889RbNBUzF7TXckop7QXwt3M+7jNr/E1dCyiXDXySV0B/qq3ARrTQdTcza8f/NjrQ==@lists.linux.dev, AJvYcCXx1Pudf7s/SehmswLdtEJEAD8X77gkJ4g0hZ6m2goCYlsheFtFwOAh+dIiYDpMC8YBiQ2L35wWEy+fizmjJCsDZQVlNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoXYk2h5J8Etmyv3kkENQO+6IXSo/AoOR/d5itrv5vVVyjEix+
	qHXoYkQD+qcWi3t9XdUmAs5Nuo1bot5fSmjxLVXna/6rQJ0/spmw
X-Gm-Gg: ASbGnctw+2op9QMHNC3X+5b0Gz0GWze5fv7dMFe+MBFS8F5OzV5tqLQ/T+MhHqZivRe
	FO33YQK02IgkP5BsaLLzb/Srh4TXVWHlC4wBh2Z25/PBH+3J2rdFd/zJmrOEd3zpMszfrbjacpF
	bkQrJ4eOyCko69jgDNzwPdsRyAHP4XqT+ebqLl/0n3ZdecD9FCMn219bz4VDDDlwh8XX6azKA1c
	FB5oXZ+sOSsrfsBQLU4ZLKRu8fjMrbHUW1p0RigEhjXkWT/MKzXHKUXmmqDlGGw5/jlXPPB9dIH
	o8wehOYpi0bkUKra4jnr2F95xd96LN8GhKkuBEIcNnidD4DAzGgexVk=
X-Google-Smtp-Source: AGHT+IEGuU/XmD9LzWAQH4urqH9KPSzTPmaLGhO4ldjnmlsaDbNT+Z6XLITK7f+gTdHHySgR9be02g==
X-Received: by 2002:a05:6214:410e:b0:6d8:8a8f:75b0 with SMTP id 6a1803df08f44-6f2c4540815mr154535616d6.14.1745171249198;
        Sun, 20 Apr 2025 10:47:29 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd3e4sm34110156d6.85.2025.04.20.10.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:47:28 -0700 (PDT)
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
Subject: [PATCH v2 2/3] staging: iio: ad9832: Refactor powerdown control
Date: Sun, 20 Apr 2025 13:47:24 -0400
Message-ID: <20250420174725.887242-3-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420174725.887242-1-gshahrouzi@gmail.com>
References: <20250420174725.887242-1-gshahrouzi@gmail.com>
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

