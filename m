Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF020E005
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337178; cv=none; b=Ei1AY1BfDrS0MSdW0HkmIsqRASOZntIdENDgZ4PGuGEZ6vsCovix2Mz+JjF9yTu/+LMdPJbXHhFboAMcFXY2UZbIqdAmI02Rb4PR92VDmBsfSvQ2x+d7MNboTHXxdtsIGeHzKo6Tuz85fWVU9+zB4WMdruV6nyKxW3AhzH7sd2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337178; c=relaxed/simple;
	bh=6eScQ+yILkmrR5/v9Ls6gwtXx6JH8fWeq4Wm72IvMxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4uNnRl9HzoBL7ons/+yjppVJcCB7e9ONRy4zsxmDLn2CvFkTLput17Yc5Hd4AWBu2MBRvSTLHvmuSXMKHsjYh4768whToFB0CpP2Vh7liteWk5oTf+6p9IunjN1n+Z5rYji9deK3mu9109815RohV2KqYm5NUXsR6v0T3VJ4UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GQNFp2Hi; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GQNFp2Hi"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c0b0ca6742so419295285a.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337176; x=1740941976; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqSkdPwdXz1L9xwrOG1KS2QGCidHxC0xW5jcZHcDLmY=;
        b=GQNFp2HiCPfZuDNcXawpoxARI5HBfCNhhc+hMQ2QK1mW8Evm6Juio16zB96mOpB4vc
         6OtagShMCg5gw8jCxiWOZl8DbLe8Y3bpGPV75l3is9YTtz9egDSHhS15ANiGmS70o+88
         84gJgv75kottO4/XrL2w56Mgk53wkLqnzrT8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337176; x=1740941976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqSkdPwdXz1L9xwrOG1KS2QGCidHxC0xW5jcZHcDLmY=;
        b=mKZIwGaRJDjeQ8CT/1cCBVUn08N+Wl07/85qBXPr6RL+t7YpRiNe8WwOCklGtIHU4b
         ZiFNuPTKksaiBInrqiZgotlfewRlUEj8YCg2ZcgFy/eBrMKqcRPW4ssSJhHUWffup+mV
         QIXNX9sub2q4USKWSWPUuakM2R5PWR2/n7PafjqeXyNoJyd6d4hj9PODZf+ivr3sGwZM
         HoTx+V09pZqr6tz+593ulaMa3VxfohXGqHBvbx4AIrypdMcpxSxRNjKzG3LjvUiCVz3m
         YZZBeTgkBlDCXr1i6Utpd9G3cGCf9TZeNAw4cZMfTWZ9x/0LPRLofzB4+iW0vds4ql42
         5K4g==
X-Forwarded-Encrypted: i=1; AJvYcCV7e7YwX7t9iemKB7HKpnchXX5IDsHC4+8IHG2Nvp8XK9ny6lf0mWPJ5/jAJ2wMjobSVpJqqI2v94pllUHZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzkOCAF0gUToLniuEQJc8IoQC9MVSCYXg0eZu+odCG7ZwlflfuG
	brNUIU1D6bP+tEe+usL4s3t6Ca1dDOR5ALVUfa0jQrUjl2tRPXhXD+64pYxWMQ==
X-Gm-Gg: ASbGncswkF3w5VQ3Li9Ck8SI0EdWwLoalOH8O26C+Jajmq57Srutic7mfpq4hduL6Qn
	YmX5BNmkuyMaaj4IHB64iE0xhje62pu+4kC9+yXPs/2AeW/R/kA3dgxTp0vPDGhCilyWq20mLhV
	kJaBy99jk0keBfG8i4QdQWy/55acgcvtILDD6Nj6tY/QQU8UEO9GIf5BCMMYOuHclhOaI9nY5sm
	Tv5BHvB7LSItzPoJFXrHA9oYRPk5ZPw7MLYsMJolpqYe7pjggSvhdwYNJPRaYMuPuVU9Pv/xllZ
	AmjQj+/lHzONAZt66sDjJgM5zRpdSDmM+GiazNoRqzsHwQBSdJEdZ+XI5FAFCT09zQDfcc6tP9Q
	btiY=
X-Google-Smtp-Source: AGHT+IFnnjBZgIrWZHVi+Chtu9HWxFVqKZWb2RhLpbJR73isjU+nhyv6klkh0PJNTJcvUMHxLxjZcQ==
X-Received: by 2002:a05:620a:2b97:b0:7c0:874f:c87 with SMTP id af79cd13be357-7c0cef6475dmr1731625685a.35.1740337176294;
        Sun, 23 Feb 2025 10:59:36 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:34 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:10 +0000
Subject: [PATCH v3 07/12] media: v4l2: Remove vidioc_queryctrl callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-7-4292911cab6b@chromium.org>
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
vidioc_query_ext_ctrl. We can remove this callback to reduce the
temptation of new drivers to implement it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 3 +--
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 --
 include/media/v4l2-ioctl.h           | 4 ----
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 252308a67fa8..5267a0686400 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -572,8 +572,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	   and that can't be tested here. If the bit for these control ioctls
 	   is set, then the ioctl is valid. But if it is 0, then it can still
 	   be valid if the filehandle passed the control handler. */
-	if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
-	    ops->vidioc_query_ext_ctrl)
+	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index deed2b44ee18..48ddeb01e70a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2294,8 +2294,6 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_queryctrl(vfh->ctrl_handler, p);
 	if (vfd->ctrl_handler)
 		return v4l2_queryctrl(vfd->ctrl_handler, p);
-	if (ops->vidioc_queryctrl)
-		return ops->vidioc_queryctrl(file, fh, p);
 	if (!ops->vidioc_query_ext_ctrl)
 		return -ENOTTY;
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index bdbb7e542321..013996c33a9e 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -193,8 +193,6 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_G_OUTPUT <vidioc_g_output>` ioctl
  * @vidioc_s_output: pointer to the function that implements
  *	:ref:`VIDIOC_S_OUTPUT <vidioc_g_output>` ioctl
- * @vidioc_queryctrl: pointer to the function that implements
- *	:ref:`VIDIOC_QUERYCTRL <vidioc_queryctrl>` ioctl
  * @vidioc_query_ext_ctrl: pointer to the function that implements
  *	:ref:`VIDIOC_QUERY_EXT_CTRL <vidioc_queryctrl>` ioctl
  * @vidioc_g_ctrl: pointer to the function that implements
@@ -461,8 +459,6 @@ struct v4l2_ioctl_ops {
 	int (*vidioc_s_output)(struct file *file, void *fh, unsigned int i);
 
 		/* Control handling */
-	int (*vidioc_queryctrl)(struct file *file, void *fh,
-				struct v4l2_queryctrl *a);
 	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
 				     struct v4l2_query_ext_ctrl *a);
 	int (*vidioc_g_ctrl)(struct file *file, void *fh,

-- 
2.48.1.601.g30ceb7b040-goog

