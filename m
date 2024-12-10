Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7028578F52
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822938; cv=none; b=VFdRqanwSQaFovjKTTKwsY5+sUpmAhS5SA7rWcm7PirLas6cCslYKgp1XoQKYyMMQacx+Cd6lYZWCNogoZYboiG6/eog9E7MZdYRSA+fOTsQoE+KaPu/lE9sBI7sxVY1kl+jKHkRbYUJjCo+VOl7V+8lK2LIzoTxvKeqY+AJXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822938; c=relaxed/simple;
	bh=64tvBdAJsYjij/MYhZgHmQi1NAwPb0Ws3Nyiuj2wFEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhB/L90ca0q4INmHdZNlWxuLLX5tgv/km2mqDDM+dZl6RdrwNAJvWmfgABQ5aQv6530AxDXelOmRphX2o8eu1U6jMtZflnk+9M+PWy624AxGwAeedWVg0yK2KJD3A40j9j3BmrxZpSavJ+zZc2pkZbcZqTMTrXo06PyZTfhb5U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HWj1KjPe; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HWj1KjPe"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467725245a2so7792351cf.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822935; x=1734427735; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjvmPnf8Z5eA5SFOWcK4xqjLhjw4Qhz4HdUq4wZg+ks=;
        b=HWj1KjPe4tjEjV23K/QNzA/lwAt/5DXPXMsTPL6ywtI1GO62JnFIP9AvxJn/GqAlPP
         d68+5Br+QHiLWbp3Fp0Qi9Yp2xtyJ2/eMVEVr7kJvaU7UnoL+frTq15Q/cYsWqb8qIVl
         XXgXRGP8PracfEm2yc6mTdkRzobvvsYjhrpPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822935; x=1734427735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjvmPnf8Z5eA5SFOWcK4xqjLhjw4Qhz4HdUq4wZg+ks=;
        b=vzVqci5S9Qe92fj/nZK0BzuzD0OZhlsOd1KCGtV0EOLbboGmd8gZ3cU5UGi2kgoyTp
         8ZiUiMK3Muuys84BDWlxnJI7yApmIr7kHdMTvGLUXrqDOJvqHKf6UiLULIWSHfLGKjJd
         jtwX36LzrLtF+ntQJoLinppmeZDWeeOeKqG+UxR+9vtFN1g12i7xDtM/ixMKfzywQ3w0
         GFrOeG3RAM3giJDNK5HdHqPXrdekXB2cZO59ZV5VXYnflCx85hO4uc8AdK5B/nzKVXqM
         yv5nrWQra+BiQ/dUmwYoQ/6LoKl0k7xhZYXQ6+CKcu+VOGaxNrF+XDjjRcUQj6+91Tc3
         4cEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbggi5+6TVbZwgOC+QQyIh4BprhKmwjRsyZjBwWSVrNnviOhmOa0VNECq0bBKMOJiAOmHoPzqd1FD28wEs@lists.linux.dev
X-Gm-Message-State: AOJu0YyJK9M2E2ACm3UWu1MtAwMYKVW3tqn6vUh3hrHiObP0TFmE6szX
	QMw31oeO3WpaTflKSZuK5hU7VIw1kCNfsoJqiCn9axvFBHjsnyrEUWqkfwrBRw==
X-Gm-Gg: ASbGncsVVZj9kJSoIMk0LAs9Rzmnwe+R4jctUgeYGC9PIy+LtKsDhOYExRD77QZP4Zg
	mnmnbG7FCXpRlWlMbwGuYeQlTeYVGDINHZGTwJJ6StkKjLa6HYQvNco94oBhQI8nSISf0rXp8av
	pw1o+2z2weE6/TWd97mEBw5ZI1B+JHa6EPiq0sF5vhQ4AZ/7g0IA2zBgKAo3qNo7t7OByL/e88D
	FOtIYUDSLI1dZDOhP/1b7tUQhT4jE5GnofF4wekTL8822oKc0Y4LNCYCySEwb3VzaLVRo5T38IW
	XvZF6sphe1O1jU1bKh2tS7KiY2vo
X-Google-Smtp-Source: AGHT+IHGAkrg9JR1HBN/d9GzBVA8UPusHAYSvN2VMXg3nbckSt2H7xOL5ABV9A5DnG2qBp0kGbezeg==
X-Received: by 2002:a05:622a:1210:b0:467:64c1:c4a0 with SMTP id d75a77b69052e-4677205c693mr65416141cf.56.1733822935529;
        Tue, 10 Dec 2024 01:28:55 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:55 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:48 +0000
Subject: [PATCH v2 04/11] media: uvcvideo: Remove vidioc_queryctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-4-c0a33d69f416@chromium.org>
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

It can be implemented by the v4l2 ioctl framework using
vidioc_query_ext_ctrl.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 97c5407f6603..39f0ddb6d01c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1014,15 +1014,6 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 	return ret;
 }
 
-static int uvc_ioctl_queryctrl(struct file *file, void *fh,
-			       struct v4l2_queryctrl *qc)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_video_chain *chain = handle->chain;
-
-	return uvc_query_v4l2_ctrl(chain, qc);
-}
-
 static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
 				    struct v4l2_query_ext_ctrl *qec)
 {
@@ -1563,7 +1554,6 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_enum_input = uvc_ioctl_enum_input,
 	.vidioc_g_input = uvc_ioctl_g_input,
 	.vidioc_s_input = uvc_ioctl_s_input,
-	.vidioc_queryctrl = uvc_ioctl_queryctrl,
 	.vidioc_query_ext_ctrl = uvc_ioctl_query_ext_ctrl,
 	.vidioc_g_ext_ctrls = uvc_ioctl_g_ext_ctrls,
 	.vidioc_s_ext_ctrls = uvc_ioctl_s_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog

