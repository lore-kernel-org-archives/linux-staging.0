Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5006C2C80
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 20:36:50 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id o63so633174uao.5
        for <linux-staging@lists.linux.dev>; Wed, 05 Jan 2022 12:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=836CBDGgLoHqJrgB5kmQKKUyQ8f2Pjj7U9sJ+wlw5Ks=;
        b=op2tTAluLlXpi73l63bd8H6LIC3NZXyjd7FcX93LNvwSK/cwQAjkxr2Y4lCGdAnrCy
         2P4foNdWT8S8IOeQLvuQ68oIKNfKbTHeyRqRCJZ7XKvlBXGFY677RbJU+uCOnB313oes
         UU6Gqi2iLYJ8Tngr2xayMylLJ9P4GkqK43QFK+U/QXxxaWWlHJdg4Lr6kUji+ULnofpR
         /wW2aFXHqBCwF+yhlnULisOVwf+VurI4ZwxjPrthK3s7wAM5J7IF+scJRQYaFhF9ZWmK
         WH12tpgc8X63hxf5YQUomqW05SUdDiJWNSQKCA8QLTxonZ9OOmK2/Pt5irlwysC1kXH6
         jRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=836CBDGgLoHqJrgB5kmQKKUyQ8f2Pjj7U9sJ+wlw5Ks=;
        b=nHdpKgHeU+yZyaqyz5ctTHaO6PXZ0CD3DwS3mfrOB5kTskCqT3i24Mfx29Q9Vb4Pei
         S6rQfuj040Bm9IjzsE06Sv5pKdTqDcoC/HPC9Jc3TluOIrS2VWBC1i8kA9a8fAIon5pe
         yK1d42vyGtFAJA5HJGp8t0cU+FoCMb2sqntNaQL/75Ei4C5CWzcRt7ixAkCNNJiUg3G/
         OcgEQ0skd7DuHU5r4/9fXTBmdZydlxe4lNjVp7YO6IfVj9HJQYWEv8jI3BxYotb9RHfo
         PkyvzH+oC8A88PeBA8dxEDgySQVMXhkK2Da39KDXYyQ9QAB/rutEgnMMX/czJkxrXQe9
         uPog==
X-Gm-Message-State: AOAM530zqr1K6KWJro3Vj1d+PHMWHPo1WSa0MJ5HsqBRYlEAjyRTPfmY
	s80sAQaOZDPL3z5JRQjLK09rspdjs4pt/w==
X-Google-Smtp-Source: ABdhPJzOsjmNyjvD9eh8RW9ZrC9OqH+ROs6XuW3xkLWcicFQUnDLHWvMBuHJuYHUAHcvzjiIXPGnYg==
X-Received: by 2002:ab0:3730:: with SMTP id s16mr4598247uag.83.1641415009126;
        Wed, 05 Jan 2022 12:36:49 -0800 (PST)
Received: from localhost.localdomain ([181.22.170.52])
        by smtp.gmail.com with ESMTPSA id t130sm7860vkc.32.2022.01.05.12.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 12:36:48 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	f.fainelli@gmail.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	juerg.haefliger@canonical.com,
	rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com,
	stefan.wahren@i2se.com,
	unixbhaskar@gmail.com,
	mitaliborkar810@gmail.com,
	phil@raspberrypi.com,
	len.baker@gmx.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 2/6] staging: vc04_services: rename functions containing bm2835_* to bcm2835_*
Date: Wed,  5 Jan 2022 17:35:44 -0300
Message-Id: <d3b6f67421c75829105f793cfb9ec1414b926bf6.1641414449.git.gascoar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1641414449.git.gascoar@gmail.com>
References: <cover.1641414449.git.gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the kernel, all names related to the chip BCM2835 are always named
bcm2835_*. To avoid confusion, and to make things more consistent,
rename functions using bm2835_* to bcm2835_*.

While at it, some realignments were made to improve readability.

Suggested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 9 ++++-----
 .../vc04_services/bcm2835-camera/bcm2835-camera.h        | 6 ++----
 drivers/staging/vc04_services/bcm2835-camera/controls.c  | 9 ++++-----
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 109021643c3f..159ac600d11e 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1735,7 +1735,7 @@ static int mmal_init(struct bcm2835_mmal_dev *dev)
 					      &enable,
 					      sizeof(enable));
 	}
