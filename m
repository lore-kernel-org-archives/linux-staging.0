Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB54920E709
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337182; cv=none; b=K2vhR6SHpK+fc/pg5uUpeIOE4lji3jYEc5fXL6QbS7uByWnRZaoPe7kI4syXGPZG+GYU4LjAHbW1Ive9zpGgxToctnSaArIFA5c9OARuQm4fF9N8rK7YlT7yHqkpZDVdIVmnbWZhGlWa4PoikYUyp3dbVter+1yon1/JinribR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337182; c=relaxed/simple;
	bh=WmADWSvj6uAUkvJFbyL8wOMewg1Hx0JsVjiP96waOB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5AUmYqapv61y4CPBhBXTrs75ZSZCr+hyWBgk63sF5mNiqo8M3sPLrwddyDGGuvF2Xd6IjLxLn0iIC7cpBEYHeXIURaRM7jK2o4edozyDKUZQD5qHnz1l9ieHKuqpJfBYdiEjt+MyztlRlr7pUxqZN0Np45r2A59qcEUi5IMViU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CoZ+HiqG; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CoZ+HiqG"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e677921db0so26270396d6.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337179; x=1740941979; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmMOjl+qwMNw0jD9DMRg4cojYEKleYPWUi1Y0A1e5HY=;
        b=CoZ+HiqGS4hm7PP9U7zkO6QmLUjWNp1W8BXk5HxU44HJbR0/kTZDVGbF4d1wYtdQAB
         DqRRXWY+ytllptnQ5B1q+F4Ky6GBRBevoM7tE4Y3XI8NAE+NZOVeD0ZQvzuykTvvaQIL
         yjbIL9gx5Oi6GbeuqLatQvlEqe0xG9sE8MeVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337179; x=1740941979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmMOjl+qwMNw0jD9DMRg4cojYEKleYPWUi1Y0A1e5HY=;
        b=SJA+rkqvxqRUDbUe1mRYIWz4nOX0cvmCP02ERID8ECnkzFpZr44C77OAzSIBR675E+
         fcuO8PIscr33oQh+cm7EfbA7J9V3oadLWnRVGph4bMf6rVNrliIVT4UrhCu15R7gQP8M
         MqhEcRXLLJXXeLN+44j4odx5t/X+5tJ1ngGLhhn6U+fexJ5DFot4KDT1BbVxGsPDUwVw
         Biv7ZEGMbS0R1o4TWfQ5Nfz3yfFZULUrmFxfJee0NczRSFL2LzKTk3nWKpzCBQA8unLx
         maejubOueYG/HoCrLTWwJcfqy3F8bE6tlsDujCDrFTlFcNxm7MRnAv62IATBkyqyeavc
         RAyg==
X-Forwarded-Encrypted: i=1; AJvYcCXoYcH7Q0Z2qR13waN3PwFsp1SNk8khs4GTldX7nnW6/N72SQCaqjfC6ZA6VtlYSHaZ3KO553FhX29j101e@lists.linux.dev
X-Gm-Message-State: AOJu0YwBO0oRZ8Uo/33IERkX29xD1zvXfZGUOuQ+jCZ87eoO2EjCx8eq
	yt84vML0EUPJdwVtABCNSw11BvPexcYLj7SRo0EreC5AtZSaiilQB8vlTvS0JQ==
X-Gm-Gg: ASbGncvMDjG1wH8lco7kebOIA0sKoy0RQ6a+hvGm22+O45XQqFInA1nCIn1904Ttqwv
	D4oLKL4VQ8sfuIHMIb/sB3sEmrtjJdhfj8+lXOewDCI9ohOgRgfoKvZo2P4pU3pXZTULbabfcp4
	EtAwegvjVnW2rmdyYLlb16pOmrLWFYC+xgZzrxbg6tFUg5Z66fUxQMPe+/egGYiSypksRWLT6B6
	+mhBHffitbG8S9woLDkUVY9iM9JTs058sFy9RFZ0Omg3Wzx+OoeXebt5WelFmI2YIHrweqlvG7Y
	adjOmVrD4UYh79LaWgytjveqte9fNVsr5HvBOq1tzjUVmjqROIyiJPKaOfIkcQbK11laCc5e4Pe
	HI5A=
X-Google-Smtp-Source: AGHT+IG0N8p+jyjmOv+jFoMONGfZHngVMJ2/L46r6qBftBaVoQxFvMRvuW+hkaPMPsXXZun2oIuYDA==
X-Received: by 2002:a05:6214:d4e:b0:6e4:2e00:ddc1 with SMTP id 6a1803df08f44-6e6ae9ffd75mr145374826d6.40.1740337179698;
        Sun, 23 Feb 2025 10:59:39 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:38 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:12 +0000
Subject: [PATCH v3 09/12] media: cx231xx: Remove vidioc_s_ctrl callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-9-4292911cab6b@chromium.org>
References: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
In-Reply-To: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The driver has been converted to the control framework in the past:
commit 88b6ffedd901 ("[media] cx231xx-417: convert to the control
framework").

This function is never called, the core will only use the control
framework instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-417.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index a4a9781328c5..5a4b0f96cca2 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1538,20 +1538,6 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 	return 0;
 }
 
-static int vidioc_s_ctrl(struct file *file, void *priv,
-				struct v4l2_control *ctl)
-{
-	struct cx231xx *dev = video_drvdata(file);
-	struct v4l2_subdev *sd;
-
-	dprintk(3, "enter vidioc_s_ctrl()\n");
-	/* Update the A/V core */
-	v4l2_device_for_each_subdev(sd, &dev->v4l2_dev)
-		v4l2_s_ctrl(NULL, sd->ctrl_handler, ctl);
-	dprintk(3, "exit vidioc_s_ctrl()\n");
-	return 0;
-}
-
 static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 					struct v4l2_fmtdesc *f)
 {
@@ -1627,7 +1613,6 @@ static const struct v4l2_ioctl_ops mpeg_ioctl_ops = {
 	.vidioc_enum_input	 = cx231xx_enum_input,
 	.vidioc_g_input		 = cx231xx_g_input,
 	.vidioc_s_input		 = cx231xx_s_input,
-	.vidioc_s_ctrl		 = vidioc_s_ctrl,
 	.vidioc_g_pixelaspect	 = vidioc_g_pixelaspect,
 	.vidioc_g_selection	 = vidioc_g_selection,
 	.vidioc_querycap	 = cx231xx_querycap,

-- 
2.48.1.601.g30ceb7b040-goog

