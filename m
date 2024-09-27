Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3A1BCA01
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431368; cv=none; b=PGw8gy3bbz/dDj7Yc6WL3D6FOhcM6oR+BWU/HVk7uRzqK9FOY5eGlcgq41cwskDAU6QtAr7MGl3cJPmqpF7sE961zkh0t9bIWaIhaYTNHR5fr7gYxcqWBsTQd2IQodMqBBsHW3WHBM8y/JBNPKWA6gVO5xDubX+R+lErYpYMwHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431368; c=relaxed/simple;
	bh=PTbEhgOwL2JzDldEWOrtkAWFRntEHE0H3eDBOM54qRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0YlIo3QNreXqR1W4/IQilH7BFQ1QapKK2Zf/HWZAE1m/5x4CuX0/F70VGgaC9qaPOGPmUTyWcRJUOeMffSD+cOCypNuq5Pj4Nyn7590pMh6OUzb4mZPyVKMX2fMtjHE0f/vDEJKA7h23Sk6wQW0dr+NOtkE72H6dK3fgIiQUt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U+ByW0cK; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U+ByW0cK"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4581d2b0fbaso13155731cf.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727431365; x=1728036165; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1m9W940jAO+8Km9/nF0drShVWDtg5UbNpWglt9zOgsU=;
        b=U+ByW0cKZsGWg4XlO2+QyhXR370nORXuSRAL/z7hvypgiuxLRFWzAk2j/zaZyelAjm
         gTE/W9DDRNjOowblAlw0PdIz9fW1QckwDSG+Tvvj1Ck1sG74gEF9gLbO19DjbYWMfU7g
         EnADQ9+rntGxynrPUw121N8Y1o3RizdH1X4IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431365; x=1728036165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1m9W940jAO+8Km9/nF0drShVWDtg5UbNpWglt9zOgsU=;
        b=KRg0sc3zrboBJBWeYwtwVPdfLbz2tMlZpXk2PVGjRVlP56Vpep0qVaM7MWkEBXUoxP
         QWgpJLgh8cdjSjgVsmG3PbU7A0V35VdTTwk0GgUNCAcudIH3RbSJZgIIl0mLQCwtyxSw
         zN3QYZMDSXkD/OK/jt8RAnPEmfM2QxDc+tnZ8kjFhj+ggf7t3Zxz/OfByUJDFk6wlqoY
         hy3Wwxoz8PSreZwQKydcBGdTmJ7ttf7ap1fMes9Hl41Rd7gx0BQvHlOeGmvM/9X0ENnf
         lYqHGfP+KNjZlw4p4TLG+4bffmbelk2EczBFt2rkNgD2t2pw5eIOkFBkCIZE5e4qe/N+
         t+xw==
X-Forwarded-Encrypted: i=1; AJvYcCW6AHAhzl8tJUTSmuwoy8NvrYaV/r5l1CfzjyFPoBC6lvvlew9kwPk9Nx+gRR/PWY3KphTkK9HA1UvW3JSI@lists.linux.dev
X-Gm-Message-State: AOJu0YxeQsP2yggqJCsxLWG1hZXuOtVpBVyPIV6BfoAI/VTT2p9itJ4N
	Itcc1adqUhQXrS/YV7wRreaAYxqBTebYNYfhKc4XM93yvXhvLcZuah6oal6Ejw==
X-Google-Smtp-Source: AGHT+IH2sKCy00o9ozG8YLnnklYCCyOzAtra00mCyeon7eku4D7Kt0x2E5WOjSuFyndy4gbIgtSOMQ==
X-Received: by 2002:a05:622a:1186:b0:45b:6042:be44 with SMTP id d75a77b69052e-45c9f270f47mr35119611cf.42.1727431364785;
        Fri, 27 Sep 2024 03:02:44 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f353f08sm6341091cf.94.2024.09.27.03.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:02:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 10:02:33 +0000
Subject: [PATCH v2 2/3] staging: media: ipu3: Use str_down_up()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-cocci-6-12-v2-2-1c6ad931959b@chromium.org>
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
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

Reviewed-by: Andy Shevchenko <andy@kernel.org>
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

