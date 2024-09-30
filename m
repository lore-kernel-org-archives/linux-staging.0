Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DCB199FB4
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697894; cv=none; b=I1llcFMD3njjZPhhIuDeyHN7DPb8l2fLEhtYNp/J0zhqcEVcFYc2PE9fMT4Pe++sb5qUXnk3Q/xQiYXq795ybc2/8VzeMC1kOrR6PUiRBd1Il88I4/TO7MIl+zHt8gPk6NKtyI04Job4lvRbqyFgiuWljP+czBwGew1+Yvjbx3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697894; c=relaxed/simple;
	bh=gioH4bb8ZF2A2YJ3Gh5wVo7at/LilX8METihZcFwy7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbcgfQAEjdeYH8751kRtT/J0ZNDPE7IokTTRDTpdTJ7shwY+DAQLTmzDjgYSelbKL0mJU7sK584BaLrf6SzHySfJSulBh+YBpqdngu8FIWCGDef9UEvLr4HO8YXJ6v9nmT8e5c2zssTZ1ILwlN2ptBeOL/NZWZziHcKknUx/lgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gqcPSwfZ; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gqcPSwfZ"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cb2f344dbbso35005206d6.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697892; x=1728302692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkGnsANo5NZRR329f/RKKIwKl1Ms+i/uz0ChSSNIXaI=;
        b=gqcPSwfZl9PUltpjAnQbhF5i2f49H0YG82wHkwuGFKGEgvmPXN14LPc5OYQameneOf
         W9+D0IzZczM2WsCbioUgrFZP3kFCgm05vMGXD06fue4CrNheC1B7Nf+e82o1KSoC01e4
         sR7w/gO3b91RqWthypqtQehfLIiM+SMR3x3Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697892; x=1728302692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkGnsANo5NZRR329f/RKKIwKl1Ms+i/uz0ChSSNIXaI=;
        b=CGcC9dXp1JEz5qNpn9w6n68e3B0B8oRYyFFDebPq4UsLVVRHvpHltdOMVtJDpYfAPN
         EdvE/n4rnEK4jKi+U5FCnNwzhBDxT3M9Jrvzu8scA1uYapDsNJXDuEJgf/SPEeeMJ/wG
         PA0bKJIwTHb9npNgECTp2Y8DDayKegddHwzGS9qq33HGUwf9peFuQm8bFrqSJu/2Bu3E
         irevmfW35TYs/tDBIn+ERjZa0VXpJRLwfUGr0NFGpwFiKHe8VZxj4X9UVxVrM1UzLAtB
         GvH8GTparm4guVvsp0Wa3anT67YC3lx5kg7hVNPgQKGmVksB0fpvFJG97J7ByROCNRP8
         Km0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYoPjUtY4Z8rQCQrdU9LT0cNe8BaspzI01fmDhTaO+uZiRB+7NvqLdZ9zu5XYTA6jCvrckbQvgIgxaJfDp@lists.linux.dev
X-Gm-Message-State: AOJu0YyXRDduzgAaW4yVYtGXLTpzsjRqTcbCidOBSFBgddk8GaNUXF+U
	3fHU18aiGZcAJVuo5eMqTDeDbNVX/MZw3uZp4E494h+OHI6Y4zkYoNC3Ph9E7A==
X-Google-Smtp-Source: AGHT+IHSrAGEQVH1G1zMvd/O9AA5MhvLH1UshVFh4gerMrNNX+7ODpeAcur/C3J29WO/FfgVZP2azA==
X-Received: by 2002:a05:6214:33c5:b0:6cb:4def:4ce4 with SMTP id 6a1803df08f44-6cb4def4dd3mr121217066d6.32.1727697892043;
        Mon, 30 Sep 2024 05:04:52 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:18 +0000
Subject: [PATCH 23/45] media: ipu6: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-23-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warning is fixed:
drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:247:51-57: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 051898ce53f4..522dbf52c82b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -244,7 +244,7 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 	u32 mask = 0;
 	u32 i;
 
-	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", enable ? "on" : "off",
+	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", str_on_off(enable),
 		csi2->port, nlanes);
 
 	cfg.port = csi2->port;

-- 
2.46.1.824.gd892dcdcdd-goog

