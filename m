Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F551419AD
	for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034841; cv=none; b=Q3rO6TJcy3qVqjVcaIno8JeqLBmxFaFNbRqYZvBoCY9JV65HFH6cdPyeijsuPZ1zVxraQ7KB7Kym5enNaH2u6gMPMuOZVrJ2Eg+V0UrMCPwbMiGPkpo4VWSci0EjU4zA+RTNbiMc+W6bOt/RWjCzw15bN/42bRzOrYtRL6ggXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034841; c=relaxed/simple;
	bh=05jIvIGWXrLnGJcrSrayKp/38O6IX2DmixejxBCN9Sc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lwotiphj3tWlHt3O0xk5tFW0UcrBAm/3wKdbG97OJZVKm6QzVRqkgKq67ATzwnYjsN7WIv1sP2DDAsO3Jf/NSnGURARKqo92874sLEBO4oMW1B1gSKyyp0wZhU6hPEetkvReJ++xccFGDK2rfHgi7NEtxmhlwxFI0a56XgIwY68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsSx4U3D; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsSx4U3D"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a3122b70439so158834866b.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 14:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708034837; x=1708639637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=21uIqFQMa/yVZznf8kmpsHONHVQ5nJQEZM8RZ+UmyrU=;
        b=OsSx4U3DTO5L9LpLZcXQgJbLumZir+7Y1KqtsWuxtOmOn0ZFRazCpo4vzSI6utNOlI
         FV5hFP4p0hk6Uwx3P9PyGdDWLzOHXdibX12X/4geyUbmeLPf9gb+tusVygbhc1VX7miZ
         3BeMtRf+hOTzGStBrWu8ttYF9aejt0BSOzkNxOzr7lT2Jva74DABhUklsgMY/2ITq7og
         FYuZhWvKD0+6hbpyrExo8IC+89porrGn9GDxNLjvMNdMQN0+hp1KH2iXlikhfIBLY2n/
         lzPmO0OWnb8A0inEkSZ1+agybe7+NG+T4bzKWs0RLHXuq6Q9Qeluob3zeG7qhr5sjo56
         fm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708034837; x=1708639637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21uIqFQMa/yVZznf8kmpsHONHVQ5nJQEZM8RZ+UmyrU=;
        b=mGXJFZ2KD69eH7TGgAMbCZX+fyx3tA+qt3/mvk/n/g0k2VSwzze2TEhmXrZhf7D7of
         xgn9CnUJ47EGQAp6cbClM3vdgOqGS2gOZ3mFItHU/H4Pw3ar7jvlh7+4VpL6Zdp0bufm
         fh7XD9mtS4GwIXS6j/6oKQoQ+b8ez0jzJq1U171gThneHyFqOeHusBeDGpWRDvovPTWr
         4h3ZVl8tqMQ96KGhLTxLUjG75KdWXc21N8h9LbriOtweE5d9lC1n7e4aY5dbwAqaJ+mT
         /64xDgCLfAeU7OwPG77k3JjpABt+G36BXqMrXo7t1mvquI/e6M8v68kvJaBeD/Klbh07
         yqTQ==
X-Gm-Message-State: AOJu0YyRVIpUZIv4VEbsGY6qVJk/xe2r8ehuZ4p+eAnV0enqf+mVM2wS
	fnHCKXTY7Akq46X+axoS6k5tV64z5ABrC71TB3L30WhNp3V+RPOn21cIcAo37Bk=
X-Google-Smtp-Source: AGHT+IHgDXQY8gMquNY6IZAlhBgxcOSmHelzr1+pZBlo3xkDM+cA9ECVhYbvw90kNcX2+3RpK9D+VA==
X-Received: by 2002:a17:907:104c:b0:a3d:2fb7:98fe with SMTP id oy12-20020a170907104c00b00a3d2fb798femr2124907ejb.32.1708034837034;
        Thu, 15 Feb 2024 14:07:17 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id s17-20020a170906a19100b00a3d0e9bdc35sm948123ejy.68.2024.02.15.14.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:07:16 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH] Staging: vc04_services: bcm2835-camera: fixed several brace coding style checks
Date: Thu, 15 Feb 2024 23:06:47 +0100
Message-Id: <20240215220647.4096-1-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed coding style checks raised by checkpatch

Signed-off-by: Moritz C. Weber <mo.c.weber@gmail.com>
---
 .../bcm2835-camera/bcm2835-camera.c           | 62 +++++++++----------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index e6e89784d..1ef7a2118 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -350,12 +350,11 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
 			if (is_capturing(dev)) {
 				v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 					 "Grab another frame");
