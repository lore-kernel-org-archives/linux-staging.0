Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742213DABEA
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822935; cv=none; b=LQuquPM7HfkjkAGWPYys4Tw9Dn+7mIZFi3TsS1nboB3T5IcQwqgMs4YNzbXvUm4rzrGB1FljIxNG8Zq1jyCCs9baEUEA4/gXkAzEYChhFnVOOHqRcv+hOW+aWXmEMntmSxS7mN3lUs9/IzezVeOxfLA2VDTnH9Ic6qsbPItUpbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822935; c=relaxed/simple;
	bh=n8ESl2FNmzgV2J4Gu+GXBLuTnzpMfyubm8vIAlksLz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/mXmCE+l/hYoYrcNNIEoCNhBoRqJd3tJxWR7o25RuxMtsY0+nmBsyGQBWCI7zk6iPyYjcODYkvsI+xi++A/Ysg0v7Bj7I4Wv17xzEdGWufRh5pPUtK4HUU9AkLdqPc7N6BzdeN2GnyjqtkZd5VNDCeFpYZPU5ED8ALGinynh0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NI3FM8Q/; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NI3FM8Q/"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-46761d91f7aso18630841cf.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822932; x=1734427732; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42cU5HndT5BBlsrtO6ikMSsiagZ6GECUgrygXPNYYzM=;
        b=NI3FM8Q/WRHVHTEMfykNj+VbndXTEXsp0PlcusH2nRFK+mREGhkly9wA/AIq2Dh7GN
         gSnb3HfCTHYfCtD9Bo47/yMKzKLhD7P27Z4AxbfgAcY0r6xB+xhgzFs9iSvNKuOJp+Tw
         xfN+b7inbyo5EaqcBghH3kumQFybs+yftjTkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822932; x=1734427732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42cU5HndT5BBlsrtO6ikMSsiagZ6GECUgrygXPNYYzM=;
        b=VDEbKemfwHdbbSmrd3i6lWQ7tL3BeOgpV4lh4MiwMJgnzbedVtDOfSgt9iDYMxGZkN
         wN3Df2cmdLQOXmDJcHsMKb/K8XDW1OZSJMXsOxdgRv0s2yCtrtKfuoiSapaq7KRL5oP0
         0NhQqyH4YgIM3uNRikBmRH+jbsYKs48TFzjcCMEvNBXMLWkNVePXRoKFhxpjajyW7s9v
         FuHM7JX+vEYrazcmfYGbKOZ6vAWGLoWh/yYxmaQDS8i/yjmNI1agy6qv3koNiZ+jQTLD
         1WA3Vj5FAq2u72AXeJ7eloOEd8xfoktKLjoJcfyTEux3pbVoSNxfumXQta9Be9y+ZTI+
         Tang==
X-Forwarded-Encrypted: i=1; AJvYcCVz6sITESGcfApt8Y5gsdoTVxZtJs2XoLGdA//X2mgcJU8NxWQHtBoLIRR6SLADZ8bJM3oc1m7+tJBQ++p/@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvhu9w/yjneJmjvPCvOPmLKk+w35smgeXmPsZsi3wfsGdwQHlG
	sTphiI/LwJDXBBrild55dnL3EagaZbb1OK8I3OmEfHFdfSO7KrK9ml3/B3ZEgg==
X-Gm-Gg: ASbGnctaqJCp+8XUO+OFT2ZI3dtgQlLm8XgaqzAq5G+KvnL5pNRlqQHKDkGR7AQTvEF
	GGGPNVUNC6TdmtiODKAl9Qm45mJ5orM67GVkBiRslXhLHSVt7KKcXvASXILKo5W6FAJ8wSARtCX
	drKT3zSmDdbsPEJHnmrttzdd18LVwGgbEcvVuffi5Vhc3HZwUeaaLU6xmrCGXya0ZEI/AuOfLsC
	JS9xvLvTaMSfDxerST8NJmwavfFUp1kuWug6wiop2SoYo3kMZUAmjcM3qZ/PC0c6Geuu6L7bfyj
	4v9ESKN98d3jsP9+9JDUyXGNUyM/
X-Google-Smtp-Source: AGHT+IEnoOn63V/B5cYU2djMibYmXdFhIdrVCbSMu3sxT5u6BPOOJNCg12HGpwhTcUzr8+E2oUFdNA==
X-Received: by 2002:ac8:59c5:0:b0:467:5e71:73f5 with SMTP id d75a77b69052e-46771ff47cbmr61831041cf.34.1733822932248;
        Tue, 10 Dec 2024 01:28:52 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:51 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:46 +0000
Subject: [PATCH v2 02/11] media: pvrusb2: Convert queryctrl to
 query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-2-c0a33d69f416@chromium.org>
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

