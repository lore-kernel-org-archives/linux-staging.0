Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1193E8C5E
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173164; cv=none; b=B2VacqM4/016uwJjJiT7JUmUIyuy8FUn016GwbDDwNXNJc/vkWnTj493001IW7QRn1BBk7jCu81yOdMKS27xWHV0g5J9HxpmZlRLeR68aFLaB80l3Po6+pTW0F20zA4LvdZwTVubmS2xvfaZXBchZ3U0Te+tCxnITzNSISDWMZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173164; c=relaxed/simple;
	bh=NmQadLrlb35menLfcI7cw9Gbg/x58iEO/f6P/uOoiYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sOkS1ffgzeXmlNs1D2/wr9TV4z76lxPIL8GDObAgokQ1Dhgh03naRRSpABmNXv3np/MFKHthq/nl2jychswkm8YnHzyoV1t2Kp5LUP/2CTDlLLaOtDUi5VKm+sAVM+7h3WGM8HZ8XZe/GMWsrxCz+qGqdr8RxsILA1hRQpcyoQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp67glKM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp67glKM"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-829928e512aso3174870b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173163; x=1773777963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=;
        b=Kp67glKMZfuVbnvgTwl4Lu1k4crx//pQfFIgfxfImn4+atohV6M6STHgdHab2qMA0J
         IBE5bugmGJqm50ioLiyBO++LdpfKi/wuf9IKCRZRYuZyI0HPjmTFA2SdNYnqYjJr+vja
         R3bL55LwC/Ss4fnNg7ASHzMmbpN1ftQIEtZh6O1YfRcFlZw2DD7CijCH8H55JBvxetBQ
         KipHzROD07PrGeM/akhaDE3L0/vaPZmAtZZEh8RlZ49K6WFc2cl4wDx97RuU6oYV2mJG
         7r+8S6DWJoIbtFFdYghgPRiyZD1msGOoe1C3pKXrZozLrliRnJcHCHNlF06fxZVc47vz
         7ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173163; x=1773777963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=;
        b=lI+N7hyCEUQvlYQYppWExIB6TtgVrbSSicjjpe+aNx868bE0jkLunfCJpj0yqzUJYz
         IXYZC8+2fAfV9O00u7JEHeoORNLIGwCtvYnRzspXod/Bv+vI+wGrbuKfGXQpUH1jn8+k
         8m6K6HslL4SjEIHpjCsmK0wqTF2FrJc5effRcDorfb+lbb+sQSpPvQPwjR3C4odCWJBe
         hPjdObHGlbcgCLMprzcZoFTdCalHS2exR56RI4NZ+LF29U0uzX3OYkNZK+yfNV44fCj7
         031opXyDYl4hiDQyn4GDVkFF5pJc9D3o4Z40K1pfboJZYQR0hPMsAhJG08eCzLyr9sXh
         XLiA==
X-Forwarded-Encrypted: i=1; AJvYcCWeGosYXA0H5YYBz37k6DDqWSn6wfR33EkSahu3wUUVZT2Z70bmMxrM3PNeCKMrYz17M1ZqXpuTrDV8/lFT@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+OhNsJw6eIre9DPxeshDIzyImP10vqM3e4zMwl8zez5ce6rnR
	XZGQM5pzNfiR1prFZbQMgXIywDX5G/yExEr1ZXdorC44sP8YhJDCHVos
X-Gm-Gg: ATEYQzx/BsxZaWVZJsxjlrIX0v25C82U0wpAiE3x9VtGdALnsFVqsetP92FN2mVJWva
	qMcAXuaFnTfb9rnmifv9KKBBpO9Hx/xo37Ldw+jX6pTGD/1NwWZE9dPCxgWDaXwJbbSuru7VHGX
	SWEg1RH7lszNM5nVGYBDaERxoirYo6D7lAm4dy9Jh4mtTSQFz3shOPpWUwrTXVwFozeRuwb0HBO
	1wTyvfMkLrCvX+32p+ThxvYDliF0wEU7rshzafaBLVioAzN9iSDIbKZCzst/EXgOj7izizS5ELj
	wlP21MDEfXMwELX1tVNUFfbmE1lZ8BB6HE8dX8S30ORVe+GbUBCt+ncgyhXLPko9FIJDGof1RAO
	FJYDOcBd9XQruaw6QtUm6s3M0cLHYVKpsb3kSlbmQZ43MElxI2rm2uJw7xWreDRfXJRLSNBslYv
	9uBF2oBb60EIeoIWwFsKcci1tNSIkRX8LX9+TIQHK8gw8+MFmF
X-Received: by 2002:a05:6a00:3696:b0:81f:4a06:6f5 with SMTP id d2e1a72fcca58-829f6e71c7bmr133338b3a.4.1773173162881;
        Tue, 10 Mar 2026 13:06:02 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:02 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:09 +0530
Message-Id: <20260310200513.2162018-4-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/iio/common/st_sensors/st_sensors_core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
index dac593be5695..f641b62e692b 100644
--- a/drivers/iio/common/st_sensors/st_sensors_core.c
+++ b/drivers/iio/common/st_sensors/st_sensors_core.c
@@ -501,14 +501,14 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
 
 	byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
 					ch->scan_type.shift, 8);
-	outdata = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
+	u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
 	if (!outdata)
 		return -ENOMEM;
 
 	err = regmap_bulk_read(sdata->regmap, ch->address,
 			       outdata, byte_for_channel);
 	if (err < 0)
-		goto st_sensors_free_memory;
+		return err;
 
 	if (byte_for_channel == 1)
 		*data = (s8)*outdata;
@@ -517,9 +517,6 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
 	else if (byte_for_channel == 3)
 		*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
 
-st_sensors_free_memory:
-	kfree(outdata);
-
 	return err;
 }
 
-- 
2.34.1

