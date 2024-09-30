Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E996198A1B
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697882; cv=none; b=OSt1ihxYI8GnBxwpSgwZyGleXmQvEojva1HKaqhzLvUWOQg0MMqOojHL/4TopvB51wBJt0VCJTtdxvE2IFkk5LkEufx2O6bcLcHHlASRAPD1Of9SOr0u7Kw4IYhyq3Oy3oJQxOnrF+SSVn5Jdqe+Fwe5G23v8yEjQdUZmGhVhL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697882; c=relaxed/simple;
	bh=RQIg3IKX+fZXCdaaOjZybJtj1jQ4oUee/Ev0G5kqLRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvxJWgGeXs4/vJ+b7LLudV3sZuzPA3wllqALBeUOhKvDSMSShc03TMX7uCYDJhB7/go6Jv1pZ5RXDMRvh5sh8PEqlKmdG55PQInuR1yEvlRgxCyU7OiVsxmJ+MmCiAsWwm+GQJTP0r3MwUVkv8XibAUPEx9icAN9xAagD25g6ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jVyPI/Ve; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jVyPI/Ve"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cb2e136da3so29186696d6.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697880; x=1728302680; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qO3qqbTfvsnj8f4B9o9/p9r5ocz9pMXhz3VcGEq7myc=;
        b=jVyPI/VeP0V/jGZmNCLRZkt2s66oAtB+1FVoTA+I7/RUyZ5YOaqZ4z7+bt52p10Jy2
         0TNYs4pMRs8jv/TN8lqbEiBtxusut6cZVEug23hLtvKzdjF0jjZVCMrDayhElgdWe8CS
         0YHKGCqvMfVAuGEnbfYXo5SxBv2eLwSnBxj6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697880; x=1728302680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO3qqbTfvsnj8f4B9o9/p9r5ocz9pMXhz3VcGEq7myc=;
        b=s93iiWxsueHyS/bHhEhw0NHcNovScWR6LwTyf/A5YbcrgyeXDZrIOzsZDxHrmgQ6cD
         y5XN5IGCdAt+1n8diODUZ3dWRQMMg3JO056YAvCAO+NoPNV/GcR4nqp1XGGoJEF3p/BG
         RzBl6iS3YwJfdjnNwSYEEeWcQIpk8caq2R6htXC9QekwpresokRCuF34mnGeuZ/qqyz/
         j0coWMg9nihDiONiguLDBuNAhy7T5n8dFpXPVPkAS2Y202or36lnbJyiGzO6c7jcap+j
         z2uJD0HL8T/lJ0y3Tx3XG3eCTq5GCwMKGDCAcWx1KV0ZTxhhAmFGG6aZnH51dZmRO4Yw
         3NpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx9e0Zpo7KFPngE2CdRUEhwDMB9STYEtDj8pxR+Rh5MfF7lgzlXzR9G7MQorGW1QmA8Hwcn+c53Jz870f8@lists.linux.dev
X-Gm-Message-State: AOJu0YwOuMuGo0xbEBo1LvydDzeJfrSS06heBTxltl6Kgzhb78U5owwF
	aFztJmF9z1l/h6dV9zzvLstK3hN9BWkhI/hHd3pyrHdLrSHskqikEM3Pt8B/FQ==
X-Google-Smtp-Source: AGHT+IF/X+sGDFBK/b7MOemtir5qM4qeQwBGu/ooPVVD2yNCkIbVJsvPbz9WJQ+49WCJsrC1J8x5UQ==
X-Received: by 2002:a05:6214:4901:b0:6cb:4b47:e4a9 with SMTP id 6a1803df08f44-6cb4b47e5ffmr151055736d6.2.1727697880010;
        Mon, 30 Sep 2024 05:04:40 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:12 +0000
