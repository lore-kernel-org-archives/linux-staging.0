Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00DC1BB6AA
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430144; cv=none; b=P+k5yCHDaCcidbANObOMcmF0NVJe5KTDRc1Yo7MJGB8F81Kf8WTCbfG2iAV8i3MZPA4T5O0UofdbdcDTQR3Vxoce65Au4/p31JjTcrBaQKGYr55RjJmtTSfFL52mxbqAcVPGZS4Q1/3WDYmEYZdEIrFXwRyF0Q8r0bTRiibqDbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430144; c=relaxed/simple;
	bh=kCl1YSqZuUUZDtGA+QAZtwsRUo5HY0IPZiSWxLVmfm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qwAPCEhjfS7vcatM6wX3oE9fQEf8+3bm5pBjvVnteSGTA4LkAKBCKMvFkFHTajJzKBn8ldywYBHiF8svGhGHM4rYKX3nmMw2XVoR6je87yHhpxPhS9kJPTPu1+bpgCz17G2SkLsbQ0STgXjedraW6ALNzOniWt0ZxZqBKxl+17Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hnLPzDg8; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hnLPzDg8"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cb2f271043so17064176d6.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 02:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727430141; x=1728034941; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VINaQxL9vW722McPbfM1p2Q0+fZYKttm/dJVtWO/GI0=;
        b=hnLPzDg8Q4h/ugdLN3Ob5xJMAHSreZaLQuUZbv2zeMS/2Q+9TOfkJ90GPJFK+4yu1/
         rxFJaHoQtnoJG31kITwgIZCrr/274HyVRuQMi6OVN7zs7b7EqsK462P4sOq4uSu4dc/W
         5qh8GHVOF0Aqhhk/TezYgU9YU5bCSvKL8my5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430141; x=1728034941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VINaQxL9vW722McPbfM1p2Q0+fZYKttm/dJVtWO/GI0=;
        b=OeS1tUqG1swpHSVc2fFbmvogFb1GyycTGj3KUTVrM9a2FxKJe+KJ6wTeq4H/Faucpy
         7nX/OnE6y1xNaIYyAjTT+eTx95J0ofF2II5pSlIqQ0jwQLjpIE/lBXS+XYx9psOLobmU
         vbzy7DvKhHCW/9TYCkeMlrLscMypef196LFpToKle0ZJ8xXfU0dsPUVrT7eEnw2U9Ck/
         NN/7Y2FySOsaczq/gUyG3daRO3cyH8MM4DDf2nAxMDFZWSPJ2N/kw/BckoKLSPUPt+IT
         KjJcQ4T7n4Ygo3k0By7QclruCQS5ENi6xi0wkaWBklkYQ/E/CKJw8tjK6bgzinQtv9qW
         11WA==
X-Forwarded-Encrypted: i=1; AJvYcCXg3QuRcYRv71vjToRw/Ln6wAQUVC+LC/qt2d20+TOHvGET4b0uACZ7g3rcig3SxFaPHUOC+OczZvYiqkn9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4RnedlDh40uBGntl1oLnxVziD/oalpvvl0WgwlYptD6y2UDPN
	SALxfu1JBxOO0kBjENTbSBT4WbW6fZItM5liVJqoJQGOvWb1iS0z0gv69VV5RQ==
X-Google-Smtp-Source: AGHT+IGGsdMZl/i8EG8b5Z1JmOsFAyZ9WklfULMXZz5d7lRQYLgXR1nLV+QVTf216ds3TwRWII3bkw==
X-Received: by 2002:a05:6214:320d:b0:6c3:5a89:9998 with SMTP id 6a1803df08f44-6cb3b60fa9cmr33792876d6.23.1727430141573;
        Fri, 27 Sep 2024 02:42:21 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ff594sm7231606d6.14.2024.09.27.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:42:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 09:42:14 +0000
Subject: [PATCH 2/3] staging: media: ipu3:Use str_down_up()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-cocci-6-12-v1-2-a318d4e6a19d@chromium.org>
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
To: Benoit Parrot <bparrot@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The str_down_up() helper simplifies the code and fixes the following cocci
warning:

drivers/staging/media/ipu3/ipu3-css.c:229:18-47: opportunity for str_down_up(state & IMGU_STATE_POWER_DOWN)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 1b0a59b78949..bb22375481a0 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -226,7 +226,7 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
 	state = readl(base + IMGU_REG_STATE);
 
 	dev_dbg(dev, "CSS pm_ctrl 0x%x state 0x%x (power %s)\n",
-		pm_ctrl, state, state & IMGU_STATE_POWER_DOWN ? "down" : "up");
+		pm_ctrl, state, str_down_up(state & IMGU_STATE_POWER_DOWN));
 
 	/* Power up CSS using wrapper */
 	if (state & IMGU_STATE_POWER_DOWN) {

-- 
2.46.1.824.gd892dcdcdd-goog

