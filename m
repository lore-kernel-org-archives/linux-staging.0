Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC26A45198B
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544229; cv=none; b=JRH95uPJt6eWvv3aAM20j+/PwQDlVKGQDURzFqMnboxs4/VoXCIXbg0bNxG1LypPCxI6dBd5yLExXS4Nza6CxzCOshL11PSbVgD/XpEUGyTiQtGzTKCjCemSzXCg2DsthO+vCj6CLah52/Fd/GdPa2dgUZ0Ej73S7God8FeQmgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544229; c=relaxed/simple;
	bh=1T6G2GdipAuIpsHBWuDFEV6aIj1b93ts1plzYTqBaak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3jbMhxFjCaB0TdLoSkb3LqdNhRSBJA5dc/0MNqNbt64SOCCsCRxCmm69Za4n+cut2UFL9Sa93g8wVatP77L9vQurOB6iHivkhBQ50GB6jYWeSIF1CGfa7m7XzqsB3LuDuZf0rPz+Ku8iTTLm5Adzb+x6KFhIlWkajo5BRr9gdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFNyLN47; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFNyLN47"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so467076b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544213; x=1790149013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Tks2oyxzxlf1TCNUshxK4sU+kJbcz/yddyURBT1Wps=;
        b=IFNyLN47yYRshAOg2RKMQat2VmGgXa/TUEjzqV0hPbiRVAvtGHuGQ13Ldbe3jjZSZD
         XNYRMQJOqxdL2PR/1zniXIYwzutdRczw2hyvw5t+0kcbU7042z71eW56kR9/UHYdaXJp
         aB3KN4vxWuJHHeQuWKY56zYu5JD7ggN+TBgpdU5iaIqayaMiL9z5BHDTuqw1bSA23VJ5
         Qe9Vhiv3N8m83ZPxRrOC9vRlRhQw0wZdHKb9M16CCdexBh5SkBmkuJFBWpL4qPH0lkm1
         ZMu1SKaGxlN2sCbQ5cn78/nBKrgsfjTaYqKmYMrev52shDGKBr2YqALaMQGZOHlYvErA
         AGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544213; x=1790149013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Tks2oyxzxlf1TCNUshxK4sU+kJbcz/yddyURBT1Wps=;
        b=f/FcRKkdMlfKu7v3DX9Qpztj60pzsSoC8suXw2cmwAOF1yDFDWqpQV6Dno+NIfH4n2
         NqS4t8hpk/wm4EwAgb/Xm5k8meGgeaoJfowGApoYy/KfJ3SlGcAUgoRfQ0kABA856paQ
         n1uEafmp0Kc9VmKxeUFCJR0VLfZYtgxnXboI4T3br6qpaX7dS8mviZ2zGV0DWg+PgJJh
         dwaQy9R1Y8xDx/dAtuY7JJlKERFTOcaBvLwWMQhd7OIpA+7i8fzA9/YiwiNBeQ5NZUXt
         YLtmPOcqeuelXnRbZQy1+b704IhzkvtmbCLg5DJLfWd9CYDvM1pLoeVghy3NM7S4dydn
         /CAw==
X-Forwarded-Encrypted: i=1; AKwUvBz+T5ji77d//bwYIyd5h6Sbp4SboOKddcmYJOjDsfjb4OGfeLNWgBFW5nX2qJVvDj4kD+EGPIK/SF9XkaNk@lists.linux.dev
X-Gm-Message-State: AFuF++lcMsNh9HQrAvXGGfUpXVh0bjp8gXMGaW4lpomj+Tl/YCTy3njO
	2tpdGeoYlwkDNOvXza68v9PDqozYH5D5x6Peo56lcmBUHY97qW5LxA1H
X-Gm-Gg: AYBFou3iA0p883B6nTxz3FTOsxMBPtKGA9HlMUZy+0XxkqxSKqKRbKRKSn9kq2CJgiz
	rwLK1vCnH9hj4qucvtB8GIUkDGQ8EtiRJIUnkWQUdjexmbd+KNYgv0ya2yuhfryQCsqo+/4Dfk2
	aY3Wg80YDAnnH7mZ+w2mFdJH5WnlizBd1qXGD/+tl5zjL7z2BYFftagnfsCvYVlcx1O8fVDUB6r
	raiIUgdf4YXTlsXVFw5wXxfAarL88k2FBgb0WSV+spt8mdG4U/QXW7UNJBzyFEzbht5TApDv1Oz
	HJKkhAZ6m2PvicFVRivx/Q0Zj87M9BIQOEVSweNH1NvyyVSfq8czWrsqZGhXr5nlAy2EtiP5wDq
	iXxna/SzEc+G/kGtC+JSlj/yh+zyC7aO3+s0GdMWTIMwGMeEy7H7Dt4hG8VlEAyQObOObz3sytU
	hpFXLt2dLwAx/B6XnUcfbRdXBGkhRPGWhmE9u+O6X6rJlrf4bxltZwQaasJnFMZMhiinGWsF16X
	myZcZeTMQFNxfz3XiI9aeZC7RGsYzpIrDmT1hmjlQ5CwIBXcg==
X-Received: by 2002:a05:6a21:b82:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3dd5f5d9f56mr4321805637.16.1789544213182;
        Wed, 16 Sep 2026 00:36:53 -0700 (PDT)
Received: from localhost.cuchdit.in ([45.248.159.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad6b9dsm5291011eec.21.2026.09.16.00.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:36:52 -0700 (PDT)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: atomisp: ov2722: Clean up resources on probe failure
Date: Wed, 16 Sep 2026 13:06:46 +0530
Message-ID: <20260916073646.26709-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915140828.25537-1-punnaysharma805@gmail.com>
References: <20260915140828.25537-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2722_probe() mishandles cleanup on three failure paths:

- media_entity_pads_init(): calls ov2722_remove() but falls through
  to registration with a freed subdevice.
- atomisp_register_i2c_module(): returns without releasing the device,
  controls, CSI allocation or platform resources.
- __ov2722_init_ctrl_handler(): leaves the CSI allocation behind.

Route control-handler, pad initialization and module registration
failures to out_remove to call ov2722_remove(client) and return ret.
Keep the separate configuration failure path because ov2722_s_config()
already unwinds CSI setup.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
v2:
  - Handle cleanup and error return if atomisp_register_i2c_module()
    fails (Dan Carpenter).
  - Route __ov2722_init_ctrl_handler() failure to out_remove to clean
    up CSI resources.
  - Add missing Fixes tag (Dan Carpenter).

 .../staging/media/atomisp/i2c/atomisp-ov2722.c    | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..272291e370fd 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -971,7 +971,7 @@ static int ov2722_probe(struct i2c_client *client)
 
 	ret = __ov2722_init_ctrl_handler(dev);
 	if (ret)
-		goto out_ctrl_handler_free;
+		goto out_remove;
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -980,12 +980,17 @@ static int ov2722_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
 	if (ret)
-		ov2722_remove(client);
+		goto out_remove;
 
-	return atomisp_register_i2c_module(&dev->sd, ovpdev);
+	ret = atomisp_register_i2c_module(&dev->sd, ovpdev);
+	if (ret)
+		goto out_remove;
 
-out_ctrl_handler_free:
-	v4l2_ctrl_handler_free(&dev->ctrl_handler);
+	return 0;
+
+out_remove:
+	ov2722_remove(client);
+	return ret;
 
 out_free:
 	atomisp_gmin_remove_subdev(&dev->sd);

base-commit: 587858367581b9c55c3690f4e63382ad622719d4
-- 
2.55.0

