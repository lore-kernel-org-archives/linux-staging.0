Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF223081C4
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364916; cv=none; b=P/3kHUZGoYR1h1rB3puscqR+hLLItM6ysOHLwHrN1vQGb2yXv8zbzBjMVcRWVtg63rHb7LQ1CqiygzMqEuReqg475gLHs/xq9ATZ460sqC0mECfD2DENzB87sOgxzDs5BSjcIMuaaM4ZNpQIsiaGYr5SMVngGEqDcaDg/cOZSag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364916; c=relaxed/simple;
	bh=SRU041Bx6qBndiZAXSPZ90z0DuuZmjP7aN/HQli4PfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nb6O/Wwk54kLe+XFKBU/u7x6YsRpHCeLGzPR78ANYsUA7TqTKYNZLFN6Qe2DHT1A05KPj7k7CjTu8MCm4xfOFqDeg1dR+cI2AQXah+JSfQ72DEidEShEyelfDleBAmNjYBZFyYfevgRdMjx3WtTPn+fg2LJ57lUDDxHaTusmdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UxrtAYWt; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UxrtAYWt"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5818de29d15so5335663e87.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364903; x=1760969703; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=UxrtAYWtzWjFZzJ+a9lAAfIhs+ZE7mm0Xb/UoQ1N9Q9oH+ZHnn8DQkmZYg0njXkmsx
         5MfW6o8PfnoAgGTtXCw9PqaMdQkDbXiEbuvgwZsnUK1bw2HuHqiFODYUjpxiejJS87mU
         LsB71+RkVd/A+aplhtt4T4lARr/jdhV5OjjkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364903; x=1760969703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=f0oxtWbevzCpcqRy5WmZ0PklTXfA0d4F9NTDP87LbA48fD8/JCIdqlrh95V+iVV93P
         oJUrQg9q9/WPfvTjTaz11e6Wzb45e2ThXcX4N+PxEDtyNIiVV51yCMWcE7idTRzPHpQA
         jHw/PFhDvEMVKJyl6sp42V6csYzClS9bSk2KbNdUejtsjU/OxKsSIC70z/VMtW0G03oD
         tJKdTLNx3ATBF46vyNcdGvjhz1SgjCfZ09Ec+3JLou8IWbtJpkcaj+hBsBLUDUXa2WkG
         06feBr9D7vx/1vVGU9oAx0ekCkNiutwVkLraTlfr6JrE2QJiZn8IbCNrXZ0TrHpVjxcj
         lRrw==
X-Forwarded-Encrypted: i=1; AJvYcCVvZFGxCAdRe0yDYZAo4JsFJydsGvola5P7Y9WiQHqfxqSgfgeFzQ7snPLZMe33C+zuNRTkJ4pm6X+oz0aV@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv+8lXZsw7ZI/YYlfng8kJrOVlsjwDcJhiojGvlAoUwFHJMu1a
	9LPQCZKc03qb1xbzq5BdMnlyyqNvkNLJLnNjkMgPrWojUZC5bRqOx5EEwZ1MjQOyUQ==
X-Gm-Gg: ASbGnctUwDQJ/xrka/WTiWFOz7g7ZArXvSnSRBglNcUn3y8XHxM911FFGjDTzqGIWix
	mCetZIZcxpqI0KnW0yku5mheXS+09XYuuIXbINukkyPlMKbkaAIZOgJ9GDRK07Dqr1D7d7FDwYw
	5/KH3bV/h8VCsK56PDXFATlDY8TrnOLlGX4rz9qF/D/bQXUb03nhmKNRqhzxBieIFZixl5eXdSu
	r880coChRdjpl7fZrP+3cxTc3IZTbvG3OKkuWmcB49KbsV6WFbgtEpX92N1dlc6133eHzzJ+l1e
	O5RZ7FzZe/4Rk5K36r7VxmyhPU7otGLju3PeGnCE368OwzooZevM46f80MOKzjDluTAvHVZHD6K
	dkArSY54eBxeeBAmb/3p0wpzkUR4b53mTzbqNBSWXnBNFvSeqzJ2wH6H3s4vYc4x0tAcCNdgh8/
	lmWZ2rH8IT2XHdbTGtDA==
X-Google-Smtp-Source: AGHT+IHTiQ/qP/uDKTsRTktboy2tz6+O6QgpLJK8/qSWk5/9SrQl1mdClJ1AYpOXCltPovAllg1/dg==
X-Received: by 2002:a05:6512:3c87:b0:576:89cc:95e3 with SMTP id 2adb3069b0e04-5906dc12458mr6541046e87.10.1760364903311;
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:03 +0000
Subject: [PATCH 23/32] media: ipu6: isys: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-23-2c5efbd82952@chromium.org>
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
./pci/intel/ipu6/ipu6-isys-csi2.c:91:22-29: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index d1fece6210ab25de4e8c7b5247f049cc1dd1e677..d858976112ba2bfc2907f9b88dc6c6434053f4a3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -87,8 +87,8 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
-			"can't get source pad of %s (%ld)\n",
-			csi2->asd.sd.name, PTR_ERR(src_pad));
+			"can't get source pad of %s (%pe)\n",
+			csi2->asd.sd.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

