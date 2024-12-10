Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B2223874B
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822933; cv=none; b=uQnbwf7ubydPn77NY0brlP5b/wVxkcxCYGEPhA6uCiWfW6WWVhC+kRR4HzZVGtGS9qQiNccMLAKpcRUqgmkbWYD76odVI3Ety298N4QLsaZkENNh9QQXU/DBxHVj7SXfvNz3GGvhYi7Sg5u7Vm6sWyvItKvS9Ps+GXJ6tMKfRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822933; c=relaxed/simple;
	bh=5tAoo54TU4GQ4hW7pLNn7ok6ge350p6usP0YhXYzePE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVvaYWpZzYBc8TK41zfQG+antZP2kRNE2JFfgSUq8SWJcbU+hXahoe7Dw8wYm+sF+uxIN+BbL1OnTcxF1Umvpc90UjLLFQ5avSZntnbPEeUWIWSiUdc8CXc5+OktF5GpfLCmK/b5MjTVVmntrSg82kyNlSXIJurVlBKV/SuyQ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UTjFbYrc; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UTjFbYrc"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-46753242ef1so34880971cf.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822930; x=1734427730; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjCxwHlk//pWYcvx6fmU+J931W36lgHNKb5tiH7Iy4s=;
        b=UTjFbYrc1rtvPb2a/lNhgXOAgJDQ6Abphe2BrZX4qDf8XpzsKqWCDwNCwo99J0C25h
         TuaumQlvQYkJQ2jfURSB/GT3ra4140Xw2Cm5+bduXrZnuFHx5z/5NVK1oeUYOVeO0daf
         RS+kNdzT19tAvmN8f98NFHUDGDhXSPIIxcIJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822930; x=1734427730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjCxwHlk//pWYcvx6fmU+J931W36lgHNKb5tiH7Iy4s=;
        b=mPwbgYfY6lYIeFoc2w+LTGAWOQDZS2tkWIiRPYEtdXADPwDT/ASdzn2MXORwDf1SFE
         PeDkAjMPTfrSgvlFgu2w2Vw/HoRzVQZUStvK5F2L15E8RN5h12GxSIrzrttKXwTEToh9
         7+uPKnq4D/rYQjpR0RGUHpSWEHLNjg2VNgXexSUcTTbhgVMW3k68Un5Mfgft+TNWbM/Q
         VaC1o/5x0KOvBhJ9mTik9uu8DIUa/mzSCcsaspXeA2hJ0mcAUuQXG3XVRc+U9igLYT1r
         AR2hNXwj6nCVaNK98MRkGAXdnQr+ePwZFgSSuch3fZ4+2sKDW4gntUbObQNTfkMeVG7r
         TloA==
X-Forwarded-Encrypted: i=1; AJvYcCUhm7ldhbTwl1inbcaT0BUzicCkgV5tdPsCIXF+DN0b345V6tgojJRpKfvQBZhTopaVNcEToXl95msEGF9r@lists.linux.dev
X-Gm-Message-State: AOJu0YwfI+bqQla7xrjXMZBjGguznM/ZExMaK0nGFvdQYvjwAdtAy5cC
	DWT7j0uU/EL1Rj05RQMkFRdbUI2v5RcvqxI+M66Q/pccOw/MRtwGnU1QIpBWTg==
X-Gm-Gg: ASbGncsGOvXFIIQ8mBd7+ySX/ndNtElbR8SyGMEWDbE42vnQJyMpVojiKVQbxv0Kgg3
	hG53QIMFpgQQdPZADn8qwtQfxeUkEnBjFMybwO3MTS6dUyK1ylzFHfHwKtPTu+mY9HMkPA6cwjc
	0DZrZhuIOKXiQGBV44YfmfzCSPdN7QJCMtkd6znoAxGmDABHZh7/VtTyogTaKHXXAPRaJYResNW
	t3Y1NeTJ4tLd9K5zdnTAzhkZVT3gVfGby7KGkX9vfXhVxmxPrgFh3B8LAMWnLmwICt5667XjW8v
	Ep+eCrxa+dGgCBrPZGhZEmWDklic
X-Google-Smtp-Source: AGHT+IHlEaOPjN93sA8cjSBRqg2/WMxOoAfLZHozJqTzhAKHeUhuWeLsI2/xEgcPjttaJynBP3QLKg==
X-Received: by 2002:ac8:59c5:0:b0:466:a06f:ae0a with SMTP id d75a77b69052e-46771f5b0bamr69413111cf.32.1733822930286;
        Tue, 10 Dec 2024 01:28:50 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:49 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:45 +0000
Subject: [PATCH v2 01/11] media: ioctl: Simulate v4l2_queryctrl with
 v4l2_query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-1-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
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

v4l2_queryctrl is a subset of v4l2_query_ext_ctrl. If the driver does
not implement v4l2_queryctrl we can implement it with
v4l2_query_ext_ctrl.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   |  3 ++-
 drivers/media/v4l2-core/v4l2-ioctl.c | 37 +++++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5bcaeeba4d09..252308a67fa8 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -572,7 +572,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	   and that can't be tested here. If the bit for these control ioctls
 	   is set, then the ioctl is valid. But if it is 0, then it can still
 	   be valid if the filehandle passed the control handler. */
-	if (vdev->ctrl_handler || ops->vidioc_queryctrl)
+	if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
+	    ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..7d615ebc511e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2284,9 +2284,11 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
+	struct v4l2_query_ext_ctrl qec;
 	struct v4l2_queryctrl *p = arg;
 	struct v4l2_fh *vfh =
 		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	int ret;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_queryctrl(vfh->ctrl_handler, p);
@@ -2294,7 +2296,40 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_queryctrl(vfd->ctrl_handler, p);
 	if (ops->vidioc_queryctrl)
 		return ops->vidioc_queryctrl(file, fh, p);
-	return -ENOTTY;
+	if (!ops->vidioc_query_ext_ctrl)
+		return -ENOTTY;
+
+	/* Simulate query_ext_ctr using query_ctrl. */
+	qec.id = p->id;
+	ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
+	if (ret)
+		return ret;
+
+	p->id = qec.id;
+	p->type = qec.type;
+	p->flags = qec.flags;
+	strscpy(p->name, qec.name, sizeof(p->name));
+	switch (p->type) {
+	case V4L2_CTRL_TYPE_INTEGER:
+	case V4L2_CTRL_TYPE_BOOLEAN:
+	case V4L2_CTRL_TYPE_MENU:
+	case V4L2_CTRL_TYPE_INTEGER_MENU:
+	case V4L2_CTRL_TYPE_STRING:
+	case V4L2_CTRL_TYPE_BITMASK:
+		p->minimum = qec.minimum;
+		p->maximum = qec.maximum;
+		p->step = qec.step;
+		p->default_value = qec.default_value;
+		break;
+	default:
+		p->minimum = 0;
+		p->maximum = 0;
+		p->step = 0;
+		p->default_value = 0;
+		break;
+	}
+
+	return 0;
 }
 
 static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,

-- 
2.47.0.338.g60cca15819-goog

