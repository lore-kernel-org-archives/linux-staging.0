Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E454B195980
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 19:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772339; cv=none; b=Iqzb5ubnM2puVBFQgba5McaJct3S6q9ZNoJwmPUxclMaXRfLZp8XvuqO9cBICZZfKSFOY9OWNoyfL+tWkSvuA2hgKJHApIjADo8c+UdQi0fRiueQ4yfgoxHpNRlCqQIX7ga06o7JitZ/5tWKAh0Z1ZCvS4oRTnfdkCelg1nf+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772339; c=relaxed/simple;
	bh=EY8oqmKTiUV81iDV12LiEs5fxLsbZtTGDuxYmfLNCp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVd+/TNejLQ2SC7MpeSmTOq5xrrzsyh9Gmg6cfvHsNtP3NHVOnEkHTW/5rNJTnOKrPujf3GTEGX3En6wVya3FohgNvbv4OMhLIC0b1FOTFKyFEE5TP3V8gui6PaN19k4HQZjBIuCwIx43uGd7F73lTxYCi31l7bPjAabuBWb5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eA6B6p+y; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eA6B6p+y"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46772a0f85bso4507391cf.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 11:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772335; x=1734377135; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALuCNiC6NiBbAaZWJ7ZF+lCNq8dvy5S4QphoAjogwrE=;
        b=eA6B6p+yYBr8/Z4oRv1+u0t64AtxqQ2xHK0HESQAuIsTlXt8DsbtrwudT4kfndSDfS
         64w4iKeS9H39f+g6yQXA69lD/CvZIlYfKBnrFe7L9PFs9218IZh7264wvmTh3erooI2l
         ushKmyBYkm1muDaqE833cOywZOUOTzMoYDy28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772335; x=1734377135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALuCNiC6NiBbAaZWJ7ZF+lCNq8dvy5S4QphoAjogwrE=;
        b=lq4RgIPou/Fd9vgDyI9BwVqj8vd2eFii/MMVk333vGaJ0YmfjjYkYuWwWIcWKbuzG0
         uzBk52qEY9U2vXvb7l5v9bvIZQPXikzeteB4bIkW6xpGDPOKpoTcKrAjKjwNxMvJze+r
         Ldba+G5y/z94v47ORE3DaLsqpLH4z0sK8PuwdiFTzgj3BfSLx8oQZ6OAmELscW9+bsW+
         9cIkIekOu+L049o4eU/FPfZUUdkGZZQw4N/uwgYHB6EBiPCBok9w+E6JbOPjRPIIgM6d
         mnU4h++JkSXjRiYfHZ2Ho11iCM1JoQ3gYjrCCpjnWmy7kJRqoLCOETkMBAHpvo8wpSNr
         /iCg==
X-Forwarded-Encrypted: i=1; AJvYcCVMMIA21JkCi0TFyJ1OpzVM1sGeoRqYG25jgK67LQwjZksNSig0NhWJXEFygO4hRbak6UpGd7M2I7dEZj15@lists.linux.dev
X-Gm-Message-State: AOJu0YwNWhtQyHus0Uoaanw80jJw9SiYeD0ru/I1J+eHlV/+LZYEYg3w
	HbEUMv6jffEn27RpoKgKxTbXs+YbtT/aYAtzisH4YOFcMIrBjA0VYEXXEkT7VQ==
X-Gm-Gg: ASbGnctCe59dj4v4YPU070+C+wSPYJBiloUmUuw1YSmKVr+q3BlSTxEcBq+3/DfvssP
	iKkwOdYmAPsW7alQjzeQJY2K9Yj13ddO2XaQbjDBu4Mq2c6Ec0VNFJL2JHh1jebks8osOj63g6D
	evsYcq3oJgUZc+AibDzSs8sR1hlf/kwA+XSwc5AphaF3z3Nfhdv3JDDc3jDYHTwrjEzXzZ8aoiq
	erH5znpN/kGljopmWLI+y7DllKOt4wS+Skm4wI1qPsuq9UaEpq6QVCNeRN1Z0AMgCTxw3rGWQFf
	e3YPpmpY8Y+VMYTrtBR6zSF/
X-Google-Smtp-Source: AGHT+IHsk+VHbWui+xY2odwllC141usB+LpKAHlP2mMq7yUmbaK9+La1b1tTbukiapbv37JDSVTxrw==
X-Received: by 2002:a05:6214:5086:b0:6d8:9002:bde2 with SMTP id 6a1803df08f44-6d8e71a8c8fmr234897486d6.28.1733772335566;
        Mon, 09 Dec 2024 11:25:35 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:35 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:32 +0000
Subject: [PATCH 01/10] media: ioctl: Simulate v4l2_queryctrl with
 v4l2_query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-1-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
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
 drivers/media/v4l2-core/v4l2-ioctl.c | 22 +++++++++++++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

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
index 0304daa8471d..a5562f2f1fc9 100644
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
@@ -2294,7 +2296,25 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
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
+	strscpy(p->name, qec.name, sizeof(p->name));
+	p->minimum = qec.minimum;
+	p->maximum = qec.maximum;
+	p->step = qec.step;
+	p->default_value = qec.default_value;
+	p->flags = qec.flags;
+
+	return 0;
 }
 
 static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,

-- 
2.47.0.338.g60cca15819-goog

