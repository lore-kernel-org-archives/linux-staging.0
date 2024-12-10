Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2759A2080C3
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822943; cv=none; b=mKTK4irlVYvVGJo5Yd+AfKPJKCH1FnftUmhx2K9cEvrClMGxRzrPWwjWX/N/iPNJUhpCaQeY//5CEu7ViCVgL0ugza0MM9X8ts3TbSpFHZB1B5fJLTy/NyOqRtLYxz7ELhPTGF2+AMeIz42TtX+FSfO9xUwrKIVJ6WdsiG/uquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822943; c=relaxed/simple;
	bh=UCSCdBd2wYaTg2mVCWPKK/8ZcXTPSRHtCpuikvCx6bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJSiKA1982jNiyR/l2l82h/+Wtp6bHq4+qPfVBBGE/mf2SJwV2EYXu4QrLBKhZVgEkIvJHa/38w+WhxZtUrdOAPWrG0v7F8VSSPdoEOMrqhONU6v41jDD85Af6iSNX0AFbuP+OGg9qpwMM4bPM8yJcIX4csXHLqqisaV+rZ9UWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N5+w19en; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N5+w19en"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467540980c9so31312261cf.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822940; x=1734427740; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiogjbYyyp3CBgcBMLahUXd4YrS+7xUetAO4W7bj77A=;
        b=N5+w19enqiovg2mH2/0hfDOrXd+P4g09MN59rEhYhA1ZIUN3N41tlQiHGeq+eX1nkD
         J6hnte/xH03W2xSEmoCmhroQ3HE2pVcncmZIMqcAwYJNE5RyjbNZha2/pxa2bj8w/2Ld
         tF+FJDtgswPi/sNi6dR0F/jZy7YfYMkE36H88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822940; x=1734427740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiogjbYyyp3CBgcBMLahUXd4YrS+7xUetAO4W7bj77A=;
        b=u0V7eEYq8kc4RPB8vTBXRopm9prv/6z8YSN0jllHP+gWh1/AHguyiWIgSB8aywQprd
         K0xqUKB5Jn2Bqm1Kr1fMtQHnNVaYG1DM9guXtdSyZCoEglb9gcV7JcJ56kXE99Dwll72
         WxrnzUJA9JiBGsqVRIIkepNHoZgIPMZ5H3ok5EpsZ8pCfjwv7YyzYlmRoDTrZrUbbfxx
         M07kijRJIt8jToKGU1j6cCWgEyYx0k4sm8qNl9rZnH2ub5LsYqOUJ0iSpcgfx4kwVGW3
         kf8q+UBCll/gPOYNIO497PL1xHYxdsydbVFOF68hoGnBsVRo+V0PUZAAt6uRixTFvcrh
         8IHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTH2dmbjftUiUkQRH6Wlf3cpUz2OLfZFm71Li9/vxbIOcLMR6D9++jcZ4hiT2Ve4z2UsXv9DHVSkKXyFUk@lists.linux.dev
X-Gm-Message-State: AOJu0YzdvL8WgQbWWmarW8Nkv56qcz2UTD66L46O+ztXhbCm4jhOqqdY
	jS8fqHn279T0iv46Ihl2u/jNfDNen8nxtWVAGNb9gdFDaOvhdN3j9lhLGAawiA==
X-Gm-Gg: ASbGncuWvvL9GHDZVpjuYmUsi4HA8QUDYEXyn/Unhh163Za+3BqQenInsYnSpFwbJ3X
	6un7KNcb+isciQxobZzMr6bz+k59RwMrSy2Z6TGP1qqzB+rpn2pES1BTC+a/VVw9e2krdQNbPAL
	L8mTq7Nz4fa1PTCLbMot3LNQadSwlrGtQcfXjjlbHspYflk/VmL+3nCAe1hLWnB2Nq6dJPxrNVY
	5lYnuDOs3ZQu8o3eiCf8D3KyWX40UQ6Wt3RbA1Zg5maQiQrXolPmmfS9H6iixYXLRo6NOdhjG6f
	JIMaaeUcUhpTC3OaOQF+QSBJxZ0U
X-Google-Smtp-Source: AGHT+IF8s1VwNRHBCKTet1sDHMwDl1DPA/dKCCMhA10gvPO+iNrMX8TslNymChXUWbVD4blpu2r8gA==
X-Received: by 2002:a05:622a:4a1a:b0:467:681c:425f with SMTP id d75a77b69052e-467681c44famr119359851cf.4.1733822939993;
        Tue, 10 Dec 2024 01:28:59 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:51 +0000
Subject: [PATCH v2 07/11] media: v4l2: Remove vidioc_queryctrl callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-7-c0a33d69f416@chromium.org>
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
index 7d615ebc511e..f512d62ab0c6 100644
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
2.47.0.338.g60cca15819-goog

