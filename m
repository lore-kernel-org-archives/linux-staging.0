Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5010920E035
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337180; cv=none; b=eG/lHt1pH6T2XG+kyqy2+ZOoGYxITq9p0vZzrmJisSB9Q6QzbmeSFla0Vbva2cmgNj98b5qpGDuiuLRhBh5lVq8HXHYzZR2FMEMvvwvU2Hk/PiK95Wkt+75FaRIR4t4unS4FPe+mo+dDjwFCHvEOe2JgfhfVdcYPKehXUWLmeBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337180; c=relaxed/simple;
	bh=xXpFiA/NyUpbzOvlTbdhsbIOHNibM6ftIRafynCnP+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OB1Jq2iLtRHXTskecVjFq6KLP+WKj6HP/kdpUKA+7E3aEFXq98C5xOvY+TH7XvXWO/IFdFTIyA4St/u1FrHxcyij+xBLH4np3kA/Nnu3W2rrYX064ntroTdw5fVrifYSFkqLufecxWQIht+L/YFcyN9dASUnXHErovOsw9Li0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DoVzvXvC; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DoVzvXvC"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47200236004so37171041cf.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337177; x=1740941977; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iyWdZqEotC84XlO1OAQy2WGSlw/iOHY1m4U05QqJMk=;
        b=DoVzvXvCp5tEh0W/to0ZcZxpM7vKNtJLww9mGgNw3tZKP2CiiUDU/MkzUxjMWlw9hx
         e5IV48SHHob9ywOPHh5SjakdrFNhZiIX+akD0EW9iVEiQ9ut4QMBC63/cvzvHwP5Bw06
         XTjP4/lUBDZdTPyAkveenuv/A60d6iBv+Etr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337177; x=1740941977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iyWdZqEotC84XlO1OAQy2WGSlw/iOHY1m4U05QqJMk=;
        b=cNfJ2dJG0ObH77kwVIoxzp/NbAUHVexdvwteNu92qxcYcM5Cmcdf3hfLQlzQ/pjBU7
         H1rGrQAls+iwXef/TTpDu7Nq9mLML9AbIV1obA/djZEH2YPF3fRqlgLXvCkpYu2ZlmZN
         Lkzk8/dR8rNHQ2/DEhVge5u74LzYMPKYzG6rp152/eaZRCnmmdhUIIfIFuj+6CMzz8fS
         yOv3QMOiPMB23upNwxxp8quHAO1cpbIDAZoSSZlzvP/TORkJv9tjWtWkzG0REOTJmJ8w
         p+KtY1KVa9MZwvCZyoDPZo7HcQ7/fxN1RC/DlY8tNvk9zFGCxR972txs4SDSBrulsnYE
         fkTA==
X-Forwarded-Encrypted: i=1; AJvYcCW0wZtnvC4L5dmj1wyuTqjO6VcWJ4VPWh0b0MbzWQhA5qP8cTbZVLsB6tSeHOX/XSkT8hgsDpAVyhGw1d3E@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfu/yqMpbvhxz+mMp9wgaeswW07zRYF74j7SB98+rvdZNY9pSr
	gA6DKjiFeKkyF5qkxhqJvk/3k+uBjxhI/lV+L5CmB479EUksVuOAAkcv95JHFA==
X-Gm-Gg: ASbGncu/JIjOVY2SDbL3iZgzoJZoLsqR+uavBro9Llq4BUfRSyqHjAU94z67CvGyfjZ
	mpcoiGsScIVilYJ1fd4wQIoAPkIYGgtZy4TPc2wq8bOomvSYqFuzd/h03DIzQnpAA67o+rWbg6O
	H1/TwucqDo/PtTWkhVsAsfnTQNkoz21XuED4z6zVfo9JbPK0r/pKl3ZpReSHa1FJxC7QJNZDQub
	1HqnP17jE5NWSswwv0p6zCBvgTNYMhqifZsCJHCL4pU6OuyzOd2BD7fZCPWawR6KGYl//y60Ntq
	Uew2G7ZWS2IUw0eBLeJIbHC1zLoXijI2HNsDMm/sqyGtxJbtwv+jyHqWD94JHaiXmZJbhBDJq51
	w0SI=
X-Google-Smtp-Source: AGHT+IFmA5F6ZvDlLt6gf9is1F56bMr6yT4/exI4Bz1fcJqcD+qyUMAxAufOoGLCX4weML9wR0ltAg==
X-Received: by 2002:a05:6214:daf:b0:6e4:4331:aad9 with SMTP id 6a1803df08f44-6e6ae7c96e2mr137768826d6.2.1740337177325;
        Sun, 23 Feb 2025 10:59:37 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:36 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:11 +0000
Subject: [PATCH v3 08/12] media: v4l2: Remove vidioc_g_ctrl callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-8-4292911cab6b@chromium.org>
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

All the drivers either use the control framework or provide a
vidioc_g_ext_ctrls callback. We can remove this callback.

Thanks for your service!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 --
 include/media/v4l2-ioctl.h           | 4 ----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5267a0686400..068ee67cd574 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -576,7 +576,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
-	if (vdev->ctrl_handler || ops->vidioc_g_ctrl || ops->vidioc_g_ext_ctrls)
+	if (vdev->ctrl_handler || ops->vidioc_g_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_G_CTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_s_ctrl || ops->vidioc_s_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_S_CTRL), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 48ddeb01e70a..d6af0ab0d7ea 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2378,8 +2378,6 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_g_ctrl(vfh->ctrl_handler, p);
 	if (vfd->ctrl_handler)
 		return v4l2_g_ctrl(vfd->ctrl_handler, p);
-	if (ops->vidioc_g_ctrl)
-		return ops->vidioc_g_ctrl(file, fh, p);
 	if (ops->vidioc_g_ext_ctrls == NULL)
 		return -ENOTTY;
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 013996c33a9e..4d69128023f8 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -195,8 +195,6 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_S_OUTPUT <vidioc_g_output>` ioctl
  * @vidioc_query_ext_ctrl: pointer to the function that implements
  *	:ref:`VIDIOC_QUERY_EXT_CTRL <vidioc_queryctrl>` ioctl
- * @vidioc_g_ctrl: pointer to the function that implements
- *	:ref:`VIDIOC_G_CTRL <vidioc_g_ctrl>` ioctl
  * @vidioc_s_ctrl: pointer to the function that implements
  *	:ref:`VIDIOC_S_CTRL <vidioc_g_ctrl>` ioctl
  * @vidioc_g_ext_ctrls: pointer to the function that implements
@@ -461,8 +459,6 @@ struct v4l2_ioctl_ops {
 		/* Control handling */
 	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
 				     struct v4l2_query_ext_ctrl *a);
-	int (*vidioc_g_ctrl)(struct file *file, void *fh,
-			     struct v4l2_control *a);
 	int (*vidioc_s_ctrl)(struct file *file, void *fh,
 			     struct v4l2_control *a);
 	int (*vidioc_g_ext_ctrls)(struct file *file, void *fh,

-- 
2.48.1.601.g30ceb7b040-goog

