Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF462C21E7
	for <linux-staging@lists.linux.dev>; Wed,  3 Dec 2025 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750930; cv=none; b=NuoIH9wiBJscbnhMa9ePO3dj4HryuWUx8DSb2CtGbW++UqCPCEdzEcx7ppyr1Iz2IJCqJnlCZ6JK7G10m4pB70qCZrr4WqUfWTuS9d4Xv+dgf9dvfmOt7g4PI890N2+CmsWpdiugsFRkb4uPTCRWSkYfNOLjcWWuBGNfiXl/nxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750930; c=relaxed/simple;
	bh=oH8yQGzzXZcaEdMki6U8Ym7VH1MYIj3PoyhKbQTCAts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXmLSkEgJgPZRq6tJY15DKLuGbA5BQ2KcwdXoXE8GLfXDxAyQ8DkimtTYO7ovMD41LJuLguMIP26bTbQkdv6SglDXFN0IdyLlzUv2cQ51Csl2DYYDVhU3Ivsy4oIll3r8ti2lnyNlCMefyHocyZuzewNb+s7srNMvIfw3P//py8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gug20vqe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gug20vqe"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29806bd47b5so36871695ad.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Dec 2025 00:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764750928; x=1765355728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tf1nnmSZ7EAkZS208EkRia8wUwwUIdfQx1MPOO30xbk=;
        b=gug20vqeA3AFps5FzKYVayJWH2ePPE51MlAfItpMlr3DPjLBhQ60JjsfPZ73LDf3eI
         +yQ80KrgPmkUUKiJer6I2/JHqIoRlva3M/hycmq2SGfXtyT4PLyP+lvccvoTsXfGZEXT
         c2B4Wj0Ui9aGzHoiWVxsV3U8Djks6sWODisINQ6PoCq58hQW6+rukphOz+iLtbvwVDlm
         /Z3XTr2urn0wBIZGg1FQ/+/K4ExuseBvSAlP/AZrrZ3QMcWjE6KT3Nu5rQtlyGI70poV
         qPTTwY6GtrYne6ACzzGLlsm0CaDwE941T1WxBgh6aCgFhT1pthWpbitZAuoD264VOP+J
         zNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764750928; x=1765355728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tf1nnmSZ7EAkZS208EkRia8wUwwUIdfQx1MPOO30xbk=;
        b=frjAWhw0UTus1K4oSQbGvTorVRco6xn5uSV4DWvMxQYTalK8UQi5K8mDN00FC1lakW
         lezWaFxbL+d9JSZj/l8Fcw4e0280RTQIYEKK0Yf/zu7hxpZC5sG3rQqihHD0IkVVVuXr
         5vR5O9i6m4pYpW9bD7d6HcBUWs42pxNOJlMfSoP6CnYO5Z56edlz5OidJEoGX3r+ea31
         z+2xXF8wffjb8mExeUro0CZI3mieCcF2lsjt0Z9h2bBa9JSG/pjYR7dXKpsIinA9PPpa
         wFAtxrdc+YiXS1M5bNL0cRk2D6y4oeKtBdv0FtGPqjKI090xRtdwigjHt0pkQBsj89hX
         RxOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1vXdoi1pth7Uf1Gpr3+fw7HKR6lQuSxP7uqU16DGDA6PsC4AwDfKuiNk4k2Ok00PK8ZH2gCKh+iEWm4mu@lists.linux.dev
X-Gm-Message-State: AOJu0YyZCzYtyJGSWpH3MQoSR+fuXzzk96BeN9Q9yHO0xaO7b6lOdkAC
	FfGpLTXEaphzTk+W+NCIIL4wwKK4Cj8uog0aK0KkzjG3lQ4a/F7RM/UT
