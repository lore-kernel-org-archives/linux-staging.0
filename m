Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D712F1991CE
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697888; cv=none; b=SSWXXzw0PPRzUXVF7ar4zeMIfb3HovC36PkZuWw4loNaY7j4yg5uxyoAwZR8nPDqgTpxJ8zGatHkyd3wkvpUlZxSG3d5erM+6Bdz+jUT0kzbAsLxgWPjXn23R1A92TujWz0X9knZPPNDre1+0kaGzHL6bEi+HoCtHVUWcCqsvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697888; c=relaxed/simple;
	bh=a+FiLOH14SS6a3AubkD6ERw5Y7LANHZ0RAc6/umufBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wv3dZesU46ESy01nzEVwD84y6SGTxsRLTifYn5/zUYOUufmRFli5R4b0oTOwDb6fVkDe0lRtZiYoX/LzsYk3EY49kKxWLFCQJ1Xhvp+JJz5i7p+fWSMEV5KN/QFVOcXFW72wUkgik4iVtQaVYT8cmwZeHmXCy422guSQroIgWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hcgGrC+5; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hcgGrC+5"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a9acc6f22dso438442185a.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697886; x=1728302686; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0yeJPaEcAnmgbtIHCIKdElv7f1NVvyLMutp/xQYAjQ=;
        b=hcgGrC+5QTTC4Mwj9aoIb9VDwgaPDASKEtbjj7zJCIta+IQIlEgureWRez6N8DY4FD
         UpWBnQ5sl83zVa6Tbm04JSE8Zc9i97+udcYZp235rEontXah27p+2xQf3vLkSduw9C46
         beDhx3R0nsf/6PV9DzRM4YorR8CX6CqzCCyBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697886; x=1728302686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0yeJPaEcAnmgbtIHCIKdElv7f1NVvyLMutp/xQYAjQ=;
        b=jA2SQ+y8d2cSDDo3DC7o0jFj/hl9kZHfKwqiUkUc6RuIIWWi0r5CslBIIWsq3IhOQG
         69Huwmi3ygoGl5jT20hSscXRHfaMiZTD/IwOpeVwJ9yR4caJa7i/xol/7b2HlOzPzh99
         C0MYC8Q4zCY8rZlNgPTMuAxniVWYewwg/7eFk189R0PZDRmQhGrWZJdQNnxqJXhRIi3D
         G2tse7xWt8n/uQmlpvQ54iB7MtnPZgDw36TtfCpLL0hAPGH48Qbuj7hWQU5dB33U1cS9
         ipMBL3rwRpgUkWXuQX+PJnrCpnnW7sdAALaTl4fhEUhT8Pqgnbg0yVIeuGmAWg3McHX1
         3HxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMir2M8rKYK2CvPJfh2nlooXDFcZ4KO/jD+8rWA5Z4LCh//M/NeQUcPT9Mfc44ZkmZ37nJueECsW3wNetU@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+yY29HRwXwAWZW7S8VEB6LXf08zKtLbsYhLQ0lkZmNJ01j6ag
	kcmTw8iWDJVDMGJ6A8+KwU9DbnZ9D9aFLJxF6YYRhWheXZ7QLGHmug+U68AmuA==
X-Google-Smtp-Source: AGHT+IG21mP+tUHPXSvJJJTKpKcZKw04O9Ig9Voo1lmCCA0A43eFT06NNMj2BNffGbxEca0hhvGjiw==
X-Received: by 2002:a05:6214:3a88:b0:6c5:b636:d737 with SMTP id 6a1803df08f44-6cb3b5b648amr195767466d6.2.1727697885829;
        Mon, 30 Sep 2024 05:04:45 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:15 +0000
Subject: [PATCH 20/45] media: st: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-20-81e137456ce0@chromium.org>
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
drivers/media/platform/st/sti/hva/hva-debugfs.c:74:9-22: opportunity for str_true_false(ctrls -> dct8x8)
drivers/media/platform/st/sti/hva/hva-debugfs.c:79:9-22: opportunity for str_true_false(ctrls -> sei_fp)
drivers/media/platform/st/sti/hva/hva-debugfs.c:77:9-23: opportunity for str_true_false(ctrls -> vui_sar)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/sti/hva/hva-debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-debugfs.c b/drivers/media/platform/st/sti/hva/hva-debugfs.c
index a86a07b6fbc7..5e8c7dddbabf 100644
--- a/drivers/media/platform/st/sti/hva/hva-debugfs.c
+++ b/drivers/media/platform/st/sti/hva/hva-debugfs.c
@@ -71,12 +71,12 @@ static void format_ctx(struct seq_file *s, struct hva_ctx *ctx)
 			      "  | |- SEI frame packing type=%s\n",
 			      v4l2_ctrl_get_menu(entropy)[ctrls->entropy_mode],
 			      ctrls->cpb_size,
-			      ctrls->dct8x8 ? "true" : "false",
+			      str_true_false(ctrls->dct8x8),
 			      ctrls->qpmin,
 			      ctrls->qpmax,
-			      ctrls->vui_sar ? "true" : "false",
+			      str_true_false(ctrls->vui_sar),
 			      v4l2_ctrl_get_menu(vui_sar)[ctrls->vui_sar_idc],
-			      ctrls->sei_fp ? "true" : "false",
+			      str_true_false(ctrls->sei_fp),
 			      v4l2_ctrl_get_menu(sei_fp)[ctrls->sei_fp_type]);
 	}
 

-- 
2.46.1.824.gd892dcdcdd-goog

