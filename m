Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDBA55D87B
	for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 18:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707800; cv=none; b=fk0T5FXmK2oIasl0OabRViN+H7a5YUjb2ZPsvTpzVidIvf5+aXn9/9xhJZq/dx7LjdmU/+VIT0A6XXneMOTfP4X1LVDqJBAS+Xmv1cxQSv1L+ff6Z7ky4AnQfmqGFnfTSKdzP0Ng/CASBGskivyqfmqwkhXKD3cIGbKLKL5WcjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707800; c=relaxed/simple;
	bh=IgggqRFRJHsrxTs4OuHEG4QNZQchSD/bszInjUcCjAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1FaC+ozc441YBMhml66ttil1Lw0+0Emujl2UyHhCK5XByvAISc5fBReTQQjJqhwn77mGDg/3MRhPWOaEF2rxI19GOPrXIQqIJZ+8yvTxlnB17FKo8kQdHwUGjkO91RP70RS9T0EyfP4xkNBSldnl0raIOuskmRhg8JOBCgSeTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTb3kjBT; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTb3kjBT"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afd5b1678so111401f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 11:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707797; x=1791312597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nV5PAl/j9F5unHW2G98h/r8gEnFDBcnSeXzHKLdPuw=;
        b=WTb3kjBTdJWQBDe/1f9E4YXn/MZbsH501INhgF/LQjJONR1QuH03FpkwTf8LpKLfAg
         LjK78UuaXsxU3/UixDWjdxL5Ogv7NytyTck5ffNt28fjRh2f+IJtERLWFms1qa51hz1I
         rj1S+FROI/Ypgt5VYiJMtL3QATDlyktZwTf3uUMeggmH8RQTjDkZlCQPyEUgFjWJgLav
         0K25pAXld1dy8fXcypwuvl+4w/fAGbcyFbxwYrWsnlbuSP4bArL3FIQvt8kvPujbYGCY
         2fgui6fXxIMX2VXeS6zdKYvOYfwhR79DNjn6P9+WSL4YgfWd2i0ukf9U272DnZWrCszT
         JVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707797; x=1791312597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nV5PAl/j9F5unHW2G98h/r8gEnFDBcnSeXzHKLdPuw=;
        b=jMHoV4UexXPxH3xKDaF4vAQKC1gPkVnBpFTlbsTRQeS1LVZki9WMWerjNCpIC593aN
         kpVrShEJIFhIOubX1Xlwc4t/A4dh8Z0n9Awwm+FktVBfdQSMO7GeDx6MJZ2vnZnQzUVP
         34nZTm4VRjeATmNezbXkbMR/413jS3I71N3jZMyi6PBuex7CeXYt91Tgi6JWa/22eUMu
         72/154tvoVEmykVPBcDpB7a1WagCoF++cpObzU8wAkbtarmOXlOyWIxGGGYqmADTBjXH
         tRi0XbjJMx3Ex4nS4uwq4ro9IPYKScqYzBkZxiB9ZsEV7Yix5M+lVNrQqQu4xNxK5qjM
         xb3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwCn4sC7lD1zhAzByolc6Pe+em34zczg+wuqqoimXE91mZKozrHSN3wBtvCyHcl1ubZdVaOv3d3jdZhCG+@lists.linux.dev
X-Gm-Message-State: AFq9FYJRI2RunxeRnc0B/bvzDuVA3o5+bi+UPkdBLLs4ubdNQziSMYf9
	fVu4lx3zcZL7yI9702hnaWW5HZP6iHxzwgqrQ1MIMJ4oDMcfpDk1gBsQ
X-Gm-Gg: AYBFou2RbyhgIFl5y16HYLKp3SSkBEQgHk8RHfP0Bd1LAtuoFYbfbkKx9IIvBSUYmE2
	uOS3Yan8W6oJOM9A2R6eTiwEqBLGFtdT94yAez+7XRT000p8jvq/bL1W2x2ZsTwyUgkDC0byEGZ
	CprE51nSt2r04sPLaMau33MzFmd80kxFw5uwj4Sfv561cK/O9n9CI0+YLJYco+B127RrgmcJOAg
	yoExQJq+7lyhNXVv8tz42RZtimxYMBtqGCxwIg3lQNnC8F+J31STNq/wqTGIuUZcsgvXLGAVUUW
	yr43cnpH1ngFri/kDvB7IX28oATZyjxjSF1ia1UDRN4tPLnRPVArOgdy93OV/jDSsku22DihyUB
	XGBvT5amA2KM9iNpK4myiZtSrl7eK8PhH2mcq2Diu/5yCYoFLHTmyxlK3dVOTu7LasQLgsYCEw2
	LudyhC+kF7dQXGZvCqMfyd+dTcEitWm+REz9jMZr09PWmwopIeWOrtMtRoBc2kg66tSzkRKAoSn
	CuySgffihkWqB37qEPvDw1ovsjEREUI
X-Received: by 2002:adf:e00f:0:20b0:488:8384:c367 with SMTP id ffacd0b85a97d-48afe791c99mr265325f8f.12.1790707796878;
        Tue, 29 Sep 2026 11:49:56 -0700 (PDT)
Received: from fedora ([154.182.121.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6b8d1esm452569f8f.30.2026.09.29.11.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:49:56 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	error27@gmail.com,
	narcisaanamaria12@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH 2/3] staging: iio: accel: adis16203: add missing spi_device_id table
Date: Tue, 29 Sep 2026 21:48:59 +0300
Message-ID: <20260929184900.39515-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently relies on OF/DT matching but lacks an SPI device
ID table. This prevents module auto-loading on systems without device
tree support.

Add the spi_device_id table to resolve this and ensure the driver loads
properly across all supported platforms.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/accel/adis16203.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index eddb786d4747..905485fd556f 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -11,6 +11,7 @@
 #include <linux/iio/imu/adis.h>
 
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
 
@@ -292,12 +293,19 @@ static const struct of_device_id adis16203_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, adis16203_of_match);
 
+static const struct spi_device_id adis16203_id[] = {
+	{ "adis16203", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, adis16203_id);
+
 static struct spi_driver adis16203_driver = {
 	.driver = {
 		.name = "adis16203",
 		.of_match_table = adis16203_of_match,
 	},
 	.probe = adis16203_probe,
+	.id_table = adis16203_id,
 };
 module_spi_driver(adis16203_driver);
 
-- 
2.54.0

