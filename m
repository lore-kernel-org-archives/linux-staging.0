Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF319F479
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697919; cv=none; b=m6FEe0QJHpxF53m9b/6BqLrlDO59gihq5TAUhoyppye71274j/ddEc3bWS+7xkJ86slHsIy4jhh6r3XgZ03wv1f8oo88kblA1JQdJBinwW8GDgcPV+rkTLXlOAAzQOx73Nh8Xy10ou9dPAYNyMDo/PGxYtuL8hXPLVkwDwhuPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697919; c=relaxed/simple;
	bh=seoZG/qn3lQcbBj3ynNAVC3sP37LRPVbxYubokeh8WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MArP2BSCtlrP5NyXUUVp+6tJXwiN6130c8JYr5UlobsIPmTh2CeRx4Gtg1cRKE9MUwPFmdEKYeM/MZsVd9+1lWYwhLc8FootkmLOxg3pOKv6MiCfsLiAM1qqj0mIAN6Rhaf9KdaLe113MVMBaOs5MehU5G6DQChqr/sImrUD2GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NFA+SRb1; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NFA+SRb1"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-709346604a7so2210572a34.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697917; x=1728302717; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VS7D6fkzy/mB93t3oLBUPb5JuZ0mJyEpuRoOfQlLof8=;
        b=NFA+SRb1Q4n+OJBk6dHum66LGBvnSWSbkkxEn2FKMYK4WYXRljdi/MMguOxZS76qaN
         hUmbtlb/IvX2zm2OHaZ1ZHp3oVMADb+ac4ef8+WwlIpARsdhzywZt+0tvRKUTwpDxAmx
         SFGgJ5hKthcSEr3znC6WSZP6Tf8JIzaPSuWJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697917; x=1728302717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS7D6fkzy/mB93t3oLBUPb5JuZ0mJyEpuRoOfQlLof8=;
        b=oFLrWklHrUfY1XHAI6atjfaepJvVgvEb1z35miilkTZkq7XJsLkhZEU8hibhw0uLT9
         abVQQq5y59kBVUOsLzowvOJYjAP0XCiHotuSjV+/dahHHsjftj65GNCXZ9/5pxEqcdu+
         RWDqKvuSNLTQTMqb3QOZQAWl+9biXA+HqnpiCV5HZybYibdnNUcch642rWmPTvRbynjQ
         KN/VwcaOQKvgejSSMYmzXW2OAdmLQXTF+y5uqoA+X7ZWmHMq/JxCQZtEnZYOnfgdWOpg
         vlN/ifUUaeVIWEddZEdrXizhcXqUiWc8w8hGtKObfpCY9/+7qmJPTP6pHhoMyDdQ7pu2
         e6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcrjPUCQW1QcCcjjkoHfSweTzGQuPDcvwaettUetuBvLneAsxrrXjsHzS6zDDvbWvHEIeFEkTtm2x7/w+4@lists.linux.dev
X-Gm-Message-State: AOJu0YxFkZKvPCVnoRb3/JlkSM94bcfiFkdD4lMnvG353GiPHVcR0UeW
	4M4WzQFEjBdnV383G2ReyngeYRuGsxtX8eSU+wSu832kXjUQVZ9tCgPMBuWE9g==
X-Google-Smtp-Source: AGHT+IEsGDncZXqIOKaIooO2hw5tICb0OJqubpFFkQiHlkBn39PImu6hgDgqbreQ/CasmuZpa2D32A==
X-Received: by 2002:a05:6358:5288:b0:1ba:580e:dea2 with SMTP id e5c5f4694b2df-1becbc86414mr292235955d.17.1727697917163;
        Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:32 +0000
Subject: [PATCH 37/45] media: i2c: msp3400: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-37-81e137456ce0@chromium.org>
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
drivers/media/i2c/msp3400-driver.c:341:4-21: opportunity for str_on_off(state -> muted -> val)
drivers/media/i2c/msp3400-driver.c:342:4-27: opportunity for str_yes_no(state -> scan_in_progress)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/msp3400-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c08..c7807b17add9 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -338,8 +338,8 @@ static int msp_s_ctrl(struct v4l2_ctrl *ctrl)
 			val = (val * 0x7f / 65535) << 8;
 
 		dev_dbg_lvl(&client->dev, 1, msp_debug, "mute=%s scanning=%s volume=%d\n",
-				state->muted->val ? "on" : "off",
-				state->scan_in_progress ? "yes" : "no",
+				str_on_off(state->muted->val),
+				str_yes_no(state->scan_in_progress),
 				state->volume->val);
 
 		msp_write_dsp(client, 0x0000, val);

-- 
2.46.1.824.gd892dcdcdd-goog

