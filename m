Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8432C80
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 20:36:54 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id s72so379611vks.9
        for <linux-staging@lists.linux.dev>; Wed, 05 Jan 2022 12:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w8EkkzNdsrnEqk2YciotM6EW2MTmAWF34zyjUlKhtkA=;
        b=ZNc0HGk+uxnzavqym+yTYhAXq6lmiJDpCdpKcUPhQpQ/v2s4ijDX9M5lpO0rIoGrpJ
         LM7uKW7jEV7HAOHBSFUeXVXpWz64sVUn1X5MKD6cgMaaDg73+OvohMoBQj6LbL8tE1Am
         Lrs9k7h8tjjT6wj3JHf8VNAECHiuhnZuazD3uMpQ8nb6Sbe+HhcCxNyGTy3/VbJHow0k
         qjGgN2oGeRHbSncqbVdp8Wk/gf/RBr/87y5qT1nPinyl1+SCL24kBbP27F7+2TTyiTgp
         gbxEL2khEgn6GbzZHNCV9ey9U2ybbpJ11eIDxpqA3+zAjG+l2pHyHbvtS7FXoF4vybsh
         WZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w8EkkzNdsrnEqk2YciotM6EW2MTmAWF34zyjUlKhtkA=;
        b=nN3Zh6FBc7ESuUm4YehngolnHMBB5G+4qxodKTgA+Dx3vOW1hMwdZYUCmWQXM+VX1P
         BAKkLkOVS6365q2UtbNJRcShMKu3uxO4Kwj5Yzvi7cqAqAYQ1TqwnZocidy52CklPgz6
         +4Fa2iJnyfApvRQBnxZnFjcaZmniYSsFXOZAGkjHggeXZb47Lye8oKUA/f2tLt+BKQ5+
         8yLl2fieR7zWrCTrlYfFfGvMzB1Tot/qlBb0n8r34lCVAFUDihS40P0NrR7dbRVGPDP+
         DT7X1DzaSSSI/RNc0hvokgVmbDkVDNgi6DHj7pwHOaEGeZAwD8iu+ulNf6lxW3u4UogB
         z0bw==
X-Gm-Message-State: AOAM532qL146NieUZdzieSHneFY7uN6ulZNHHKECg2wf0lMylTrXz76W
	4CWFJqOCMJWgSK0Kn2EzdB+myimSw6D5Lw==
X-Google-Smtp-Source: ABdhPJwhC9Ue0swAVd5zzL/J9JY/4NkVzVDYQvA6vAzqJIfw57q1jDgz+w3yei7bb9hr/ez3NXKRBg==
X-Received: by 2002:a05:6122:8c6:: with SMTP id 6mr18487538vkg.33.1641415012981;
        Wed, 05 Jan 2022 12:36:52 -0800 (PST)
Received: from localhost.localdomain ([181.22.170.52])
        by smtp.gmail.com with ESMTPSA id t130sm7860vkc.32.2022.01.05.12.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 12:36:52 -0800 (PST)
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
Subject: [PATCH 3/6] staging: vc04_services: rename variables containing bm2835_* to bcm2835_*
Date: Wed,  5 Jan 2022 17:35:45 -0300
Message-Id: <a0af5deacebc2da9b21772c7677e1a9627edbed6.1641414449.git.gascoar@gmail.com>
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
rename all variables using bm2835_* to bcm2835_*.

While at it, some realignments were made to improve readability.

Suggested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../bcm2835-camera/bcm2835-camera.c           |  4 +--
 .../vc04_services/bcm2835-camera/controls.c   | 31 +++++++------------
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 159ac600d11e..cbc881e19f65 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -654,7 +654,7 @@ static void stop_streaming(struct vb2_queue *vq)
 		v4l2_err(&dev->v4l2_dev, "Failed to disable camera\n");
 }
 
