Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23215194ACA
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697877; cv=none; b=fyRxn8eFCJc/fifSpuHun8+tteQCqRfJetN5J5pGBJadyVHDtvfIBmZrOL2s/JMyWkUjRCdEsZ4JMDmCDH5fpYRxIFRlRHGMNQLUJIXC5fBIZn28DYl7ArlLdPXHa5sY01M91AiD7q4jzzenwjzNeRdxgT8AdwLztpirI1LMRP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697877; c=relaxed/simple;
	bh=27dEbLYS3PRjKxWaJp2KRsfAuUa8ZpRAboFGn7TSbcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6TYGvj5UFAQpn201ZbchtEM8pCx0jzaJBN+RYnbFOtW8lv2IkiwGt9qapNeYLkRMSs8Ap09WcE9IP3YcwsRY2WRA7OFktDvxiOCLzTbDiULXlE5RirEkJXa2xsHLTXdMIZM6cDjwAkdpVnKQThq2oN3N563GIviGs2s6ekGs+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YfSIUuY9; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YfSIUuY9"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e1b55346c0so1791930eaf.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697875; x=1728302675; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpVUYLeo0hSTOfKt30J/ldl6oRGhulqCfi0QX1kLeY0=;
        b=YfSIUuY9oKFuurooKY3kA0iBAWfctTNU7TDJW98s8N3QvGGfwm/xlWYYoZpF0lgM3y
         5fbnEWDODeOKGFjY8rh98vN5oPGxmXzh8qJXgnyLEQxAgsK2AVjoeyH/VHHXKPuI9/gx
         XcHm6V0N/wxblFGcqGylmmAKs7ppOHMubmHDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697875; x=1728302675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpVUYLeo0hSTOfKt30J/ldl6oRGhulqCfi0QX1kLeY0=;
        b=VI6A8c6N5ATNSmdEErsKUmaYn9L0+iZPY1XCWL1ZYYRsKsNdIsBzX8gDT8bZIt0Wdc
         l7HANeHNKnsOqYxx69Vtf5QoGQTrsEe0FJubi3/V78Z2IEN8sJFdVWlCcvMuJbjoA+t6
         7k3ejPGg24MY5fa267EEBd3qJGUtmUESesYcBkzIoBIWJI3kDgEJOLoTwOQes5QgVcOL
         fTt3rSmoP5xlxqieOfZtLqAZstUOqfkgStDeAsi+hSyuh6R+XrcQwi3/7IfgibzAzExI
         CkokvRo9ugw7Onz8FQRREBM5aLJ0IcoDvGSK9TLTtFOKWqT4XHx1veK/sH1R6/7KIHi+
         M4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUM7I3oaqcR6zkUpDPlMg/lCDE6Jk7YzuFVFVLyXUU3BkWT5Lnv6znfc5+rr4Sm8tQV2hZmJDN76lUzfOYV@lists.linux.dev
X-Gm-Message-State: AOJu0YxKRxz0V4FPM6S9GcuRIshxeljURSFVp4/EnSSicPn9muorQXo/
	5zMPDauxIvKgxWFhgKnwAOUXmKBmBN0HoaA5fMTIREeniPhTdIbZMxv66igI3Q==
X-Google-Smtp-Source: AGHT+IGd3K8vbb6GyQdRKaZnKoS5TA6gIcUfCdqxCm9K5gJfl06dGrwyNT5yGfSWCEUO0kuvQMkCfQ==
X-Received: by 2002:a05:6358:e4a9:b0:1b5:968f:e221 with SMTP id e5c5f4694b2df-1becbb39bb4mr326693155d.2.1727697875191;
        Mon, 30 Sep 2024 05:04:35 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:10 +0000
Subject: [PATCH 15/45] media: amphion: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-15-81e137456ce0@chromium.org>
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
drivers/media/platform/amphion/venc.c:1206:4-26: opportunity for str_enable_disable(venc -> params . rc_enable)
drivers/media/platform/amphion/vpu_dbg.c:259:3-34: opportunity for str_on_off(vpu_iface_get_power_state ( core ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/amphion/venc.c    | 2 +-
 drivers/media/platform/amphion/vpu_dbg.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 351b4edc8742..789c8fca3d31 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -1203,7 +1203,7 @@ static int venc_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
 		break;
 	case 8:
 		num = scnprintf(str, size, "rc: %s, mode = %d, bitrate = %d(%d), qp = %d\n",
-				venc->params.rc_enable ? "enable" : "disable",
+				str_enable_disable(venc->params.rc_enable),
 				venc->params.rc_mode,
 				venc->params.bitrate,
 				venc->params.bitrate_max,
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 940e5bda5fa3..2dbcef4e83ef 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -256,7 +256,7 @@ static int vpu_dbg_core(struct seq_file *s, void *data)
 		return 0;
 
 	num = scnprintf(str, sizeof(str), "power %s\n",
-			vpu_iface_get_power_state(core) ? "on" : "off");
+			str_on_off(vpu_iface_get_power_state(core)));
 	if (seq_write(s, str, num))
 		return 0;
 	num = scnprintf(str, sizeof(str), "state = %d\n", core->state);

-- 
2.46.1.824.gd892dcdcdd-goog

