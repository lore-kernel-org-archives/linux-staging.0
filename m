Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79351990C1
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697887; cv=none; b=HQCWuuBqh8/yK7hRtGiIBpkEXcrho9pgY7mhuJPqK7Vg942FsZeN2yjXIqtNrJBHNma7T2DC/v7guyBVvnTv95bp63uRfnJ9XTHYaaqReL1OCm+UyaWaMXVMcVa8NyLkozSm26dn9XS+pGSuRUdgGfgBnXlhW32GC4IplnY4Avc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697887; c=relaxed/simple;
	bh=wO32bcNT3LvCUpFUE8spFFSYHTYoba2s3UV9j7voxsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=owgm6d5jyH034dFmDvd5wRCEMFrGc6GnkeE9EBXMysLcxZy+Bt5SEwsrDIhhsM9N7jyiV+QmHhQzhN0jc53WIjSHicREHtc4P9DjM6tAmvJ/f3vBY/0u9WN0YyNk0dWq6bkZi/fzVI9Y/HGMHGGKNgndOOW+C0zn2EXpVUacUCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tx/Kqtq1; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tx/Kqtq1"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a9ae8fc076so475926785a.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697884; x=1728302684; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+1PZUGpVB6A0qj8dhi+z1VPBRWAZJyLXCCfSc2+bXs=;
        b=Tx/Kqtq1lF6lUgYMiXbkPiASyTCTj4iHo+zkiekW5zPkmDHDiAKaH2k6mS0J6bjyab
         QCbYgj6RUyOJ5//7zOl5TNrd92odhNqIU4A0MTXxUwFcf0LV6DeRfMS1MBtDMAbfUdQX
         q0J0odIKnMxhCRC5ooiL7F5zl+yxflxCJV6Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697884; x=1728302684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+1PZUGpVB6A0qj8dhi+z1VPBRWAZJyLXCCfSc2+bXs=;
        b=Q3KUXb+dXHt2Zg92dNBQEjFo9J86xFcdFGHWWGqlscFrgvOLnw6RZQkKWgLNPW745U
         sS5oiAv3E6gZaiUlzHvtlBkZTGTMNUP3KNuBwDw+pqzGhfKH+5N8/jVurlTnVSMCEezi
         SWiDkZcxE6/esyDpcghSopsjgFZ2+BOGgnJnM8j4UzwVjF3XAvZdLxdqs8nkKTnj/zBj
         GJSS8mZk9PVaV6aRzN11IKmjfUitndSuPH8RLOuK14lagdRZPYFAp0ziydy7w7JVYGMQ
         4l71lKOnd6O9ZpQvilh6NSrnV3cL2S4frXpErxGPdF2AFlkFnom+W3dD1xtN42WNIF8U
         9ScQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc2yKtlGBLvh/4UrdOL9EIp8z/uITz0XK9XpK5Rpb/pEPiQHdO4uYhSUEQB6tvO2EX/clzmMs1riOJvidE@lists.linux.dev
X-Gm-Message-State: AOJu0YxABQqlHYl/9/CdwSEu16pg8v/Zz/V0QyL+FpShU8obBHDGCgNV
	dRNx2ngYwxJd07H9hQp38tG9//voTwkcyHWOCgL8zZh4ffvSSnBI5ejVjqkv5Q==
X-Google-Smtp-Source: AGHT+IGmAxnIT189WVUBwg+x/R9UvWvqRDVNzUhwwxur3BAKszcZq3coNxLRGmF9WP2isGNKo1o/8A==
X-Received: by 2002:a05:6214:5706:b0:6bf:7bcd:78e3 with SMTP id 6a1803df08f44-6cb3b643feamr164774016d6.29.1727697883855;
        Mon, 30 Sep 2024 05:04:43 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:14 +0000
Subject: [PATCH 19/45] media: platform: ti: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-19-81e137456ce0@chromium.org>
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
drivers/media/platform/ti/omap3isp/ispstat.c:771:21-27: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/ti/omap3isp/ispstat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispstat.c b/drivers/media/platform/ti/omap3isp/ispstat.c
index 359a846205b0..603439afe582 100644
--- a/drivers/media/platform/ti/omap3isp/ispstat.c
+++ b/drivers/media/platform/ti/omap3isp/ispstat.c
@@ -768,7 +768,7 @@ int omap3isp_stat_enable(struct ispstat *stat, u8 enable)
 	unsigned long irqflags;
 
 	dev_dbg(stat->isp->dev, "%s: user wants to %s module.\n",
-		stat->subdev.name, enable ? "enable" : "disable");
+		stat->subdev.name, str_enable_disable(enable));
 
 	/* Prevent enabling while configuring */
 	mutex_lock(&stat->ioctl_lock);

-- 
2.46.1.824.gd892dcdcdd-goog

