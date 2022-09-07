Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B02904
	for <linux-staging@lists.linux.dev>; Wed,  7 Sep 2022 12:34:19 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id bp20so19682706wrb.9
        for <linux-staging@lists.linux.dev>; Wed, 07 Sep 2022 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=TuNv9xAerp4VecthQpyVMQXzg2+N+yWDS5sH4eqvaoo=;
        b=AVukzR+7UJbFJypi0cWfXymNJ+/8kpO4hV5GEy795M7k26aGDq8Y8JVHT+J0X9bwZq
         zvx0MsWRyk4KVnlutAvZ5ouflgglZV6njRfRkNPsIgdduNk4w7hAMV/d9Ks5xSmpblFm
         Zu9JXSdyGo2Lvso034ly381imia14iBWPhjlegk6wWFvMaA95Vy/Nsvaao0Ea2K4P6Ka
         a8FisMVE7bK7wrMNbVMAv8ChC3+2XsdgpdNVTJuA3WWOiOQ7aTsV8N0yuBaD6ImoeyZx
         iYWJImgO5EL7HUbGTr3mXQrTARnJXw7fo8nkOB8mDcHFA4Hore3JwXzRsyaM+kj8idp0
         nbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=TuNv9xAerp4VecthQpyVMQXzg2+N+yWDS5sH4eqvaoo=;
        b=ufFhI4RRmhr6ccwFHSr3duJjxeskBEDcTrmA7uSJUUz+yI+n7Cc2P+OhbaXz8IiZ5f
         DaRI7atOlc3bkPaobgbvnmeZYj4YCsZUnCQtPVvWTnd742k2zTclT26wovleN6w/BOd8
         22461l3nDftwLsw1+Yeey6LqU963m2+5vX03PGXVRFUt2dLdfGYVPjfBzwn3A1bWeyGL
         R1+VGVIhkyz7HrSWNonspJ67BjX5TtUrBjAHSClI3l5P35+UX+EVdCjM9X2VpsUgRm/v
         +fIZR11MzDeRFPgFMihcFxb1OIErcx5cRJzKpN3VU/ihxgaNG74Cn8H8VFzcj9+ZmGtW
         yFEw==
X-Gm-Message-State: ACgBeo2FFXwh67uhb84pG7P9+qlcbB62h02ppGc3VwlTlw50q/g1o+yp
	6p+O0LxBmXlFxpTVoPWkcqM=
X-Google-Smtp-Source: AA6agR7c5izzV6X7pGkGLnH3MXE/eTx3yRCKV3BNvb3+CCtnLtdWY4f2w7lrDH8EOpOWIGoECtGFuQ==
X-Received: by 2002:a5d:453a:0:b0:228:7873:1101 with SMTP id j26-20020a5d453a000000b0022878731101mr1941404wra.241.1662554057507;
        Wed, 07 Sep 2022 05:34:17 -0700 (PDT)
Received: from xws.localdomain (pd9ea37fb.dip0.t-ipconnect.de. [217.234.55.251])
        by smtp.gmail.com with ESMTPSA id g40-20020a05600c4ca800b003a4f1385f0asm18015696wmp.24.2022.09.07.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 05:34:17 -0700 (PDT)
From: Maximilian Luz <luzmaximilian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH] media: staging/intel-ipu3: Finalize subdev initialization to allcoate active state
Date: Wed,  7 Sep 2022 14:33:59 +0200
Message-Id: <20220907123359.1275322-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f69952a4dc1e ("media: subdev: add active state to struct
v4l2_subdev") introduced the active_state member to struct v4l2_subdev.
This state needs to be allocated via v4l2_subdev_init_finalize(). The
intel-ipu3 driver unfortunately does not do that, due to which,
active_state is NULL and we run into an oops (NULL pointer dereference)
when that state is accessed.

In particular, this happens subdev in IOCTLs as commit 3cc7a4bbc381
("media: subdev: pass also the active state to subdevs from ioctls")
passes that state on to the subdev IOCTLs. An example scenario where
this happens is running libcamera's qcam or cam on a device with IPU3,
for example the Microsoft Surface Book 2. In this case, the oops is
reproducibly in v4l2_subdev_get_try_crop(), called via
imgu_subdev_set_selection().

To fix this, allocate the active_state member via
v4l2_subdev_init_finalize().

Link: https://github.com/linux-surface/linux-surface/issues/907
Fixes: 3cc7a4bbc381 ("media: subdev: pass also the active state to subdevs from ioctls")
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index d1c539cefba8..84ab98ba9a2e 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1093,10 +1093,18 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
 			"failed to create subdev v4l2 ctrl with err %d", r);
 		goto fail_subdev;
 	}
+
+	r = v4l2_subdev_init_finalize(&imgu_sd->subdev);
+	if (r) {
+		dev_err(&imgu->pci_dev->dev,
+			"failed to initialize subdev (%d)\n", r);
+		goto fail_subdev;
+	}
+
 	r = v4l2_device_register_subdev(&imgu->v4l2_dev, &imgu_sd->subdev);
 	if (r) {
 		dev_err(&imgu->pci_dev->dev,
-			"failed initialize subdev (%d)\n", r);
+			"failed to register subdev (%d)\n", r);
 		goto fail_subdev;
 	}
 
@@ -1104,6 +1112,7 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
 	return 0;
 
 fail_subdev:
+	v4l2_subdev_cleanup(&imgu_sd->subdev);
 	v4l2_ctrl_handler_free(imgu_sd->subdev.ctrl_handler);
 	media_entity_cleanup(&imgu_sd->subdev.entity);
 
@@ -1275,6 +1284,7 @@ static void imgu_v4l2_subdev_cleanup(struct imgu_device *imgu, unsigned int i)
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[i];
 
 	v4l2_device_unregister_subdev(&imgu_pipe->imgu_sd.subdev);
+	v4l2_subdev_cleanup(&imgu_pipe->imgu_sd.subdev);
 	v4l2_ctrl_handler_free(imgu_pipe->imgu_sd.subdev.ctrl_handler);
 	media_entity_cleanup(&imgu_pipe->imgu_sd.subdev.entity);
 }
-- 
2.37.3

