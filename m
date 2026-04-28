Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ACE410D1E
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380087; cv=none; b=ImGD6mClbPVVaJGLvT8b99E11ZMvbKHcEvepv44iCqjm9LttyIxMb9rRA9AQmdZAe3cFCX4JGmNOSGb706W9nabCqCivL1LILanyfTrQVmnVX7Gx2qmHMbdYpvAWV08EL0wx6/b5qSez1bMCINn3AgXcZIQuSBZwX4kagsOTgdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380087; c=relaxed/simple;
	bh=uyYaC1lTz0w/nk+wumPROnOpURb8EgSxj6J839JiKk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnPrjGMjHxA3ip1/sEnxuvS5sgbFerd6ZZCO5zXGol5OzPrM/FB/3i/xm2nizG5p03gsD/vAGpClzEh+sm8YB+w22z3tf0w84ZBzNR4coPDPCeflfkMSHK9dhQDhn+KdFJFsoiJGi7wLRrzsO/ydOZbdoTafGVZKVKK/TyLwivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jIN+pUmA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jIN+pUmA"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e4a04f059so13944037e87.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380079; x=1777984879; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8cx0IS1VAS+UenVXpVCneZJCK5BcfnnFJsArKfUIY4=;
        b=jIN+pUmAPm66hiYMbZ+Dqnbc7a2eKLCZr7lszQq0o+NZMmZ5MyWbl78mwC7DZLmoSe
         WPjqDCL0/0Z9da1lXy3Q9FFyU4ielhS3LhOF7hD09dupI42ZzHNsqzLA3/f7RQjCSIw0
         1bmHfrUPdPrzlfCDnrQGRSWi6WXqgIeaMnBVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380079; x=1777984879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t8cx0IS1VAS+UenVXpVCneZJCK5BcfnnFJsArKfUIY4=;
        b=Y4aiudl+pwTHc/6pb5qz3aUUSKivQ44o60a1C3d5NQt84k7N1genN1QweLkuhFYvAO
         WFjVNm7d+m8AGF9qNt2VRPD00rJFPLErK8T4dMP53dMVEW9SZuZErjC2TyorQu0BxZtU
         0R9ya0l5Zo5yRKuy/9lCGRKUTD6Ed4mUsI1607YTSWnGV1nDG+FEMXDjA0EGeEJQYs3k
         Wc99L4NYJPJIFt4dVlHsIQ6jLG5VTQukEZLeOf4KML7VSZH7yLd4eVqa+KgMZqthYviQ
         kToQJnHzCCGTflAWFLzRqm7AOGyGli09eENERr6X80WxwCHGCRLqfvX5hIa19rTL7cv4
         KSZg==
X-Forwarded-Encrypted: i=1; AFNElJ9PYDtTpTVqldKDfVwXljHusKerM/ZGGR/ULWaGOzhwP1tKGpa8rdWd+L+8XZ5fqTTqTfMdb9RYUMUXrU1s@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjq90/vOj5EkR8El+I86D0sbeEUsa/n5UM2j0npkfqg9LSS0bl
	Qg4RpI0YABNDcaSy6X55NxHrr1ww+mwDVVyfQLVUmO9x1KbUCZh6bJTCDRue4N5BWw==
X-Gm-Gg: AeBDievoFCUl4ohaf9GigOQlyBnceOAujurSRcPwum3ZFi1E3V51IsUROmvnJJ/aS/s
	f+o0KCNH34LQNs5iiyjZk3dy2q85hPWvkPqVyqoZApabmawrpqKQY7TRnt5fI+De62aNaFE8JZp
	36+c3pGEr46Y+tlDiWi0+B36qLpeiwmuUjPifPaBmgycX9xuZ+UOUmR5iaT1mTV0Vah6ZhnxwKp
	bkEVDXNu91EHyL46oe4g3crSQu/3pP6g6+2yRRNFUIfI5lwrehelvRZoRd6+bhRRwh24Xut8SlE
	Nu3P8jKVk4MO0CbpDJjELWjyayR9NNEQF24ubdQL+O+fFtMTs0Pq8L8UmViurrl3IwiwhjSQI66
	KJTGgj/qC+TqUMi9B3v3L86lw69KTgFOHl9FyYoo7s0XUafpTa8bFXyLVMPA9I6GP1EPLzJYJLi
	aTiiwKbKrtjDicZOkMNsgGK2fn5oAvNpS+EFvG9gie3e0cr7HVsTqnpELpPW725GagC5VayH2/T
	8HqmL7nmvvOXWWp5g==
X-Received: by 2002:a05:6512:2203:b0:5a3:cc81:efdb with SMTP id 2adb3069b0e04-5a7466234c2mr1158896e87.21.1777380079343;
        Tue, 28 Apr 2026 05:41:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:08 +0000
Subject: [PATCH 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-2-46890dffb611@chromium.org>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

The current code makes smatch a bit uncomfortable:
drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'

Probably because smatch is not clever enough (yet). Do a simple rewrite
to make sure that smatch understands what we are doing here.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9p031.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea5d43d925ff..5c9dff030b4d 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
 			ctrl->val &= ~1;
 			data = (1 << 6) | (ctrl->val >> 1);
 		} else {
-			ctrl->val &= ~7;
+			ctrl->val -= ctrl->val % 8;
 			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
 		}
 

-- 
2.54.0.545.g6539524ca2-goog

