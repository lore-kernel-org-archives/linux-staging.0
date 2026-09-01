Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8642948822B
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283292; cv=none; b=q65/s1Vm2uSM9+70N1bmwRjUfMnuLWwJyytaodbp6dbzi3ag/M6GRV+woffVYzYNj9d4JUQ3gs204Pe2NXr5gtxtLGbooogwX4igoNnMoLTcXSWmdQHce2P1U0DIz0Qr7cW7cv4ROmARjqDzJXUVkiffZOuMGKRbdD0klyGj/+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283292; c=relaxed/simple;
	bh=LeGDvC3l27Wo7zRvl7F/A9X2MyhBj7RXCYXvGI4LZpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qfe9nGoBBhnll8bCqr7WV4J/L6QhsFl80jImLPRZ07eubtSuNGJLR3lpbqQ39PDclvM0LqrqDMHbH505TMeONYJ68F4GMVuRJTIhwTC7BqavTUqHdVn/g3WsCxj9YBO0cDt19tVB3thbnRe0p730yqaW1BdkbV8mI1ZWHGT/ouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUmVALwh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUmVALwh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so172145e9.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788283289; x=1788888089; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxn9qM2Ppo5iTTsOVfzJ7uBe3gU3KpqKhhkdUu2Nv7M=;
        b=hUmVALwh4mTZuV466yFtcRYTHg6yjW7GcXUpASKqtGV9qgxqUn0NZqhc9EC9RHj3y0
         nB99Xi/PZ6M+x+9Vvrz5dz5B1niwU9ojVVto5oXVt3EAQwjO/cLnyz95gmSs8TLrMnoo
         EMQJ4xWAbz1wo0wfEjJDbxz9vVlRmc3ga/acFwI0pfLM+U3ByMUyYcfRW9ArrlIhVwLe
         1n+wpu3ysHdywHKprVxYaFj3VN8era8jUxRc5ODqiEp3r1raEtzZUlYbE1zTC6yWN32s
         slSUFvQRHkIbODveo6TudeBNGG5Z6FHKxWNQX3omksQvkYqOmWg140QEhH5gKhbIHlK5
         Iy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283289; x=1788888089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxn9qM2Ppo5iTTsOVfzJ7uBe3gU3KpqKhhkdUu2Nv7M=;
        b=TqNug8EFWEr+BPZ6/k3mrBTKONACdgTj1lcxT1YLlkiE5jbCrQnl1Imt3oYs1lBCjF
         Bzp677LNsUMqaSsdFtR8QZMP8efuDttz1ufnbjON0CrsxbQI2I4AyVGZi9HMZ087/RNF
         p9BglmFZUZf2swdGefVilJbHrGIOEGS2gOk9pnzUYXyvRoONGvm+A6eJDf3icxdXWzPQ
         w1PlKn+/t0fKVBqmh6UJQ/+YhV7m0QXYBzSi8h6HvMuVezEXy2cgysPCiZg7LvyXIVYn
         T8TxUpYZX6iQHZQw3gq7WjL7H345+nFRQskI//+1s35Ca8nbVLIT3y5UA3KO1DuL5AHD
         Roxg==
X-Gm-Message-State: AFuF++mHCCRTVQZinSK5UCZrX8lqx5dWjtHjF5nWoWdDINXFrunmcIVD
	7kypRMKUmIJj03rlAqXIMJcx72FLW1r2ISDUCLm7apfSN5mcjXfsYNk/
X-Gm-Gg: AR+sD12UmV+IqmjWGGJRXCkKTLpJlxOhk2orZL+xis+IQw0s/HDEPT1kDnK0BjmBM5w
	IsWXJM7QrNBV4g3vK/TlHA0KiXswI0QT8Y4zUo6Gfq1fwpUyJVbEohgcDzWTUtmk3zxzKUf62mt
	Kta3NO/PCmOW8+c6jytmNImdcNA1lG4FBdtvyRBWRg1GYM4f/uKemNtRt9UMa1tBAEz2Xffk1oj
	PZGWlzyxlLYuQT8MeOBfeKTBID2t4UxVNiAYoJXSV7bw5DvHvR/pE+aV4UJjCna11eAVil9F9ss
	J5QyCR8JSMzd8R3uQxJwlUim8vRJqhpy2LqYWop2IybRoLlJJZ6uM33JMpTy84N7iIIYqSlIGXm
	BkW2ekBPydZuNxnxVtKRLwowbz7MQEOWszrIDliv4xXrdI3IspestY8dtsWAezysltUmkVlwFJB
	DYpc/nJSVG2jm8fry4mdf6OV9O7KPlKU0Em/sB/6Lm+V66OI2hGG1Tf8JMEGH+aElvCVl5tg/X5
	fI8RF8gv8PXxwSxKkb8GrZwjIYYRz14/hkUs2eSxUk=
X-Received: by 2002:a05:600c:4704:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-49b91c2d8femr548275525e9.5.1788283288657;
        Tue, 01 Sep 2026 10:21:28 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.209.109.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm508846f8f.6.2026.09.01.10.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:28 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH] staging: most: video: document the locks in struct most_video_dev
Date: Tue,  1 Sep 2026 20:20:55 +0300
Message-ID: <20260901172055.53889-1-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neither lock in struct most_video_dev carries a comment describing what
it protects.

list_lock protects the pending_mbos list. Buffers are added by the
component's rx_completion callback, comp_rx_data(), which is invoked
from the interface driver's completion path (a URB completion handler
in the case of the USB HDM), and are removed from process context by
comp_vdev_read() and comp_vdev_close(). Note that in the comment, since
it is what makes the irq-safe spinlock variants necessary here.

lock is never acquired by this driver directly. comp_register_videodev()
installs it as struct video_device::lock, where v4l2_ioctl_get_lock()
returns it and video_ioctl2() holds it across ioctl dispatch.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/most/video/video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 88892b5db..c354d1820 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,7 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/* protects pending_mbos; taken from rx completion (softirq) */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +41,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* serializes V4L2 ioctls; used as struct video_device::lock */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.53.0

