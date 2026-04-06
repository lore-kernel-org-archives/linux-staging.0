Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1BB2FE579
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513691; cv=none; b=IE+s4HcSN0vvArO9t3CaLt7B5vyis8Kf7OCY4Qy+eKR/QvtFiGepvURDKXVfYQN1O5drZsnqFzey/VglafFRHs+e01h1EVibGcoTMDaMB5EVPL33/2QzCieJo5v+EYGYVFQFPYSLM+kWn6hfU+YNBs6P9bhPFMqv98uzjTk8nF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513691; c=relaxed/simple;
	bh=lmqzuOQqgNOAyPi5swfvuKRWX8HE/D1ZIzOxJVc5ihw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptpKkIzpq9EaOusIvHnP5mg+YK70SnGA3AAfRy5pGnHj67Z6PaevllVieUfNM3ugn75gZ3KMl3emlLYdacXb2p1fqGu+t2FQq7z+R/SA/mw2j4ZG/b1oD8MVPI65lVtrXnWLTp6pZDa2IX56t/IQSCwMEIsaj31rwv7sVMS/YVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtLzsGVx; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtLzsGVx"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38def541b0bso19389001fa.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Apr 2026 15:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513688; x=1776118488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpN+/b8lu9/yvEaNtHU/WVfOxILX+ZQUzWAcfY4lXzo=;
        b=UtLzsGVx6zhEMEwwVUEKnyZNPXzNGfvWx0bPPbR3+VIj/kHLEGUqA7kVGwVegoddUg
         m7+CUI3+Pc9vAS8i4o+WOcv6SQv94a7n8nLT8nXgp7QkWW6xe0pVOcW+A/c/K0k7c+Mh
         81pX3GUnP+U5Opg5eSyR6x1NgC7n5zho1uY5zDyF8D4O2zh4B1pmr145o0SmmK3VNjFA
         z4mwKRtn1HoAAVd9rwZ9Fha6mYGPprS/1U8x0uzdsbuKZT+F4KO15aYLiDFliYSO1V04
         wJ4/TiIFzaTeoUD+vQHplHumgcf0jJvWqVjtyFgu7MnYOhroSthlbahIMmFiN9Mpjm4N
         9gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513688; x=1776118488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpN+/b8lu9/yvEaNtHU/WVfOxILX+ZQUzWAcfY4lXzo=;
        b=BwCXoAWLFMIokl3vSaa/O2oTZZXSNZF/MZ0HASlur+I6Wkdik3FQ8xjLmeX6rl+PUA
         +9SpZZo6NmWTqV1uY9G7pi1Xw6ngB+aDKwNHPQiSNWMBS72AgsWjNPu3r8oIzl+eKHA/
         AF53B0qm6sT/pwfGa2AQ0cFlapwnfjeXavRapT+dSL4q53rS/6cTgMV5JczblcBUGjAO
         Ddcq6QUdy9Lk4VLXTK9eHCKkkPpVlzU6OHfjT7HSuaTb+gRa6EDa6cHG5lcx6bPB6Ogc
         CMRKvoaRCg7/48Hu/UZUwVBAZshtEIcDTTXO4UoXOAVdKuobmd8FLfKJyRrgfXimxJkx
         SoLw==
X-Forwarded-Encrypted: i=1; AJvYcCW8jvaSeegtCEjHC9nIsXDsBkzWH9qB9R1SJsAHT9MVfzPEgYVfmA936Qv7F6v095kMVpC13IDT9H06cPes@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi7aVOCGpgzXjukLXGa8J3uanlzclN9I9S6DMtTRj0A6ZwTRGf
	C3P8W7yCnNwrZ8U7reyqAuvmjZOFxWjzSZHLmITdsR/JeogzZdHlTdHn
X-Gm-Gg: AeBDietmwMyl4mpbsa3rNI5i7UWgPnQLU1RjMFcYtKZYmMde5PSKYEyvdih64lI6vgN
	lxGJmXSD3EZHvd2ONs6NF3t7w8115r8NirOmJbwgV/p9LjHjlHRQaLf0Xf4CARETExp9wqsR7hx
	rL2A6RPx6qZJi4s8nDuEzoOhGdpcHnwC72qptkwmnzD17UTZJP+7yH/CF7R+610iXRVhBXnXZFm
	40UWT0Qdej8YYwkaKl35ejA7vH4grZZStBp9TEso/nQROYUMUmMBH7F3IG3lWfaPnjG/sHoNxdy
	DuqXz4fOUZl7Sbrp6TbGAJL4tdI5ueIJaAZUXI+iPV5S20+O9DH5rMQNlpNO58niOni1T/RdkMp
	Fi8xSlwp9xriEqDttGdgsfngY6Mpws4nfYmP0mBoj6ajdEvTuIui24jbP4OFRGZ4MBk1lduy3Sx
	rIOx18ZC6wl/FRBjffvEX1Nv+T7Q==
X-Received: by 2002:a05:651c:1b13:b0:38b:f0f0:e38f with SMTP id 38308e7fff4ca-38d91d78c88mr39211001fa.2.1775513688308;
        Mon, 06 Apr 2026 15:14:48 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108c9dsm31924801fa.21.2026.04.06.15.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:14:47 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v2] media: cedrus: Fix failure to clean up hardware on probe failure
Date: Tue,  7 Apr 2026 01:14:40 +0300
Message-ID: <20260406221440.3721863-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

If V4L2 device fails to register, then SRAM still be claimed and as a
result driver will not be able to probe again.

 cedrus 1c0e000.video-codec: Failed to claim SRAM
 cedrus 1c0e000.video-codec: Failed to probe hardware
 cedrus 1c0e000.video-codec: probe with driver cedrus failed with error -16

cedrus_hw_remove undoes everything that was previously done by
cedrus_hw_probe, such as disabling runtime power management and
releasing the claimed SRAM and reserved memory region.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---

Changes in v2:
 - remove duplicate 'in-body' From: record
 - add more technical details to commit message

 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 1d2130f35fffc..ee0e286add67d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -477,7 +477,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register V4L2 device\n");
-		return ret;
+		goto err_hw;
 	}
 
 	vfd = &dev->vfd;
@@ -538,6 +538,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
+err_hw:
+	cedrus_hw_remove(dev);
 
 	return ret;
 }
-- 
2.51.0

