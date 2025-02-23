Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688F20C000
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337169; cv=none; b=aNF4cYBHrBii/RS9St04aNelS6JE3C1vyzqNTE7x3j/vHu6zkEP5+Pjt8NL8C5VBb2CnLgTsoG1XxbPFYN44Ye/V74pS+TzYRAkqYRk6EM3kDNyY7w8bM7ggm+apNrOIhEUCrCykVfR6M+gLCeKO+pfuOBHJ1aW+T4mBwouz2Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337169; c=relaxed/simple;
	bh=myXjIaGjfoOSk4gWvfNUCnPKOkUfNfQoYFyPFWxU7TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vd1CipRaah7Kqo3K6hgIBz5w0y/L9xd4H6jHfm3uzytg1gjmvUaVvTb5RESx7YV9Q4ZRf2dvdC6WPW2DikcIQ3Ai+OjtCSjuxMXRNGc7z7+AayLgyNEsuZmtUAk0hdzlgSaFBt3bsFRNJMd1Pa63VDaUMaiyFEOxkTWOagWB5G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=df2bhQzZ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="df2bhQzZ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c0a1677aebso363119785a.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337167; x=1740941967; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnN0g4zN2JxT7rEykWa86K6e7OYYbd0erUw+cYCyMXw=;
        b=df2bhQzZGbt14268DsuLuIar1Pr29XcThhKH5nUuHq/7atGgeFppdOMwxYX/q5IKrq
         UUFv3g1BNUgNAkozMtZZEzuYeu+p+3YwUUlCO2PsI9Lur9WMmJtxUDJ1wfp9mKeM6GkZ
         wO+NT99YbM4Z4I/tKD5WD9nFQKCqBNBobuG2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337167; x=1740941967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnN0g4zN2JxT7rEykWa86K6e7OYYbd0erUw+cYCyMXw=;
        b=MEDnFk8ycR4w7dkJxXef1F8p+6vCTVj+kebiwJFoxkA5VsKekxrmMKrkQJwpn8BRyT
         +jiAqQsoV9m+plR6KMgZzHqEP3ANgQsZ7lC6hwtl8ErJXJ388YTObf6/shmB+xsGWLIA
         YasQBcvhaYW3vFDl1wT7R5gzQZnlXuNmJgLsFZEsWFQ3BBbHjypTe9tUVbXi0teWHh3i
         Si1h13Ww8y0B2vQGznmgZnYgwYvJfAEFzpUrTmbMprys0WB3U8z0ZBT5Hqia2EP22qt5
         ByO4V0LMHnwOcdGKWDnGcBiFfQHkZ20EACr5vL7du+xtS8ouE3Ws3fcfq6IGRoqEXc7J
         aXQA==
X-Forwarded-Encrypted: i=1; AJvYcCXZY1B+W/0wIDGGPu2n1K/YEgXpviLZ8JBMEl4X+H9S2RJqv96Krbj8dVpeueHA06MV4+ZZgP3gfYb8/nHd@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7kAn03bi6wzq6KOqI9za3O7gAcAF/a+WyF2v5Jj46uLwq/LTO
	3toJfP7OiPn/iIfcW+OjsTVmB7nkapdSIL3rM3rxvN5VIZfUF3YgajitpUZEc3lEO92lc7OlGIS
	yX9/F
X-Gm-Gg: ASbGncty3x4AZGyVEjNFFoCd4QBHM8/Kh/a2Jx/4PEn2JNv/+8aviRPF5ZX7CTVnLQx
	Dj5e1uTZeWQE1uDfD56KEVuRQAMLavBFIh0BZCO5JJHUWw2A7w+CDiT7hnruFj5xi47TbNP3ZXX
	tfNI5x+LRGjvaHt+krfoa5hnq8mIJsv0NydGNd2gObEeffA1yMoG+PTgmpfRADWFHyxsBPyi+VX
	aS0ymLF6nrzEH7tqXJfm+Bj9pm9NTw+bW9vZWGJ68r6Tf7J8PoHpUG5SG9253aptQjz2A9fTl5L
	4GSqqEVfzmfl/7FmHFP3IxyCq2fKLVrGpggk9VF+ZyhQbWVASpFWhXflcLv6lfVOkUl92dPhai3
	RCd8=
X-Google-Smtp-Source: AGHT+IG6XQAhoRI9GvPepX/CjaG7nv07d/LfoiHN+LEQpa+mFjWVBGB/SkS22EGTKBolEf1SeYC0Ng==
X-Received: by 2002:a05:620a:1a1c:b0:7c0:c214:f2d with SMTP id af79cd13be357-7c0cf8ea897mr1355134285a.31.1740337166661;
        Sun, 23 Feb 2025 10:59:26 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:06 +0000
Subject: [PATCH v3 03/12] media: pvrusb2: Remove g/s_ctrl callbacks
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-3-4292911cab6b@chromium.org>
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
2.48.1.601.g30ceb7b040-goog

