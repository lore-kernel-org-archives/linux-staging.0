Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BE834D38B
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162525; cv=none; b=b7uArtYwZrdb5l83nTYGaMZTe1FOXxzsqfK0+fpr8noilboCUqZTU+zwk6pr+CVyLOg3dIyh+DyTPQydHzMiZp9xerFVgFgtl//y2t18lo4qlSrBJB1hVO2CDrmyCLoNfbPu2fZWdoo3dG6XNT8SUItuN29y/K3i69wmU49be4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162525; c=relaxed/simple;
	bh=xj2N+hvunO9H/qokpmL+Uj1ED+5NNhqPQcO+Sny1sow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9WfgRUxuFfKdRS3l1e3UZ8lyek2NqtJNrw5bgvr41wmcrpPFeVfLTEt5m1h1dHGN63XmbA59YvAxOo+vEmZHnXdDTAERyG6UR4XUtI/Ng6aTMNF31uwPZPtISfX/phvWrVaVIZVSohnroHK7KagcBgAcb7ddplQ5zxZt/IBSL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5LS7ai+; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5LS7ai+"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39666c7c910so1043091fa.2
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162523; x=1780767323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/CEDkzzLvL1DAe0lGDe9mPko0qZhdDrWYtsQ4KepKeg=;
        b=R5LS7ai+vxChFHq6FFdoCEQv1H+ugOUSXnEO/Dx9/LHVYG5tZQtr2tE0XaSEx+BPz4
         RpdBht4IAqAqXoh1qPjR/f9+Q3e5eroGQNPlhOiQ/x/Fsl2uR53wzkyikB+w8+Q71RC6
         IjPk6kBB+KNc+OuDywvkENTOTzi2RSIXZvjbmyP2s3mMSVuJj4AURWnbmXuCsMfwNi3T
         jcHX3Ic7LHJ3QjUVVSRuJLWnSpjzMijUetzzdzaU8cWgxMnrnFd2kF7ZmLQIQQqiMwLh
         iRcytVAmPkHdoWg5G1lcb3OdSrQud156CtfjpvPjkHZvL+knel/GP0sD40kifBTypWs7
         GiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162523; x=1780767323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CEDkzzLvL1DAe0lGDe9mPko0qZhdDrWYtsQ4KepKeg=;
        b=lCbd5FoYyU00f38KcxksN0EhM1IlVG3pmd6XpvZNgxtg/EV7j2JmiIj5Cjuv/KfNfh
         k1OLqwoSgzG3UIkPU07DAjuqStugS3MBOomscMYVA8LcjV0kY9N42gyccK6mpOe4KCTv
         bovTFyUNhBPYyswpI6F4tvyY7gyBPDKJJNQ1wPkeh628vHiTCeT4YzLeLUx1I94Rnqg/
         TY2YF6Ttfg/41s7dYZeuFCN6uLuT7MmKLo5c2lPH/3FPhJeTiDHHEBlZZt6sQlxoVVdo
         0XrOHE7+uri4pASXj/XRagzunlAn6+qEBzz7Qby0AUOx6/KfJqBz6U2RMkWKkL3PBjLj
         +aiA==
X-Forwarded-Encrypted: i=1; AFNElJ8YUJwcY9GprJdj8MmKhOP+dT8/qDuwvNOwBu7cr8YJpR77r1ZmKdypJRNNpnAfSdpL/YVOEWbrz9/9OOYj@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyf2G8f4syCld0LyraX2BwI2Gx1LZpOJUcVIFFCRfqRFMgXuWD
	8nvqs0kbliwr6VfYHPxVeRWTgQhs5l1hyowtAvmzverBrgket8vuZTd1
X-Gm-Gg: Acq92OEbCpIvOh9JcjIu8xlh/ME2zoZypfK0JOpg2hQOasFeT3RGlPjfM5HRzXnhx9P
	iJaq5AJ47jT8JMHIID+aVhURVWdAfhtXJpMZvrORbP0kFP+zOmxtYzPwlT4ifRpcBzI4dVGuR2M
	DRP+7xEYe1paQtStuJWQtzferjWiGw7EheK66u/zJZl5F4SgPbdyUdrhOZCgTxEovfbHSV9Ttq6
	mmcxcEvOptkncYVc25RhOP4xhOBPd2CM1w7jrZxLa9mA0A9OqGyQmIjwrP0TlgvS/cOwrSpNi77
	ZacRvo12NHXQ3LjxwpTV4svPH4FFzr3E3F8gzOwdZOJ8+QnX9wjcsMVE1AA6i3cyeljb9Lm1nRS
	j9lnr44HgZKTlMyQDZjkeFcwlPovXyVpkc7N68lPDvLDmpDeIF/t3S7Z6Hss6Co/g94wl1R7H5D
	8SJkmvAzJLFUsTFfWSnB1ISNUjxH8uL7IzzE74jbWlbF8f7A==
X-Received: by 2002:a05:6512:3f10:b0:5aa:59e8:3313 with SMTP id 2adb3069b0e04-5aa60a35218mr649131e87.8.1780162522382;
        Sat, 30 May 2026 10:35:22 -0700 (PDT)
Received: from localhost ([5.124.164.24])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b072066sm1128982e87.22.2026.05.30.10.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:21 -0700 (PDT)
From: Taha Narimani <tahanarimani3443@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org (open list:STAGING - INDUSTRIAL IO),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Taha Narimani <tahanarimani3443@gmail.com>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: iio: adc: ad7816: drop busy pin requirement for ad7816
Date: Sat, 30 May 2026 17:35:12 +0000
Message-ID: <20260530173514.56640-1-tahanarimani3443@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the AD7816/7/8 datasheet, the AD7816 is an 8-pin device
and does not possess a BUSY pin. The BUSY pin is exclusive to the
16-pin AD7817.

The driver previously requested a 'busy' GPIO unconditionally for both
the AD7816 and AD7817. If a device tree correctly modeled the hardware
by omitting the busy-gpios property for the AD7816, devm_gpiod_get()
would return -ENOENT and cause the probe to fail.

Fix this by restricting the busy GPIO request strictly to the AD7817.

Signed-off-by: Taha Narimani <tahanarimani3443@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 988eee3..0eac484 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -84,7 +84,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 		gpiod_set_value(chip->convert_pin, 1);
 	}
 
-if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
+	if (chip->id == ID_AD7817) {
 		while (gpiod_get_value(chip->busy_pin))
 			cpu_relax();
 	}
@@ -380,7 +380,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 			ret);
 		return ret;
 	}
-	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
+	if (chip->id == ID_AD7817) {
 		chip->busy_pin = devm_gpiod_get(&spi_dev->dev, "busy",
 						GPIOD_IN);
 		if (IS_ERR(chip->busy_pin)) {
-- 
2.53.0