Subject: [PATCH 17/45] media: bttv: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-17-81e137456ce0@chromium.org>
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
drivers/media/pci/bt8xx/bttv-driver.c:2988:5-31: opportunity for str_yes_no(dstat & BT848_DSTATUS_HLOC)
drivers/media/pci/bt8xx/bttv-driver.c:2992:5-31: opportunity for str_yes_no(dstat & BT848_DSTATUS_PRES)
drivers/media/pci/bt8xx/bttv-cards.c:3039:13-22: opportunity for str_yes_no(has_radio)
drivers/media/pci/bt8xx/bttv-cards.c:3040:2-12: opportunity for str_yes_no(has_remote)
drivers/media/pci/bt8xx/bttv-cards.c:3043:2-21: opportunity for str_yes_no(has_tda9820_tda9821)
drivers/media/pci/bt8xx/bttv-cards.c:3044:2-17: opportunity for str_yes_no(is_capture_only)
drivers/media/pci/bt8xx/bttv-cards.c:3042:13-20: opportunity for str_yes_no(is_lr90)
drivers/media/pci/bt8xx/bttv-cards.c:4080:8-19: opportunity for str_yes_no(tuner_tv_fm)
drivers/media/pci/bt8xx/bttv-cards.c:3140:24-38: opportunity for str_yes_no(btv -> has_radio)
drivers/media/pci/bt8xx/bttv-cards.c:4081:8-23: opportunity for str_yes_no(btv -> has_remote)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/bt8xx/bttv-cards.c  | 16 ++++++++--------
 drivers/media/pci/bt8xx/bttv-driver.c |  6 ++----
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
index 867c1308de23..f989b5ed28fd 100644
--- a/drivers/media/pci/bt8xx/bttv-cards.c
+++ b/drivers/media/pci/bt8xx/bttv-cards.c
@@ -3036,12 +3036,12 @@ static void flyvideo_gpio(struct bttv *btv)
 		tuner_type = TUNER_ABSENT; /* No tuner present */
 
 	pr_info("%d: FlyVideo Radio=%s RemoteControl=%s Tuner=%d gpio=0x%06x\n",
-		btv->c.nr, has_radio ? "yes" : "no",
-		has_remote ? "yes" : "no", tuner_type, gpio);
+		btv->c.nr, str_yes_no(has_radio),
+		str_yes_no(has_remote), tuner_type, gpio);
 	pr_info("%d: FlyVideo  LR90=%s tda9821/tda9820=%s capture_only=%s\n",
-		btv->c.nr, is_lr90 ? "yes" : "no",
-		has_tda9820_tda9821 ? "yes" : "no",
-		is_capture_only ? "yes" : "no");
+		btv->c.nr, str_yes_no(is_lr90),
+		str_yes_no(has_tda9820_tda9821),
+		str_yes_no(is_capture_only));
 
 	if (tuner_type != UNSET) /* only set if known tuner autodetected, else let insmod option through */
 		btv->tuner_type = tuner_type;
@@ -3137,7 +3137,7 @@ static void miro_pinnacle_gpio(struct bttv *btv)
 		if (-1 != msp)
 			btv->c.type = BTTV_BOARD_PINNACLEPRO;
 		pr_info("%d: pinnacle/mt: id=%d info=\"%s\" radio=%s\n",
-			btv->c.nr, id, info, btv->has_radio ? "yes" : "no");
+			btv->c.nr, id, info, str_yes_no(btv->has_radio));
 		btv->tuner_type = TUNER_MT2032;
 	}
 }
@@ -4077,8 +4077,8 @@ static void avermedia_eeprom(struct bttv *btv)
 	} else
 		pr_cont("Unknown type");
 	pr_cont(" radio:%s remote control:%s\n",
-	       tuner_tv_fm     ? "yes" : "no",
-	       btv->has_remote ? "yes" : "no");
+	       str_yes_no(tuner_tv_fm),
+	       str_yes_no(btv->has_remote));
 }
 
 /*
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 511f013cc338..fdad666d3d0f 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2985,12 +2985,10 @@ static irqreturn_t bttv_irq(int irq, void *dev_id)
 			bttv_print_irqbits(stat,astat);
 			if (stat & BT848_INT_HLOCK)
 				pr_cont("   HLOC => %s",
-					dstat & BT848_DSTATUS_HLOC
-					? "yes" : "no");
+					str_yes_no(dstat & BT848_DSTATUS_HLOC));
 			if (stat & BT848_INT_VPRES)
 				pr_cont("   PRES => %s",
-					dstat & BT848_DSTATUS_PRES
-					? "yes" : "no");
+					str_yes_no(dstat & BT848_DSTATUS_PRES));
 			if (stat & BT848_INT_FMTCHG)
 				pr_cont("   NUML => %s",
 					dstat & BT848_DSTATUS_NUML

-- 
2.46.1.824.gd892dcdcdd-goog