-static const struct vb2_ops bm2835_mmal_video_qops = {
+static const struct vb2_ops bcm2835_mmal_video_qops = {
 	.queue_setup = queue_setup,
 	.buf_init = buffer_init,
 	.buf_prepare = buffer_prepare,
@@ -1930,7 +1930,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
 		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
 		q->drv_priv = dev;
 		q->buf_struct_size = sizeof(struct vb2_mmal_buffer);
-		q->ops = &bm2835_mmal_video_qops;
+		q->ops = &bcm2835_mmal_video_qops;
 		q->mem_ops = &vb2_vmalloc_memops;
 		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 		q->lock = &dev->mutex;
diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 08fadc164b02..178fb310b89a 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -58,7 +58,7 @@ static const u32 iso_values[] = {
 	0, 100, 200, 400, 800,
 };
 
-enum bm2835_mmal_ctrl_type {
+enum bcm2835_mmal_ctrl_type {
 	MMAL_CONTROL_TYPE_STD,
 	MMAL_CONTROL_TYPE_STD_MENU,
 	MMAL_CONTROL_TYPE_INT_MENU,
@@ -67,7 +67,7 @@ enum bm2835_mmal_ctrl_type {
 
 struct bcm2835_mmal_v4l2_ctrl {
 	u32 id; /* v4l2 control identifier */
-	enum bm2835_mmal_ctrl_type type;
+	enum bcm2835_mmal_ctrl_type type;
 	/* control minimum value or
 	 * mask for MMAL_CONTROL_TYPE_STD_MENU
 	 */
@@ -903,7 +903,7 @@ static int bcm2835_mmal_s_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static const struct v4l2_ctrl_ops bm2835_mmal_ctrl_ops = {
+static const struct v4l2_ctrl_ops bcm2835_mmal_ctrl_ops = {
 	.s_ctrl = bcm2835_mmal_s_ctrl,
 };
 
@@ -1323,12 +1323,9 @@ int bcm2835_mmal_init_controls(struct bcm2835_mmal_dev *dev, struct v4l2_ctrl_ha
 
 		switch (ctrl->type) {
 		case MMAL_CONTROL_TYPE_STD:
-			dev->ctrls[c] =
-				v4l2_ctrl_new_std(hdl,
-						  &bm2835_mmal_ctrl_ops,
-						  ctrl->id, ctrl->min,
-						  ctrl->max, ctrl->step,
-						  ctrl->def);
+			dev->ctrls[c] = v4l2_ctrl_new_std(hdl, &bcm2835_mmal_ctrl_ops,
+							  ctrl->id, ctrl->min, ctrl->max,
+							  ctrl->step, ctrl->def);
 			break;
 
 		case MMAL_CONTROL_TYPE_STD_MENU:
@@ -1352,20 +1349,16 @@ int bcm2835_mmal_init_controls(struct bcm2835_mmal_dev *dev, struct v4l2_ctrl_ha
 				mask = ~mask;
 			}
 
-			dev->ctrls[c] =
-				v4l2_ctrl_new_std_menu(hdl,
-						       &bm2835_mmal_ctrl_ops,
-						       ctrl->id, ctrl->max,
-						       mask, ctrl->def);
+			dev->ctrls[c] = v4l2_ctrl_new_std_menu(hdl, &bcm2835_mmal_ctrl_ops,
+							       ctrl->id, ctrl->max, mask,
+							       ctrl->def);
 			break;
 		}
 
 		case MMAL_CONTROL_TYPE_INT_MENU:
-			dev->ctrls[c] =
-				v4l2_ctrl_new_int_menu(hdl,
-						       &bm2835_mmal_ctrl_ops,
-						       ctrl->id, ctrl->max,
-						       ctrl->def, ctrl->imenu);
+			dev->ctrls[c] = v4l2_ctrl_new_int_menu(hdl, &bcm2835_mmal_ctrl_ops,
+							       ctrl->id, ctrl->max,
+							       ctrl->def, ctrl->imenu);
 			break;
 
 		case MMAL_CONTROL_TYPE_CLUSTER:
-- 
2.34.1

