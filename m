Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A9C158D94
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209674; cv=none; b=GyO0ZSYwcYjxi6K+V/UTNjN7t8HndDR6Kd++qtC9D7GIsLx5GZGwY/tTcP2LJziSHPva54Hrwme354bK9KKUM4XRcLmtNOyUMihUt+LVLAP4xkhqSlV8t93lKQ7wPa4LMi7rMWC3+5jW9bxdzOjJo6ar9l37Y/HKHsCu/gf+qrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209674; c=relaxed/simple;
	bh=pkDHUvzM/3se4qU8yUrUNq79FeC7MKupjn4wDvpoFwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxVVUca38Xu/swG7DmPS9tzvYdooxQ97kIB8AlkiB5Bb/no0WU66lhLUYCl1hADe+z/4EWQHfe8DcjnO3UfR5rS9lXpoIrWEHdZu92kuG5jPr8kWH4+bdmCtdOk54c2GMeTJ6jiPMMyfnPe/qcIt0Uog5ijPQW8XtGqsSfk47eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eVxw9en8; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eVxw9en8"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5aa1b7a37b3so2245799eaf.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209670; x=1713814470; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq+7mr1szAOvpscJpegvOEKeeaK/lFJAotzxeoFP90w=;
        b=eVxw9en8PHbmR30a+51nFOJDwaNrqsyktFG2YQqfzgezsHJXShfKZjBPC2fd6NBr2b
         /O2MqjpgVaebSfBYmgEYWYP7gieuqdv1xvpNc6Os3uukGIUXnbZ22Ac4420CjAiBtb//
         e0bZJwwAzRbY7NVq3Gx5upYZCB78oL09qzaE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209670; x=1713814470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vq+7mr1szAOvpscJpegvOEKeeaK/lFJAotzxeoFP90w=;
        b=ex74+avLEPfeedjfktnrw9b6AMSTienA9V1nbY8jqLfaFbNdoLP8Lj41BGGQTacR6t
         cKJ/nDBsO1gBMGZTdo0A/18Rp+KLizCqz01pHu7ADQ5VoQU0yQxUPMthLvItjb2PuyP5
         CE1Hmp8BgqzIadhhd+5aTFlpj8RCo5mim+RDrLKmjcaQC+GXyVd9k7R9spOzfcuBLnHr
         FhywCt6NO25piwvM0yOF+JAJFGJahHNn/5fTsQJry+lU1jVqReRimBB5rsdxuJdBjVHa
         1B5OIC9Z8KJmJFQRtr4ImP38HWEsbWtaoPrp9MvasFsQ0WEGWu66wJj/kDrA02wQN9Wc
         Wh3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvt7FaA4TzqyFkuf5sEJpG9nJkVfrkHCeWxSdsE+ugsIYonhd9Jf/1XZ1m5tPbFpMHCxpasMS0Q/APwRevHAalVv6BxY6Qzhp3v/4NSg==
X-Gm-Message-State: AOJu0YyRvYieuc386Ses6tlKIj9ulvQa5Z6JkST/gmd0aWTEAJ5sthzP
	wSYz64CAn8twHmjfSMwBWrOLiPR8DzJB80DIhaYmV7zuC++PPGhCFpn/M3udUg==
X-Google-Smtp-Source: AGHT+IFDs72yHh14dMP/v3LcOXYq1AzGZaPkrHXx/btoSixg8uGduMLiI7a2hIPG7rGea4VcIV3D3Q==
X-Received: by 2002:a05:6870:9a97:b0:22a:2e6:b82e with SMTP id hp23-20020a0568709a9700b0022a02e6b82emr13491647oab.38.1713209670403;
        Mon, 15 Apr 2024 12:34:30 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:20 +0000
Subject: [PATCH 03/35] media: uvcvideo: Refactor iterators
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Avoid using the iterators after the list_for_each() constructs.
This patch should be a NOP, but makes cocci, happier:

drivers/media/usb/uvc/uvc_ctrl.c:1861:44-50: ERROR: invalid reference to the index variable of the iterator on line 1850
drivers/media/usb/uvc/uvc_ctrl.c:2195:17-23: ERROR: invalid reference to the index variable of the iterator on line 2179

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..a4a987913430 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1850,16 +1850,18 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	list_for_each_entry(entity, &chain->entities, chain) {
 		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
 					     &err_ctrl);
-		if (ret < 0)
+		if (ret < 0) {
+			if (ctrls)
+				ctrls->error_idx =
+					uvc_ctrl_find_ctrl_idx(entity, ctrls,
+							       err_ctrl);
 			goto done;
+		}
 	}
 
 	if (!rollback)
 		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
 done:
-	if (ret < 0 && ctrls)
-		ctrls->error_idx = uvc_ctrl_find_ctrl_idx(entity, ctrls,
-							  err_ctrl);
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret;
 }
@@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	struct uvc_xu_control_query *xqry)
 {
-	struct uvc_entity *entity;
+	struct uvc_entity *entity, *iter;
 	struct uvc_control *ctrl;
 	unsigned int i;
 	bool found;
@@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	int ret;
 
 	/* Find the extension unit. */
-	found = false;
-	list_for_each_entry(entity, &chain->entities, chain) {
-		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
-		    entity->id == xqry->unit) {
-			found = true;
+	entity = NULL;
+	list_for_each_entry(iter, &chain->entities, chain) {
+		if (UVC_ENTITY_TYPE(iter) == UVC_VC_EXTENSION_UNIT &&
+		    iter->id == xqry->unit) {
+			entity = iter;
 			break;
 		}
 	}
 
-	if (!found) {
+	if (!entity) {
 		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
 			xqry->unit);
 		return -ENOENT;

-- 
2.44.0.683.g7961c838ac-goog

