Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CD218E756
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697849; cv=none; b=T9E2zrLxGo3+w/UgN6norGGd87U/6SMvpApEYN35agypKM4IbYixZDKbbbWrS4yTL0bZUSQ07KjN0DEkuw6Ean6PJA8UUzR54cHWKi0+5Rf34g2ltcRkMewbJWruxHdDc3PI/kJbNytjEpAtfl0eNSDFZ7KtcvgKIwxd2bMwMfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697849; c=relaxed/simple;
	bh=6tsZ1NoeAxhaSKOEEQHt8kXuaM/4oPbiO7sTIQQ1WIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CC/OrmaVD9SKJ+q615rTBR9OAFQIIGPDCmNCeIwC9Biy4lEhwazOkBp9wp9msBgl5qiDRhfHdJLgIU8Zcs/NlCCye5K92d9Gf3JbzqILSnlQLo2MEcaASwRffya+xeDohfCGi9WaVooLcLoDLLt49yWLOvfL32DT0svWX2HQg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iZkvGegp; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iZkvGegp"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cb3bbb9cf5so31769096d6.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697846; x=1728302646; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMPmE5TkHFd80YgqTri0+sfyqDiwarpX0eHsAVhj80Q=;
        b=iZkvGegpKvVgh3qX2Gu86vTl7kklbKFDHAsuCq5rOybBQbmWc4m0yrMkGZM9ngdO2W
         X7UrFuZKhvF07QBk6rz4SSsDTgH5Lcm9tEfZzpmk2GSi5nkTzwby2FpEsxSI/V+gshvl
         ouY86mMpE5XkAVeiZtJHz1L95+qSBqtFumRRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697846; x=1728302646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMPmE5TkHFd80YgqTri0+sfyqDiwarpX0eHsAVhj80Q=;
        b=bdbP98VtOL7LyOEHgVORBUbrq3w1fmVOtlAugz/u79hbr3O24BNVW0+Gef36knKXcY
         fGcKBdGvMOSK0YStIGLOtPsek8ppU//ANRmNvwtfGlQBb6TpSZaC0OuzczzIo0gcyanP
         aHJKUzVjaqWKW0QFtBxV7MCRcbBsM9N75ksiKqYJxFMgkfSD/RkupB5U2zmgD73MgGCT
         BaxkBDaiHp0ENuBbv02+04r2BpPnzTP0xrCtQW7poQH/z/sa32p717S3rDL6G0JNXpog
         If++2u+BgPy72yenjgtGLk3INHguew2iugeN5Wx6lV/5F0U4g9AGJ8EFnBjpZSCWQmVp
         amXw==
X-Forwarded-Encrypted: i=1; AJvYcCWlb8fCcBxmZZWzCX6laLjXTMW0unRu6Ux5zuYvcIkM4Y9X/klM08qpiEGvAaDnUVND51x9vMyigbtYo7oX@lists.linux.dev
X-Gm-Message-State: AOJu0YxNOxZAQqAWhyF/BfIipNQlHWhADxdeXIcU2fbKhLRHiopRfQIv
	CcljuguJPw3uCL3nC1fJI6+cgNvP27dF403HJ2KSLBGTJbY8GC3EZ7PeaI22dA==
X-Google-Smtp-Source: AGHT+IH6/D/fn5XLACymMtvSYJn9uYVBCFXPJs1Z5DofbyQa884ygogtE2Qn3wPmK1ZC7+LIXRRj0g==
X-Received: by 2002:a05:6214:4905:b0:6cb:4ee5:8a80 with SMTP id 6a1803df08f44-6cb4ee58e92mr128655486d6.34.1727697846439;
        Mon, 30 Sep 2024 05:04:06 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:57 +0000
Subject: [PATCH 02/45] media: staging: atomisp: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-2-81e137456ce0@chromium.org>
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

The following cocci warnings are fixed:
drivers/staging/media/atomisp/pci/sh_css.c:1490:16-19: opportunity for str_true_false(map)
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:855:2-8: opportunity for str_enable_disable(enable)
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:542:40-46: opportunity for str_on_off(enable)
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:584:48-54: opportunity for str_on_off(enable)
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:1006:2-4: opportunity for str_on_off(on)
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:1019:3-5: opportunity for str_on_off(on)
drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:394:9-19: opportunity for str_low_high(active_low)
drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:1253:3-35: opportunity for str_true_false(xcandidate -> sp . enable . continuous)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c      | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c       | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c     | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c              | 4 ++--
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 2 +-
 drivers/staging/media/atomisp/pci/sh_css.c                    | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index a62a5c0b3c00..34e68ea1b1f4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -852,7 +852,7 @@ int atomisp_css_irq_enable(struct atomisp_device *isp,
 {
 	dev_dbg(isp->dev, "%s: css irq info 0x%08x: %s (%d).\n",
 		__func__, info,
-		enable ? "enable" : "disable", enable);
+		str_enable_disable(enable), enable);
 	if (ia_css_irq_enable(info, enable)) {
 		dev_warn(isp->dev, "%s:Invalid irq info: 0x%08x when %s.\n",
 			 __func__, info,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 6abda358a72f..7d1905791b9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -391,7 +391,7 @@ static int atomisp_csi2_handle_acpi_gpio_res(struct acpi_resource *ares, void *_
 	acpi_handle_info(data->adev->handle, "%s: %s crs %d %s pin %u active-%s\n",
 			 dev_name(&data->adev->dev), name,
 			 data->res_count - 1, agpio->resource_source.string_ptr,
-			 pin, active_low ? "low" : "high");
+			 pin, str_low_high(active_low));
 
 	return 1;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e176483df301..85e7d14ef394 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1003,7 +1003,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 
 	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+		str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -1016,7 +1016,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c9984f1557b0..6fd18217df1e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -539,7 +539,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	u32 val = enable ? MRFLD_ISPSSPM0_IUNIT_POWER_ON :
 			   MRFLD_ISPSSPM0_IUNIT_POWER_OFF;
 
-	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
+	dev_dbg(isp->dev, "IUNIT power-%s.\n", str_on_off(enable));
 
 	/* WA for P-Unit, if DVFS enabled, ISP timeout observed */
 	if (IS_CHT && enable && !isp->pm_only) {
@@ -581,7 +581,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 		usleep_range(100, 150);
 	} while (1);
 
-	dev_err(isp->dev, "IUNIT power-%s timeout.\n", enable ? "on" : "off");
+	dev_err(isp->dev, "IUNIT power-%s timeout.\n", str_on_off(enable));
 	return -EBUSY;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 7ce2b2d6da11..7e295bc83464 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -1250,7 +1250,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		dev_dbg(atomisp_dev, "Using binary %s (id %d), type %d, mode %d, continuous %s\n",
 			xcandidate->blob->name, xcandidate->sp.id, xcandidate->type,
 			xcandidate->sp.pipeline.mode,
-			xcandidate->sp.enable.continuous ? "true" : "false");
+			str_true_false(xcandidate->sp.enable.continuous));
 
 	if (err)
 		dev_err(atomisp_dev, "Failed to find a firmware binary matching the pipeline parameters\n");
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ca97ea082cf4..89a694453e6f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1487,7 +1487,7 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	enum ia_css_pipe_id pipe_id;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p, map = %s",
-			     stream, map ? "true" : "false");
+			     stream, str_true_false(map));
 
 	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);

-- 
2.46.1.824.gd892dcdcdd-goog

