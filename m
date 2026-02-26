Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30EC2DEA74
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092144; cv=none; b=Jp1h0spzEDBv6phYqnJks3Sj4aAA+kFeMhfVgQh0tcmLicR7nB4nkPbKegq/tREEeQw2OX8wcJgZm5f5X9OE6k6TDXguiPJocQUO9v9M7IZ14Ci2IMrDHW1/haDCkLEO3u5m+8kwirG91pd5QwRY5VDQLkGOj7LwcB2GL4+CujQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092144; c=relaxed/simple;
	bh=3Y1sRV66tPa0iCH8Y7SbBFhIlTW9UBOtVElNQxJXw8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucEAk0hFpioELHw/u38xU5UZbVs1TGRSbkZdjiHVRSYKaj179y7WrKPMbmFdcSk2UN8CW4kz030XKgHkj7oGIimllL+wlQMPbQo4FNV/HIKCoXaS8GkDI8hAhT0t+Vz2F1uuMufEQZcBZ5jVfG3Nrm9IM2g1IEMKI7yAfzKJ86g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgjA9xQA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgjA9xQA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4398f8403edso400580f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 23:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772092140; x=1772696940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Obp+jlj4fAJJnC5C1xFGFcA2X3tdhF8x/67LbIKcCNc=;
        b=RgjA9xQA7UOaUGWEjHEb2J0jdSQ3+l00YEqlVidvBpcrJCRrIvKZEjHtNrIs7oZzom
         Mtl9bG23i6Zyu0XaLXgXg/buo3QFdhuJJB4fPLBo/fsEQ4xhTRWuJR2e0oua3pxOjR3F
         TnWRWIg612W+hLJ5ltjKIlLQwystzweDjgHjQaS13tuXtUXalUAmYaGt3bufLUd3ISq5
         itSCgbOf1oFX9dGBrACj6CjzIpYqOt9xuKzRKdrS6+DnzH8kmsxB6zV6FIzWkjhUxt7S
         Url/xslhKVMjejrym7TRpQNqTYqEdsxpfrR8hLb/noPiLfpCEalEyR/0aZhIYCR7ZT4r
         ZJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092140; x=1772696940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Obp+jlj4fAJJnC5C1xFGFcA2X3tdhF8x/67LbIKcCNc=;
        b=O4PhK04Z4pU7UXh/743pn7sRBdesCNiGLYGZCoerpdj9nW7+GRf45Dl9smgHhvkvm7
         gIA0BGwJgcqBQaNnrQRB4lL4WYvbID/Cr52CYzbmzTuD30S9W7QAtkA+Y9TvZ2Xw0qW5
         Gnm6kcyxTAZussOS1Crs/teKKwZutGKP5G1EIxa1UcOUCBVkGAf4KTP1vsrLEn5g/0uo
         TVzQ3B3x9i1JcjNoWcOLS20DxxS5yVnrsG6oMxgp5W+oV8Ai0vIt9UQjMiLbBWbbTmqz
         9YRe9qzgfMeboz5soIv0M96KC0tX7O6lqNyaOPNVJCdH3yAHAeasaSAqg5L+jbfmk9Gf
         TKNA==
X-Forwarded-Encrypted: i=1; AJvYcCXr96zgQML9fsXNG+OzhNikBRT73SEw8LFj0balpJGBGcNvhsAUHDXqx2DmoUyMxCDJ7kEdk01s2xIu5hRB@lists.linux.dev
X-Gm-Message-State: AOJu0YzJcN8RGUBCOYo3dIGbw/keKpxmTD+DSKjp1UFjErKA+dqJtw/i
	eimYbMdY3s0V6Js9JzlZ4qJO7AmCovChvu6LjA1c+h6IT/PTjFKXdELe
X-Gm-Gg: ATEYQzwSr9mchfZWpFANt6W0OsbxD1Sv6P94Am8LJY3TTgUg0QK+9ReGnX00BTlOUL/
	1gpWXlL/+uezDwTQPN30qeDY5HZInECiEU3V6mM7pLFFcKFCc/QG7DSojMETWyxsDC4wPMJVJ2p
	reK3U/eaVamzChobvGKmx1eI+Mpy08RhLhSwz85FqiqQZKkipoNOBcYpno7WXOPysokLfWs8ZnC
	LCdsDDX20pFkveoDv29Az0zppAVnciZlpufaBLh8vDQzxnREnAuwZir08e+LbPFlbMMSYDYXMJC
	JZV399RTjG8o9FNOcHK9y53iMFGwB47ZeaHx5dNN/8GTIZtISCQaiOp97zYYB+HH8/s6MzOz89F
	oZF01mT6aPOjc7aziEUacBR8UqBm7tCODV0pQGfBs989po33/RtzBb2nSuA9diPGCG1XcSkwAIA
	==
X-Received: by 2002:a05:6000:250f:b0:439:881a:656c with SMTP id ffacd0b85a97d-4399429ca55mr5857411f8f.6.1772092139934;
        Wed, 25 Feb 2026 23:48:59 -0800 (PST)
Received: from kimsufi.. ([2001:41d0:303:6f54::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa015sm39244229f8f.8.2026.02.25.23.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:48:59 -0800 (PST)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ruslan Valiyev <linuxoid@gmail.com>
Subject: [PATCH v2] staging: greybus: arche: use sysfs_emit() instead of sprintf()
Date: Thu, 26 Feb 2026 07:48:58 +0000
Message-ID: <20260226074858.67635-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225212955.57102-1-linuxoid@gmail.com>
References: <20260225212955.57102-1-linuxoid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in state_show() sysfs attribute
callbacks in arche-platform.c and arche-apb-ctrl.c.

Checkpatch complains about code using sprintf(). This code here is
obviously safe as-is, but it would be more appropriate to use
sysfs_emit().

Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 10 +++++-----
 drivers/staging/greybus/arche-platform.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 33f26a65f..19a6e59b6 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -300,16 +300,16 @@ static ssize_t state_show(struct device *dev,
 
 	switch (apb->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off%s\n",
+		return sysfs_emit(buf, "off%s\n",
 				apb->init_disabled ? ",disabled" : "");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index f669a7e2e..de5de59ea 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -374,15 +374,15 @@ static ssize_t state_show(struct device *dev,
 
 	switch (arche_pdata->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off\n");
+		return sysfs_emit(buf, "off\n");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
-- 
2.43.0

