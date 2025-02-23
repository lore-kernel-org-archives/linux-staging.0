Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E83720C47A
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337172; cv=none; b=ADkfku3OV6bNpTtlG8fYDXqrzC86j0xOmtdwKSBrNuEvLMhO9PDkBKhvaTB+z95867Wfemj9qjkq1jcXbBYsa+NNiQ0wxvbn1CoS9NKeFpbCcNEiKNZ4fomnWckPjEVbccVdCIO0YLHffDatLDr+W57Y27muYxaNWsW3mujugpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337172; c=relaxed/simple;
	bh=xHh1GodNV49mVOXTDlr/kmEEgfRtOkAHCbSYPASBaZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZkqbh2P05gbWNabDZzwirvWA0z6+tZ7dsAIivINMViafTjcKYZnI7/y134swkgj9FOJv9n8gCjTM9gFcSat5iCfdHa91tFTXE5+Dloguazc9Hgd4FAenfK7SbcLai/w7jsBDl30815Y+po0WAyWFOml8Oh+fz0o7M14vGtJJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TshajwF+; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TshajwF+"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c0b24cc566so321991085a.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337169; x=1740941969; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRb6n6dm7lw2Z9XBFIWilv+DzQlMIIsiVy3tu994jwM=;
        b=TshajwF+rlOsb+wFYe4HC90DmUfbpKp5v+VlpoDTNXYshAfS3FRCmtmxNR+W6S6VXP
         Vqar7UXTdpMeaZs3Aywazpt8F39pPW216nA86qeg4hhMprUX4DSVexjutGTwJZZmM7pA
         kirn9gvsu24W1fhggdt7vYCfFSs6YIOnHYOAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337169; x=1740941969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRb6n6dm7lw2Z9XBFIWilv+DzQlMIIsiVy3tu994jwM=;
        b=PkBuCYrogY9wJu8KETHLcnJzD1UhU352skpC8Xj/gYRnaYjCTn1IrHEBgyI+XdcUyI
         bxfK3k7EWs05naqXPbZN2kfr+4qskg0488rT5qBq8PZ+SlJFsGHp03eT2oaYc0ud4N7N
         tU+6A+mml17tmCI/xD/0k20tBzWSVQBbKcuIy34alQmQOecD3xZ8xWQztvzX1Mf+Y6mH
         rGFt04w8uDj4n62XWzaPp5Bs/8ju1YZ7PdBiBgSzUtCKQwgRclYk+WsgNUB2M1xYTzzG
         0pj3tVEYdU/P0Q2dB2JdPJryBUL5lvYrtB8jrmLsBAbM1XlpASGf744YIuwqpr1ZuEFD
         TOxA==
X-Forwarded-Encrypted: i=1; AJvYcCX1zqvcxbPL6Hw6/QyoLUe0BNFlQlvPylkiwLxG32H9gDZGp9ezSZ6eyhWYI+WZqDpwrkNq9I/cOHcmkpnr@lists.linux.dev
X-Gm-Message-State: AOJu0YzwbmfKr7dHRr33kbFH5kCEKENG4uxjtdO3xEksrfVjcmAvBodL
	lUfa3hoLMnhOZmGGbZQweML4ZZL37dqR+z4FnkqYbD3Vi5LVntX/pnU2INi9Fw==
X-Gm-Gg: ASbGncuHvMVCVEF0MzzBEFkErqWJ4hxc4Wc7sluCU/rc+CtdXkXExzojT9SR0rzjR05
	wdW6OBQeZ0FFrXGKb6REbgNyBvzc5bnOQn1QRhWTxmhoqGgvHCrNumtWOH5IHZ60NGc+57rtRIt
	nrdx/Xj6jraoMzw2ccOQQWR0sNGcOTEwVX/FdusTFZP89zrA7viahrJ9jUmUeIwL453NWdCik0A
	QLnpC+ifKlRoE2PiZZ1n58SXUWE4zjgnbhutxLeahCu4b3NI8wACqYJdpaA4Kzh7bzaaZFeQi6H
	JZWmb1jkFqsGmIbdosdFm1fgSLQg2jenKdd7gvE6FTYVqGJS1cTPJGeGXhmJLu6KlL1AQ3idi8t
	BknY=
X-Google-Smtp-Source: AGHT+IFIm1syTpeE2i1EYWI3iEtSyliT4ATG6d2xnrdk5fvsT0z7+hE4dqtz3meToG77GzeKzuMC5Q==
X-Received: by 2002:a05:620a:444c:b0:7c0:7a0b:3727 with SMTP id af79cd13be357-7c0ceefd391mr1224831785a.16.1740337169084;
        Sun, 23 Feb 2025 10:59:29 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:07 +0000
Subject: [PATCH v3 04/12] media: uvcvideo: Remove vidioc_queryctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-4-4292911cab6b@chromium.org>
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

It can be implemented by the v4l2 ioctl framework using
vidioc_query_ext_ctrl.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 93c6cdb23881..89052455ed50 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -963,15 +963,6 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
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
@@ -1491,7 +1482,6 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_enum_input = uvc_ioctl_enum_input,
 	.vidioc_g_input = uvc_ioctl_g_input,
 	.vidioc_s_input = uvc_ioctl_s_input,
-	.vidioc_queryctrl = uvc_ioctl_queryctrl,
 	.vidioc_query_ext_ctrl = uvc_ioctl_query_ext_ctrl,
 	.vidioc_g_ext_ctrls = uvc_ioctl_g_ext_ctrls,
 	.vidioc_s_ext_ctrls = uvc_ioctl_s_ext_ctrls,

-- 
2.48.1.601.g30ceb7b040-goog

