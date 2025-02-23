Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E931E20D518
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337176; cv=none; b=NP4uT1YHjx3cXp8vGC0Ta47R8FB8WYUXJ4QT/43WIt0ntj+dnC+DWjgL0MTEJHL6t4v2oFc4aocRg+yEcXk1yjJDr66iffJ0QU9Xz8toloBOostIqFmxWmOAIiE9YpeGdD8OZ8NUcqSLWLXMk8XCMrTv98t9z2PwkKLQimcbzBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337176; c=relaxed/simple;
	bh=lWWjDY2I/8kPY7a6V4ZbdxW4J2FNahz8aBfrPuD04k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FjZoFOSc1vjT4xZi2a2WRSR/P+zfB2Sh+Hx+UQj5CSqJpFVnF3VSvo0jpfRa6WEPzm4kqPBSzR4Qhsn1/udfEphh6gwxZVNaGnV/rGKuNP0uFBLUr5F/yeF/X4EdfRNmBOl31yCLWJpQ7j2DDKQqBVzMf8kHI/ZLoQSv1xXt7KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RINC/kA9; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RINC/kA9"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c0ac2f439eso404862985a.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337174; x=1740941974; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9BY7E7vHC4YHTi+FAvg+DDleZXfy5R/P4AUAZGGpCU=;
        b=RINC/kA9oIJdlpRbyDsP+qYOre1Fmh58zPrv6dC0FPTEaJLhIdNm2GBphG3ljzDjd6
         hWAQV1gw92UxtFNxRx+Njvkj/vsp82RNcAQAEouZugsxEKKYyWwWyalMif+ozIRKV7fK
         aNzd+Pc9tBpJUSvvoTl2uP07hu1DigmYwgcXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337174; x=1740941974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9BY7E7vHC4YHTi+FAvg+DDleZXfy5R/P4AUAZGGpCU=;
        b=rd9l/G4Oz0TVq8OvU7cf0i53puW28pUw7KpkWk5Rizptv2DafkdQ/SVbkdKWV58zc9
         /c2tOX94PDaTEHNFK9PC6ZEbh7zI2cxNrgVLBqIJ0sqPDDcxky7bpWTIj6BTEIi7c4fw
         ekX0dhkEcnL0Fzr05aviG081+QmszQ64LH+Il9V0BZoES8PK9oSFQhEFxkjxZ9+dz4Vs
         mkKywnBuMr48Q+GCD5oOmCw0ZppVDbgT/1xvCrGG5pRu8cDd6DTMR3z8SxxrF/68d3za
         7olOlx2ZmMRcRbTECSY16DqXHXXxiczW9AhwY5CS7qULU+80sg7O58cnVu4PbUAWOdIz
         9K1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLV7ZR9IPCWWtDcYnk2MHyBdxM36BC13XMlv1v7J41EFYpoy3cIBIxBzpCuy/lrj/hhwBakk13DXskgVm3@lists.linux.dev
X-Gm-Message-State: AOJu0YxZb/xOg/IyvJlTApjiVENGpCMnyFaMX9WkprcHG4UXsNBnNhQc
	bNDOpdVd0rJb5nnGKxguhUi8BJcBgUuhteMMyo1pa13E63YefM5pIEszZC0C9g==
X-Gm-Gg: ASbGncvRSvYL75/dF03vKp1PTb4FveHyZ6xBOp1oGS09bLvLMfOfwhY3g4R3eSzvdfG
	0YvaGLAGoaXBN/9J1iSH/QRBzwQ1kIh/AjMW8SEnz8fNyx8fv03tbAr1h4q8ldhtvV23ejl2ktr
	U3GDH5p9rGuyKapFe8PbqJNtRRUCIKKcALCpHF9AQybGH/CaAait12smWngxc1TQ40vzRGOuN2P
	D9MB1OYoEkgo0tOgD2qy0HyKooerRxbrShIETLJda0K6UuS0+VjZ2RLQXjVJAu1bNIIsThvIar4
	x0O6/6qaBO9wdbrE/DvdiimlYniQb/dMrR9KNCZwmmi9HysotDWuBSYucrqzf/eJzxXrRHrI8u2
	f/es=
X-Google-Smtp-Source: AGHT+IG41KzlGhpkWHI86/yfKt+dY9ha4b9ql5LXo9JQXG1jbyYnUpn/M+Qt6Q5FogdDhwrNVGX+Bg==
X-Received: by 2002:a05:620a:44c6:b0:7c0:c2d7:5f2d with SMTP id af79cd13be357-7c0cef0e576mr1229924085a.28.1740337173910;
        Sun, 23 Feb 2025 10:59:33 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:32 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:09 +0000
Subject: [PATCH v3 06/12] media: atomisp: Remove vidioc_g/s callback
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-6-4292911cab6b@chromium.org>
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

The v4l2 ioctl framework can implement vidioc_g/s_ctrl with
vidioc_g/s_ext_ctrl() and we provide those.

These are the last references of vidioc_s/g_ctrl in the codebase. We can
attempt to remove them now.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 6b84bd8e6cf3..1fb2ba819de3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1565,8 +1565,6 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_g_input = atomisp_g_input,
 	.vidioc_s_input = atomisp_s_input,
 	.vidioc_query_ext_ctrl = atomisp_query_ext_ctrl,
-	.vidioc_s_ctrl = atomisp_s_ctrl,
-	.vidioc_g_ctrl = atomisp_g_ctrl,
 	.vidioc_s_ext_ctrls = atomisp_s_ext_ctrls,
 	.vidioc_g_ext_ctrls = atomisp_g_ext_ctrls,
 	.vidioc_enum_framesizes   = atomisp_enum_framesizes,

-- 
2.48.1.601.g30ceb7b040-goog

