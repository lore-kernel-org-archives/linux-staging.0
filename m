Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40681A9F97
	for <linux-staging@lists.linux.dev>; Sun,  9 Aug 2026 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786298478; cv=none; b=cQ3hqMWydTS5aPpxNqrU6fIvbGVWbCgxViTwnbPqPvbr3l3gYjddrDnkGkYNhtzB8dYxYYcA2sRz9IdBA8pjKyVSGojhrWx68HNZYT14cjAy27DiDbdcarEN+RzWNKhkcRKEQi42dXaFq2qV7mRAAGBZqtfgQdcblN4KZ0026EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786298478; c=relaxed/simple;
	bh=gzifpgE9ICFIAAZYvC8/pUI2qeWn+jZ0r69/l67bSCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2N6TH81SEBa9ZRHtmAF6ncFpET0gG1pR+7mIcWxVn9sX/7rYQLBaQoRLpFNs60G2DIz/0MfkAGv+sNhdIaKo1q168xyw20PlrFCfCiHnchBCYwNBsGs/LWsJYeAHKctfG5CCviIZ3jrPHy9E0Js01lCg3uSETZh8jxzqCf/AEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUGMkmZU; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUGMkmZU"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1150417a91.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Aug 2026 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786298476; x=1786903276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SufUvnVfKIwI4mamqZ79S0mhPSYgYY811KsbCw73B2k=;
        b=IUGMkmZUD1j9k9AXBT9aDqfV2PQ+GT0+ZjKfc3jtZQ68v0MY/ovNEl2laXVgRH6jAJ
         JG7Ypw/Z9JDbXD9Z9vTKHXQHp4kTuz9tsrAFHYXeDj2dpi32+tCsaow4OXrmog7Vw+g/
         IAZ8JWAVnWqY3CBHU9qGIadqh+rrRXg6dzhHhBrCM77iw4TWLdNnqSg5rHCISSfMICei
         ibqQIvkhuhqT9bzHPA2O/9MDH30eo/TtteoxP2pGrgxMLNDCRJR813thcCBLis125LlT
         /ulu28onN4qF2IVJZxsLJwsA+kQ+hOG5sn7Hcl8N3+v60jGuncWk/qBvYnQjjGagaL9D
         LPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786298476; x=1786903276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SufUvnVfKIwI4mamqZ79S0mhPSYgYY811KsbCw73B2k=;
        b=lg0bPXw/pdWqoJaGHw/4+o92NLWxYNJzUXB7sfK2JQG8iTAakVJGSxzSX5Dz7xydxh
         LPi0Ss91GVuA4E0xRn1SNRQqWwjsF+hnuStLMr9xW9CrqJ3zpanrJZ9oLg7FBkKJkwRt
         bjRXyBtKMAeMGvnHv/CZ3RJB33Sp0KnhGtlNEQQD4f+UizwHpxUp9+Bjz5dcklsRZSKT
         dYj0pHWiNHe3ywWHx0q/NYam00aSR1cGKB8CwtaDsw6HjItKW6Rq1TwWild7e2oz+UoA
         h7F54Su8/FmOb/Aw2LAnZjMioSGGni6CjC1aqO85cGCwlBeC0sAiq8dfLnIwc8w3OHRH
         Vuzg==
X-Forwarded-Encrypted: i=1; AHgh+RqZmJ+5I76KmCqy7kcgf6juLcEb2hly48gdtJD4II+Mf5tLAT9Vwgfz+oGh120u+kbAIg7Lf6nxm08eZnN4@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbt6gg4Ei0/ctL1KAtuQGpzB/UXxmwM0QhkTkv6+N6TTTSTC6p
	9eHXo7KumME+8zmc4pWGz7ZhZlT4lc1vc8zqGz86M23AgocZ/qTJXaXT
X-Gm-Gg: AR+sD10kCbJv9UAc+UWvN1z6ciq1kd9gmLuOLLQyeR7cwv/1OCiZ9GWWSkXXU1+YMcW
	Mimtmhakmkk5n1nG5ssOofXtCagma/16tz9kRYCClqk5SSYGSCri3HhMr/B3e6u8V0MlSXb68J2
	UelW+K4NRIltq/FurFszhvqFF/OSc/OQVPxQkHGsSaKiv/NQg0V/UoP/VBm7RZG4EieP9KLPKS2
	rLyyqqHHrErIeBIy+YQwutue0xXswWdK5PJ8G92pAMKjv0UdxttC2Wl2Rqr0eQdkRd068gfaTlV
	HvRtOCmcs2lbYR6FT3W2Qh5K2YYzKaeDE53seA70k7uC6etsmx05mWWr2pouIh8XYygWDnw+nii
	6wRdLNz8NFi4FWVoX6se1HZW6WGA4SymLAA42FaZsTKMaYCniiHs2deuz7davY4yKhC2/OPnSat
	23XR83mBmKOBQeFkYr8m66OGFbZWM27THPL7MQJVpQjrUUl67JER+bpJnCPZA=
