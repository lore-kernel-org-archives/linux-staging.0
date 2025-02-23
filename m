Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2720F078
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337184; cv=none; b=CQH+N6B58P0DYWepmbw69B+fC01eeLS93UBQLk0RJSfJxDElYG1u+WeqCaeTSk9sc9CNW2eWho7SOhFNbRM3sgg93bvzXsRl0xhxSRSuqNoDwHIefcoHv5MPMidYJN7TBaNJNAI05iphgPyxwrbixFQXOSDGqVMsMdLWXyqTuXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337184; c=relaxed/simple;
	bh=R+jYJua/JoNmJtSkvaDUD0DjudTsHKGGp3KP+h8MO+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5z7p9yd+57aylAoiO1WOtStPtCpRjFvNX2EdmpHxStcS9aVESW6CdGyroBYCXGK7aCnxwerioX8Tx2R5dqzafE7fd/Iw7GucE59XPqefm90O25nTDGIPLYy3G8xry1ZKeVYIaghZP3rBqY8F6XN6Kce4pqYxe/i1ySIVFHkJ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b8LhLg38; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b8LhLg38"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c0a5aa0f84so333673685a.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337182; x=1740941982; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTHD0WBrVxKMoHAJFWLjBpuZYRSXtcELoY8iTxveD40=;
        b=b8LhLg38oNlxukdl2eY5F4xIM7X9nKE0qFUU9CmxTFAQ6/qV9Q22lHK5cP7HFrcoHm
         bvNmDG+2UOJX3W+ddRMEIETqGt+r7VYgNO2A7HZjG7Kbd+ZPQ6v4qxlfGzobDQP7FET2
         cxBk45SaHMB9Zx2wI1k97mf4P//qUy15GneXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337182; x=1740941982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTHD0WBrVxKMoHAJFWLjBpuZYRSXtcELoY8iTxveD40=;
        b=afA9rjV5haFNSubS2p7Yaz0lXBYK98VZ9IFxLS1YFvBQfwVJCqjC8iJI7Ux7X7qJ6L
         NdWOEu1c/8gcvuLbIWR8DtucjUaLIu8yFqPEfJkMfTG078yxEBuqUXP0iS5eCspq+UEn
         QHyM+Alugn1j9lBfLfRovWa/hCujRKoHcDXBNPldPCMXqSh6cvBzwB5vluOx7DzaWjFY
         PvvxdKh7HLppeWGql+qC4uetuFZKW0e/BymVZpncULd4wD4yBriHHVNTuaBsUJjORdTc
         25jZ+yqSy56PJnl+JzekTunUl0XzGNPeZPyC/iNe5YuCP6nA4Umxu+27xIPT/X7HWMNE
         Fpjg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Kj9ktDGcnZTsvRZtFKAadZHl9+qtAXY7FW+n2CLgVBeM2gJezAyU9YKjO8YOBL0424OD8U8P3e6ngkot@lists.linux.dev
X-Gm-Message-State: AOJu0YyzkwPwxFh4PmKA4JLlxDZLQa2LEaSDvMc69WpqsHIg/VC/J1Yt
	oCA09wh1v8XIhwG8xfXYPYJL1S17ppVn9pb9GEvI0znIMotUf260pX4H5IQDig==
X-Gm-Gg: ASbGnctYkF6+V6Q3VtSCaGJXyYCkvnZOe6XGAlNdEr1YT5xRQXDGxBv3VNBWXm2Lz0N
	6LdPlr5sphNvB0Eh+Ffp7UeFnl8vdezf+DHkvo9Xd3mZ9AHMOUgnqi76pC0yr1FJjkS84wVsQSi
	DPmlzuE/osER7asMdFenDMPbCjx62p/GR9vH/0U/VBqfmn/ErmaS/DJgmnTAkP4alPMXtqKvX6+
	Afdh/uJy19NYu8tNj+LMRJMH9N7sbt8/mTC2x/NKn7sjbWhVcLMrFzMcJiz3x4S+V+IxtGP8J1/
	s3Pf4HTpjTu7rg9M6ytJWFRpjWJ0EbjKZ69IGJkSo0Xw8Yk52a5rHj11RaJhE+h7V3B09t589Zf
	w+a0=
X-Google-Smtp-Source: AGHT+IHMMtAKUl1nnqWjm92ELMXJMqaYYhbAnpTq7xf63u5qZkQjjXTU4L/aQ34kAl2TkpYkioCZdA==
X-Received: by 2002:a05:620a:468b:b0:7b6:c324:d3a5 with SMTP id af79cd13be357-7c0c227c7demr1840363085a.19.1740337182001;
        Sun, 23 Feb 2025 10:59:42 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:40 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:13 +0000
Subject: [PATCH v3 10/12] media: v4l2: Remove vidioc_s_ctrl callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-10-4292911cab6b@chromium.org>
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
index d6af0ab0d7ea..fea53b419351 100644
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
2.48.1.601.g30ceb7b040-goog

