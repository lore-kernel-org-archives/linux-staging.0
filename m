Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BA4197A7F
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772339; cv=none; b=Sb8+iZRDwL778pUhJShAF/64xA3EIoC+Z/zu9vXto3X39B/JxO10fNiw14KfH65dmJ9aZGWUmZyRXig5h8T3FlNblrix55Czwgfof1rs6oincum601jqFi7C5reSI/1ehwsNczzfewMuCMuZ8LkufVVFdkzmi9N0NS7rv9aBb7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772339; c=relaxed/simple;
	bh=n8ESl2FNmzgV2J4Gu+GXBLuTnzpMfyubm8vIAlksLz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBbTC7+RfIzjCX27UfB6Gd/ZouEYUdlliWZLkaoXVc0+CqMvQIT8l6Up8GGwSLKzvzfxpsjX+LHwyVFeecylhuKtk06wQRp6dACTHH2S74ogG8Zh0KDfjH/WJaw1g5i70qWTC+MzseCP4wi5H8X2sAvxwjH39VRoHQD25jnLeYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KbSQmqs7; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KbSQmqs7"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b678da9310so412880985a.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772336; x=1734377136; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42cU5HndT5BBlsrtO6ikMSsiagZ6GECUgrygXPNYYzM=;
        b=KbSQmqs771ImdLOKk+DB8aJdqZBznXgf13oXY+BxqEVEI3jSQVwxsmtvA5L0QvaKI5
         oGfYaPvzSjCbCrxsk2204mMbtIJpj2uRlhLEs+qobTGmzYUg5IB9uYSL9hZlGMNUHNXw
         WLH5lDF0JGynQgaRqkmLy8hCKM1hOHMoxL/ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772336; x=1734377136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42cU5HndT5BBlsrtO6ikMSsiagZ6GECUgrygXPNYYzM=;
        b=FXTbaenzzglWzCrXSBtOkhsAxaIprpwoDBB81xOdV0FIIK//6nyrFpFIM++60GoB7n
         1odLsPXHUd9C77UnOsPZGs/IZou9xE75fAP4JWMD0haa78J0tTCiDhS44Ff22TYD0Nte
         y4EJTPqX8dR1BR4NnzeGOCPyAQG1FIZxwL+pLqdNVc3+vsQQZ+vnbPM0Zo/F8mUPayCS
         lIgBQPMpykbrg30bRioYkPfRVDksRJL+PI41mxq8I0CXD6P0lJNXzeRHmAjODnjKamu9
         tZKa3lOyvbW0+WYtBwDHs9BCVbXptbgeUvnv5SwqzgEp3EH5TWS6Fk85l2cGi4n43yax
         Qizw==
X-Forwarded-Encrypted: i=1; AJvYcCX2TdchpfwdhDWYtse+7zGqmC3ddh+ocNZ81PDYD6jS+K4qgEvqKdJAbew/RWo0w5GM13wzEYcgEq5cS0Y4@lists.linux.dev
X-Gm-Message-State: AOJu0YzWDo6S7L0J6WIneNqVAMf8VfSrMOX7JibyZ9baWjhf04L/7+iX
	kgBtRZNns5R5ligAJNdHxV1Pv99OAJH/FDU3kca+gPRpWBA0rK4nm9n0GimTrw==
X-Gm-Gg: ASbGncsXAV8tdIiVpUKEIO25hnq+hEsStLlh4UPKHrcBRx2vtF010cGpL68RARNcO9x
	u1ZU1IderI9VEP+VVggsFeSQmVdOQEHaEbcJoHmjTRd5cxT9fd55PEUYE022WVr3D2vgL64dKWR
	1g36+NQDNs2wE51AVma35/7nv/vOUq7oeBb1jYPvWcUmeKcu/7CC+bt9Dc4CZkJ0D+G/Dc8raLa
	Wa99UxtmmO9RSOtdLkUYsmsQgO9r0j07drTPGAtvsKXeOl8DPEtveHQoE+KRiXVR/icnVy6qtAR
	3QC5FIbL6uOCMLG7rD7HE0uf
X-Google-Smtp-Source: AGHT+IEy6l30xGUpPrtDhWxzqtb+SOk5CYgv2g/6hAF9Khw34+20F7wqboI2TcspSBsyb30HCeEv+A==
X-Received: by 2002:a05:620a:261d:b0:7b6:cbe5:4072 with SMTP id af79cd13be357-7b6dcee4214mr257887485a.61.1733772336321;
        Mon, 09 Dec 2024 11:25:36 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:35 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:33 +0000
Subject: [PATCH 02/10] media: pvrusb2: Convert queryctrl to query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-2-deff7acfcdcb@chromium.org>
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

The driver was missing support for query_ext_ctrl. Instead of adding a
new callback for it, replace the current implementation of queryctrl and
let the ioctl framework emulate the old function.

Most of the fields are identical, so the change is pretty simple.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index d608b793fa84..7c8be6a0cf7c 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -497,8 +497,8 @@ static int pvr2_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 	return pvr2_hdw_set_streaming(hdw, 0);
 }
 
-static int pvr2_queryctrl(struct file *file, void *priv,
-		struct v4l2_queryctrl *vc)
+static int pvr2_query_ext_ctrl(struct file *file, void *priv,
+			       struct v4l2_query_ext_ctrl *vc)
 {
 	struct pvr2_v4l2_fh *fh = file->private_data;
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
@@ -521,13 +521,16 @@ static int pvr2_queryctrl(struct file *file, void *priv,
 	}
 
 	pvr2_trace(PVR2_TRACE_V4LIOCTL,
-			"QUERYCTRL id=0x%x mapping name=%s (%s)",
+			"QUERYEXTCTRL id=0x%x mapping name=%s (%s)",
 			vc->id, pvr2_ctrl_get_name(cptr),
 			pvr2_ctrl_get_desc(cptr));
 	strscpy(vc->name, pvr2_ctrl_get_desc(cptr), sizeof(vc->name));
 	vc->flags = pvr2_ctrl_get_v4lflags(cptr);
 	pvr2_ctrl_get_def(cptr, &val);
 	vc->default_value = val;
+	vc->nr_of_dims = 0;
+	vc->elems = 1;
+	vc->elem_size = 4;
 	switch (pvr2_ctrl_get_type(cptr)) {
 	case pvr2_ctl_enum:
 		vc->type = V4L2_CTRL_TYPE_MENU;
@@ -549,7 +552,7 @@ static int pvr2_queryctrl(struct file *file, void *priv,
 		break;
 	default:
 		pvr2_trace(PVR2_TRACE_V4LIOCTL,
-				"QUERYCTRL id=0x%x name=%s not mappable",
+				"QUERYEXTCTRL id=0x%x name=%s not mappable",
 				vc->id, pvr2_ctrl_get_name(cptr));
 		return -EINVAL;
 	}
@@ -812,7 +815,7 @@ static const struct v4l2_ioctl_ops pvr2_ioctl_ops = {
 	.vidioc_try_fmt_vid_cap		    = pvr2_try_fmt_vid_cap,
 	.vidioc_streamon		    = pvr2_streamon,
 	.vidioc_streamoff		    = pvr2_streamoff,
-	.vidioc_queryctrl		    = pvr2_queryctrl,
+	.vidioc_query_ext_ctrl		    = pvr2_query_ext_ctrl,
 	.vidioc_querymenu		    = pvr2_querymenu,
 	.vidioc_g_ctrl			    = pvr2_g_ctrl,
 	.vidioc_s_ctrl			    = pvr2_s_ctrl,

-- 
2.47.0.338.g60cca15819-goog