X-Received: by 2002:a17:90b:540f:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-3903c5b7247mr40709313a91.15.1786298476026;
        Sun, 09 Aug 2026 11:01:16 -0700 (PDT)
Received: from PC.. ([103.172.209.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm37111527eec.23.2026.08.09.11.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 11:01:15 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mohit Mishra <mishraloopmohit@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [RFC PATCH] staging: media: atomisp: remove redundant ov2722_startup() helper
Date: Sun,  9 Aug 2026 23:31:05 +0530
Message-ID: <20260809180105.58428-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In atomisp-ov2722.c, ov2722_startup() was invoked inside
ov2722_set_fmt() to program sensor hardware registers during format
negotiation, accompanied by a "TODO: remove it" comment.

Standard V4L2 subdevice drivers do not program hardware registers during
.set_fmt(), but defer hardware register configuration to stream start
(.s_stream(1)).

This patch:
1. Removes the ov2722_startup() helper function and its TODO comment.
2. Refactors register initialization into a static
   ov2722_startup_registers() helper.
3. Moves sensor software reset and resolution register array configuration
   into ov2722_s_stream() when enable == 1.
4. Preserves the PMIC power-cycle retry loop on startup failure inside
   ov2722_s_stream(1) to maintain hardware fault-tolerance for AtomISP
   tablets.
5. Updates ov2722_set_fmt() to purely update internal software state.

BEHAVIORAL RISK & UNTESTED NOTICE:
This is a functional timing change. Deferring hardware register writes to
.s_stream(1) has not been tested on physical Intel AtomISP hardware.
Submitted as RFC for review by AtomISP maintainers (Hans de Goede,
Mauro Carvalho Chehab).

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 109 +++++++++---------
 1 file changed, 53 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..5cbfbe5217a4 100644
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
@@ -746,6 +691,26 @@ static int ov2722_detect(struct i2c_client *client)
 	return 0;
 }
 
+static int ov2722_startup_registers(struct v4l2_subdev *sd)
+{
+	struct ov2722_device *dev = to_ov2722_sensor(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret;
+
+	ret = ov2722_write_reg(client, OV2722_8BIT,
+			       OV2722_SW_RESET, 0x01);
+	if (ret) {
+		dev_err(&client->dev, "ov2722 reset err.\n");
+		return ret;
+	}
+
+	ret = ov2722_write_reg_array(client, dev->res->regs);
+	if (ret)
+		dev_err(&client->dev, "ov2722 write register err.\n");
+
+	return ret;
+}
+
 static int ov2722_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
@@ -754,10 +719,42 @@ static int ov2722_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&dev->input_lock);
 
+	if (enable) {
+		ret = ov2722_startup_registers(sd);
+		if (ret) {
+			int i;
+
+			dev_err(&client->dev, "ov2722 startup err, retry to power up\n");
+			for (i = 0; i < OV2722_POWER_UP_RETRY_NUM; i++) {
+				dev_err(&client->dev,
+					"ov2722 retry to power up %d/%d times, result: ",
+					i + 1, OV2722_POWER_UP_RETRY_NUM);
+				power_down(sd);
+				ret = power_up(sd);
+				if (ret) {
+					dev_err(&client->dev, "power up failed, continue\n");
+					continue;
+				}
+				ret = ov2722_startup_registers(sd);
+				if (ret) {
+					dev_err(&client->dev, " startup FAILED!\n");
+				} else {
+					dev_err(&client->dev, " startup SUCCESS!\n");
+					break;
+				}
+			}
+			if (ret) {
+				dev_err(&client->dev, "ov2722 startup err\n");
+				goto unlock;
+			}
+		}
+	}
+
 	ret = ov2722_write_reg(client, OV2722_8BIT, OV2722_SW_STREAM,
 			       enable ? OV2722_START_STREAMING :
 			       OV2722_STOP_STREAMING);
 
+unlock:
 	mutex_unlock(&dev->input_lock);
 	return ret;
 }
-- 
2.43.0

