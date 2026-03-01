Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602EF1FC0EF
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 04:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772338703; cv=none; b=KL8ZTIIZLe6hQZ2XSJvC7nlfLhzs+VaDj+hWkQWc8lA4AarPJh0JH7JIwKsl4g05l9hfZEGJfDi3MEWT/7FlcUnQgptxl7W/ndRArCHFBK43rF2xTab0kvuUQW7qoDNfpzeCcke5kt+80jv0Om8fsLyYJ94co4+uOzsoNXiEsWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772338703; c=relaxed/simple;
	bh=xWb14Ex3kUdDZoR/I5oUCAdUhsMYy7Mpget5ZRRWlEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FU5GsBRfZrp1uEZzh8+2oI90fRk+USaTa/tcMGC1sG2RFHU2a9Gx7w6ZLhtAMUBytG934omk4kdOuvH5INFkuxsE9BMe+QOO7eZzD/BcZzpyEXi14gvrSg9LHQUjm1686wIV8I3d1LqmdyPXg7f9imiCbvSnqSW6V1aHSZY9g40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdZuEYbq; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdZuEYbq"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb38e6d164so444697985a.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 20:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772338701; x=1772943501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7RWNVIIQtMJvrnP7LhcgeJ8kigZSsnoQ3mQyerhYeM=;
        b=NdZuEYbq7zpah3A635QTFfpriIm7HELNGIYbjwbLXG+oityjMUZ94nJ2rQjy7kl6wn
         v1YIsbeWbnL/ScuQ0KPjq2rjbgeJIHPkhmy4bv1lKzR1rKYCBhaX6Ad3JZJpWsqU1Tqr
         +mmxj6Q2eo06UGuq7kyDZbdVBPIeNgPMnH8MNvM2xBT4pAtreHQBPe5LP8SdxwvhwZBv
         TFpnhJRAuJXPk9reP3mPBoHY2DWHDJ0g/r4mG/qs734vPUa9RCB4hoBAKsRrxI7paaxi
         ni1xOR54aR5PImJ0bgCuV11ilRv640aOgiAMejscPZNAvcUI3Op3DCNRud8h0okE5UsY
         LEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772338701; x=1772943501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7RWNVIIQtMJvrnP7LhcgeJ8kigZSsnoQ3mQyerhYeM=;
        b=ZqDlx5gw1Dq0E2PFsmovKVklkToNjT5S6cd/NjcC9XxpnIFR686a9cnD8Iojhk98ds
         ovOZberztqIzg6MuYhIJvvt+WerEMSb9iFxIO/IjuuKR+1xvJjpYXKcmcgcOQfet6szV
         1YoA8ii/tQNpcaogBu4n92PT8CJOf9+XzaONwYHdZKyC1abOfuvquRNMDcJZJuaiGf0D
         9zN3eEzUmrHs0ZyjaKi0GBoAL8uEWyQp5TRGS+kFRmbLSXqx/cVrfIkB9MlK2NsAqO4m
         PiF77oOJXGm5YW2lg/ZnwPgcwLe1PXC+67Cn8g+ahD/4k0430Uk8+2PRJaYUdYmIX4Rr
         TaQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTjiB92Yp1+X1UP8jcXWE4ucD4p1JdN+PJvx3Qh2HAfaEnRr6gycsaopuDX6mEuhZ7OSlHl1q8TvEwrT4j@lists.linux.dev
X-Gm-Message-State: AOJu0YyblKgOisccpntGtY1enDXBjDz39egbfiwhEUw0uu4ta4lpQ1rV
	JNpvFRkTs8Y4DFxyAC50a7SY9z1WoTLLe3TGkBTuYdTiyveZ0cBZRKP6
X-Gm-Gg: ATEYQzwXj6n4ZOEyw8JoxkN1Y0TEjCeV8nrrufhb089IVsvtQK1J80NGfPEUuNS/xb4
	Y2C+vf0unQEb6lP0hzje3FASPiMiUeAgl1VpKKEAsoRuteG9etHBrm0BAhmMx0SR2pM84sMEIW8
	/mcmLe3jYRaqxUalozpIPdC95sWE9+m+gnVUOD/gBNBFmCiTGol57FmmePgmnPW74cU44rMGlHd
	/d+KoGWAI7o2u7Q0DDElshCDchv/jYamaM02SUwVDbYZFeAvrhvl8ejHfNUqzJ2BM/jGA9h2XRX
	qLQDcjeVztHqt+d0qt49Vq+fCNZGeJnEJX0NYKnZl6Szn36Q0MYVbmmOiK2HmAM2KRw3uafDLvN
	NE/YqMWtChlAfMtbMxX6dPnUi4wHjRqJY3zho7sdjQa6QVWiT9Yddy/OafyCXNhU3be6oZ+VKsf
	gD2lgpHo3ZFdEEAOq7AFVynHrYO9A0xGgdDlPfO+ROnggRzY9+rOWfNlynd4RIW33H9wRKLYqui
	OJDOpTzBeCTe9Ylk9fektPb7VUe+E0Zla11LaBU1ZBFkA==