-				vchiq_mmal_port_parameter_set(
-					instance,
-					dev->capture.camera_port,
-					MMAL_PARAMETER_CAPTURE,
-					&dev->capture.frame_count,
-					sizeof(dev->capture.frame_count));
+				vchiq_mmal_port_parameter_set(instance,
+							      dev->capture.camera_port,
+							      MMAL_PARAMETER_CAPTURE,
+							      &dev->capture.frame_count,
+							      sizeof(dev->capture.frame_count));
 			}
 			if (vchiq_mmal_submit_buffer(instance, port,
 						     &buf->mmal))
@@ -406,12 +405,11 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
 	    is_capturing(dev)) {
 		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 			 "Grab another frame as buffer has EOS");
-		vchiq_mmal_port_parameter_set(
-			instance,
-			dev->capture.camera_port,
-			MMAL_PARAMETER_CAPTURE,
-			&dev->capture.frame_count,
-			sizeof(dev->capture.frame_count));
+		vchiq_mmal_port_parameter_set(instance,
+					      dev->capture.camera_port,
+					      MMAL_PARAMETER_CAPTURE,
+					      #N(#O(#O(#O(#O(&dev->capture.frame_count,
+					      sizeof(dev->capture.frame_count));
 	}
 }
 
@@ -420,11 +418,11 @@ static int enable_camera(struct bcm2835_mmal_dev *dev)
 	int ret;
 
 	if (!dev->camera_use_count) {
-		ret = vchiq_mmal_port_parameter_set(
-			dev->instance,
-			&dev->component[COMP_CAMERA]->control,
-			MMAL_PARAMETER_CAMERA_NUM, &dev->camera_num,
-			sizeof(dev->camera_num));
+		ret = vchiq_mmal_port_parameter_set(dev->instance,
+						    &dev->component[COMP_CAMERA]->control,
+						    MMAL_PARAMETER_CAMERA_NUM,
+						    &dev->camera_num,
+						    **sizeof(dev->camera_num));
 		if (ret < 0) {
 			v4l2_err(&dev->v4l2_dev,
 				 "Failed setting camera num, ret %d\n", ret);
@@ -468,11 +466,11 @@ static int disable_camera(struct bcm2835_mmal_dev *dev)
 				 "Failed disabling camera, ret %d\n", ret);
 			return -EINVAL;
 		}
-		vchiq_mmal_port_parameter_set(
-			dev->instance,
-			&dev->component[COMP_CAMERA]->control,
-			MMAL_PARAMETER_CAMERA_NUM, &i,
-			sizeof(i));
+		vchiq_mmal_port_parameter_set(dev->instance,
+					      &dev->component[COMP_CAMERA]->control,
+					      MMAL_PARAMETER_CAMERA_NUM,
+					      &i,
+					      sizeof(i));
 	}
 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 		 "Camera refcount now %d\n", dev->camera_use_count);
@@ -786,9 +784,8 @@ static int vidioc_overlay(struct file *file, void *f, unsigned int on)
 			ret = vchiq_mmal_port_connect_tunnel(dev->instance, src,
 							     NULL);
 		if (ret >= 0)
-			ret = vchiq_mmal_component_disable(
-					dev->instance,
-					dev->component[COMP_PREVIEW]);
+			ret = vchiq_mmal_component_disable(dev->instance,
+							   dev->component[COMP_PREVIEW]);
 
 		disable_camera(dev);
 		return ret;
@@ -1006,7 +1003,6 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-
 static int mmal_setup_video_component(struct bcm2835_mmal_dev *dev,
 				      struct v4l2_format *f)
 {
@@ -1042,8 +1038,8 @@ static int mmal_setup_video_component(struct bcm2835_mmal_dev *dev,
 
 	if (overlay_enabled) {
 		ret = vchiq_mmal_port_connect_tunnel(dev->instance,
-				preview_port,
-				&dev->component[COMP_PREVIEW]->input[0]);
+						     preview_port,
+						     &dev->component[COMP_PREVIEW]->input[0]);
 		if (ret)
 			return ret;
 
@@ -1720,11 +1716,11 @@ static int mmal_init(struct bcm2835_mmal_dev *dev)
 	{
 		unsigned int enable = 1;
 
-		vchiq_mmal_port_parameter_set(
-			dev->instance,
-			&dev->component[COMP_VIDEO_ENCODE]->control,
-			MMAL_PARAMETER_VIDEO_IMMUTABLE_INPUT,
-			&enable, sizeof(enable));
+		vchiq_mmal_port_parameter_set(dev->instance,
+					      &dev->component[COMP_VIDEO_ENCODE]->control,
+					      MMAL_PARAMETER_VIDEO_IMMUTABLE_INPUT,
+					      &enable,
+					      sizeof(enable));
 
 		vchiq_mmal_port_parameter_set(dev->instance,
 					      &dev->component[COMP_VIDEO_ENCODE]->control,
-- 
2.30.2

