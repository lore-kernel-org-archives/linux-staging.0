Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AA629D275
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348674; cv=none; b=HX+oklDHSIVdpvvUweybyb1WVx4Q5CjuZZQmY8D/JpzxJpD9+paqS0UfnDGrwVTq+6G6ByCJhdCLU0ar3Q0x8Kt4t7d/0oF+yYDnvnzvWiChNp999AKCFacGnAgAyb0hXPDU9TEHqDLYb6ELDz1vRfJQm6ScNewtRxjQBOz8kd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348674; c=relaxed/simple;
	bh=b8OkLsmgu7elnySFLUp+N4jsaAoX33QuKfmTdncvJYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCjbap2rqb/8TC7L7DnVWkv+/VJKmad9JPhq70JOGEQBUP9+EBUyWDbQwN3X0frtvU0/UcnJOk3vkTJNfqsfCvIvmogFHgDFe6E8LEG5n+fqHvVV9hZKOO37vacVaN2vFUPFZiQiS/WPOHrmNl5w1W2HKeIbZO+ZotTCQR2OAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6eg+L7n; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6eg+L7n"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so1887120b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764348672; x=1764953472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AixbcePaxXBqlFsZfr5qfISJTULeQJZ1gpiBt/7fNZM=;
        b=l6eg+L7ndzcJlw3w4yfngYJ2L/o1KZ1bj04bgCUrlAklTdgDNLWes10XyX4l5n5sE+
         A55V9eYS26pVmlgtGqAGTCHha9QbXDUU1rg6fINL2mB2AqCVzgUnrzjlpOGUyDXP/W60
         kaspnpbj6bayfewGlCWaHnpuRuR+gsL/M/HS9MxK+OCV4RIh57x7LWzmEeVvL06OtpNd
         0fXsW5plobU3RF5EGSc0snqJ0+PbW4i2r2iuwjacsKrOe3LHu6606NPz7MnMSkUUIsH5
         edG3sqwyoaNh+2IX7O56rA/6Sx5x9hKOwW78T0Toc9uXSmbs1N9Yv0zx0QIv0sEpQNf7
         +fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764348672; x=1764953472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AixbcePaxXBqlFsZfr5qfISJTULeQJZ1gpiBt/7fNZM=;
        b=N1gIwBLKT1nDSAq8Na6BcIVDaHaMLKm83E+jrgPCo2G52sXtXnyoYO4ewzn5TgLWN9
         WGUtgNlWxNxuSqUtAMemwPGZ9lh4trz/iy9HRi5e3LvoL3m8jtdaXfvXZyJaAJBfrgOV
         d00bOcWlusO/6sNsjDHodbEFEsOxJC4sRj9eG9SBNpQAA7Yok5D+aZrvVhUiX2t3D7Zl
         Qm5t3+lwpDLhGj+PHDVX0e5Np2eivcjwRAAH65ux+m+gfwKH7QXVfuQsZmjWKt2XaUAd
         ZpGctpQXeUBESEQK3bbIePX9RQUDk8HEuHCeA1Dpy6J8DuMstzaxVqxGx9psR+cBgM9g
         CP/w==
X-Forwarded-Encrypted: i=1; AJvYcCXj+TFuviDJTWxbNTF98bfCfZdOe+QhjFHAQz4imSCS/HXtPHuVZxuIsCq54E0clpQMLMQ1Ip+AMh25oCwT@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0ZLyrfPqsZt/X0P6Uts9UkSjkSSC3ds+zLi0MUUpVV50hDh2l
	g28Imv2v9tSUSyPUTk3pdixko6fHtftIELPQv0Op4ZFAj+ZtGeZudUNN4qE5SzcZoZQ=
