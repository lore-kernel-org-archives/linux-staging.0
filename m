Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE97BB19
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520162; cv=none; b=th3MF4SW8vYmbvhyjy7+1pkXEw6o8W0e5EKrTr4TMHXfp6XVS6+d0KFlCh9pPYNx4qr5WBjLm/cjjBJUqsiZTMx37L5ru9Xu9XKECFfVGPXAex8MMLZsYn8Fc7D9fdB7H4yuu5PUncD6Dq58DW+Dg6i3+TK0O4pPD/GNULVsOqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520162; c=relaxed/simple;
	bh=9zM0Hr1EOWa9tBCrj0oU1BEsI1sH0P8oKQcejd+0WUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZVn47B51DVk/SPnXZJaWH+TMLOA1McrxZE6Ev/f0xbdBMIOOoAuT/uQcNn2XHdm/Q+jfqAJcbqrV2imZly398yffag6EZUd1rqfe6fNkEnh50foowqfMpr+4RSMaaHfImXEm7KCLsBxQJLp7EvyU4TVtCHYLuuE1idmn1vnCUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ES/nLiqD; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ES/nLiqD"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78efd533a00so105603685a.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520159; x=1714124959; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtlViaUk+ppF2YvB3wdQyftKniyUzK8Ej92YBlwMILc=;
        b=ES/nLiqDZeBXs01iVHNhtEYWER4f6YHIYqbWNi+wKbgKiMPVDIrODETFcjPlvhvyiF
         slD6MInOW6BNJof7N2JV0bkI/PJtE5oKOKqstvh/Gxq0P5/QAPUnv8MK+w/zzynvKiQ+
         E4YUQPFCZNa9/4o/MFABbhNkW1Pq3d13RHs9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520159; x=1714124959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtlViaUk+ppF2YvB3wdQyftKniyUzK8Ej92YBlwMILc=;
        b=uYo5RUSqGeItEEDJw1lbdkgKm56frShtAEiyGaSg3RT02Fbqk4PGZvDJZO3bJFUxPN
         zvb0+56npxvtraWchaHRl3EoqgkIEVR6chsK3x80b0fMQAadYAjZ1PaqiplnoSnHVyWB
         GFkY5oXde7XuG5d/10jh6qfi6MXzDv2LwsQuiy1jy2kPCMOj527prOpeFVvpo0PcrhGx
         LSvr4y9ggoWfD5y1BylEj3BWpkHvQ2yYu174D4hVZWExISp6nZIDt2aXqffo5ssZkxxe
         JGd2J4JYIjAzrNzb6sTA28EjqPAb3uGlz1ikAECWjaUeeaxkyALjSR179bnLQVujxOD1
         syqg==
X-Forwarded-Encrypted: i=1; AJvYcCWoiCdUFzFiPP2K5mDbwtN4NgSGRmhWtOwyglFZvCY8fhvI8kxL5uXzqiR3iKDfk+cI62nJ3edshT4A+zTV2jAQTfmteD/O9WOF/svHtg==
X-Gm-Message-State: AOJu0Yy6vD/KqtOWvQGBmaTXjaJBqilznAmt1Tx/4mYr4g4glwg9ISTs
	8iy1nY4KjY/QndlDnvr6Tl9Wbgng0W8rAFBIdbQpRC9osCsjUpbP9UqwJ+3x1A==
X-Google-Smtp-Source: AGHT+IHcSLXPGR/K0waZNqFgMaXNzaf95X9YYFUFUCHgvEpSUHJvLAV/8QVHrr+4o4OmwTvG9tzrkg==
X-Received: by 2002:a05:620a:1da6:b0:78d:5065:c5df with SMTP id pj38-20020a05620a1da600b0078d5065c5dfmr1595944qkn.18.1713520159351;
        Fri, 19 Apr 2024 02:49:19 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:47 +0000
Subject: [PATCH v2 01/26] media: pci: mgb4: Refactor struct resources
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The struct resource end field is inclusive not exclusive, this is, the
size is (end - start) +1.

Update the definitions and use the generic resource_size() function.

Fixes cocci check:
drivers/media/pci/mgb4/mgb4_regs.c:13:22-25: WARNING: Suspicious code. resource_size is maybe missing with res

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/mgb4/mgb4_core.c | 4 ++--
 drivers/media/pci/mgb4/mgb4_regs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 9bcf10a77fd3..60498a5abebf 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -493,13 +493,13 @@ static int mgb4_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mgb4_dev *mgbdev;
 	struct resource video = {
 		.start	= 0x0,
-		.end	= 0x100,
+		.end	= 0xff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-video",
 	};
 	struct resource cmt = {
 		.start	= 0x1000,
-		.end	= 0x1800,
+		.end	= 0x17ff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-cmt",
 	};
diff --git a/drivers/media/pci/mgb4/mgb4_regs.c b/drivers/media/pci/mgb4/mgb4_regs.c
index 53d4e4503a74..31befd722d72 100644
--- a/drivers/media/pci/mgb4/mgb4_regs.c
+++ b/drivers/media/pci/mgb4/mgb4_regs.c
@@ -10,7 +10,7 @@
 int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs)
 {
 	regs->mapbase = res->start;
-	regs->mapsize = res->end - res->start;
+	regs->mapsize = resource_size(res);
 
 	if (!request_mem_region(regs->mapbase, regs->mapsize, res->name))
 		return -EINVAL;

-- 
2.44.0.769.g3c40516874-goog

