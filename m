Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795593C6616
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941934; cv=none; b=NI1ZfDQd+QI+llFfEsGihkC0NiMfLXGgoqtrLy4/RV5pTiEA5+DP+tbB8MllVivpeUuq5pksp844va7yxV0kCeNanoVr7PRNNoBcqjTHC2dlaNt0ivGQgDPwUCTgq7d6YjImirvZu7A+IbWKlkJBj+1u9moPapdXpWEb1Nnenq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941934; c=relaxed/simple;
	bh=GnqjuQY2SpYNpEiu023jp+jx3wPKs2w4MJgRFZGBcBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q8QJAGmRGpCwFPX0MszEnYkaDXgL7xBFrWSzuIBbKoEZiUiJvSjm3Vo0uf4U7w+vAje23GQi2JLonJro1MMQCN/9VIGGUWA/9ZHCnDuVyLngB23UhNNlxqsccUQxPN77B8Fv0vqs8ha2DKs+3p4ezKQ4s+3h7y12qj0FOELIKaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhQRmyPa; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhQRmyPa"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2b256a4c6b5so9839185ad.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774941931; x=1775546731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUTK122ypo+0e+etGwYyhErGcBcCbI2DEOZyVvoyYr8=;
        b=ZhQRmyPaJ3os0tH1RQFB19rdtGnEpH65D/0JHy7uMGFqTAkOhtBxWn6uUrFwmvDRUu
         HqgMIoKXcDrIF99JPfWjhHVjW7oktJloZ1fZYCzGoqaZm+rq9Cy18+8Nx2+iz8IXhhX2
         Cxa6MROYpd/QJ5v/IESIxl88ZPuhfdHScBBJONbB8qRVGuMNVMG7lH10SWJmlnG0xuf0
         SDpU821nvwT44r2eYmkld30biZGS2UKngKXA2gx5eN5cK9eplonMcIVKg9ObJ87enXHa
         yfgr6KzzebxZkIEv2ci1LRwi4h7lLlqvg4lzSmnuuSoySUOhd5T4WdItXXHC7EDiCNUX
         Sj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941931; x=1775546731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UUTK122ypo+0e+etGwYyhErGcBcCbI2DEOZyVvoyYr8=;
        b=G67WPJunA/b7S78U1xZzCxBcqw9ITdCVB2MPQjzsdG3KK5U9foCdm8pkahpdxyxg36
         FrP9NPkcngE+O0oeRJA6g7IXOAf7AI6CuxeDXy6Oc++ldZUNb6jwmlVcT2bHmnRS3Yhb
         UTZxdAXz6jLtXjouurvBs2Su9XqFHMrUEtuug/qqxwmkmDueLaiewsZS90zTz+Fql2Gd
         KQUopHxvXNTNK04RtQs2T8pQ6r69I1E+RMslqO6l359YEdA5UkpoTLFJ95k/zhMOIFr8
         ZnRJqQ14PWZaCby+AeoFbeHf/Qz/6TbndR53+X4ygluCTNv2VUhDTe74ro8t7nFDzyWL
         iGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrgYm6oiWJrFA1SrHekcT4SWGY5evN0lzbq4vDgpiepvJiUrP2ptv0ysEVCXLbTBlrauvOk07JD/uTVHpJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzA1NgFLfjDD4Z8kZXXD/z9Gc2Er3Ib5hDqDInOoMeWcbeHCbVT
	k1K1T5VvIxNCDODFNgncZpTSyf3KNOcL73WrqXCwH3ll3+Yo86tGMFbZ
X-Gm-Gg: ATEYQzxx9Coxpszrg9lQwhDeGa/407OwFxo/EShWs+JTHfJF1hvhfuV8WwJ8Ddznl1P
	naE+xRlN1tou/1NeNZtXYMD2MclBXmgO1/nmC42JQk8iBbzE3AKDLvnE6dYM0pTvE/5rTob/QI0
	FaW2i8Pt7Kdw7NoqBGbQL2XOZZSWQA5vzXVuTi7BKPKtsTAKCc/8P5/HEPoCh/j4QbpFinbUuTo
	wcYxtNggZjCJ+HerCNz6MjnftI9jFICO5NnvJkZNFjE0H8DiUmmS4syDBAMODkKyPYoGgbITRTa
	iTP/orji7hWUVPalOIQUpsbE/QmVFRbN9RDgj9Ba53SgOVmcRZ58OREKV0Knrecm310qcf2GPh4
	A9z9o986QPmA6W13xylWEo/gYNyWvi+Z124HdWbA+TBvZ4+fxXqzVPN3g0jdm8F6FbmW9BIR+wT
	1Pvi3Uo9caKidBFvlTfJkhRF1qRImfKZGz+drWz/Y=
X-Received: by 2002:a17:902:cf0b:b0:2b0:c90f:449c with SMTP id d9443c01a7336-2b0cdc22e03mr152495895ad.9.1774941930836;
        Tue, 31 Mar 2026 00:25:30 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:5412:6527:d590:8704:ff8:2ffd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642956sm109272495ad.6.2026.03.31.00.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:25:30 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v4 2/4] staging: iio: adc: ad7816: use sysfs_match_string() for mode selection
Date: Tue, 31 Mar 2026 13:24:51 +0600
Message-Id: <20260331072453.6530-3-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331072453.6530-1-mdmahmudulhasan1511@gmail.com>
References: <20260331072453.6530-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual strcmp() logic with sysfs_match_string() to simplify
the mode selection process. This reduces boilerplate code and
leverages standard kernel helper functions for string matching.

Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 9a2f60b97..253ef2262 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -59,6 +59,11 @@ enum ad7816_type {
 	ID_AD7818,
 };
 
+static const char * const ad7816_modes[] = {
+	[AD7816_FULL] = "full",
+	[AD7816_PD] = "power-save",
+};
+
 /*
  * ad7816 data access by SPI
  */
@@ -136,14 +141,14 @@ static ssize_t ad7816_store_mode(struct device *dev,
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	int ret;
 
-	if (strcmp(buf, "full") == 0) {
-		gpiod_set_value(chip->rdwr_pin, 1);
-		chip->mode = AD7816_FULL;
-	} else {
-		gpiod_set_value(chip->rdwr_pin, 0);
-		chip->mode = AD7816_PD;
-	}
+	ret = sysfs_match_string(ad7816_modes, buf);
+	if (ret < 0)
+		return ret;
+
+	chip->mode = ret;
+	gpiod_set_value(chip->rdwr_pin, ret == AD7816_FULL);
 
 	return len;
 }
-- 
2.34.1

