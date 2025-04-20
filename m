Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8217C68;
	Sun, 20 Apr 2025 01:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745113755; cv=none; b=AyUrJUCCs2LXWaByLRmJRAIQERy1PyGcSe5uT4vS38+2Syf47EXYstW8CR3ZRK4pLnTv018bJY+dlSPklOl4tWn3ZwP2xIC8UpssJebN685Dm/gHG9LmysifoK/VWoicxFkKZXOSdOa6zjl9dJdfJkUcYGsJS7SWXkfZLWRoMsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745113755; c=relaxed/simple;
	bh=nhjNiEws7JDfpSABnQRCrgaV/jVLhmHTd1ukZHOLh3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yq1udvBeo4I5UAJ2s0je4kMbWdfejkjs3F7TGNkcAvfu83Ilr/Wo0ducS3zZ60LtPUhuXiBgVl8VPcgnXad4xjUSbjnLchsQGEJ197BHMpgw496JG3l0xWq7B6MBpqEkylAv5UIwshCn0tZ++r4ikUq7njovEZ8AkVOisRDfFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2kvVm+l; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2kvVm+l"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so42228286d6.1;
        Sat, 19 Apr 2025 18:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745113752; x=1745718552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk0TUJMIcvb2/Yt9CvbEI4RZU5fYHN3893YNwk+aijI=;
        b=c2kvVm+lhjzsHhCBSCCB+qp6aIiZCO3pZrpKkssMpuwUIxmnL5ALbBJhcKQRWxn7HC
         6MB55dHszZYKGpAw9w9gNZehr4HuAab4chRNv+eQyWIwnkPPGcXEWktLGiULqeStG50K
         YG6U5i+h0CS6fXz3pl4jksq7oSN75Jn4MakuUkvK2ZJo55x94d1EWesb417Ot5jT3rQb
         7h+3eldIWOp77pz7tNIwQ8bOQ4o64GwdDtmBPg5j80wuuVDkYi5kWD6n0xCA8SWwznSY
         PeVRozwQ0lmKwlr24lvsRzkjk3lWQz0cxw5a3ZhH02kE+9xPf7NfL21qEVMbiK6PpEuK
         fIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745113752; x=1745718552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk0TUJMIcvb2/Yt9CvbEI4RZU5fYHN3893YNwk+aijI=;
        b=arSR7jjyN+ABRVv3JAjmD+/nPY4Hd8qlIONImnDJGbpepHCEZLYJlcPXmS7gu0HyrN
         DP+z9niKB0yPqu1mDCrR+uEXhEx9wvx6zjCOR11vi7dm8P1+ffcmF5IKWj941KRxufyy
         gDDKS/PFQ+Wf8Z25SPDeTS4mrTWjf8CmLNivSOxpBVh+wZwZT91ga73x3pufSxotAbzp
         Sgw+wUbTUIHSPkQxyL3eYgep9YAkMgLaV2vHTA8K7pqfAOGDq2ojf+7YH+DcFtN9Bz/x
         MCun8PZaLVefhnc+KCs9HyKjDAOzzQQBtBqgg2FFDkCgld+jlCTUAqrvafy6aTVmNVmx
         6Fnw==
X-Forwarded-Encrypted: i=1; AJvYcCUW2dXRJxD5hz3lg+HtqttrhPofX4DWjbMjCqGwp8Di88DU/xk6CtUqGn6bfaRaghwtsmExZWJnR+hMoDe7Pg==@lists.linux.dev, AJvYcCVElvKCHAOiYn3gj9LeoJfUwTElvg3wRGMIGmCkf/u2KUthjjuT7YIjv3F9kknbWkeDcxiu2T6oPdfZOwFMxPAq1FCMmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yypt26LZHLXFaVmG9zpryMWM29XL2inICnkGWzguuGNB9j3CpnN
	jh6URSxdyL/oGGXvo83eg1oUqtaTqKUCBYFGZDhDa1dFr5Nd4SZs
X-Gm-Gg: ASbGncsAXfeMHwaSIbAT8OxRN6f0o8qxciOEWUgIZRghYwOabSCw4enPFC33+PMNSEo
	eOZ87TmavTespBAed779uiXyHHYHdaOEs5ovGLrOiKBNp2uYTmZfvEiA27tg5MPbJECdJiua5eI
	3TruP20UqU5ekZd8/ZVzpMuM0w6yGJetPF9tst5Yr+5TRz744qNMJouxNpfp9nfvg+MQAUfELeN
	pdgtczGiHYhaeqSirDVkfhMyF790fYgmWMIHItZbs4c/geUWnwgbP0JMU9CAy1r427rkvDSyub1
	uMlVToAQFDp1PZWCJjcVbv7U3RAbhhQ+GC5cLfkXgpvbA8UNi1KVFXUDPaN9En/Q0W79tYqfLT0
	ro15fKHNarGAu3/H7VXA=
X-Google-Smtp-Source: AGHT+IFRsCe5B3DOeaXRGR7WUM1HNURo5facIOltw+5BM63Sm6+YsXazg+DParofxt0X8IJh+8vDZg==
X-Received: by 2002:a05:6214:238e:b0:6e4:5317:64a0 with SMTP id 6a1803df08f44-6f2c2716ceemr122000666d6.13.1745113752465;
        Sat, 19 Apr 2025 18:49:12 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1283sm27583846d6.23.2025.04.19.18.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 18:49:12 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v5 1/5] staging: iio: adc: ad7816: Allow channel 7 for all devices
Date: Sat, 19 Apr 2025 21:49:06 -0400
Message-ID: <20250420014910.849934-2-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420014910.849934-1-gshahrouzi@gmail.com>
References: <20250420014910.849934-1-gshahrouzi@gmail.com>
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

Modify the channel validation logic to permit channel 7 for all
supported device types.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 6c14d7bcdd675..a44b0c8c82b12 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -190,11 +190,11 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for %s.\n",
 			data, indio_dev->name);
 		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1) {
+	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1 && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev,
 			"Invalid channel id %lu for ad7818.\n", data);
 		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0) {
+	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0 && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev,
 			"Invalid channel id %lu for ad7816.\n", data);
 		return -EINVAL;
-- 
2.43.0

