Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48628488DAE
	for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044274; cv=none; b=bZg1e8TP5hrhFPUaRSdQaQTUywUafdNj0MnB+2f59IubwYPIHc2a4weIIxeaSLk9rwp0MrtKFfBfEeBuyd+XOymy++w1dfqw7vG2mzTlAh0YmzTuJRPzqYq+Z+mg0Bk0taMzXEvgQzLUvXFhQHbhI9qiCJHAuKXZ4Rt7OpH0mWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044274; c=relaxed/simple;
	bh=R17Gb+XWftjBcYxyj0I2DLQIm3K0udyH9vg/SmozghE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=crXHJDs8ga5tiHIm2SWyWVOHyb+GFs8ALC0dBZSZuHs8BTp8JutMS61mkzYzMh8q7CHTjMV6bOTI23Krm9k5T4bvyJSCA0DiWSgc8tuez9EdVplx5s0BTMLXWj9YH23/yMg00NvraCe8mw3UJDhwmfpiTl4USllPipuDxGhNUoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+eqDV2E; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+eqDV2E"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso14609305e9.3
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789044267; x=1789649067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1abMDSHbrc6CBNfufK1oYgsczusTwH0/aL3eMH7YTa4=;
        b=P+eqDV2EfiITxZCwe+mw9mgcgOh9KbW3n1jS5ujPBuBGy3z38SaR2pU8VSTc5BTLnp
         0ZhFh7kSdGh61ZPgTN4Ph/q69l5/tm/e34spiCKLhcKaMOn4Voe3FLstyrY2L031pk+C
         dV9wPqY+UlnS7NSMhTuu2SRyXZL3S8CZS84tj6rNdK90KicfpxgTlzoDFwdzArFZnhkR
         p8DOtayZ++QKdpqCCLB0s6WH4khWj1r6JBuz/cVl+2iEw6m76Bf/6Jq5j/vX9uC3SYbe
         IZhOz+zgWGyxzuaLHsVG75LJANxxZsa2SV8Gf3JLW7c5A05yrzJTmiZlF6dLP/hnFSkR
         6ATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044267; x=1789649067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1abMDSHbrc6CBNfufK1oYgsczusTwH0/aL3eMH7YTa4=;
        b=SaFTXnZi9V0R0TQC83v+HoqPobexGi6slaMloAY/xuxXADbB4ecSx0yzyDEPeysC6b
         LlO7ArTPZ5kXVkOY9ysHt8N5agPs7cmiZwYcgi83ImgtAHpaWol58SwZUX+PzGWDCjLr
         /tyNmVr4WYjLQAvzSmkPCyDy1ZVSFqgyls4CgfHSGMnNdrTRxNQGkJd5S4rbkZ1B9+Re
         g5liJSyzDF7MQ/yp8nMHQhZLpQuTRpGTWWb7ByDNZfjokb7QVJimYy8SNOH+pmFxBRd+
         MyA66GJKS8LcGR8JKf6FXNFdW+L51LD8EIz9Zm6s3tBUItbhWHlTQzpiTmqVBFVwgzkk
         Rlvw==
X-Forwarded-Encrypted: i=1; AKwUvBw+Q0ycHrlStMcSkRQUPHjwFKVr45Yx10Xg++qxVDgGzuEDqCCF9PtoJwc6ivhYK8bOJORfkTRSF80s9wqU@lists.linux.dev
X-Gm-Message-State: AFuF++kCjXMlZ9yEUT8b5zCAfsDq3P6V/94apyloXMwA8N52EGCQ6IXl
	GWf6JDpXgiIF5yBddOjDy392HpB+9DPfYth/dUYdGqo3ow/b5/ie07Un
X-Gm-Gg: AYBFou0IrXlyGRYw8mrz1Qp6MF4h8SqoCiCC4T6a8iHj+IuHohPp05csheAP/BWpVdz
	LFtWmH9pSBqFUs8Sa3/Rm9ked4RtD+uzDvR7sbiMJs4tQv84Qg2Tt8LlXYSJesOXs2Lk6hySCko
	y+ljaHzC5DyGFLBRx27oRDydeYPeixcSv6T0ky23k2e72LN0U/lt3zbDncy6KmJvu755HkNMPyb
	UcCEZxjFxzqUIXO924nD483m3GVfwXvItcWSbQEOlvMMBiQf8VDIn5gpb/SZ7NHGqEWz3ZsCZW0
	rmg3M1KnTlGy7aQvS0CJ0vWhibwQgfcZ86CSOheqU0jKFPARTSHMybzXdPgzdMeieItC5HklZff
	YJ5PuR2dISeYeTsu711CkUzZGg7nDtB4AK65fnGkTlU7Gb+KZtaA11CRi0zg8mfFjEHXp5CujR7
	bsoDR7k3EnEHuTYWUkY1yVThC2OL+WM+2J1HGwSPb340ip+/P0ne2Tv77ZmSfDfCzdkcY=
X-Received: by 2002:a05:600c:4695:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49d258e3ce3mr65429385e9.15.1789044266950;
        Thu, 10 Sep 2026 05:44:26 -0700 (PDT)
Received: from zephyr ([2407:d000:508:1732:c5ca:107f:bc81:7575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm69354095e9.6.2026.09.10.05.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:44:26 -0700 (PDT)
From: Muhammad Israr <7israr.work@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Israr <7israr.work@gmail.com>
Subject: [PATCH] staging: most: video: add comments to mutex and spinlock definitions
Date: Thu, 10 Sep 2026 17:44:03 +0500
Message-ID: <20260910124403.95741-1-7israr.work@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments describing what the list_lock spinlock and lock mutex
in struct most_video_dev protect, per checkpatch.pl's
"definition without comment" check.

list_lock protects the pending_mbos list. The mutex is registered
as vdev->lock and is used by the V4L2 core to serialize
video_device ioctl calls; it is not locked directly in this file.

Signed-off-by: Muhammad Israr <7israr.work@gmail.com>
---
 drivers/staging/most/video/video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff62f4..41b617b553aa 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,7 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/* protects pending_mbos */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +41,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* registered as vdev->lock; serializes video_device ioctls */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.55.0

