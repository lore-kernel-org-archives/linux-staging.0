Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A972367AC
	for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 04:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768624265; cv=none; b=LpV0TH6OLTSrfIcw5vdJd6HdY0k5hdfLqqAUTRh9SZPoeR0YGKuqPIq1hCvMzddbEUVd2K3UO3d1sNfZyyEU0gZ/YsQeH4DS/cd/EZpcb55eENZtiVd7PjBNc/pGFb/AwgQJhB8ErV0NM12JzAcZGEVlP21KOgoTOgxg4yZqKOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768624265; c=relaxed/simple;
	bh=uE69x94dEWXAgSGtMUCZSUPtE0Tydj3bf2EuX68TmvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nh3N+4CvMl8jH9sX6byQIDd6gQHOXhFScUscT4LQpLgXc6ncI3ZFzu4GPR4yZKw1tb7p/U+oAZkKmKDmjVaayc6A5tPvVa41PMdPtaQQT5QvAzCzorPY0lLaZYLb5mexuIHBvq7qt74h19ItXbQMv9995iSym++uWY4runPYb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ls/L24Es; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ls/L24Es"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f42a49437so1441344b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 20:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768624264; x=1769229064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2w/Q0mSJAiu6YE8Oa45NpmmddauxEQc9oB3CUI6p98s=;
        b=Ls/L24EsxWVQd/UWXZX/aS2XecU3/Wi2/OUpW+mXNJ110ynfNwXclV9kOvfjq+6dSP
         P2Xh+E44QF2Cv1EVzxwzusoEijeRGKUYtCjuZH2DgJviYi14bPzXcmJXC82kvKI+gF91
         DSHzDZrdARgPJ5mHQDhDsGlNWO1gv3vh5Oad3g5kh66C5oGl3lHcsZWnaBKjueoaCv7a
         he2Y0Hl/6vzl5lH8qt7NrEGB78gzyQU2WYOKo6lXhAFHgcvI1A03zpEWuXrg/FnS760X
         QVy2koEQIoJI78WY/NAlLXbau4acyP1GmelZMkw48H9W5bpbyDguaitbleJFlCh1OmR+
         ycxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768624264; x=1769229064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2w/Q0mSJAiu6YE8Oa45NpmmddauxEQc9oB3CUI6p98s=;
        b=Lu2OpXIKUYwBgIA6gDzMw+jfjclDx+C6XNxH3B8slQDeuJEo5Z3GbdCc1fXjc8k9BA
         XhldlrKBYRH8ec3kdD6rTsAR+notKMIhXsmFDjhUH4fwDzRC+qnN+ZKwT0BAgcURt6+0
         WrXC6ItoeMJIHbwmQfe4WtcUJpO6weufyIGZT+6RsGqhUyogjQjQ1Wz1Wzfu2CF5ES21
         08M0dA8hdBZe9b9wsNYwsjSSlttiudzs/6crSRFkTKleHTg2M4YMRHD1TM/TlbNnvUAn
         hcDsFt9bhgJLvIgZlzVnWYO43fuShvPpDftNW5UkbAz1j6yB4LhoGzqMelVRdfUS/qTX
         Wp/g==
X-Forwarded-Encrypted: i=1; AJvYcCWrKAW0SoywtwZ0+d6gn5ORzPe/DFF6va60OUCl7XbAd93pjPkjTmC9ny6Q6aXISDsek9DDgzMyMQHcptfV@lists.linux.dev
X-Gm-Message-State: AOJu0YwNRlKR1FllPEc7KJ1qPya5QEIcKKoSDGrlGWz9bgmEkEN0FxWS
	VTahH5f+VYnuR8Ketfw30gsewxNxfBMILpfSkvKQ9vwaSVVmi6izr8ha
X-Gm-Gg: AY/fxX5sCSrdTqxIezoQ5P2ieBRQi+n5tb7QlvUH1IovLvVRqgglQ00jiyjvH5m5WBx
	AeHb4+ktKnORkiiJmsQ++EcfCsWery1MI//WgHXq0MzSxnfLRbWFLGvINJpLnbwtwvW7d3sTm6t
	wcYOgVsXFsp9IIfp+muU9OlHjpgryoTNVMYyYHvozD34XwvRYO8N9/E33X0Cte9txKZeQrXAlq9
	Og26NLKpB+FOdPAJ+Fz8nao3fIIablMacY0JazIxkAF2IP2XnShcjtpMcyqnjfXn4xNjUDaxyoj
	LjCrp5xoNsKFKJeNIbnktQABTcm+AGqah9fcBoGpJLuBcahPbmhIkOTBwCoFG9jUpLXGFTyc4O/
	CqKIrQqf4tb3aeLI8HXy1Kw3eRpLubbkpvuk8Q/u9he939EY6/AKwKtisv7A6TFAMd/LSyAFihp
	Kyf34NcruQwDxTnWSN79r/xUkuj6VNmn8HFU066yCasZAKd/l7LQmraw==
X-Received: by 2002:a05:6a00:2989:b0:81e:af19:34b8 with SMTP id d2e1a72fcca58-81fa01e487dmr4740579b3a.43.1768624263888;
        Fri, 16 Jan 2026 20:31:03 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:26af:b454:d793:29de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108b23asm3370159b3a.3.2026.01.16.20.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:31:03 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v7 2/2] staging: fbtft: Make framebuffer registration message debug-only
Date: Fri, 16 Jan 2026 20:29:31 -0800
Message-ID: <20260117042931.6088-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117042931.6088-1-chintanlike@gmail.com>
References: <20260117042931.6088-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The framebuffer registration message is informational only and not
useful during normal operation. Convert it to debug-level logging to
keep the driver quiet when working correctly.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 1b3b62950205..f427c0914907 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -792,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	fb_info(fb_info,
-		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
-		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-		fb_info->fix.smem_len >> 10, text1,
-		HZ / fb_info->fbdefio->delay, text2);
+	fb_dbg(fb_info,
+	       "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+	       fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+	       fb_info->fix.smem_len >> 10, text1,
+	       HZ / fb_info->fbdefio->delay, text2);
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-- 
2.43.0

