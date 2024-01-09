Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F25822088
	for <linux-staging@lists.linux.dev>; Tue,  9 Jan 2024 08:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gsOKov5R"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6daf9d5f111so1374134b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Jan 2024 00:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704787794; x=1705392594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BTtnGyw1QeZICEXzNWj/b3uZp4Ky6rxO+ouhWgqdio=;
        b=gsOKov5RVIuFdT2mnqEwjPZxfTSwJ09O/aoRo8zKp8DWnSILln/r1M5zJzk/qBZSLt
         G8KtTa0Q3fhI3DJfe23Du+Q+5c+jBNEQtondieVzX6yZo3xt6iVlo1ivH5EefBm0jhai
         224tWzS3OxKtsWh0COccYoI8UD9p8C7dzSuQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704787794; x=1705392594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BTtnGyw1QeZICEXzNWj/b3uZp4Ky6rxO+ouhWgqdio=;
        b=Q7YlDEo+qcwHRIvB7somwpqQArZBEHhhJmiNNXGFlRAFE8fa34i3KQ8hHl9/tdjwXX
         QlR2NeoP2ZhdO5+8tFlD3ahIpntLFaoLdMQlzMJac0x/SWMR+P2th5QNeoMCXlt+Kzuh
         cB5pCk/xAnBz4IWfcqEyPDngIN6MELlm13HcpCjVhA5kF+ocH63gnYB05T8OfqA/tXPD
         DSBcTVwmxDaD1XYIN2B9gNi1SUHIGuRqnYq/qc0TPWV9Cq4IgsNj1pwpfDrNY9yVOQvW
         ESX7KEzIgIQP+wUNuTpuX0wzIqvgemIrqg803j2YGmpq3xqKX6cxjAVomSVdlR6+JGdw
         ujOQ==
X-Gm-Message-State: AOJu0Yw7qCf7QnsEFP+4N/ToSMps2YXcWZmDiumgQbTyc+8AXpUxwzjn
	AkPezm1tGi+GN5IoixcvR00Y00AsXLmE
X-Google-Smtp-Source: AGHT+IFmkVNBkgtp8ul2fu9yxEhoX7/JSX9fBb/VBWL3OB6woWAa7wzZyq3DfGOV+wd/NLYCkT9E0w==
X-Received: by 2002:a05:6a20:918a:b0:199:f43d:6cde with SMTP id v10-20020a056a20918a00b00199f43d6cdemr513287pzd.67.1704787793820;
        Tue, 09 Jan 2024 00:09:53 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:7b29:709a:867f:fec5])
        by smtp.gmail.com with ESMTPSA id q24-20020a62e118000000b006d9a6953f08sm1072963pfh.103.2024.01.09.00.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:09:53 -0800 (PST)
From: Hidenori Kobayashi <hidenorik@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yong Zhi <yong.zhi@intel.com>
Cc: Hidenori Kobayashi <hidenorik@chromium.org>,
	stable@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: staging: ipu3-imgu: Set fields before media_entity_pads_init()
Date: Tue,  9 Jan 2024 17:09:09 +0900
Message-ID: <20240109080910.2859780-1-hidenorik@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imgu driver fails to probe with the following message because it
does not set the pad's flags before calling media_entity_pads_init().

[   14.596315] ipu3-imgu 0000:00:05.0: failed initialize subdev media entity (-22)
[   14.596322] ipu3-imgu 0000:00:05.0: failed to register subdev0 ret (-22)
[   14.596327] ipu3-imgu 0000:00:05.0: failed to register pipes (-22)
[   14.596331] ipu3-imgu 0000:00:05.0: failed to create V4L2 devices (-22)

Fix the initialization order so that the driver probe succeeds. The ops
initialization is also moved together for readability.

Fixes: a0ca1627b450 ("media: staging/intel-ipu3: Add v4l2 driver based on media framework")
Cc: <stable@vger.kernel.org> # 6.7
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
---
Changes in v3:
- Add error output to commit message (Thanks again Dan!)
- Link to v2: https://lore.kernel.org/lkml/20240109041500.2790754-1-hidenorik@chromium.org

Changes in v2:
- Add Fixes tag and revise commit message (Thanks Dan!)
- Link to v1: https://lore.kernel.org/lkml/20231228093926.748001-1-hidenorik@chromium.org
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index a66f034380c0..3df58eb3e882 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1069,6 +1069,11 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
 
 	/* Initialize subdev media entity */
+	imgu_sd->subdev.entity.ops = &imgu_media_ops;
+	for (i = 0; i < IMGU_NODE_NUM; i++) {
+		imgu_sd->subdev_pads[i].flags = imgu_pipe->nodes[i].output ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+	}
 	r = media_entity_pads_init(&imgu_sd->subdev.entity, IMGU_NODE_NUM,
 				   imgu_sd->subdev_pads);
 	if (r) {
@@ -1076,11 +1081,6 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
 			"failed initialize subdev media entity (%d)\n", r);
 		return r;
 	}
-	imgu_sd->subdev.entity.ops = &imgu_media_ops;
-	for (i = 0; i < IMGU_NODE_NUM; i++) {
-		imgu_sd->subdev_pads[i].flags = imgu_pipe->nodes[i].output ?
-			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
-	}
 
 	/* Initialize subdev */
 	v4l2_subdev_init(&imgu_sd->subdev, &imgu_subdev_ops);
@@ -1177,15 +1177,15 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 	}
 
 	/* Initialize media entities */
+	node->vdev_pad.flags = node->output ?
+		MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+	vdev->entity.ops = NULL;
 	r = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
 	if (r) {
 		dev_err(dev, "failed initialize media entity (%d)\n", r);
 		mutex_destroy(&node->lock);
 		return r;
 	}
-	node->vdev_pad.flags = node->output ?
-		MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
-	vdev->entity.ops = NULL;
 
 	/* Initialize vbq */
 	vbq->type = node->vdev_fmt.type;
-- 
2.43.0.472.g3155946c3a-goog

