Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45703815CD
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774045476; cv=none; b=Y4VMTYqJBqym3WBPcG5Nr0KInSudMhRWhX9qFkhvRXvAeQNAtFiTqi4xSFgcT2zh8mJHpSyojpgQaYAleuORipkDKs6DK6Uaxtu8bufd3HQHtUA5j8WTwRoN64tb+XTqHHzqdIuM2SStkPZZDIe0WFd7B1mhRZGfimG7bYkR1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774045476; c=relaxed/simple;
	bh=24s4xN6YFjoYXIk8uTUy5ywo7jxmwS+0fXPQrONB34k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CqbQChsblnvWShZQjgIuKjLBAZsJDPMNgaVyFMeFWujDnn/Jz28u+PVPpzBgcyStfDA4uFe6bVU4OrGKXzyiSUITXFzuHgj0NQE9u0mqxPwZTBT5Dh5lclFXOXEJhED8R8WhZJspbvwVDGoIjjg6p5mWV5DR6kDUu4yJaHcwDh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Si35RGyL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si35RGyL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486ff201041so8762025e9.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 15:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774045473; x=1774650273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=besVw0Q61aUOkSVGtpMPG9G/0SuwwqrtJ6yLz21HoDQ=;
        b=Si35RGyLS6KudABfhzz4DibrfdUjfP6s/X7lOLNE4avLesgGlz7n3ZjaYaWfE0ADki
         hYjfnGOpf9utkTLs8U0iiBQsMfAQTDc9cyZfzgDWulKxe+lIfgpjEWQ6kcflvasXUiT9
         0AMvU/bVvMKCx1CspAhCGKX4HUz/t5SNHkQhADyeYgJeiUHe0sDFaZtFSsxk/1XkQNNv
         GFc7XrkSvF0eevmAWH1EfcdbCu1Iej2jLFXoeknet/etp5V+pfakfdTPlc811hwU9F7K
         uzdgZ/YXcg/eU8L44HrOEnlerXxVdgkm7nLc1qqUk/qr61hhaCwVgKSTxOQ/zYFnPFrF
         ITZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774045473; x=1774650273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=besVw0Q61aUOkSVGtpMPG9G/0SuwwqrtJ6yLz21HoDQ=;
        b=qRQT+mnioJ4Smxj4c14fotm8QNGnydQQ9TM7tE+J6gBPoDCGgKfnn6PLZvkT1sa7j0
         E2N/ACYMSPbQiqkpT06fWvBh8FbsIe8ItFeY0zoFCaKoWCVzUYp4wbfK9HIWokpGi0OI
         3PYvvtEm1gMOV3ruLd9mxEiKszuzl0RAsaJv+eWhKM56QXlWhYOeDNQIWkN4QSFONkX1
         GmAdw/8VnjR/fQBB8TLtXiUY6StdtSaMCvQ3vyEKZBVdQ9Hm3XZeyHSiywBl120awu8p
         M5th0nnr/2CbsiJ6oJ91dNj5ICuXG0wTXb74sf/XAn+uBPf9bbket/TktbG4WDO3PrA+
         UDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM8sLC6eny2kn59dxzPx+eyGdeROnN6ovrMYKRgWmIMTzsm+Ucmt1jQmi5BFZHUh8ufk/bmIF+yRsPNplj@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz+CF5VX6TqPj7gQi+xPcruB/lqA1tpQePuflux9fhCzxAlSdp
	xgvtyi8pkmGVpE34WE9KylQy5IXQKD7Q091GulyCu2cIXaAB0AA8DsHZ
X-Gm-Gg: ATEYQzyWig8/SNB8SPoeKr9Q4ox3uSVJ5iQMl9LT5Q+6YYCnayaDQruSVe2ZhxI0o2g
	0qqZA2ySagtKhU75lEu/8MCNZ/zTZDzd0qdh8ECiVVVf2WlvsN5ZdCuNsaKybPAhjXe/XWL7Z/p
	Rf/B7X71Q6UpH/IIn/XjV6MqIwbFOmDcNgXJI6oiICmEEe3YR/OO5G5J+Fxk+c9WIxEWQGJ03Ze
	rh5lshGiYYpE+euh87bOFTFQ/fhY3xLyN/2C53uFAVd0wKQzw0sJR5tv95pB2BS0FAe3QVCoCUl
	iN2OXhdAq/YFzVOF9Wscr2r7MZeZXAiB7KT9i56zwmhb8JAE8tVHai6PSsEF2Yrk/SZdDkoklO+
	BfPuQsc2SmWvVzf2s6D6HR6FxHTNldpNl66dzrX+1XMpCzbNeMvuL6B/s5Dq6KPxPntInr91MFR
	0iLPfxqHnrpf+Q+TeUMzzUCGmw5IhI50cwRzNkGYUloeSVSctN9q8yVDA2SA==
X-Received: by 2002:a05:600c:4e8e:b0:483:c35d:3659 with SMTP id 5b1f17b1804b1-486fee04a48mr64997975e9.18.1774045472933;
        Fri, 20 Mar 2026 15:24:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:bc11:6b0a:79ed:3d9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae016sm9290237f8f.4.2026.03.20.15.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 15:24:32 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: iio: ad9834: use sysfs_emit() and simplify show functions
Date: Fri, 20 Mar 2026 22:24:24 +0000
Message-Id: <20260320222424.53294-4-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260320222424.53294-1-grondon@gmail.com>
References: <20260319225719.73587-1-grondon@gmail.com>
 <20260320222424.53294-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in sysfs attribute show functions.
sysfs_emit() is the preferred API for sysfs callbacks as it is aware
of the PAGE_SIZE buffer limit.

Also simplify the wavetype_available show functions by removing
the intermediate string variable and returning directly from each
branch.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index d339d5e8e..bdb2580e2 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -281,16 +281,12 @@ ssize_t ad9834_show_out0_wavetype_available(struct device *dev,
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad9834_state *st = iio_priv(indio_dev);
-	char *str;
 
 	if (st->devid == ID_AD9833 || st->devid == ID_AD9837)
-		str = "sine triangle square";
-	else if (st->control & AD9834_OPBITEN)
-		str = "sine";
-	else
-		str = "sine triangle";
-
-	return sprintf(buf, "%s\n", str);
+		return sysfs_emit(buf, "sine triangle square\n");
+	if (st->control & AD9834_OPBITEN)
+		return sysfs_emit(buf, "sine\n");
+	return sysfs_emit(buf, "sine triangle\n");
 }
 
 static IIO_DEVICE_ATTR(out_altvoltage0_out0_wavetype_available, 0444,
@@ -303,14 +299,10 @@ ssize_t ad9834_show_out1_wavetype_available(struct device *dev,
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad9834_state *st = iio_priv(indio_dev);
-	char *str;
 
 	if (st->control & AD9834_MODE)
-		str = "";
-	else
-		str = "square";
-
-	return sprintf(buf, "%s\n", str);
+		return sysfs_emit(buf, "\n");
+	return sysfs_emit(buf, "square\n");
 }
 
 static IIO_DEVICE_ATTR(out_altvoltage0_out1_wavetype_available, 0444,
-- 
2.33.0

