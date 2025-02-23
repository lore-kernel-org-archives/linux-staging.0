Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4761802AB
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337167; cv=none; b=ALMMkrGnn7tbPvloc7PHMbMvjNCn5ClbHCPCYl8BMZ8Md3mba/LgU18FyuKINB0zX6Oglo/A2HlB1UqUwnMHryvdc9JkWVFePWxHeEw39foe3r9llKp4BUZFzM4S/YzV6vOAxFLgr8pm3aKt12NP0TH89/exJzZeYE0Z1An/nmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337167; c=relaxed/simple;
	bh=dOYR+rU45ZTedZeI7JX0raU+lCcGXk5RD8f4I9wTnUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQ43bZ/5VTfADEKOCXx1KgYHCh0HAsW0DVVKym17pMZ5IXaBk+lJbnwWapx5cXT5dyyaWysU8IWKAWbe3VF3zB94wD2BuHJFBV+TBJSr3HXyU9NG+Vqjn+/O8eA3Z7yyp6QujcLD23CdwtAcNLnAteYRlhF1eSrtVWJnVbOQdTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DTSWbXEi; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DTSWbXEi"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c08b14baa9so352212585a.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337165; x=1740941965; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJWyEAap1+WfidHk2zAGjrE4DT6kHcz4NCpxCTH1+J0=;
        b=DTSWbXEi3tYHrT/nNuAk7w+hId1SfIXe2FQXrqDrs+07ARYzuDFdSOKsAXIFCy8Qao
         Bkemu8f8AXRxF5EZd9Vkji7/O8EdSs+e53NCWkpjZ+CeGQyo7Yh0iwnMnxr6tLQkNyrP
         zC7STC0NUCy9sp6GtbO16dy+SSYU8GLWHXU8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337165; x=1740941965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJWyEAap1+WfidHk2zAGjrE4DT6kHcz4NCpxCTH1+J0=;
        b=vzw1tQl5cF9KD8EuXArKzxO/HHFrUc6EywMN7Xil+4Feel6PTwgeddp2hkYaQkoto4
         ZJp9PoY6aUsGqrl1E0XGtu0wBxWTTUmlMmI6a29N3f53PFOLKnnJNybfFMYUYL71/5rF
         FKWs+tc/bStn4MBcogDT1B1Xr8qAcO0vEd6eexDx6CReegtpmIPVsiO2SdyGRG2Dsm/f
         ACO0YlT3gkB7JD3NCh52Z0dbfP84/n7Ye05O+4Ap1qvl6td9H4PwA4xi8SvVVOP0emOE
         N0pinZk6IYH4qJLI5hh02ug0nVxshHYn6K/mkRgzZfSFiIcGyc64DYQmjG9B0bwd3eAa
         xJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbfFkuRtoZlYdaZohXFy32j68S4G0YGyqrTlzr8FY3OOuiY2KBPMpAUSNH+66kMKZa7B8FxYQLYjDd9IeC@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3SfT+BmtkeuOef1JGWoYKgN4/TuPe16Z4aX3Y6hHwBphLFMLW
	MjhQNbZJWj3mCEpJb+KrMYODKe/V1VMUZSKi64rFJiLJXUO3THD2Gv60uHMLEw==
X-Gm-Gg: ASbGncuLPKVwcmiCUAJ7PWjKDDFhg0+g8ZlRyI5lAPosGiLiDECoUZNKpOJsDlGUD8c
	UE+NRXH+O6d8cpwktb3nGCdbdZMUUxeF5vXBC7MRiS6mMSL+aKbF17pxpeXQ3JhuQmpDXoVIJFA
	WVCAmBkxo8OOynuSlCLk4GJ49RLljgYeqMyAmFyUPQLBXttDK1WEdLG2G1qHhiG7CH09R0QLm7+
	jiP7zzcEyIo+P5062YulOQ5SrAlm3G5reXj57rCBa3+QZJ8vRQ56WO1nBu4qUll3mq/UewNci/X
	UdqnyhzgOFiNONIJFhcjsa97zo5pYNrzwiL3RVTCmqlPtX6Rb2bu/523aSjtApeAVjqVKuyLmTi
	LYhU=
X-Google-Smtp-Source: AGHT+IFYqDOGgV28QPyX8iJ9ppiO1sSvPVW9QWBsd+01pbtAkqxHgdzjOQyBpkU8O/OVREpVDay7zA==
X-Received: by 2002:a05:620a:1786:b0:7c0:c2ac:c087 with SMTP id af79cd13be357-7c0ceefa3f1mr1372556685a.19.1740337164924;
        Sun, 23 Feb 2025 10:59:24 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:23 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:05 +0000
Subject: [PATCH v3 02/12] media: pvrusb2: Convert queryctrl to
 query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-2-4292911cab6b@chromium.org>
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
2.48.1.601.g30ceb7b040-goog

