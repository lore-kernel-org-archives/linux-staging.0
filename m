Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA9B2080FD
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822945; cv=none; b=YoXtGI5jTuqpnzi2hiPboaKbf+V8cKEv8PzY6nsYNBu+54FKzPWS+fB0lbPQfnYwzjdC4eXpAsfy5KbhnHsu2yKsOM0gxjRltKwvvAnMDjmpcmLQOkJsv0L3RH88BE7Wjuj+alTIvCicdJK6NVLMAkCA5GrIMAxVulFVoYwNQvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822945; c=relaxed/simple;
	bh=cG4VxhpXxhG3TuQZqSRn1AJUQpiLuYKfsrXFh17x05g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLNUNx1N62NaQZI8WbH2VSYJjr/q0DJNrva+AkBI5SaOaRuRVLILM22N7PBm3kMpq6tS5c76449OI03gWgaoqGuKg6MWt9fKd/HDmZsOF7Fgi3a9M9eosfokQGCR20mWSr+ZDcmy3wtwsNjRSG+CGVU+PWKX3lGqk8UhlS7hSUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ieeBpg51; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ieeBpg51"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4677628c092so6452401cf.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822942; x=1734427742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSXoybomn/ykxqyK2CoWexEZQMj81DftjVpdQUWPaP4=;
        b=ieeBpg51vhJeQpEd4PKNYvZ3UY4JjD81gtpUOJKTEISofc+u+YXDFoAeT1UggAs/O5
         77KZ+3lDP6xJEVEziWLhzYrQzrniH3w6Pn7V7QITIxlfjTo+PaDa3Xr7JhdEeTk5maSc
         J4DR0gQWQ8DYUimr7xdtcHV8/tzsiIlPuNkrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822942; x=1734427742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSXoybomn/ykxqyK2CoWexEZQMj81DftjVpdQUWPaP4=;
        b=UtWh4FBoJQ1AeuRHJvaIF8ybPv2PATav0RcfJOxYQU8LaZbu/Tl1+9mAQHbIJ4qDJi
         1V6Af9fvYHIaWGPK1tnNX5PhsZBOIA1MPWUTpypXxiu/pmc9cpxExFO+WwTU0rrNCK3q
         2atMiT5Z314BuFsfCYvctB0YDpHxTaj6sSLpbYRmG4XoGI2KZjfj9IurPglTiqBHJAhj
         jKgMBWwBXcH+CEeT5xkdvCNiqeXiehs4vrD4o/pRWdi2wubKhRz6+I3VkSEsn39QB4CW
         zxNeBgDYfp4DFb5fMzu4v8UWJJH9UPy8dxgj5ZXxKAl9UI7uZfxedHAS5iqg17ibnd98
         jgTA==
X-Forwarded-Encrypted: i=1; AJvYcCVsTz6/Wa8miMbvyAisgygFRB0JjgJc+6Ln7j/QuUPL7w+Py2NVO5BT3VFu7Q3z3Q3TPIkdruRHKBYChRX2@lists.linux.dev
X-Gm-Message-State: AOJu0YztXoRzkD0DOFnPt8ey6sHheJ2P4DjbeusfExfLQzCU/RtDQSzL
	MvqtumwxA3/fn8cX1NTDLm/C3TbE7ms+yRouhoB5vY8HK7BHLeyXdkYO3sTdvA==
X-Gm-Gg: ASbGncsv0bV8nY5fCNXBw3yEbs58Ew6xrnt9Vdhb2DaU7JVMAk3/C51qtFsiLVzeGSw
	c61YC0sHSyBHQzmhmbZeLOaD6xDd2Op2dj//6D87t+GqoEuGEG+CE4M/G8vymBz24P/O/R9AdoJ
	hincrHSyeL9k2uw74KtlbFb7G2AKiYy87iCYSjbHjlildeHyIyvXnBDCCiKgYdkDz6G66s2bMxb
	aN3536HiOe61Pmf7aEm2EZjx/iR+ow3o1YZZhWpbUgMLvDSMCIRMSkpHqE/LiAFTQuVqdIZBFby
	+XaEnk/PCtZPX3428rV2mp1EMpCm
X-Google-Smtp-Source: AGHT+IHyw4/Sttmns55BK2aFWcYhSEUrFm8lcYTEWfDHCAAYIHWB09gHSf50A3dGLtaNkvGDK7brMA==
X-Received: by 2002:a05:622a:5588:b0:467:54f4:737b with SMTP id d75a77b69052e-46754f47fcfmr168332111cf.25.1733822942143;
        Tue, 10 Dec 2024 01:29:02 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:29:00 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:52 +0000
Subject: [PATCH v2 08/11] media: v4l2: Remove vidioc_g_ctrl callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-8-c0a33d69f416@chromium.org>
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
index f512d62ab0c6..03a62fa960b6 100644
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
2.47.0.338.g60cca15819-goog

