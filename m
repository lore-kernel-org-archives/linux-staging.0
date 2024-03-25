Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5DA153BE1
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376401; cv=none; b=js0nvx/UwxkmqL6rJvbgvpAI+94KIUeu6vdnftWreuF69u4D63OUJ/08lxcGV7Vf3FJExN0pirfwk9zYQncFoqjXC0Hwcw/UC+Ie7Mk0tkHy/AekjargaqUi9d+ZPj55vkXT/NFYwcmngMYGQjb/9FotuNdzliX76L5P0Ae9gv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376401; c=relaxed/simple;
	bh=u7jspQ3Aev3XJQiTO8vdl6msbbnJu1QvF4iX1a51EjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oeTzoupCMasI73fDnzMXypS03ihaca054Wi7OAqD4ERydHd3B3F+kIrGDPKf4CJNTOjzAQ0Qdq23QQvhyDT2QrtYS+/0EiZC+WXE1mWbGbpQOwQTrvMtNnYO2ELuQnPYxWD0U7qEzmntCb/jaGDIQcIE0K24iE1bkzMpWEf78BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SvIHHLlY; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SvIHHLlY"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c3d404225dso232896b6e.3
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376398; x=1711981198; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxSMnfcXo9eH24y0bZB1VjxXV/n6bBssF/qdkJ/8rO0=;
        b=SvIHHLlYh8hDrQXUo8EDjIeeEsGF/yppefKiw5yjzoPGgLE8XFY7N3xyZ2frYRqfJp
         hQt4mJlHsNs+gIo3RMlu9K83LmovsWRSNywXwr3y26J5ojqYOUbGp8I0n/+7259RiNXf
         o49tZXftXFpi2/p7yJYtfMI0Fpmz4T/4O91Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376398; x=1711981198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxSMnfcXo9eH24y0bZB1VjxXV/n6bBssF/qdkJ/8rO0=;
        b=AaGadY02qp+TshKfMvgsKb8tl25UvLdA7H52Dc+RbcoOW9LDbCh7FXKQX3mlm34wOl
         PvRMWg4QI25ZvtMBbT+hmTPY8l/2Y99rbAUtunsKozkewgeA44kmHBpr/ldSf//68XN/
         AmaZq29otBMhtM7OmgftL1ga4sroW2yqEVtjSVUYm+aIZQyCVdSXRuS+tiUr7jA8HGqR
         o0Nv/2BGyVI4AUW0zcMrkh0vk426NBkuZPiwcDtK4qsw7uth66yY6mElGOHbEvXNTtLU
         nf+SVuI4tfIRjPqhj3Lrtii6apW08iElHdirVSSlOAcoIKqR8/UUVMmOrZLTgr8b2qEO
         yaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN3lWpxqRAaJLCUdrLRKHXOOohUK7xsh2+m8qPLRqZiXj209fyBiXjdJV6uIpNvt4HHHD3CXAc1LNfN1fnWUCVbMRHHiqxxWTBIgueVw==
X-Gm-Message-State: AOJu0YxYCHENUiYNaW+w9WO2zsRbPMgGDkmvT1TSgyc1shso7l49LkdA
	kiGZpy4WXgI4ywfW1fjoY+R7/sXYJv4uE8qlnyUgPWQM/PYt9ZFJvUdJKKdMpKWBR+f2niaoBgU
	ucg==
X-Google-Smtp-Source: AGHT+IFXDkHwTGNUZBxyMK2jzEutUrDBtNUTzl+YFRneAkQppTPw7jEE9XRF/qu3laG74FPOuty29Q==
X-Received: by 2002:a05:6808:15a0:b0:3c3:c923:4f03 with SMTP id t32-20020a05680815a000b003c3c9234f03mr6512221oiw.19.1711376398398;
        Mon, 25 Mar 2024 07:19:58 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id br11-20020a05622a1e0b00b00430a9b20a55sm2618759qtb.69.2024.03.25.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:19:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 14:19:55 +0000
Subject: [PATCH v2 3/3] media: dvbdev: Initialize sbuf
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240325-gcc-arm-warnings-v2-3-47523cf5c8ca@chromium.org>
References: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
In-Reply-To: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Because the size passed to copy_from_user() cannot be known beforehand,
it needs to be checked during runtime with check_object_size. That makes
gcc believe that the content of sbuf can be used before init.

Fix:
./include/linux/thread_info.h:215:17: warning: ‘sbuf’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c             | 2 +-
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 733d0bc4b4cc3..b43695bc51e75 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -956,7 +956,7 @@ int dvb_usercopy(struct file *file,
 		 int (*func)(struct file *file,
 			     unsigned int cmd, void *arg))
 {
-	char    sbuf[128];
+	char    sbuf[128] = {};
 	void    *mbuf = NULL;
 	void    *parg = NULL;
 	int     err  = -EINVAL;
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c39b52d0e4447..630e2ff987a37 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -164,6 +164,7 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	unsigned int input_mbus_code = chan->fmtinfo->code;
 
 	(*main_input_format) = VI_INPUT_INPUT_FORMAT_YUV422;
+	(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_UYVY;
 
 	switch (input_mbus_code) {
 	case MEDIA_BUS_FMT_UYVY8_2X8:
@@ -176,7 +177,6 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YUYV;
 		break;
 	case MEDIA_BUS_FMT_YVYU8_2X8:
-	default:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
 	}

-- 
2.44.0.396.g6e790dbe36-goog