-	ret = bm2835_mmal_set_all_camera_controls(dev);
+	ret = bcm2835_mmal_set_all_camera_controls(dev);
 	if (ret < 0) {
 		v4l2_err(&dev->v4l2_dev, "%s: failed to set all camera controls: %d\n",
 			 __func__, ret);
@@ -1769,8 +1769,7 @@ static int mmal_init(struct bcm2835_mmal_dev *dev)
 	return ret;
 }
 
-static int bm2835_mmal_init_device(struct bcm2835_mmal_dev *dev,
-				   struct video_device *vfd)
+static int bcm2835_mmal_init_device(struct bcm2835_mmal_dev *dev, struct video_device *vfd)
 {
 	int ret;
 
@@ -1908,7 +1907,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
 		}
 
 		/* setup v4l controls */
-		ret = bm2835_mmal_init_controls(dev, &dev->ctrl_handler);
+		ret = bcm2835_mmal_init_controls(dev, &dev->ctrl_handler);
 		if (ret < 0) {
 			v4l2_err(&dev->v4l2_dev, "%s: could not init controls: %d\n",
 				 __func__, ret);
@@ -1940,7 +1939,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
 			goto unreg_dev;
 
 		/* initialise video devices */
-		ret = bm2835_mmal_init_device(dev, &dev->vdev);
+		ret = bcm2835_mmal_init_device(dev, &dev->vdev);
 		if (ret < 0) {
 			v4l2_err(&dev->v4l2_dev, "%s: could not init device: %d\n",
 				 __func__, ret);
diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
index 338b7c142ae3..84ba789af120 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
@@ -110,11 +110,9 @@ struct bcm2835_mmal_dev {
 	unsigned int rgb_bgr_swapped;
 };
 
-int bm2835_mmal_init_controls(
-			struct bcm2835_mmal_dev *dev,
-			struct v4l2_ctrl_handler *hdl);
+int bcm2835_mmal_init_controls(struct bcm2835_mmal_dev *dev, struct v4l2_ctrl_handler *hdl);
 
-int bm2835_mmal_set_all_camera_controls(struct bcm2835_mmal_dev *dev);
+int bcm2835_mmal_set_all_camera_controls(struct bcm2835_mmal_dev *dev);
 int set_framerate_params(struct bcm2835_mmal_dev *dev);
 
 /* Debug helpers */
diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 03967a7d99a0..08fadc164b02 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -884,7 +884,7 @@ static int ctrl_set_scene_mode(struct bcm2835_mmal_dev *dev,
 	return 0;
 }
 
-static int bm2835_mmal_s_ctrl(struct v4l2_ctrl *ctrl)
+static int bcm2835_mmal_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct bcm2835_mmal_dev *dev = container_of(ctrl->handler, struct bcm2835_mmal_dev,
 						    ctrl_handler);
@@ -904,7 +904,7 @@ static int bm2835_mmal_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static const struct v4l2_ctrl_ops bm2835_mmal_ctrl_ops = {
-	.s_ctrl = bm2835_mmal_s_ctrl,
+	.s_ctrl = bcm2835_mmal_s_ctrl,
 };
 
 static const struct bcm2835_mmal_v4l2_ctrl v4l2_ctrls[V4L2_CTRL_COUNT] = {
@@ -1246,7 +1246,7 @@ static const struct bcm2835_mmal_v4l2_ctrl v4l2_ctrls[V4L2_CTRL_COUNT] = {
 	},
 };
 
-int bm2835_mmal_set_all_camera_controls(struct bcm2835_mmal_dev *dev)
+int bcm2835_mmal_set_all_camera_controls(struct bcm2835_mmal_dev *dev)
 {
 	int c;
 	int ret = 0;
@@ -1311,8 +1311,7 @@ int set_framerate_params(struct bcm2835_mmal_dev *dev)
 	return ret;
 }
 
-int bm2835_mmal_init_controls(struct bcm2835_mmal_dev *dev,
-			      struct v4l2_ctrl_handler *hdl)
+int bcm2835_mmal_init_controls(struct bcm2835_mmal_dev *dev, struct v4l2_ctrl_handler *hdl)
 {
 	int c;
 	const struct bcm2835_mmal_v4l2_ctrl *ctrl;
-- 
2.34.1