X-Gm-Gg: ASbGncugwl4sphbUVt30ih6+Tt1opymstGOyz2+I6qh2fufBhQtykeR/rgnThZrZv0N
	r/xskKVGubqEO4X3rVk33JIpNUzRC4rsI71bqDmvDeaFtP5JunafF6F6oL66w9rmfMYDE8XBnIF
	EpnhQ1mYAdFTd/tqlZDdhNDaM1XaCUvhT+4lkmoOUoLWCwfEihL93wX3J1wwY2kM4K3/og36NiQ
	KDT7wbfa7GrXj3qohxMUjIE08Fk2kT2pV9Owp1q3ynthUJwTqeKGAoUZ7BBRpFztjNThVb/q2ls
	XyxZUsaWZMU6rkjDvfgkW1d7ytHxYx63kC/3C7C1r+01kDBTXPsD6vVe/WlgNZKAs9P1zPfFHRj
	Zhdc9VMFmNmyIow+Su8Q6piTcfeK9mSO4uhe83rlFc3g1hoOWzwdS3Kocgpq/7PhqoLav2wSnb4
	qoKHGUBeHLqqAIkk4SDd/1nR3cuCLbdpxofwpXfQ==
X-Google-Smtp-Source: AGHT+IECH+suzCjglAdy9C/2HZznFTsJXi7mal4382Oi5LkjGTA7ODw3xYLKMGen8VJdolzGLnk/JQ==
X-Received: by 2002:a05:6a00:9294:b0:7ae:8821:96dd with SMTP id d2e1a72fcca58-7ca8977866dmr17174932b3a.24.1764348671683;
        Fri, 28 Nov 2025 08:51:11 -0800 (PST)
Received: from pavan.localdomain ([49.37.147.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fb1430csm5498848b3a.59.2025.11.28.08.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:51:11 -0800 (PST)
From: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-staging@lists.linux.dev,
	pavankumaryalagada@gmail.com
Subject: [PATCH v3] staging: most: video: prevent probes during component exit
Date: Fri, 28 Nov 2025 11:50:33 -0500
Message-ID: <20251128165033.25060-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When comp_exit() runs, comp_probe_channel() could still add new devices
to video_devices, creating a race and potentially leaving the list in
an inconsistent state.

This patch prevents new devices from being added while exiting by:

 - comp_exiting is set under lock to prevent new devices being added.
 - Early exit paths free allocated memory (kfree) to avoid leaks.
 - comp_probe_channel() checks comp_exiting before modifying video_devices.
 - Removing WARN/BUG as it becomes unnecessary.

Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>

---

v3:
 - comp_exiting flag update and memory cleanup for early exits.
 - Commit message clarified for reviewers.
---
 drivers/staging/most/video/video.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9cf7..f257fb179813 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -60,6 +60,8 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
 static LIST_HEAD(video_devices);
 static DEFINE_SPINLOCK(list_lock);

+static bool comp_exiting;
+
 static inline bool data_ready(struct most_video_dev *mdev)
 {
 	return !list_empty(&mdev->pending_mbos);
@@ -498,13 +500,22 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 		goto err_unreg;

 	spin_lock_irq(&list_lock);
+	if (comp_exiting) {
+		spin_unlock_irq(&list_lock);
+		goto err_cleanup;
+	}
 	list_add(&mdev->list, &video_devices);
 	spin_unlock_irq(&list_lock);
 	return 0;

+err_cleanup:
+	kfree(mdev);
+	return -EBUSY;
+
 err_unreg:
 	v4l2_device_disconnect(&mdev->v4l2_dev);
 	v4l2_device_put(&mdev->v4l2_dev);
+	kfree(mdev);
 	return ret;
 }

@@ -553,8 +564,13 @@ static int __init comp_init(void)

 static void __exit comp_exit(void)
 {
+	unsigned long flags;
 	struct most_video_dev *mdev, *tmp;

+	spin_lock_irqsave(&list_lock, flags);
+	comp_exiting = true;
+	spin_unlock_irqrestore(&list_lock, flags);
+
 	/*
 	 * As the mostcore currently doesn't call disconnect_channel()
 	 * for linked channels while we call most_deregister_component()
@@ -569,13 +585,14 @@ static void __exit comp_exit(void)
 		comp_unregister_videodev(mdev);
 		v4l2_device_disconnect(&mdev->v4l2_dev);
 		v4l2_device_put(&mdev->v4l2_dev);
+		kfree(mdev);
+
 		spin_lock_irq(&list_lock);
 	}
 	spin_unlock_irq(&list_lock);

 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
 }

 module_init(comp_init);
--
2.47.3

