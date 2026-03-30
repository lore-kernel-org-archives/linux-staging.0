Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DFA3DE442
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892471; cv=none; b=cMtoixZhJ7SOmOLQxEfPGxmwGoR9XfHCLDA5W5Qytqp4APwH4c5YYBEycSuwCc3qJ/PtJYgZqzRZzzGXOtLVjOaGvh+AyxMpd7vpU/ePJ8NEf/Kli7gxsSpgcfXLSvDZkbdrmELii8WiRJO1n756sD+rEQhhxc/1ohLnlzrQsLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892471; c=relaxed/simple;
	bh=od+CttlPpI9/Mh/jJSm8FrUoGXVeBS2nvt98p6hrArk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cwdWMgbiu9XXgCRXzSd1FZ4iekKBxgfmS6BvqJezCdIUAbrDnm3zGVR6G0TcU7KSh56gMqkpsifjesSS0+RaoRMYNpRHW1tj/A2bBO12wOuSc7IUSDb5n9pOQZq4ow0FJ/q49G3++lk2jWxkz7JrbSBZ3XLSwFlGdeqkzzDBfho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFK/+whb; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFK/+whb"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c76864f4e58so1385768a12.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774892470; x=1775497270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br6i/M290AXSW7sbMlbOqqhuMEb0TR9+xezMJ45NLio=;
        b=ZFK/+whbCUn1t7KM9B81i98OqXr2S+xv5EGvuP3AJtEhrLK5RLpRxcQB8LjHbDWpc+
         YhH53zG9rI4GOIfW6u/y+PVyXp9YOXaT4V3VgoEZ8R5C9nUCwP6aw8XEE6gEdzUIME2U
         gzt4AcMayexVMkuvYaL51AM7kg0pgUhBGWUvop3IAfuZbQuj9gsLMTYV+DADwt2iCfkD
         yw6aUB8XkXmWEMj4haPA7QwhI8/uzTLfsy6UERFsB6DEf/zUTVkntjg1WgWBTuhZygxJ
         l7itLEyEvcVJktZAOGUqoCMAYMsct0cx6k46U8RIfx/yaK7i6sJpM0olJmjDcD5crGlG
         yi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774892470; x=1775497270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Br6i/M290AXSW7sbMlbOqqhuMEb0TR9+xezMJ45NLio=;
        b=qJ1kfNcxwsD1MTfLAW8HI68wpeZApsv6+ucf+hZkRsdEQ+VsJ4wf+6BLLIgymz3WaE
         JSaThTnIGjgkapVhZcMiHQMgNj2fNvZ6r+qWeMFMYEAxDzQULW6afQ03FcVu26Qm91zS
         u2eH7cSnZVjOVtAxv8agrG9cpsK0lb0pjdYm/55vop851D3zfL/Z2GwafM+0N/QehkKA
         c2OS9YV39qTBq6nzorSbvjcwvjpadiTjzBnHU2V3Y7xgzUARK3B6y1h4b0V0v01oWiMl
         bnvrPKNP+QmY4kGF7CkaGHag+M180hLhsdzHUV3FCkZbjWJvSHY7jrPsli5AqP4E3aga
         mawg==
X-Forwarded-Encrypted: i=1; AJvYcCVRWVAOaM8vJ3FU7AEaLNuNGHWDWeuLGrOJpoZ9zHCsFaBKIGER1MfbX5bIo+Ep+FPTRMrKGGMp10+nsIPY@lists.linux.dev
X-Gm-Message-State: AOJu0YxntyONOOKemWRGnNmCJvGzDB1EgCWPna7Hkn/MiS/74KaIGTcc
	tJEE3ysmNZ4qI3cmBKlJG+QJnt94ERyH3dfeeWmZM8U3u9Fw20i7OBhI
X-Gm-Gg: ATEYQzypPHVhm/y1NYOlFv+ogmjqMXjQvAONKGhiXXbQ+NEeWqg7hsxJohQE92Z8qY1
	yTCxBol5CWk6HDPI0e6M9onP/SGZgL4MprZgeH6O7G0YAsKTVM1/ixphe43b32jptn2erv3Lkwg
	pmhYuujgOxjUenQW6h0ZgsUQpF7++EB0gNZIz+++cXNbt1yJOK34LvgfRWN+agBC+Y8jWADVoHn
	/8korfwXeBTArGiCqyii/DR6O2DdeSclk3mxUJVFkPl4EQkcDcmircvohiBBOa/9T6eNOwj+bam
	d/nWEs7pTWghpPgv60V0ECui+X2zcujzI/z55+Wie41FScAr9s163UlNygMl1m+TG01gT/3DJzk
	41RPU7hl6mTISI08Hk+6hJfCLcd0g/RxcOlbruqo949WiQRYMsfzyL5dHmKRQkIFX//KEM98qHl
	or+RpRhZC2xhGdcAMWTRe9Z9onkYc+wcsBnqONNvZ3aD57FJE8aNA=
X-Received: by 2002:a05:6a21:9987:b0:39c:113:14a4 with SMTP id adf61e73a8af0-39c87ae49e2mr13191508637.50.1774892469601;
        Mon, 30 Mar 2026 10:41:09 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm7844052b3a.50.2026.03.30.10.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:41:09 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v2 2/4] staging: iio: adc: ad7816: use sysfs_match_string() for mode selection
Date: Mon, 30 Mar 2026 23:40:22 +0600
Message-Id: <20260330174024.20712-3-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330174024.20712-1-mdmahmudulhasan1511@gmail.com>
References: <20260330174024.20712-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/iio/adc/ad7816.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 5acfceb90..f9a0a5a69 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -58,6 +58,11 @@ enum ad7816_type {
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
@@ -135,14 +140,14 @@ static ssize_t ad7816_store_mode(struct device *dev,
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

