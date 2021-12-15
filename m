Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAD82CA4
	for <linux-staging@lists.linux.dev>; Wed, 15 Dec 2021 23:35:45 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id l25so12423160qkl.5
        for <linux-staging@lists.linux.dev>; Wed, 15 Dec 2021 15:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u/AH9wrTDXjufS8cGkvVASvLa0xf/37kmJtfJgtModw=;
        b=ivYp+OtuI3d281zt8M+NM8TtoXt2oNc4KJeGOD3n7u3KcNNh16w11AYLhI9HFLmcaB
         hHcNG1k+qiAPES1WsNqTZHXTqfmfkFN/ZqWkKp/oNV5hw3hNrERHoZcmKcF2NtELWgUx
         /NFvS4XowjJLMbB9D8jkQm24HsyQb15NNnflFK3a621O79+7zqpigw6VNSBeJWXCVK3B
         DtXI58QdPUJoqlRin6QhdaTRIBiKlOCQ+j8aQFMQ1iTMPHDU6DZk+7DWQ3zLp+yMDMZ+
         P/XD+pZKJN/H8+DnClzJZSZyiunXKMDoza5KyWiuswNWpHGo073upm4p89CjNI+h7tvc
         wb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=u/AH9wrTDXjufS8cGkvVASvLa0xf/37kmJtfJgtModw=;
        b=D9za4wagfIBoeIryLJ9DTNx+pVzAABGmHICgSUSQ1RqYSmaEg+caph7oqip7mPy5yI
         oQrHlABmwl41hgdtqBCTmqkgC/LFm4+TGRM+K5/v9LoF6TZzI0QLX0WFOiXSn6oP0ycr
         nlmEJmTK9YxFqZKcLpg8uDJe2ZQZtvr3DadJrjMKqCIDGfZjp/uqnMwlShNl9A4yV2DI
         4b8U3OOS5O9wHvPs8yf4nObTnfugcvxCdoqlFzV8I57W609AnFBwVY08LRG6P+igf/Cy
         zJTZlLqbwy1E4NU7/YsYPeeKpRM21OooYHJaMhcZnYVGS0uNlolVEEbrkHzzGwhspoiw
         QGiQ==
X-Gm-Message-State: AOAM530P5tho8391OiwKxKGe3P9Vm4IjhOlWnkyMR0sEpuXYkJvOBtWI
	j5f06plYBkgI4W2Tl4EaJO0=
X-Google-Smtp-Source: ABdhPJzpqbpjEAV/ZJiuuF/uPFA0DRVQppLYaOaO3rHZVNqSuCpE5CAAwZC64fDo85mzCAe3jHbCUg==
X-Received: by 2002:a05:620a:1192:: with SMTP id b18mr10433114qkk.393.1639611344834;
        Wed, 15 Dec 2021 15:35:44 -0800 (PST)
Received: from kubuntu-laptop.. ([67.8.38.84])
        by smtp.gmail.com with ESMTPSA id y18sm2851290qtx.19.2021.12.15.15.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 15:35:44 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	niklas.soderlund+renesas@ragnatech.se,
	sakari.ailus@linux.intel.com,
	kieran.bingham+renesas@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	failyildiran@gmail.com
Subject: [PATCH] media: max96712: fix unmet dependency on VIDEO_DEV for VIDEO_V4L2_SUBDEV_API
Date: Wed, 15 Dec 2021 18:35:43 -0500
Message-Id: <20211215233543.163578-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When VIDEO_MAX96712 is selected,
and VIDEO_DEV is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
  Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
  Selected by [y]:
  - VIDEO_MAX96712 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && I2C [=y] && OF_GPIO [=y]

This is because VIDEO_MAX96712 selects VIDEO_V4L2_SUBDEV_API,
without selecting or depending on VIDEO_DEV, despite
VIDEO_V4L2_SUBDEV_API depending on VIDEO_DEV.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/staging/media/max96712/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 258d47644cbd..117fadf81bd0 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
 	depends on OF_GPIO
+	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
-- 
2.32.0

