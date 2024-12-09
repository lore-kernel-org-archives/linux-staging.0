Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4FC19B5A9
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772344; cv=none; b=oz2vLUskDafpmIR2tZa2E96RxH2oH/Fb6CYJGM9wJmHVBt1lk1Ur0KGXk/KbnW8LbgP3rxIUqiaZ+JF7yI812g6mjlhlmy/jgmkPqp3YWh7Evggv5Orjq6Yfm7gMCvf8DJyR1YJXVoc+f7HIKtmwv0VEov6E5CJe8gO8nOzoMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772344; c=relaxed/simple;
	bh=oaCq3lFHUlXWfLBs1yLgfb1pQhfpAzznJwSy1NrE1wY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCLt+rG66IbUxP9eF4+FZIkx2UC7AJz5MtLC7a/0cKub4ocm3CcX9RrP9XVX5MzFon1y2fcSv5sJ7K2lF5oddXZIaIx+Rway6r14fkkHkn6PA0vaQMFjysAzLqORUBReu6jjMoefZAARlUf4xZOTZqdYs6D+MEyZlH0eB2/crKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PIHcObUa; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PIHcObUa"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6cf666ab9so163422285a.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 11:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772341; x=1734377141; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltErOm77Oh5lK6TbfQofWHlLQPTPm1Kvo+0ZzyBQyKQ=;
        b=PIHcObUacd56YUR8JN4pi6AO6B5gx/6B9Y0jXICxZkHBadvm183gip+L0uoIkjBedW
         HAfmzpJShDelq3IIW2J9ILP0pp/e2Y0sQsJp5v0JqasidVDX0RRKra4bWX2l/HoRBAo6
         nT4FG5uYvkSmVL6SZx3pYJ5Rr9GQUDURGbkbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772341; x=1734377141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltErOm77Oh5lK6TbfQofWHlLQPTPm1Kvo+0ZzyBQyKQ=;
        b=R41v99u9IUn+gg/l/iT7MkrEHGJ7iAQIkCR3LjXU5eV89iS8jPFzsU6dd3lnfPegnF
         Rh5xqp4x+PDnQrvosLdNguTbtL7a9T8ZondHfWBTotJrTe5COgJ0kBgP/Rl61ZJAgHn2
         1qrtshYEXQ64nxj0Oob/KXqoepUrxHSl6dxG9aIMTz2NIGkp83pET35OYOMUAKHOIz7z
         WIWr4flJ03q4+dlj/SEQaBGUrGxO6mjbxXQdopqlTTf0BqbcpRl/EhffIj8Ea3vLWCGY
         3q7rcA3In4Q6t4ZQ2ctLkJ6QdvBlY1shbdYKFgGNWatsD3OzaVgHj71SOtgTIT1QhO72
         TgDw==
X-Forwarded-Encrypted: i=1; AJvYcCXl1NJOR6VynuVcOirYUh+gJ8YwRPb1EIvwsPTT62OJBTSiIXk+taZ+JXsKgvcy2MAVS+iyYKLIdCNyWHOS@lists.linux.dev
X-Gm-Message-State: AOJu0YwzFbQPF7flFrQLfmA+fMdI/4JqvNHUraeR0Q+5Ttvuk/F+7HWA
	nSWVaeM/YYQjx0K2/hEBQwhSamhDr00guEnR5Qac0ryWxatmhx6csXJJR3mZrQ==
X-Gm-Gg: ASbGnct7f0qX+rQr4n1PPSXHpFt3N5keh1r/E6EqBFo9UPQb6AWiL2WbmILzMtjMctI
	StsMvo5sYEvb2JQ/VTbNfN1F/CdUID43NosbKTmC1XZJPzngfUoUtewhfnj6wE65BQD2U86bsNw
	qwWkqQcbNqbSX0x2vmS5emdeQGwgxF5Gj9P4Udy56QG8PeX6PSbc7EiSvARMjyiTWsoH9OJXqTE
	ImMSlV4j6xarF//GWW1rLSOoRMwlODDlj3IQ1gw6NMa1Z0SrngvrMCbWnzfDWA8y6eeFxdZOyIv
	PmUSuyBSc7Nt4huYgY0KOcBK
X-Google-Smtp-Source: AGHT+IEC8fFJCiNRaM0A+A/h+DVBohii9gw561GeeuVFgC5WSmzaiO9D+NgO5W3/1EB4ImZzjjZjKw==
X-Received: by 2002:a05:620a:468f:b0:7b6:d0be:ca31 with SMTP id af79cd13be357-7b6de762d37mr79678685a.25.1733772341402;
        Mon, 09 Dec 2024 11:25:41 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:40 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:38 +0000
Subject: [PATCH 07/10] media: v4l2: Remove vidioc_queryctrl callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-7-deff7acfcdcb@chromium.org>
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
index a5562f2f1fc9..30e32ce5278f 100644
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

