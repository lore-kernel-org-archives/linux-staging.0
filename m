Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3269222568
	for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 18:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742122; cv=none; b=gxn8OtlsE8PrVI8BlJH9bu+yXq2EmRbO2f8a9kLdLltcoHgmT7GR089kaJyJ25ATjZ+FYt3gAaO29QkSYFbAHXdsRIDZ/NGROMDqQ7OXO6tGym4g2Ik7Uh12bR2LqKpbzP9gTCydJwquzcjzdSl6uZeMN+Kd/z1BseuEAOIC3c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742122; c=relaxed/simple;
	bh=m0ngbikheMR+1AzBKdPAopMMX2/FHuoyguBS+J0KTQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O3cmTumJrR+hvLZyp2rK7Ljldba6PL/EfarcJB7+XM42SGJuBiFBgQ4GsbqGt9hWD0pV6UhXrsXLLuzVV4Jgdk+k3Lmf6S18Ym+2RpIqzavDCOFYQaho2haa+jXjjGmp0YXDec1gjVZJJGnVMpR33H8OGnNJnNGRn3B8TZ3ojac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XF2PDoI+; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XF2PDoI+"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47690a4ec97so57560311cf.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 11:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742118; x=1745346918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97X8AfJzSEM+SJ3Sxi/vdcxd/nCQ6ViCFDXjOmjTF6E=;
        b=XF2PDoI+iQ88SDgW8cvQ6fyrysCzOt9bDYEq9TC8HxdDy94M7MUqz0tguOHDgS7UFo
         riRC2X95szuD8QmtVL6R894gbY5UHelopCQQxQqN/liig9eIdielna7HzumGvgYw11Yq
         BlDYkStYp1Wq01cCHM95YVqZVItptAvrVt1BI17VOOR4S1bnXd3m72Oet3B4RvQR6sT+
         Ep8PlOePmwDO920huMmxnwXtxy0XbBIPM3oFmyJAxbaqd576VbN1moQtNoBBKwm4pwrb
         8q1qOU2jQyvP1nNvRcFMw6AEZoTP1Ovt7A02c9Yg6qCPH1SBVCny5znYyw3+vcG7e11n
         WH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742118; x=1745346918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97X8AfJzSEM+SJ3Sxi/vdcxd/nCQ6ViCFDXjOmjTF6E=;
        b=PvkB5NstbCIYSFojX2Mbkbprw5+8qqdoAGCH9umfi4QLKGzeVaU/Ltn4ireT7PRTTR
         ZwxWP5uRqaGiVDIU3crvxtsnpc+bxTEbsJS+Zq3VoyBE01XXsLVxeqFicrB/Zi+3r7IN
         bRL6Hl70+qt2cHPRsN1aDvt/zeBzhtJ53uLWgtubrwDbXQMTGxKLBIAOcX77MUIXOoC3
         CrDni/zpoMI21DOJ9Q6KMporQy+YZVEFsHrcSKUV3qK2U1Pu7PcX3XK3ZULqQgkg64Ar
         bfgYUF6QEjLP+qT0NzykjgLVwVZAr/e35IMMBRuUq3Z+YYTQ4mbDb18+1RIkpt/vlTrj
         qKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVJ8QrXj4b8tWFNHC/WEw6flir1D0Xu0LG5XUGVD6VdCJL7AVxY8/Y1XeHnV81ByLLa3rxITG4jzfrCiWJ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp65Z9oh8xX13RZFDz7rs5TiHGOWGy7fpZuxqUzEagkPVsF9X9
	dVlNxZAymhUYkLkkUxtLxsuo9bxu2qrMrhIbcoqnDVL7oTIgMam9
X-Gm-Gg: ASbGncu8DGteDIdMUtcKIij6qgRaYL15GUOMOIQdbqlwAYJ1bg1CBpD/jDy+2hhHcz1
	HHw2GrTbepYY2s1Ylj0Uxk1smxLzi312i8HyxOTHlRKlpoL5nQdLTEZI5Kqx9bOkj2IGWzxZC+Y
	2Vx046lzns36ajqE/yu5ALY0QS3Y2xhBZeuDisfin4seNUG6a2UIsOEzhYfU8Z1zaYdO1zgTn1y
	QI39/73g/KuY6fRqAwxekpTz4HWfjYTCtgfsmTLbrOzW62U/k+fZx390glhawk/Ea1a48xoqFUC
	kdgHTmZhxy0UPdiVoCiSNGnVvyTYcMT/qJJBrh1DBVDm6AD2gPiMnAo=
X-Google-Smtp-Source: AGHT+IFDLnaf693CbcJqHa7n4MDj3QAjiwK9YeW53EEizGcBL+eM4f0LfY8bkzMCvFDj4Hto48V/uA==
X-Received: by 2002:a05:620a:2991:b0:7c7:a59b:4b07 with SMTP id af79cd13be357-7c91419a469mr70542485a.3.1744742118218;
        Tue, 15 Apr 2025 11:35:18 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0de11sm936533185a.101.2025.04.15.11.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:17 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org,
	stable@vger.kernel.org
Subject: [PATCH] iio: adc: Revoke valid channel for error path
Date: Tue, 15 Apr 2025 14:20:38 -0400
Message-ID: <20250415182038.523186-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the datasheet on page 9 under the channel selection table,
all devices (AD7816/7/8) are able to use the channel marked as 7. This
channel is used for diagnostic purposes by routing the internal 1.23V
bandgap source through the MUX to the input of the ADC.

Replace checking for string equality with checking for the same chip ID
to reduce time complexity.

Group invalid channels for all devices together because they are
processed the same way.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 6c14d7bcdd675..d880fe0257697 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -186,17 +186,12 @@ static ssize_t ad7816_store_channel(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (data > AD7816_CS_MAX && data != AD7816_CS_MASK) {
-		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for %s.\n",
-			data, indio_dev->name);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7818.\n", data);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0) {
+	if (data != AD7816_CS_MASK &&
+	    (data > AD7816_CS_MAX ||
+	    (chip->id == ID_AD7818 && data > 1) ||
+	    (chip->id == ID_AD7816 && data > 0))) {
 		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7816.\n", data);
+			"Invalid channel id %lu for %s.\n", data, indio_dev->name);
 		return -EINVAL;
 	}
 
-- 
2.43.0