X-Received: by 2002:a05:620a:28c2:b0:8ca:d5cb:6840 with SMTP id af79cd13be357-8cbc8e8496emr1119514385a.73.1772338701287;
        Sat, 28 Feb 2026 20:18:21 -0800 (PST)
Received: from rusty.tail87dd8.ts.net (host-28-207.ilmon.monticello.illinois.us.clients.pavlovmedia.net. [216.171.28.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf64ef00sm857647385a.10.2026.02.28.20.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 20:18:20 -0800 (PST)
From: Jack Tanner <jtanner0786@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jack Tanner <jtanner0786@gmail.com>
Subject: [PATCH] media: atomisp: ov2722: move sensor init from set_fmt to s_stream
Date: Sat, 28 Feb 2026 22:17:28 -0600
Message-ID: <20260301041728.577647-2-jtanner0786@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260301041728.577647-1-jtanner0786@gmail.com>
References: <20260301041728.577647-1-jtanner0786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the sensor reset and register programming from ov2722_set_fmt()
into ov2722_s_stream(), which is the correct place to initialize
hardware. This removes the ov2722_startup() helper and its fragile
retry loop that attempted to power cycle the sensor on failure.

Signed-off-by: Jack Tanner <jtanner0786@gmail.com>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 73 +++++--------------
 drivers/staging/media/atomisp/i2c/ov2722.h    |  2 -
 2 files changed, 17 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..0585b984e097 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -599,39 +599,14 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/* TODO: remove it. */
-static int ov2722_startup(struct v4l2_subdev *sd)
-{
-	struct ov2722_device *dev = to_ov2722_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
-
-	ret = ov2722_write_reg(client, OV2722_8BIT,
-			       OV2722_SW_RESET, 0x01);
-	if (ret) {
-		dev_err(&client->dev, "ov2722 reset err.\n");
-		return ret;
-	}
-
-	ret = ov2722_write_reg_array(client, dev->res->regs);
-	if (ret) {
-		dev_err(&client->dev, "ov2722 write register err.\n");
-		return ret;
-	}
-
-	return ret;
-}
-
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov2722_resolution *res;
 	struct camera_mipi_info *ov2722_info = NULL;
-	int ret = 0;
 
 	if (format->pad)
 		return -EINVAL;
@@ -662,38 +637,8 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 	dev->pixels_per_line = dev->res->pixels_per_line;
 	dev->lines_per_frame = dev->res->lines_per_frame;
 
-	ret = ov2722_startup(sd);
-	if (ret) {
-		int i = 0;
-
-		dev_err(&client->dev, "ov2722 startup err, retry to power up\n");
-		for (i = 0; i < OV2722_POWER_UP_RETRY_NUM; i++) {
-			dev_err(&client->dev,
-				"ov2722 retry to power up %d/%d times, result: ",
-				i + 1, OV2722_POWER_UP_RETRY_NUM);
-			power_down(sd);
-			ret = power_up(sd);
-			if (ret) {
-				dev_err(&client->dev, "power up failed, continue\n");
-				continue;
-			}
-			ret = ov2722_startup(sd);
-			if (ret) {
-				dev_err(&client->dev, " startup FAILED!\n");
-			} else {
-				dev_err(&client->dev, " startup SUCCESS!\n");
-				break;
-			}
-		}
-		if (ret) {
-			dev_err(&client->dev, "ov2722 startup err\n");
-			goto err;
-		}
-	}
-
-err:
 	mutex_unlock(&dev->input_lock);
-	return ret;
+	return 0;
 }
 
 static int ov2722_get_fmt(struct v4l2_subdev *sd,
@@ -754,10 +699,26 @@ static int ov2722_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&dev->input_lock);
 
+	if (enable) {
+		ret = ov2722_write_reg(client, OV2722_8BIT,
+				       OV2722_SW_RESET, 0x01);
+		if (ret) {
+			dev_err(&client->dev, "ov2722 reset err\n");
+			goto out;
+		}
+
+		ret = ov2722_write_reg_array(client, dev->res->regs);
+		if (ret) {
+			dev_err(&client->dev, "ov2722 write register err.\n");
+			goto out;
+		}
+	}
+
 	ret = ov2722_write_reg(client, OV2722_8BIT, OV2722_SW_STREAM,
 			       enable ? OV2722_START_STREAMING :
 			       OV2722_STOP_STREAMING);
 
+out:
 	mutex_unlock(&dev->input_lock);
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index 00317d105305..d3499c9e5465 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -21,8 +21,6 @@
 
 #include "../include/linux/atomisp_platform.h"
 
-#define OV2722_POWER_UP_RETRY_NUM 5
-
 /* Defines for register writes and register array processing */
 #define I2C_MSG_LENGTH		0x2
 #define I2C_RETRY_COUNT		5
-- 
2.51.0

