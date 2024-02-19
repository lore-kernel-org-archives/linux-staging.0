Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EDC2C1A5
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708341796; cv=none; b=FDLIkHUeUPNc7ncCoJUEZoR4/URFT2Nbvlz371sN5XlrkzsxAUCRY+DZnKgWJW1zPozsBB2xtWri82zllRlv7HxL7vz4dpSrTARNDxLY3UTcOo48MetkPtsCPZ89KubwN8QJO+LZuxDCx9YigUUfIn6BNbXBtmgmv6ubECaLYLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708341796; c=relaxed/simple;
	bh=WJhan3UP9Z7GAaBjgIiNA/IqDSv3J6aKXJJ9PHj+wuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SvLnVLmTvMHGFQBFm06xtdsaEbAI9JEPHSEi7btHuQXlwLrZV5KeVhRW3l26HIVqSvXptmNmV93oAwmfoDROR4L1Piv9NPqWHCaNi9FGjbuIX5QCa0td9yPKKjVEpWlegUDOB1pSemFjFfbR1oQe9HE/zQxcihaPYZu6SmYEBmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hslL0Kde; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hslL0Kde"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3566c0309fso484305266b.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 03:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708341793; x=1708946593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuW0tA1+gOLBqnUIoohkzCyIMBvVnloNgoNFu8SX/5U=;
        b=hslL0KdeX9OgaBVaOetESvpa52iHVT3wdrS2MZqeYV08iHMUQm4owxBCMYR5avkSf6
         mnhvO3Ub1ZPJO59ffg2PR4ypvXQMyozJVwj5gZ3q8nTUobPb1iov5Ar1naaF8fzW6kzr
         jj12PAczpOT5apibwIST1DUzAYgwkaGGxTkMtLQtsN4XLr8JqWHhpqmBAGu/Ks1Dy2EV
         TwdEZoeikvCiil58vPsc/r4CskQaJv8h/Mr/NFtcWCBhXvo65vFX1/D9sGDY6zJlWAC9
         pgqcmIRzXYTihYtdgtHGpnYxrPuKcjzHDbvKhtRIjbEW8EoFZjbMXTZvpGs+icS/aqX1
         H/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708341793; x=1708946593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuW0tA1+gOLBqnUIoohkzCyIMBvVnloNgoNFu8SX/5U=;
        b=uLhvLpaBXvb/QrDQ3gxkTaK7uWQHZASUHFFxkFo2JqhzMwqD3UGjfHNoNeTXFZz6Ci
         24NMEcJDQMBvmWgq9kKNa3/nMuqn3XMkXyAXhI3JyeEu8dniuOUdeSAaqF6tM3uS9IvI
         VZKrvEBcfCv3GAsDH+JqoHFe41NMmoS+w0oF1qPkI93fu3q0bIerejVIdJ/4I9xqSRfP
         Fzxf6yPURq1sjl1bN05trGBo1/cttCWNQ1eLleOtliUczUonu396miqCWFWm7o+swQa9
         6X1eEoXdFw/NEOZ8GlMhqKAfIcj9nY5pONfHRJP7xcbCd0d6SvWD23mOjVliK9b/anLO
         rwvw==
X-Gm-Message-State: AOJu0YwTb4TNya5TesqaPueMfTpFzZ+gTTE8pVDuaLdrpMrUOnsTAuQj
	AVbK8yyEOufQahlJbzO7H405Bgb0Ad+dB6U65EWvAjSa+j8hUjeM
X-Google-Smtp-Source: AGHT+IGSD3jTvmpSu9lWqJy92v3b8wbBP8Kn6inBcfLvx/7Fp4KrXtljJvlVnzhlgszKc5IkdfBLKg==
X-Received: by 2002:a17:906:a1cd:b0:a3d:6eb4:9768 with SMTP id bx13-20020a170906a1cd00b00a3d6eb49768mr7088156ejb.46.1708341793096;
        Mon, 19 Feb 2024 03:23:13 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id ti12-20020a170907c20c00b00a3d581658bfsm2826495ejc.24.2024.02.19.03.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 03:23:12 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v3 2/2] Staging: vc04_services: bcm2835-camera: fix brace code style check
Date: Mon, 19 Feb 2024 12:22:34 +0100
Message-Id: <20240219112234.8673-3-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240219112234.8673-1-mo.c.weber@gmail.com>
References: <236d985c-1835-410f-b0b5-cacbd5fbf930@moroto.mountain>
 <20240219112234.8673-1-mo.c.weber@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat function parameters to fix checkpatch check:
Increase readability and consistency

Signed-off-by: Moritz C. Weber <mo.c.weber@gmail.com>
---
 .../bcm2835-camera/bcm2835-camera.c           | 60 +++++++++----------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index e6ff5ea04..c3ba490e5 100644
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
+					      &dev->capture.frame_count,
+					      sizeof(dev->capture.frame_count));
 	}
 }
 
@@ -420,11 +418,10 @@ static int enable_camera(struct bcm2835_mmal_dev *dev)
 	int ret;
 
 	if (!dev->camera_use_count) {
-		ret = vchiq_mmal_port_parameter_set(
-			dev->instance,
-			&dev->component[COMP_CAMERA]->control,
-			MMAL_PARAMETER_CAMERA_NUM, &dev->camera_num,
-			sizeof(dev->camera_num));
+		ret = vchiq_mmal_port_parameter_set(dev->instance,
+						    &dev->component[COMP_CAMERA]->control,
+						    MMAL_PARAMETER_CAMERA_NUM, &dev->camera_num,
+						    sizeof(dev->camera_num));
 		if (ret < 0) {
 			v4l2_err(&dev->v4l2_dev,
 				 "Failed setting camera num, ret %d\n", ret);
@@ -468,11 +465,11 @@ static int disable_camera(struct bcm2835_mmal_dev *dev)
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
@@ -786,9 +783,8 @@ static int vidioc_overlay(struct file *file, void *f, unsigned int on)
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
@@ -1041,8 +1037,8 @@ static int mmal_setup_video_component(struct bcm2835_mmal_dev *dev,
 
 	if (overlay_enabled) {
 		ret = vchiq_mmal_port_connect_tunnel(dev->instance,
-				preview_port,
-				&dev->component[COMP_PREVIEW]->input[0]);
+						     preview_port,
+						     &dev->component[COMP_PREVIEW]->input[0]);
 		if (ret)
 			return ret;
 
@@ -1719,11 +1715,11 @@ static int mmal_init(struct bcm2835_mmal_dev *dev)
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

