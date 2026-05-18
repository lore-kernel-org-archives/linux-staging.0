Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216D03DA5B9
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779083200; cv=none; b=XtMg1MBpzMWFPaBos5OI6w6D3QwuiMJucJjvGSbLtbWsx4YSSbkURNP/sfotPYkOKd/+7r3xd5JbQFU49j0kToAgqsia5RM7+ry+gTA7HIadt3+7Yka2UwygvfP/lxec+8fTnCGMkFFG7fbU+ctiNDcrLZMNRpvGrBIz5VBYwHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779083200; c=relaxed/simple;
	bh=nzlZAviRkiUVtqGLGxPY21P8av4JBOU+eehvWsyKAQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVDwc0AEjGcpDVqEshhHerx1/mEjQZD6hP6kQZBM0s8CKPKulzA4uLlMu3wVqdbXW7cj7Ul1E20WMmtt6wXHvHxo5If1LK+ADquvZpEHLIymcvM2fR4rB0NRaL5H/Ee4d0hpLdu1tMivbrUXt2CJ2zAt8FCQq4kKAFlT5flxKDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcHpbRtS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcHpbRtS"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82748257f5fso1718908b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 22:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779083188; x=1779687988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=;
        b=mcHpbRtSmT4a9G1pbOzdugD9vFOb+WbwaDwmVl4jZ39Ukq05g5sdpPmk6498AhUHlF
         6kllyS9rAovyCQxiohePXpxlqcX69HoFV1s7iZN5/5dTWdt3dmFCLTC83IsPZWb6JAyp
         rlwnnCNj1YIa8908gDtn9k6+z0as7nWgsgdX+Yfj+sm4zE9MOyMOwS5SLykykvuCGiCL
         jes1PTrRjiUhFpihJ4+2lOS/dPioFjS55YwcGauC4DxrHHg0w2op7GqBNSCaoFA6odJY
         oleMbhoV4ykvZJMz3yDqJABfJkZtYBuiz2HjFEZ5fWwUMtz8je3KAbiLBnyYL2ncbN3f
         svog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779083188; x=1779687988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b69/f1IaWhKRvn/Sm6atJ8FHYkT6bLRfEDI5V7g2TEc=;
        b=V1kp+0uC8iLV/PeO6/3hOdbMqVd1Dsy9PTcn8f+1AqOEQyb3+cgQ7TWKfl0eyLcDlY
         ydb6LuaCq/PK7b7ARq/FqWaqd9jhvHs7HXurwe2GNxU/RuYN7vHGuh3YsvjOl/utDrVn
         sPHM27qkjmBuxbBBrF9xXGKCKD7zsBXtUG8lx1ZvQHQ242Z06u0I2SBuEmgGfFpADkFh
         pICCBsBs+is2ffqX493T+604mW3sHSaGApYM2kycmCtasdpz41PyXOE0j19C784x9am0
         ut1KII+Ih8+Rau1rB0fqTLxwSuSqzulDw2gmyRd4998NVJ1Ktt92QXUAyBiMYC9CnPtA
         Vn3w==
X-Forwarded-Encrypted: i=1; AFNElJ9QDIquvJDMXB/2ULthksOzNofkdGCCs5Xvw4JiUMAhXUN+Rsupm81qSyni8Y9FmnYeUY24WoK9x93ldiji@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt3kjHowhjloTF8L4OUODmuPnF/8yMp+IYj3yk07i8GOlez2Q4
	+4sSmqOpIvLfVw6BqaK+WWiwW+Jgos00gTCOA4Fi+zTJ+JYNVHTl9Src
X-Gm-Gg: Acq92OG6jpZPvC0uPKDngPkwVPHDR+I4zavmMsKI7R7wrpIioruGsN3rHM9E+dy2rM2
	EWaE8b7SDMcnDUFLeL9ITSPQLs7MUheJZl5OChzHcJrB8H+RZ7tAeuArafWMVZMaAqzeMkTN1a5
	FuJJxMozi86TLBhHrwEIOCrkNn1An6K/VDXQc0x6QVp14VnKISyb8WMxw7wKjgCt21URnW9Vl4t
	ViLuN8MW1tOB1Thk69e1mWy6yD/xYfkSr96hG2nb/E0rcE7ACdswJFq+hFm6rJIHgVJsSUi7kcH
	qBWFHxBrw5ecCfT5hi14ud1GWh81bFWkbhn9kC1avNCsjQ+to6Y124n34W7eaV5upzeq0VKsDDN
	euPM7+8NYGgJL+7ueajRMQK/4mSfKOYTJ+nX34WsWdcnQUXW3V/h/KolHqgA6CFuL3HFgQUkZKD
	JzbtSuCDWY39GfcuaL
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr14563893b3a.16.1779083187983;
        Sun, 17 May 2026 22:46:27 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c020sm13344918b3a.30.2026.05.17.22.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:46:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: meson: vdec: avoid double free on video register failure
Date: Mon, 18 May 2026 13:43:18 +0800
Message-ID: <20260518054318.979147-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vdec_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vdev_release error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  vdec_probe()
    -> err_vdev_release
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
vdec_probe() then releases vdev exactly once from err_vdev_release.
Restore video_device_release() after successful registration so the
registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..2994e46cbc25 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1074,7 +1074,7 @@ static int vdec_probe(struct platform_device *pdev)
 	mutex_init(&core->lock);
 
 	strscpy(vdev->name, "meson-video-decoder", sizeof(vdev->name));
-	vdev->release = video_device_release;
+	vdev->release = video_device_release_empty;
 	vdev->fops = &vdec_fops;
 	vdev->ioctl_ops = &vdec_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
@@ -1089,6 +1089,7 @@ static int vdec_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed registering video device\n");
 		goto err_vdev_release;
 	}
+	vdev->release = video_device_release;
 
 	return 0;
 
-- 
2.43.0

