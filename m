Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF947347BC5
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886472; cv=none; b=jEXSnGun7ipccCo9ZfWfu16I2cg/hyYP92qNtpxmm2cGXRxWKauCO8JGhuI3bR0+BU2YdIurWsV3xVBuVnUCGY4a/2wse2JUpuWUX7oKxhnDHHQa0tB7eO2I4GaQbM5it5xE5xurZxbXQ4a/upcv8NxVcM84tGeo1r7+e/pnu7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886472; c=relaxed/simple;
	bh=ulzqJ0A64mCZb6Tz8JZ5fB2Djo7jXZEPXe3GaCWOvpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEglxnU3rEcSMx9CMDN+JMKYlYIBAfrXCm4ipTO8PTJE005vYbxrX66xECfHuIdvUr+PTVmP2wYvRlPo5JMJZLRINkP/BI/q4k/umXsbbZogBH0Um+0OXt+QVY4M9sMzzM71U1nxuWHwH6QD5Ylo7+G9fJVYkFKE6nCMd9K4AJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCdk8o5l; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCdk8o5l"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso1476895a12.1
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 02:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777886470; x=1778491270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGuDlYG3EUJIcPBUufNdlUwETr2b6TX7eTkemyWIaqw=;
        b=TCdk8o5l9EFIelTeGkWe9TFZHaHOoCvszWdTvdCgaLKIpwpnuFKqEc/gnELaXO1rzW
         urocZqmLkBvEG0BVJM/0S1vOeuHi0Gb22u/z53xWOEwoS4iZpmOw3qrzWvNbVfku/w8G
         1W1qoyUl4VWhdGOqsFelnUmltIVfOdHi2zGNRn02dCpU/G49imaRTe/SrccZSu8EMKhl
         qMPTIHPlBhLRLtaLaDSQaijWnNrVFl41ldVeGciKC2xo1Lm2a6hevjzMt0WAfAjYXuj/
         SYyasDB0gCUf3NwSU3+hE7cYFiTjlks39iipBVPkQqtVIXsx+w0jA7rXc8hEwVeXunsx
         H0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886470; x=1778491270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cGuDlYG3EUJIcPBUufNdlUwETr2b6TX7eTkemyWIaqw=;
        b=Cn/bfh6GFYkdt9MQUVEFhG+xWT15MD+pxZ5v5ciIGQFj1jqdZEJ3IKalccv4uOEoHU
         8zzWUXiOe8IEWibOd4Fxbrfh0ffs7oc+b24cBrTbsyr2FdECff/dHW+uzgCTXLHevZo4
         bbNEStzjVLgprLMsNjRK9R2/OmCulFf0buY1Lw4LMFgku0XHUks9kBKmMRPpdddm0i7o
         5gm4GPGH7sicn/c0NhmX+rKq6sL+vje+aH6dmzDTkB5Dot+fSmvBp6bsY270hmt037Sf
         x9nPzLu8L3iA0J/soh2v/0UbijgfnUhYzRBWDvjOk+jXS4c3ni/TlsTlGdmlIN+3hGWN
         lhAw==
X-Gm-Message-State: AOJu0YyE0VgAmV015bJ3+tJW0b/p7L91BbfnNsPaVAKsjR5oZqfjs7Gm
	gOaStJk6XU5SuAuiBgm4EUDoLdhQN3UMRJbGtpr8/eNlRIsSTA1BI6gK
X-Gm-Gg: AeBDiet8v5zoonwyczWNk9bCeUR/o5s7vu4/pZ4nnnyOESrp0EejEbv1lfCitgD+KC3
	f38uJL8DfN4m+qc5/rdICLS33QlJ5FzJEAWGtbtYv2DMyUbAK966Ov/kgB1C5P71WGe8AEflnSK
	YAyLbv8k0BDuWWyvszLu8WlXB38eVacgmwTv7zftuepGhOXLFnUqLDON6q2+nadBeYAuaIOdHbF
	wi1fBAU6ufcD6YeJZHqeK6sB+eKF9/wfPO4fit35NPJ5PmHqzx53UXU3Uo6s9vQUDfg33l8Yl/b
	84uNs5aHuvZ0pj/u5zJhU2cWF3ErnyY+B5piV252PIq9fisOHUn6iIbi0s4ttDOQAN+lBJyijD8
	A+6FJ4P6G42+p99L3MaEUgqtls/FAsyrLi3DxIgj//oAogOM5XFEANFcwHGqVzLeTYHz2Ew9z2A
	HIxHoo34D1cYDQPi9y0zwRdVxvIlTAPO3L7xeyifuT
X-Received: by 2002:a05:6a20:7f98:b0:395:7fb:9362 with SMTP id adf61e73a8af0-3a7f1b344a7mr9071850637.19.1777886470098;
        Mon, 04 May 2026 02:21:10 -0700 (PDT)
Received: from scootaloo ([101.179.98.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c802545908esm4163923a12.27.2026.05.04.02.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 02:21:09 -0700 (PDT)
From: Angus Gardner <angusg778@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Subject: [PATCH 1/3] staging: iio: ad9834: simplify -ENOMEM return in probe
Date: Mon,  4 May 2026 19:20:57 +1000
Message-ID: <20260504092059.1536094-2-angusg778@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504092059.1536094-1-angusg778@gmail.com>
References: <20260504092059.1536094-1-angusg778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_iio_device_alloc() failure returns -ENOMEM via a local variable
unnecessarily. Return -ENOMEM directly instead.

Signed-off-by: Angus Gardner <angusg778@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index bdb2580e29bf..f2bf7123ffcf 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -389,10 +389,8 @@ static int ad9834_probe(struct spi_device *spi)
 		return dev_err_probe(&spi->dev, ret, "Failed to enable specified AVDD supply\n");
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
-	if (!indio_dev) {
-		ret = -ENOMEM;
-		return ret;
-	}
+	if (!indio_dev)
+		return -ENOMEM;
 	st = iio_priv(indio_dev);
 	mutex_init(&st->lock);
 	st->mclk = devm_clk_get_enabled(&spi->dev, NULL);
-- 
2.51.0