X-Gm-Gg: ASbGncvIBp5MWCOl1djLViT9alab5htfLkbkERTqsbB9hwZN+F2eSWmWInPZbdMsTGg
	Zk3Am13oRa2iCNYpNfs33LBCOaQFNhJ8TdgB7tIS/UjNqo52QNSZy88HsRVNBPRlJ1FEsmZEyYB
	gDVUKoFhK+CU+xzOkJx4fp8QZl5Z/3/UFDrez2Hgk6D5YlgaOrSsaLbwmh1PlUE5UM8F/r749au
	v8DkI+l2rb5vawNr/tFg765Lcr7iH9hZMqz5X/8zl1/gqeRPVveQmCKmSdV17fTRFY8Oqux3FSh
	7zuygVysVMEiESiVGr+qTSnZfgmqC1WvjzyWdYs66zbZm7LwynXfyaUaXSIE8cSYEQBd6kKLZf4
	YZgAcrJvDBsJn7rRdkx7OaETDP5ENqA4B8lmueQig3EiRKY5Y1oe3BTETAgjpw49wpXlCA+SS/3
	is7bdo9Pal3qJIZsoxWnlVm66GScY=
X-Google-Smtp-Source: AGHT+IEAKboQRaFs/KJv+Ej0IKMc71NAUxirzYj6FDqusBLvHmU6/h0Z+CFr40zf6m6cyoyFqNmkVg==
X-Received: by 2002:a17:903:11c3:b0:297:d6c2:d06 with SMTP id d9443c01a7336-29d682f4d7dmr18117135ad.20.1764750927866;
        Wed, 03 Dec 2025 00:35:27 -0800 (PST)
Received: from pavan.localdomain ([49.37.149.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1520a48b2sm19390530b3a.28.2025.12.03.00.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:35:27 -0800 (PST)
From: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	pavankumaryalagada@gmail.com
Subject: [PATCH v5] staging: most: video: prevent probes during component exit
Date: Wed,  3 Dec 2025 03:34:11 -0500
Message-ID: <20251203083411.7072-1-pavankumaryalagada@gmail.com>
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

- comp_probe_channel() checks comp_exiting before modifying video_devices.

	if (comp_exiting) {
		spin_unlock_irq(&list_lock);
		ret = -BUSY;
		goto err_unreg;
	}

This ensures that all partially created resources are properly freed
and no new channels are allowed while the driver is being unloaded.

Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>

---

v5:
 - Removed unlikely() macro since this is not fast path.
 - Added comp_unregister_videodev() to err_unreg cleanup patch.
 - Removed blank line in comp_exit().

v4:
 - Used unlikely() for the comp_exiting check to optimize branch
   prediction.
 - Removed err_cleanup and use err_unreg for proper cleanup
   of partially initialized mdev/v4l2 structures.
 - Removed redundant spinlock usage around 'comp_exiting = true;'
   comp_exit().
 - Removed explicit kfree(mdev) in comp_exit() loop.

v3:
 - comp_exiting flag update and memory cleanup for early exits.
 - Commit message clarified for reviewers.
 - Removed WARN/BUG as it becomes unnecessary.
---
 drivers/staging/most/video/video.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9cf7..11e63f5d5b84 100644
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
@@ -498,11 +500,17 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 		goto err_unreg;

 	spin_lock_irq(&list_lock);
+	if (comp_exiting) {
+		spin_unlock_irq(&list_lock);
+		ret = -EBUSY;
+		goto err_unreg;
+	}
 	list_add(&mdev->list, &video_devices);
 	spin_unlock_irq(&list_lock);
 	return 0;

 err_unreg:
+	comp_unregister_videodev(mdev);
 	v4l2_device_disconnect(&mdev->v4l2_dev);
 	v4l2_device_put(&mdev->v4l2_dev);
 	return ret;
@@ -555,6 +563,8 @@ static void __exit comp_exit(void)
 {
 	struct most_video_dev *mdev, *tmp;

+	comp_exiting = true;
+
 	/*
 	 * As the mostcore currently doesn't call disconnect_channel()
 	 * for linked channels while we call most_deregister_component()
@@ -575,7 +585,6 @@ static void __exit comp_exit(void)

 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
 }

 module_init(comp_init);
--
2.47.3

