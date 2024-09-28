Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786013E41D
	for <linux-staging@lists.linux.dev>; Sat, 28 Sep 2024 17:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727544258; cv=none; b=o7ORVd6M7UY9GSktzhVqAbJrj2TXbs+mbwCXlbKMcRznWpMJsuVYYNeiCKrFJjCMev8F9HKtXPahjJTmW4SR9+UgIdi3SCCiyIGsaCxpoaRRfeWPenyQMvS9vDFZRFjPw65UfFZVQ6ODuPNueckHDEbHFDd3f8REtj9pT25m1GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727544258; c=relaxed/simple;
	bh=PTbEhgOwL2JzDldEWOrtkAWFRntEHE0H3eDBOM54qRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HBa96uTts7SwT+e1GqjCEO0xXWzyizVeZA4ysWkhEGi3Kl2b22IENGnlvyQH5ibsvrubbwzSQodKP7tzIbAiTmBr8GVp3uHTyFMWaGT9La3EpOT+mZI2ruIOMPzbibUAD15xSVtNkIsYlGpirH08E/J0JsMSSEdSQFYKRcztM7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lnulRMhY; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lnulRMhY"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cb2c5128d5so21885706d6.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Sep 2024 10:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727544256; x=1728149056; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1m9W940jAO+8Km9/nF0drShVWDtg5UbNpWglt9zOgsU=;
        b=lnulRMhYJ4xRKGIe+Va4bM53V/EmMzFBo1qcYqScW3uYtBiRKyhhmGHE3cr4O+TFpu
         Ts1RFlBs6TlQTjgR5kU9zDbwJ5+16fYMNpNZsJ5BDrI3qEdeOhT8XvCIhxjwx7mDD7wk
         GGZtdSZkRmyxdpNX/F1R6iRb2kqu4TnulvqlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727544256; x=1728149056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1m9W940jAO+8Km9/nF0drShVWDtg5UbNpWglt9zOgsU=;
        b=VWvutH8ABF1FEffM5DBcwY6HvlUGANwbGlQwTUcMXYoN1Y11oVkmdh1ZDvgt0XM/Jq
         +4tjni/mgeHbtbK9ye4BM4cKIDCmOhBqs5EdF09ND6fu8T6tCH8ZlfdFg/EiyCjIbb34
         p6sbXiBhLdyzgjbC8B5h3/kOHdqhT9f6HOaMiqFlfjftHOwHYes3ZKssnwjvKZHJaMar
         lcHRjrbVINHyb2ksU1PTvvFZxCcJeJNlElxCfuTlG4x+zpgkSOMDILUUFez42qpYDO5m
         y+hD1f+cRanPTk6t8ct9hE4ZIIvJw4seAMP44NuRKsPI8f1coFYLdckTz5VzkF8AsY8C
         UKmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0xKZyMajH8ef4WBsLMEYMwHuarws+BNKvSb8aODP+SMF5MTzNPdjvZQrvBlJxxcMlIllq/YeufQpDemy/@lists.linux.dev
X-Gm-Message-State: AOJu0YyKwI5fiEe1l0jQZNInR9hlr9IPNbsZyBWGUfh8Dx5GOGmqabWS
	iy1Fz76MNMRBGVnVeHDNaCWwzPsUHjhei1jsty/hK+PsFFxDNN0L5IxA+1k6Rw==
X-Google-Smtp-Source: AGHT+IHUubRePPbps9nQLaIqqpUrHOtrCXulHR+FT1p2sXm+rpX8Vvptl7dELgS+F8WL0gXGOOf3Jg==
X-Received: by 2002:a05:6214:3d0a:b0:6cb:4225:d85d with SMTP id 6a1803df08f44-6cb4225d9bamr101605986d6.1.1727544255950;
        Sat, 28 Sep 2024 10:24:15 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b68311dsm21437756d6.122.2024.09.28.10.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 10:24:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 28 Sep 2024 17:23:59 +0000
Subject: [PATCH v3 2/3] staging: media: ipu3: Use str_down_up()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240928-cocci-6-12-v3-2-53fc5ed20be0@chromium.org>
References: <20240928-cocci-6-12-v3-0-53fc5ed20be0@chromium.org>
In-Reply-To: <20240928-cocci-6-12-v3-0-53fc5ed20be0@chromium.org>
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

