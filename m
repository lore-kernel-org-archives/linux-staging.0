Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38141990AB
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 19:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772340; cv=none; b=hpuSstY6jYFhd0u9JPD5CPHHugl76t3DZFWH2ISXWX8AjDl5apbJ1KGOUjFxOFOduO1BzRs1d3GVzwEpxyTvfCEH7uKH0sUjLbuJZ+Y0W1DBmsFvh/TYHjWHEkmRB8V2oRpnNmprm4uVZxh2MvQMKv3D0OxCV4mt89gOxTTjlLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772340; c=relaxed/simple;
	bh=64tvBdAJsYjij/MYhZgHmQi1NAwPb0Ws3Nyiuj2wFEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nV2sn49wsX4+5BFL623aeMH+g4gcSnvzTOE0u22n/7qgkjB2fGFxFMKXxsP7hyN18v0FrArHuDJhVHy5Z8Unge/YLbdwEiMX5bhr1Zd2Y2eHYdrX8/bmzPtvefPM5LC22aMETqoGc/DjTIuS1AV87Y1HOBpzoCWQB4aHFEvLEwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l20/uS62; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l20/uS62"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6c3b1ee59so181816885a.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 11:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772338; x=1734377138; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjvmPnf8Z5eA5SFOWcK4xqjLhjw4Qhz4HdUq4wZg+ks=;
        b=l20/uS62UGzKanWB+n2H9aKabb9NKjwvvDVXGgXXWhjW6NcQ1jZ+e25NYcZWSN3u7W
         dAdXM/LaP0FfoutWbsbshxbkCmyrOVizhHok4EzLfgaujBeXUHYX5GoB2f4PYmC8nnq2
         Dza1honIKny1SER6msB1KArOeb3M8xfxedBcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772338; x=1734377138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjvmPnf8Z5eA5SFOWcK4xqjLhjw4Qhz4HdUq4wZg+ks=;
        b=SSMxYiethM5L+GeQBkI8FVlSXcBn5ZgtfakZLGAlCGZz1rKxgQZZs9GmgCf3bH20A3
         tmzZnmZ3JhM4Xlc3qWXats34OEAUtxS15W9DKQiblVdlJg5wG7pQEqWKtQWEx8yYm1wk
         bFRWk0DoaceEYV810bOZGJJFJn0PmvLdOywmx/A1m+KKs8c3zjWdIKgFXFic/2zPdIdV
         7EwqCNJYa/exX+0YCzICByvsrI5ibRMaIblNYvfMac9UPbylI3Nwu77FS5KVlfMEakih
         VrTbdq+UB3Zh8nB0ONfTF7kkt+wce8Ll2PfPQthFcIImYjkrkI+Oq7GpYE70oNbHG/On
         8r6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTbd86tRW8QmDCiNiIBbS5ujn5AIokHucH1FWqUbpV/byThmcTpv0A3Iuhha+Q+o29YGkNdi+eG7ewLKj5@lists.linux.dev
X-Gm-Message-State: AOJu0YxSu7ZR7d6zgzhljz+FlApoVZZJ72eD9N8TVlaRbX2Me+SbbSRb
	C5g8YHrYyWL3kxTHLuMGsmOKLY9YwuVBbtKxZIuhpk5loCEWyKsk+pQKn9lWAA==
X-Gm-Gg: ASbGncvIEU+qwaeQ8rR/kQT7libafYev48Dbxi0PkbagxTMBlXZqyJOoLHBnqswK0Dj
	cC+JT6fu0ViWu3i+PwYd7Vx7e+aYC86ehzhUuZ3hhfJNr4DoNb+32gxprEP4OJTJcsOvVFWQ4VB
	ZpNwMBGNiYgTYduFVc4VPQLyeieagVixKE7sDgQf47kK9UqEMTDxOM0qGKmvbouTGTwoy6HWAh7
	EicbDykE5dEtNk67aFMtc0NkNHpDPxHiIqCHF1bDYdhVvwsCsUw1Bnp+4OhpNRNzxZHo1zr84C6
	UJSPMxKnR+UnsqEYQNPY7nzc
X-Google-Smtp-Source: AGHT+IH1wzP+i+irxWUKaESGp3CH30PU34aVuj1OORJWuuu0GU8d5eHV3sDCSLEwq9q3e/12onKEKQ==
X-Received: by 2002:a05:620a:8904:b0:7b6:dc74:82a5 with SMTP id af79cd13be357-7b6dcdcdcd8mr249752585a.10.1733772337958;
        Mon, 09 Dec 2024 11:25:37 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:37 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:35 +0000
Subject: [PATCH 04/10] media: uvcvideo: Remove vidioc_queryctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-4-deff7acfcdcb@chromium.org>
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

