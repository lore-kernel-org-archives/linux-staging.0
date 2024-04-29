Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD16214AA3
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714377112; cv=none; b=DCYQ7hH80rXSJoWAkhshvd+ZXyIvm8esVDG/6aEyyBbLgiRSXyxKkpbGq6dvy4T6H+0bwoZ1umDlzgplj2XBJGYZSIbc9F8lQisll8e5eacLA5364eqEQyZLyaT8XmO95ZlgAzgfyFdhxqBRui6rWJbfMYqObLhziMmKiJqvn0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714377112; c=relaxed/simple;
	bh=eYP/yKhPTk4xcwsUruZPlGdv8rd/wEe9qbaGyUog6rU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=N6Yq/+dr8U/z+nkwmvx5zZZMfrIMDJP6WeVBgbNulBkR9PRqb3hjR/zlEWckrz7m2d6bpPh6wvh4XJSVWi5MvCiUg/VJk0RV1a6mYfchG7w4uHi/Tdg7gPTz5Y8hYgwCicRHy/YBlmLj1uKUe0DaAcejf/mJ82lcMmRUVYDW5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koLiMAVC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koLiMAVC"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-346359c8785so3614050f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714377108; x=1714981908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OV1u7iz1PWDb5GaSZ+THHGsU1iE1fOzj0JoX4zD0XiQ=;
        b=koLiMAVCq7VGcusjJqGghgZ4ta36STF85veSKYx7vB4ve9O1tAOGq7r2rZ+pNxXoV7
         nPPpmYkainwHZcAlTvHu0eeVabq/aIQK1BbdLTKOHuwXhNB0cRq6czfv1+Ru0wei1X+I
         XisECkXpR5rez/E/y9hnZmQ9PfqzbChSjp6zueuwMYl6g1u/8060i7Ou4fpBxAKRhASZ
         TZ3H9N2pD2O6ypyE1TdfKxiCWEQQ1gmV3meAODhD5OcAv/DkibPev/HT9dB6IZlFFuqM
         KDJpEGe99NihVXJi+zbBcwHo+Jpkxbosd1bCT2YgMVwrGFx1m8qONZojXa17Sc/PfRbt
         EIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714377108; x=1714981908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OV1u7iz1PWDb5GaSZ+THHGsU1iE1fOzj0JoX4zD0XiQ=;
        b=aWAiutBY5AREgj32qICfyR6TvZyrLogDgigO2wjwo6rh4r8+UXX7ImvUMmz8Ow+hqJ
         G9XsBnbmwf4VJt+bg0gMx4itDwp5pnINntLFzI3Jdtk5Y7NyYPvhh2mjzNhSk7EgTPtm
         V3fmfsU2mjO/cbJ8O+K/GXl6LmGNF3ESweMeUlFJTbgO162lLh5rIWE9Sr19VoNH90l8
         BzTw8KX5XS9Z40IajpGyMFtdPDTeNESiabK5B8/8d7r5dQnKi2lvYjOwL/ZD7/MddTHW
         eXbERC4+Bg74o0eAyQFDOmBwlwocy9qgK5zL1D8iUNWbEZGQP9Dv8sLXgk3Gm96RltE4
         G0XA==
X-Forwarded-Encrypted: i=1; AJvYcCVqHoxXjbw48elZfy3+AdKtd+5O8Zvb76eOTbaC2RU5iXg2i0FRZLV+1McGU+hhZmn9hKG4mj0bpyXHBH8yWd0/cQ//8K0J9WQxeP2gXg==
X-Gm-Message-State: AOJu0YxYuUHR6ayYkC43TcnNA5QhXvo6W8+pRDdgi/u0+FHwOO3YTzSA
	JYeBJVbAQT9Sx2nW28N2e0uS+MqG6ACXdpz3+p2DArZjKLSr6192
X-Google-Smtp-Source: AGHT+IH11dIw7Z/1uzLHUqzGAesECRoyaRjhwayeyJXoR2GMh2LzrblIOO3vP8j/BApimDpMRqJTtA==
X-Received: by 2002:a05:6000:1ac9:b0:34c:fa08:7917 with SMTP id i9-20020a0560001ac900b0034cfa087917mr2718925wry.49.1714377107990;
        Mon, 29 Apr 2024 00:51:47 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id d4-20020adfe2c4000000b0034a3a0a753asm27165212wrj.100.2024.04.29.00.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 00:51:47 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: atomisp: Fix spelling mistake "pipline" -> "pipeline"
Date: Mon, 29 Apr 2024 08:51:46 +0100
Message-Id: <20240429075146.1073869-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index effc71b5a439..d7e8a9871522 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -894,7 +894,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	ret = __media_pipeline_start(&asd->video_out.vdev.entity.pads[0], &asd->video_out.pipe);
 	mutex_unlock(&isp->media_dev.graph_mutex);
 	if (ret) {
-		dev_err(isp->dev, "Error starting mc pipline: %d\n", ret);
+		dev_err(isp->dev, "Error starting mc pipeline: %d\n", ret);
 		goto out_unlock;
 	}
 
-- 
2.39.2

