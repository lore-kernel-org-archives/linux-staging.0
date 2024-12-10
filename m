Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E4E215765
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822950; cv=none; b=DXiOnhtgCrkiAqQT13nO0svfcRbA00couXcVCXlrGLBvExpFiZrPY/zTvKj9DjuiewLY24uswemvAIfF3btlIKIzUAHbpV/+jWwOGqiSm7BJ/Um696q+HRvAGgpqotVrRz/jIrYbZuUOJFTtd1GAEN5YofRoptLn1dF9Rf54OqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822950; c=relaxed/simple;
	bh=oBcqkfXM7E90s1taQvAsnIcQGP+0/edriRflHVpoMcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rX3MX4C9J/wpuv0b/6iqMa8Kgf8OeVbFw04GR6tfmRexaPfpgwVWkWeaScACTd6D0eGIl4uz/tGKB98y8f90zjcQgsIdpyGCHsSAwW+DHMvcYC9ycWy+tCpVkCbE/nr665dVSUAeKrxYvMlXRmgMjwuQHSEKkUDFJ4f85QQIkR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OOptBntU; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OOptBntU"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6dd0347dbso77159085a.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822946; x=1734427746; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fauP20HSTE8MNs9sZtafcLYAmxh0dWmJO0jdKtoSo0I=;
        b=OOptBntUOK1vJGweAltO3kNo6CRIpxinpVD+0NMgerIyKOwEJB7J7TW61Nhz94dkQ2
         DGVmPXhIcLS5ZA1c/jHHGIQKRZs3mtml/AbFYN8B6U4ZZHrJiopALuQZ5v0hNAlOMSSZ
         HXPAhRx7IKKeEyu6V9rdIwyC3saFYn2RWOqEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822946; x=1734427746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fauP20HSTE8MNs9sZtafcLYAmxh0dWmJO0jdKtoSo0I=;
        b=aWJq/3llJX64uoAzX9k05k8tJ3fHYBybCetXjTLbE6OYoMqYOuc7BwrAz9gAag265f
         Ui+qLSVFrgAl5I2Pd9NnrzmvVAqaSmjwBts7fN58/zRNhEPuSymFis7KWnhu411BvPBt
         cTZQQmcgnxFiUJbV4/1xq4gBBKZmZ4p8blmET49nUVxCYpm6dMlNn+dsVxCKIpXLOfLL
         QJVKPXeoVEQEZgBzz24xGGvmtNvnqZuI4a6GkTROhsoqEJbqPZ8aW7c7GIz+6haooJl+
         jNQqSX8whHgUsplzB69r5vDcCUSDxPC0v/mKzTPcPxML5TfiUl9oz9grKhinD/pmm1bu
         BHjw==
X-Forwarded-Encrypted: i=1; AJvYcCW69aDj+IlZin/IKwI3aCqhmFfwxR38Wz2atb/IbdjB/OC2WQR2neWoKfvzfdEBUQaZfh/dJb36IREeognP@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn4ycyvJv/nmbrkwdBashNmYtjU7QB9o2aTc7sTnneb1vlTtvp
	Oub3XOXJe6CBicIQiFkUFMrixIRUuBN0keP7BEvfwC3FLzG+sgnABr55pCk8+Q==
X-Gm-Gg: ASbGnctXXmUGHk63766x98ycYfzD8e1FRK4nDkgLK81mXJpMyQRC2jJo/57/jYUgvzC
	SqngRAciLqGDSPRyxGMoRmL4x41iFKLBgLVnd2NjxkDhdK/JruRvomBMXcvclRGZ+kwc7ntXpSb
	NhC9NXE+8OrgMgdMyWzIUkb/JJbpU1xovoUYer7CdpvyQUKcP05+InfVbacPPNpBXUw0RDXXvZ3
	C8qQwxnhAuFd2VSmNCexjYjodyxW2ZQuHVORppPyY7dFGLYsY8aatcLfZqP8S68XLT7JEBiVFPT
	uJBNTdA8TjRaB0KhykpMLuPkAZpR
X-Google-Smtp-Source: AGHT+IEnAKwp90vPjCXMeqd1g8B6cI75StK2j/sdcO6TCrMFGNndcgYh+1KjE8474PP7wfMI8TymRw==
X-Received: by 2002:a05:620a:2a06:b0:7b6:deaa:3191 with SMTP id af79cd13be357-7b6deaa33cfmr302944585a.55.1733822945932;
        Tue, 10 Dec 2024 01:29:05 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:29:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:54 +0000
Subject: [PATCH v2 10/11] media: v4l2: Remove vidioc_s_ctrl callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-10-c0a33d69f416@chromium.org>
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

All the drivers either use the control framework or provide a
vidiod_ext_ctrl. We can remove this callback.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 --
 include/media/v4l2-ioctl.h           | 4 ----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 068ee67cd574..b40c08ce909d 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -578,7 +578,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_g_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_G_CTRL), valid_ioctls);
-	if (vdev->ctrl_handler || ops->vidioc_s_ctrl || ops->vidioc_s_ext_ctrls)
+	if (vdev->ctrl_handler || ops->vidioc_s_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_S_CTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_g_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_G_EXT_CTRLS), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 03a62fa960b6..aa31678fb91e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2411,8 +2411,6 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_s_ctrl(vfh, vfh->ctrl_handler, p);
 	if (vfd->ctrl_handler)
 		return v4l2_s_ctrl(NULL, vfd->ctrl_handler, p);
-	if (ops->vidioc_s_ctrl)
-		return ops->vidioc_s_ctrl(file, fh, p);
 	if (ops->vidioc_s_ext_ctrls == NULL)
 		return -ENOTTY;
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 4d69128023f8..c6ec87e88dfe 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -195,8 +195,6 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_S_OUTPUT <vidioc_g_output>` ioctl
  * @vidioc_query_ext_ctrl: pointer to the function that implements
  *	:ref:`VIDIOC_QUERY_EXT_CTRL <vidioc_queryctrl>` ioctl
- * @vidioc_s_ctrl: pointer to the function that implements
- *	:ref:`VIDIOC_S_CTRL <vidioc_g_ctrl>` ioctl
  * @vidioc_g_ext_ctrls: pointer to the function that implements
  *	:ref:`VIDIOC_G_EXT_CTRLS <vidioc_g_ext_ctrls>` ioctl
  * @vidioc_s_ext_ctrls: pointer to the function that implements
@@ -459,8 +457,6 @@ struct v4l2_ioctl_ops {
 		/* Control handling */
 	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
 				     struct v4l2_query_ext_ctrl *a);
-	int (*vidioc_s_ctrl)(struct file *file, void *fh,
-			     struct v4l2_control *a);
 	int (*vidioc_g_ext_ctrls)(struct file *file, void *fh,
 				  struct v4l2_ext_controls *a);
 	int (*vidioc_s_ext_ctrls)(struct file *file, void *fh,

-- 
2.47.0.338.g60cca15819-goog

