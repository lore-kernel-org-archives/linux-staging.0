Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9234B669
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779016355; cv=none; b=rLiHTxiQkjc+4h6FKE8lnZkUd7ps+8EjCLSPxueVcKMBElOUWAEoGCRzPgwUDF1dpBi++4BYWf9nrp7CFk4NOZwBuHAxrkbtzFgSow8sXMECIlY3u09eupRyMVn1Vzrf5jCPjOaVICtSTj0ykdQy97lWMWU5kO2saSieq+4stwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779016355; c=relaxed/simple;
	bh=f0g5T88FWRy9py+kZbJQnPShEfxg6b+Db1bbOip0OzE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=jSjyeazvBGD9AMM5FISX5Kbpb5TXWpotZ+IG7tPOEqypFeTdePL7IZpj03W4W8vOY/E8GjA2f0gD0QR1OZ+z5w/SA/DdmOckmoPgVouHmrDbLC0CPZHAtVcwyaAH41hstEDR+G07SbIUNtFXBjSlnTFgPIS4T7Mq8aEIaXSEYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgK2IWz5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgK2IWz5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so13282845ad.3
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 04:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779016353; x=1779621153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SeLEwX44ip67YHr4MzOBD0XZL7AjVytU3/wLAKY1OxM=;
        b=fgK2IWz5WN2vM/47kNKbRFFU9NNErR5185JOJ6DMMpZCaCw815gU2GZ+2HhzMeN5fy
         iTlJY6ZhYxsZ7bMGiAjCn8XiK3MR/ejs1y971q9fbzj+VZx1xL/A7fwulLNf4G7y5hMl
         4DG0w81jIkAQKZN4w6yKi1UAgmySbIKTl84pAgepK9ot49aIUdO3qMU9nrhSLNMK5mjU
         Lkc985kNtJy9FChfK37hXBPDylA/sbeu007nUi3iUDEByV3ldNwLRsBAEctuANTJi0i7
         tDkb5NmHfP+P6I5IwcNgdE2rvnVD0eGZvekXR0ZVq4qLfQiXvfNmKCyJ9aJHvdFmEigH
         s0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779016353; x=1779621153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeLEwX44ip67YHr4MzOBD0XZL7AjVytU3/wLAKY1OxM=;
        b=kec0IJYzXvA7j59dYDDhmepbSGgoTLrc88M60SqiUf9O8+oOb7AOT5+/PK+5XKgeyK
         WtRODzBLRheOULGftv7k0FaqQ02paxpWbCX+kRQCARivVLH8UMVtGy2Nz3tFk7kFYhta
         Yl6V7okYFmUhrWkDe9Y4yaGWhbNX7oiPS3He5YN7bQzThRPoHdU7xQgmRbdI/BUo3jDM
         LkzO24XREgSl+WlVWqPIJzC+WT7DCdnZ2+B1G9zXxGXdAGaSumcyBSGEwxdF5QNNok1+
         fmrb7ivEj8EaI3Q98u3E0H2g8czjnlq/V62Ue0o+bhhcwDeqRM7lKbpMWW9hotcohJWw
         1U1A==
X-Forwarded-Encrypted: i=1; AFNElJ8OPJsSMMW2JmOpmBz1r/7yye/ld3WVb1RlzSlNCZ69VyeG3+d2SVF8mFQTmYN5vHnTpzAGo5hadQ2hfz2N@lists.linux.dev
X-Gm-Message-State: AOJu0Yx52WmkD6ALvN7tERG85BmBfGUpdUh3IT3r4NRxBNAF0uKrhV63
	emucBBatMI+5Ne1dZdkGmuogPVmV0CQvLhQZYaKXeAyzK26E88SJSs8q
X-Gm-Gg: Acq92OHxo8ZMMMFXF0uvsqRg9zpo6GquUTnh60VPxaHnykQpc3sW6gUXQ9bgcyN88eM
	7/z5fNwDCqkOxnnvxfJKylSEIAkcEAUM5QPzZ4vMsPHke1ag6BFXPGwwAL6C59IiZwpV6SwbT11
	1gYWbrmgPO240p+fJ3mkVaOoOMd1sx0arHQkGVri5hcg+op+jW3ZfbttsBYWD8IpS7xbKYe5vXL
	cV2sd5XIYz1DTabgR0ey88ZqCGU2MSvrg5E7CT8b4hGiAOLGiCWI4lMTX3M2m11PY9MGny3B0DU
	+BXmyuDTB28S/0vc5+aF/MrLXs6kMKIzzWrkyWga0EEEtLbrzJS3PbAcc4i06lqw58tcCAVnbBk
	X7qHzv80sLrdAHR/gmfndz/or5/cn0NSaHc+R1Ty60NzF38zNiTTfMkjSD5E7pBqzQ6YWCtmk2J
	14AVsDyT/Pa+p/Wh3/7HEZ
X-Received: by 2002:a17:902:db01:b0:2bd:2de3:51a4 with SMTP id d9443c01a7336-2bd7e8feac3mr126508995ad.27.1779016353137;
        Sun, 17 May 2026 04:12:33 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd791e0b11sm91758165ad.18.2026.05.17.04.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:12:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <kees@kernel.org>,
	Minu Jin <s9430939@naver.com>,
	Andrey Shvetsov <andrey.shvetsov@k2l.de>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: video: avoid double free on video register failure
Date: Sun, 17 May 2026 19:12:18 +0800
Message-ID: <20260517111218.945796-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

comp_register_videodev() allocates a video_device with
video_device_alloc() and releases it if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  comp_register_videodev()
    -> video_device_release(mdev->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free mdev->vdev through vdev->release().
comp_register_videodev() then releases mdev->vdev exactly once on failure.
Restore video_device_release() after successful registration so the
registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: eab231c0398a ("staging: most: v4l2-aim: remove unnecessary label err_vbi_dev")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/staging/most/video/video.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf..aab57768f4f7 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -420,6 +420,7 @@ static int comp_register_videodev(struct most_video_dev *mdev)
 
 	/* Fill the video capture device struct */
 	*mdev->vdev = comp_videodev_template;
+	mdev->vdev->release = video_device_release_empty;
 	mdev->vdev->v4l2_dev = &mdev->v4l2_dev;
 	mdev->vdev->lock = &mdev->lock;
 	snprintf(mdev->vdev->name, sizeof(mdev->vdev->name), "MOST: %s",
@@ -432,9 +433,13 @@ static int comp_register_videodev(struct most_video_dev *mdev)
 		v4l2_err(&mdev->v4l2_dev, "video_register_device failed (%d)\n",
 			 ret);
 		video_device_release(mdev->vdev);
+		return ret;
 	}
 
-	return ret;
+	mdev->vdev->release = video_device_release;
+
+	return 0;
+
 }
 
 static void comp_unregister_videodev(struct most_video_dev *mdev)
-- 
2.43.0

