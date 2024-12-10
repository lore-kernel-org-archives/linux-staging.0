Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2B78F25
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822937; cv=none; b=iJVDLCYSAB8cyqmIsJfxefo1XBnbsn+dWr713rz0F3XAYFumoDVQc909qtbmYfuRPJyAioWwiR1KCPpmDkElvA2FynDMH2C4viYQZUBG4afsmSGSPTXiciFqSImEch2ywrGDhrsz75UTREQRP+YxDecy8Jh+GhsweJoDO1ZQbHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822937; c=relaxed/simple;
	bh=QTPQ1DyM59FTFwoOCCInfTij+St4lWshfJMO2MNF9Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EpkaQkCqsxzhNUbqHQDnUYBRaRjn6Qgte9uCcO87DkrFWdDZWJVBXJF74wcnhF70VQX1Qt3qGWWEWeS9S9NmODgp8RhPathRZy5q9O/ktNozWzBA6z1X6aXxYE60Q96lj8oKQ8xeCOkiHTkXEGY+zx7gVSVGYpcuWhmuXFquRIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N/xi67Y7; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N/xi67Y7"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4677628c092so6451141cf.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822934; x=1734427734; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldrzuJki4Bob493jggNorXy/00Sxo1CNpTeJmfaThng=;
        b=N/xi67Y7KEHdbDTBtYz9o98Ru1UKxRKnnT1csXxPYZtSr876cL7cePKHwmadllFQxC
         WMpnDwYBPX1VswsVRKPUJkFn/NJmHLGwznQHir+K2kaAepEbH4mXKqsoc4TnDyrG3G2p
         NWMiBe4QZId+HpuTP2hmz6B6CZHtN/35ChQQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822934; x=1734427734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldrzuJki4Bob493jggNorXy/00Sxo1CNpTeJmfaThng=;
        b=jLio4i0/apxgr4NvbnTtJRWPBvNuAf3NQvp+xMuSqKUy3nZbuk2JNgeOssMePdxVCM
         YzXMII0qiVV6lqJ5+61KreldGdgsbswRM1dyPXVx1uhaPKG4r8rNgIsj36X2Z+MxyOsw
         +yz9MC2AtFHrQPtY49DNI3O6iDwItYtgMSn7be2h6EVLkVDJAfVmG8Zlp5+RtmZiqOhW
         nmjVq80Ll6S6/4MH0+BDkMZ2UrEJUr2My+mxhO4NVLxsv98HEedY6PlnWpiCbUHV180z
         hzLQ0vcqXQv/lxrO5vanZ+SCAwXlkQXhMqvFUO1Lk6zZtr6hG+9/O2Fhjou8oAQhdoWe
         0rpg==
X-Forwarded-Encrypted: i=1; AJvYcCVIHAHBAA2VeILh+EMff2R17aOPtcraaLGgbe/zQwNGKpDzsQyWXLPTxb2FEYTFcLrJ2LezmKmUyh0kvPkK@lists.linux.dev
X-Gm-Message-State: AOJu0Yy96QAkCjVYfuMjqP9kC2zv5fpBjmW5/FDe0icyvm83BCwI0m8E
	Maf2JYTHiM2kIoLX80BYJ6NM2+vN1ZBhjGlXT6oRftdOFEM/AjkSLdn9l+h+7g==
X-Gm-Gg: ASbGncuL4qmrb96V97mWUOkmlcZsxV+viQK5jQaLpT5nnnPwzoiwRRRQ7MnUHdDxjeF
	aPUr9FYeEzc9SsPul98BxKANS41Hc0caECQ2HeL2iAX+CuSntuyWlp4jgH7nkr6YfKvVB9oC2cs
	yl5zKCOvJCtaIpRHgnhMGtg9GR/11V0ukuQNpKvxqdoE4l2ohuTRvy9eLrclmI6qGYLi1G0jYu6
	0l3Es59TYI28UKD3yW9xjZn6S2Jc1YGR3UnMOaUT/WIab7Y6ABFrzVLLDFXzCa6fE9J1XKPS7ub
	2yBUbetp+YNbqcBD5zYCzLZVCaxP
X-Google-Smtp-Source: AGHT+IGAAxP3Bb8dp8EUNxps8UjQFg2XrkM8eTt6qptwkb9cgt4CUX5Y2k7W1aHCNPf6K0Nheydqdg==
X-Received: by 2002:a05:622a:118d:b0:467:6092:8414 with SMTP id d75a77b69052e-4676092879amr124695261cf.0.1733822934276;
        Tue, 10 Dec 2024 01:28:54 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:53 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:47 +0000
Subject: [PATCH v2 03/11] media: pvrusb2: Remove g/s_ctrl callbacks
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-3-c0a33d69f416@chromium.org>
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

The ioctl helpers can emulate g/s_ctrl with g/s_ext_ctrl. Simplify the
code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 7c8be6a0cf7c..ad38e1240541 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -574,31 +574,6 @@ static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *
 	return ret;
 }
 
-static int pvr2_g_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int val = 0;
-	int ret;
-
-	ret = pvr2_ctrl_get_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			&val);
-	vc->value = val;
-	return ret;
-}
-
-static int pvr2_s_ctrl(struct file *file, void *priv, struct v4l2_control *vc)
-{
-	struct pvr2_v4l2_fh *fh = file->private_data;
-	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
-	int ret;
-
-	ret = pvr2_ctrl_set_value(pvr2_hdw_get_ctrl_v4l(hdw, vc->id),
-			vc->value);
-	pvr2_hdw_commit_ctl(hdw);
-	return ret;
-}
-
 static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 					struct v4l2_ext_controls *ctls)
 {
@@ -817,8 +792,6 @@ static const struct v4l2_ioctl_ops pvr2_ioctl_ops = {
 	.vidioc_streamoff		    = pvr2_streamoff,
 	.vidioc_query_ext_ctrl		    = pvr2_query_ext_ctrl,
 	.vidioc_querymenu		    = pvr2_querymenu,
-	.vidioc_g_ctrl			    = pvr2_g_ctrl,
-	.vidioc_s_ctrl			    = pvr2_s_ctrl,
 	.vidioc_g_ext_ctrls		    = pvr2_g_ext_ctrls,
 	.vidioc_s_ext_ctrls		    = pvr2_s_ext_ctrls,
 	.vidioc_try_ext_ctrls		    = pvr2_try_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog

