Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076713081D1
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364911; cv=none; b=KNbSaF0hDzrt+9+bLvSfeF+7WgcjB++WvyrNtcY2Afk4Y+z5wRkjYklMKam3fBlxB7zujZVS3JwoLoMShyeTd8fCJPX5rnMD/tJMhr78nGZSnvpAK3clEhvqa9E6ck2ZQZXWwJOMaijSJR4rhnSgnFQR3UaGOyiPOOcCaygiQ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364911; c=relaxed/simple;
	bh=IYbyVo3NUXYVIwRmrClYpoFVDSCS8PA6N1mE0EyDE2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFcjYRqQqoMWCRldg6syoLI2FIqGSdHSDV+LcyWIJ6+ji+UQMfQ9fpAKeVuIu9qhhqx4JTCJgqqiw/2VHxC7XAfTgAwC/vjvm92l0x1uiFrdDnhSWfXjk9fnufXpM4HVm+h3dArEXFtmEBC/aYjxlSHRCRM2kK2phMeEttGXYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iRiLH1ZM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iRiLH1ZM"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59093864727so2839246e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364898; x=1760969698; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+HlSqes1yCsLkQoWVAYYhek4ZxMIKlt6Lo2LEEYk1o=;
        b=iRiLH1ZMCKPaNX9AmJL4UNSh5iS3KNqgYu0B5a4/lXrM5hoLEAr41pU2GnkHzFdDwM
         b/CYJCWO5dqxkceHu4ypuwzc6srd99Uj58YC9x8mE/aDpKmryqFIB6Wnao5Yl5guaynC
         E9mVZkZIKOUtjgRcehzwsmGfD7R9fhrJ7cnvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364898; x=1760969698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+HlSqes1yCsLkQoWVAYYhek4ZxMIKlt6Lo2LEEYk1o=;
        b=CKsMC18DlDVWDKOFq4YOzEdKFfh/cNSA9dHWNnla880In/t9VIuTz/ZPfT35SacT67
         24hi9Q7cEuUaTiU4UA0zOZINhpSMK6f15rrxE4GQ8gfgPTRs3nR1ItBS/dKqi4NvntH5
         uR/gjpNvQPe3p3KJA7JJXTLU1AOKh7clSadYYFbM2RunRflIfjsTPvQt9Cwabp6tVvvX
         g/Cwqc7asdbAs6jwIm9MZ4GrNOu6bk3Zker0e31fK1IUkXsIqw/AZB/ED9NOLwV/WAy1
         6kRbIB7VuMaqjn6Ic7ywLKo9UOQ0YAkYK+McnDztyvAostsdLNzyCYMxr2PM4JeezFWj
         wVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD22G8GL6960nBwKkuyCy568NbawLMJTUt1mQWTSQeFuJh7MWo38wnl6eoFME8Cn+t6negNKtfru2SRUJQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyZwxo8r2VkJnC0ZxIDqJOGwvmVFeestdwfPBsZDbSVXl/Uw7yv
	rE1ePrrkVdb9XC/Mq3uc9v7qxYFLDjwm7kx1oDVjI8H3AC/aX3+fw+KDWTW7w522Mg==
X-Gm-Gg: ASbGncsCHIhjAE6nYJQ3Koj8ahoRqL5dsH+MQ11CN2OTxPzBwQe5JqhN7anqDzP6iUk
	yiTM0rYf2Y/GG/zzkezIlnmGygHFrTfKMPKprbA9wtIU4a5ksEghX6JYJIIfHPNePoTz0/SX4mj
	N9S3Oza0ct2xEmLJD9IQzu3jKOdPC05Nvd/pg7w0M7YBS4lq8tJAsBbJfuONb5/9CLNv6S7gg/2
	cOIOVPRdcbbmsPlCg7gCSQcUNN4FjjlAzrTUnSIoMrTCPdmfVxu1OeuHahSx+zgy/F5eK4AgqsG
	6CueggV/MywECRBrUDNd+NNkrk1xQU8muMFE5rDNdpdF5ilRGcxMwoOExse1OiUW72YxSmmE4cV
	ZhMd0TfMWlOo9sdhcC+pvUvOFN/Dk3G2gKDoyaOlBHXZ2ebuJLUK6ZDS0jScAz71KVuHEBSWsOb
	+4iuSiG6MyIcfX+yV4Jw==
X-Google-Smtp-Source: AGHT+IH27CfYjloqEXA5bxWZfYaU4LA1SVwbUAxn03k9AIO/MXhXvYZJr7Cls4Tsp0u6mygHRedkXg==
X-Received: by 2002:a05:6512:3d94:b0:579:d89:20c7 with SMTP id 2adb3069b0e04-5906d896e12mr6073927e87.9.1760364898078;
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:54 +0000
Subject: [PATCH 14/32] media: i2c: mt9m111: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-14-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

This patch fixes this cocci report:
./i2c/mt9m111.c:1290:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9m111.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 05dcf37c6f013b1cefb5d85f893af08f4533c7b4..3532c7c38becc21df88957f8f323c77033026a81 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1286,8 +1286,8 @@ static int mt9m111_probe(struct i2c_client *client)
 
 	mt9m111->regulator = devm_regulator_get(&client->dev, "vdd");
 	if (IS_ERR(mt9m111->regulator)) {
-		dev_err(&client->dev, "regulator not found: %ld\n",
-			PTR_ERR(mt9m111->regulator));
+		dev_err(&client->dev, "regulator not found: %pe\n",
+			mt9m111->regulator);
 		return PTR_ERR(mt9m111->regulator);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

