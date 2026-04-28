Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2746436352
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380089; cv=none; b=DfYyHlzpiKa6PGFEaoOb3q5xDJpei8YHRO3xbC+TOA8xij6OfEwDzDXJ3YV8UOI347CqyrFlLYbK5+/uBwKstbvx2wON0Ip2uALWK51031tLbzYVqwZnPxHSmCWjWZhlaf/+AmM+e8LZSDQusDTI4hEMMo6EtENa8unqSd7JxBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380089; c=relaxed/simple;
	bh=pRgYAG7i71lCsBAZBdT5Yr8NlqJWs3vM/Vy7RE30WSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2uRo7HJdoJ1IcdTdAtnSJ4tnerShm3dPv/kpyf6rP/rDRTiI3Zs/eWA/yl/KpkXWbDvsr3hiyBSXFnoQYLybk63r5pM9bE/f668POjqMqk+E3rz+5pkmz10yd8h7fiRp7dyzEJOuvokrywD3OXQ24JUqOMwiatX3WXDtVQgt4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AVFgZ91y; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AVFgZ91y"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so11242862e87.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380080; x=1777984880; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHggW5sbT0Gy3AFxkHr9GAwTW2JGfsyZeCtfl/8SYAw=;
        b=AVFgZ91yXogQcytLh8ul1ShaWX0BXm3UPwjIEOfq7JZadiPNuRvxAQk2H8F03aVbnN
         Vqi/tOsdepyIP4LZw3p4mwgz0gWIkIy/xjP+mAloup0gN/YOmEcND4yAIxVhwYHUanOr
         8IjLZqWEHh9YFYDz6knpo75/kcyIbRewmo2qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380080; x=1777984880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHggW5sbT0Gy3AFxkHr9GAwTW2JGfsyZeCtfl/8SYAw=;
        b=I4TPkOnXTRvLCmZm+pkFFGtGgONma5pIVIH+L35GiVcUdfNemutWZYW0tl2REqehJt
         mUoYPYgNRvsL7kJcTplJkwojrDmuh5GZNl6j8DYT9HNoY5JGfDmzOPnKfPaS/jRRLjHM
         dXuJBiUC/e36sePNmU0awm+bbfywR+UG/oJ9Gf/6gHQHCLqQGTo8g3dKbuVhU39+xBeA
         +/wUXabnCmPjkKpDkNSpucckA9FmMMMwDq0x0Uvd8//H8Kgyn6rJy7xSXrzYRTLtjFR2
         K9BV+jIGAfwQnh4BK5SVeGG9G83Ma9oRMcumGDHD7QT7o7ydOt7NIX5haFZp5/I3FNGa
         WNbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zmKxTk9k3bngjKXWJGgsDL0s/Y19NukoiB/zVDVp4T7XWORZTPnpOd9QLP12/uvWkwfaHVhmJrIa4yO1f@lists.linux.dev
X-Gm-Message-State: AOJu0YwB5S1WplJpiV3r1804Q4pvY7NCPb+b55/YdRSAGarPEBRRSgMw
	xY22aW2tgNE8jlUH9ZpMgjVw1AS/78FhtgcHyDwH2FkfOUKPwX6T4QAcCQMXXBkKRQ==
X-Gm-Gg: AeBDieupl7Np0y7X2na5ocrR9/QtCfA9fcOMR4Tf3TfkcDyJ7iCwX2TF4CRqEDcct+1
	5CuFqMU2E9vK0nlaXg2A52UftwHNIy+6D2x3DGN7FEghX+22B544Yqwp076LKOWMrI6wsxRhu1E
	ZAgzd99vkTBMNKVqcnsxo+Tuoa35tgv77SjoB7CPL66E4t/uMEIoF5z23/+11KMd0cUtBEE6pt7
	wahwnYc9eNAczPpC6sHIuOyiU9/P1rCEi0jJ1lCkF64gnMGj1BwIBmdNHrRvNSsZ+Bn2fLxq/Mm
	u3UsK1c5QowdcLjaoKf9rODuhP34431IFigVTqdaRXZXt/o4nnpAE7w1KRP8fq7t684ppV+mzdy
	F8yfYcb45nahiGRL1k7Wf2WWTxZz/EtnJ5zB259rROeTvQeUX5ZXnovPW+rHcLvJ2I2+zsfm/yO
	o1SN7/aPUPMaDDN0r71aIPalVxIJbPNSnDjrvlDdS6o9PIFiCuMZMrCcFilXFL8ug7Bw3PAqQLF
	5k5uCwrX/I5/Kr6mw==
X-Received: by 2002:a05:6512:1594:b0:5a2:c0f1:17d2 with SMTP id 2adb3069b0e04-5a74640b7ffmr1010015e87.10.1777380080486;
        Tue, 28 Apr 2026 05:41:20 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:09 +0000
Subject: [PATCH 3/6] media: i2c: adv7604: Add range checks for chip info
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-3-46890dffb611@chromium.org>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

If the driver's chip information is invalid we can end up accessing an
invalid memory region.

This fixes the following smatch errors:
drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7604.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 67116a4ef134..ae75982fb514 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3668,6 +3668,12 @@ static int adv76xx_probe(struct i2c_client *client)
 
 	state->source_pad = state->info->num_dv_ports
 			  + (state->info->has_afe ? 2 : 0);
+	if (WARN_ON(state->source_pad >= ADV76XX_PAD_MAX)) {
+		err = -EINVAL;
+		v4l2_err(sd, "invalid chip info\n");
+		goto err_i2c;
+	}
+
 	for (i = 0; i < state->source_pad; ++i)
 		state->pads[i].flags = MEDIA_PAD_FL_SINK;
 	state->pads[state->source_pad].flags = MEDIA_PAD_FL_SOURCE;

-- 
2.54.0.545.g6539524ca2-goog

