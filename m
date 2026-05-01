Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C2365A1B
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635178; cv=none; b=t0cSnv+xSsutwAxtnUWHwX+JmMv8NjRyWybcdDLO4br5tP0bVCs1WjAYeOXpfSxTxQD0HPLh+/kOzBCaj666/V8EHMgrW96o8nOlDvj+DzjTsGpDit316w1P36tQeCVVWejb0UBPBW4OhVFiVCf9rI46PGvQu+RbH7u1QxeKvZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635178; c=relaxed/simple;
	bh=ne42xYajKx8Kiea21amC61A8URblNNdzVSYQ5+DXQtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlcoKh5DNRmPlckk9cmE5V0AQR+wAks8bzfbFtztXYC12K+MhbAzHJr1fT6Dn3E+hQjZT15JhVLCtKlWVRbx9IjzkZbnl6mLMp+6pLA8N+hpDPbrgVbHIXfZI4q/Ta8LRVosyseIfk57tkGFAcUzNOJiUTesIdvpFv7wJfp4Iy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d9DflvkG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d9DflvkG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so2628826e87.2
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635175; x=1778239975; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgEZKNrl10DgxlH1xZQyC/yRD4psOac+PKsvu6TEYIs=;
        b=d9DflvkGijuS8kzMjXxWxNbIgdaGA93ea23svtxAyCmosOLNXbucVgdFhbQih7FGVG
         9o9Th2vd3U0ysd4gvpy0hSoelBzqcGNJLECohavGlw71tvapkmKkIJLrEb2cE607wucc
         i9FX1iBo30RghqLNI1sG8CMp+aZdJ78N8nTyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635175; x=1778239975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgEZKNrl10DgxlH1xZQyC/yRD4psOac+PKsvu6TEYIs=;
        b=NP8wQcsIxeFkIUOP3mxuB5rUqIWgflRk9e0HADmhxUctbbffixBOCJx+MHEjFgRMjQ
         cUK6/b8q1ql/XJtoEVzlOk9vzyG8Kq9FHXe0lG6KvoxmAvRBFlRCqC78ltse5OKEg26M
         mDDYyCBLryEAHNlItyWM/ZLQq6GvT2UPYWwlIDbBN1V7ls0GBNBQOw2qTUQbwcea02QI
         VPGqHYtx070eg0X16CQimGgMKT/JtyLHcC4rSGi5XoBHsj1nttlgpJUKZvOsN8Q+8uR1
         LUKm0rVMgF9CaC12YOhW0dN3izf1QehnPZjNNw352PJArbZI5+AJ/9bajIofqpMNF4wk
         wvwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8R9fBtJcEYKCXicLBYjCj6dC1y62aAjGBR2fxt8aE3PjsaHj2V2kLMWJpn2510D5vMNAEkk7VMygM5oKOS@lists.linux.dev
X-Gm-Message-State: AOJu0YyVux3Qb5LzBXJ3fiU4YrnB4s7G55DC+5ZAexbB85ejUffAnf8F
	Md4mBk6RTB41H33HEda4SjkPLfik4cjZlAkRuBb+qWA1/X1ul/WlcpkrvxLM2nZLxHPW5Bl+2u+
	Q8pg=
X-Gm-Gg: AeBDieukbsN0K2yc+P/fbd+c5IAtP9n0ZPimLrGGaVl5lsI3wMQGgJ6hAfytiwtQAbc
	NesbK7Ja5i8a3ZU3bIpJfc9kocgA1Cfbqv0wX1mYdUHRlZPg3gl6JmsMlDC7Ux6jo5y3OqT90Q0
	Mi95mj10HN0Kqma5uIJvKC4U7nbQw/upfb71F3dEbYEkY2JP7Vj/uOWlqVZ6Hz0cgIe2HiU4A5M
	f0gUDVix8nyie/lQjqeJh19nDYbsZS9TXrkoLiVcNkWKRuroVQDWqXSdi5R7bscw+gGRWj/rOlA
	UtP3sG7ttNkKYc5TiaYCBdghT8kDk2zCdjQjukhFybC7Ip/57smWSa9ka6IMUbq9/DqA76Y5pBD
	PmE+wI48uupyXG9wqkhuxozSQNudEvf4d7y8IuPvDLkWY8k8R3OCzgJi9LRVJhKe8AQquVV8q9n
	YJPsSB6PQC6x26C3NePvfYfO7z4v19CYBcUYuR3iFO5GeXFGDI0/5bBm2AvbbqY1rIPTTerdpNT
	8nXK0o2OT6lmErYYtVfiCCE8EKA
X-Received: by 2002:a05:6512:138e:b0:5a4:12db:d0f2 with SMTP id 2adb3069b0e04-5a8522d5ac0mr2843571e87.24.1777635175346;
        Fri, 01 May 2026 04:32:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:32:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:46 +0000
Subject: [PATCH v2 1/6] media: v4l2-dev: Add range check for vdev->minor
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-1-a2fcfb2531ac@chromium.org>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
In-Reply-To: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

If the fixed minor ranges are not properly set we could end up in a
situation where the calculated minor is invalid. Add a check for this in
the code to make it more robust.

This check also fixes the following false positive smatch warning:

drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..5516b2bbb08f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
 	vdev->minor = i + minor_offset;
 	vdev->num = nr;
 
+	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
+		mutex_unlock(&videodev_lock);
+		return -EINVAL;
+	}
+
 	/* Should not happen since we thought this minor was free */
 	if (WARN_ON(video_devices[vdev->minor])) {
 		mutex_unlock(&videodev_lock);

-- 
2.54.0.545.g6539524ca2-goog

