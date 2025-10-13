Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C88B3093DF
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364920; cv=none; b=ggMK3ymV0wF6Rae89QEuLQt+amMzD32wMo2qVDNrnEQyM0rvHf4xskBB2tWU8C8qv1ikyJ8Hd+Nm6Io8ticnINHYhPdMDSKsXxv3xlSH+4i2mTR42HiWnEXyRLqLc3oykCfqWyWoKoqvjc6u00JrByUB2QlN1Pvx+rovGTFLvJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364920; c=relaxed/simple;
	bh=6oC75UBV5kQKcDj22i/SCXI/g3seRGkpC1t1HJaeaO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzg5mvf5PxtLo7pRlB6rGyk+X82huPDpHVv7SFLgUqtjrU6buMjE4bf2CNBX7gUP7996LjUS8lav956nK4qnV4wzioW85yyfnhCH+LF4q1oCamufPGAEK44PkLtvwdrul7kqGocfJGJvX3AMr+xv2ya0w1sQSSU2JJNCXJ1Z5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IqPOAO9e; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IqPOAO9e"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57f1b88354eso4814532e87.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364904; x=1760969704; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvGrgXxce3b673ZvWJmL2O2P/vGZxGBn/PkoM5SNlqE=;
        b=IqPOAO9eZhgWIVPjGDBJ88uDYTM2b1BbFFduaPij+DdLf7gBHbKg3cmKWwktfw7nAR
         BP3fk4m0CPrhSTfWQunkmniIj6YCISxbKpDmLCGXWI11V6fThArd0pnRffyug9qCawjQ
         j9KqvWy5otsBaxO/vjQ6Yl7ExR4UrHUJ8EjOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364904; x=1760969704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvGrgXxce3b673ZvWJmL2O2P/vGZxGBn/PkoM5SNlqE=;
        b=aNXJDj/ObCelHYnmkRYJ0vJbQ7kCC3lSZrFyRWVLN4gb1tGCBSX+XiaN9KS38wEUXn
         e/NPv4N9e8CLfqb6zLieU6ovmwuNoR0GOQRRZi7VH4bBz8HcnJe03c4NtC6EEW9mc7HQ
         R7mSeGNDs+/naNDhuiJEtIiX4cpbFo5kSUCUyndlE5DYmyWVkl/IeNWveeDJ2AI19kZi
         QV9pqesTUJ/NelynqW6h0aMPuoJQee6jwPkbFidooMMdL0p5nU4IFtowlrqFeeUGP0AS
         nz6VyySbmMwg7SpFssMLvp2dQgt3gHewYLL3YZAyAPP2k6/7ZWcTqvyc5E8giRgaXkc6
         zjcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHmziIYwDvZ4gia7uxcOw0grhfl48rjkDQDzrPk3GPb/YHPfWX7axMXmuWBAgeOWwNMr362GrElAJkQqXP@lists.linux.dev
X-Gm-Message-State: AOJu0YzcZUsVUqGtJNuWMGdi/7Eeewy0iglWL4auvxpkv4AuOOYWVrb9
	UmjFwIoaVSwkCG5FChbXxx66M4ox3w+ftQlO4NoNCBDmcsUcOtPGB4wkYbSqvUIvmsYuCK8Yl59
	g6gl3XDwg
X-Gm-Gg: ASbGncs/0AvH2O01+RJ3cfSTImTXA1tm4WL7fpP7Fa27xVx3zju9PjXamPonx4u1h5L
	sjA6+1hb7OC+4AmGypj2lUb6pMUBwuFjR0Uk5V6C/EwmtsrJPoaZLA4alZkVIIQJAGY8Dps46mi
	Nt7ogb+RqONH3VKp2oehBkcGJFc9sSI2ZTZG4xnnk9R3d9pAZgiBnf/bVhuRv/yAdIQrZQIXCh7
	iLBd4/FRl9zs4dIKx9o1S+ilQLrBq5qpBfu56k2r59k+gwv2zvA0Dq1dlbLvzelA1a7teqz/YYC
	/nI3aKDdN5+HhGXXkrXiOAi656+iq7D3CmjKDVXA81hc9z6fIGaxLoi7/hFbA7mOZz3H1qBWyDF
	VAyCyeF+FWu+iqTZEKany4R8d+kotOaqWBIbawsQCJpo9Gz6gAfTNcbML19J84hUFfW+NrSg+4l
	IdG8p/PPHaXTmJ8I57YXo9yqWuN2O1
X-Google-Smtp-Source: AGHT+IGGd6j7B+8NL75y4mrJN6TXhWVlixXUpX+LgX1rgjlDHLsFmo3oZTEn3Lq8AvVEZR1xSQXSLQ==
X-Received: by 2002:a05:6512:3b12:b0:576:d217:3f79 with SMTP id 2adb3069b0e04-5906d8b179emr5620261e87.15.1760364903769;
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:04 +0000
Subject: [PATCH 24/32] media: mediatek: vcodec: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-24-2c5efbd82952@chromium.org>
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
./platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c:187:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 5ad3797836db15bb62744d6699cdd2d6f05ad01b..643d6fff088b22dd58c0b05d5699432ccd0bc582 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -183,8 +183,8 @@ static void mtk_vcodec_dbgfs_vdec_init(struct mtk_vcodec_dec_dev *vcodec_dev)
 
 	vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-dec", NULL);
 	if (IS_ERR(vcodec_dev->dbgfs.vcodec_root))
-		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%ld\n",
-			PTR_ERR(vcodec_dev->dbgfs.vcodec_root));
+		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%pe\n",
+			vcodec_dev->dbgfs.vcodec_root);
 
 	vcodec_root = vcodec_dev->dbgfs.vcodec_root;
 	debugfs_create_x32("mtk_v4l2_dbg_level", 0644, vcodec_root, &mtk_v4l2_dbg_level);

-- 
2.51.0.760.g7b8bcc2412-goog

