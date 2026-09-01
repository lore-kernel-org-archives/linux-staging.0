Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7EE4A0150
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289487; cv=none; b=GWwTxxDHJCe1pTtGAsCHmFtwyXZs78/o2gcQhKOj4BJCHl64oB+lvIgJmA9Y78YkW05oMnqFgFKnikqekdiTfY3dLzhHmdD0oUdafrgdbEOwqQt83lkxAtug3Kz1g4+191xS90GpKlE/CeRB3z7JYz+UNQ8pJ8Oprw2UdxhQL2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289487; c=relaxed/simple;
	bh=IJTIjXefCtpyzFz642pELl2c8LGlNjVMmQXZPOjQ1EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdbrfWeSNIr7v7WzP/hoJc7CJFGDrkD2DcgBgmnxdJFA7NOM32huSTKdkJ66iZRPgayVYsEM+n3mAnb/UX1t/TqdcpDwZna0f+2tqsXJ+385Vye7989t/SiSgVzLylHs9tuF/sAChRpYgK3VA2NyiyKV/A0D//kEtHFX4zsM5kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CC6aTAP8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CC6aTAP8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49557167508so1406155e9.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289483; x=1788894283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=CC6aTAP85vILk5ieLnuTmBN2q6B3pf8F/wh1sjSo99BqhG+dQGw1yBWjXhnmmnBW/s
         myG6nts9BM4rLmt9iQwaD9QunIV5TcGIYcMqvHIcAg4Gbfwi31M6wr2elRTd0ff4LBqO
         VuwIdcmt6dg+c7zvVfHGKlQQdyiBaJsZmr8pCHYbV1jlgB0VPedrGoKjjKPmoccTU+NV
         o8uollySMEaLfS5Jtl17JzpOBKB4DHikDrtEqc36GfkaQ53Y6NZZml20r+251PuQwJn/
         WLw3BSdKwmd8P2ht7CHvy+piyYDENC+NNmXFUqovm3jUgH4YwbyowZjBfnFdH2EZ/21d
         Bh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289483; x=1788894283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=fdoz7Ks79IW7u0d/da9+kYcCXxQ2OSMJpqTDUVVVFN3EyNEqtSmsEl6OL8M8y6htPS
         C24EuTjQJtF0vNXWkxQYlFaMixcaYT+p7H+NWro/HYt6vLukvXCmUp1Pmda7cOfwJXV+
         y3QDBltvEtFuAC0l2Fezpjzvpx2404SSaog06VE1YkJZnPxaOArmhY/Ek3iUI1lASzwU
         03mc2Ch0g1bPUc4IsaPzAIL1zeXy6h21mwE+4SGtsJ4rlt7N39fKV7M93HMmKqLLLWDc
         DysDL0PjaqXuC2HzBULZ5X90PwVGpj5PQfE1GzlQUl/KMD3iHiC2AXunT3KHmxRnJGlE
         H/6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoR1nuiJJ3KlwXYWYB9ySg7H6I+tdJAd3+gCaMhNRg6RnW6tVchBBanA1o11J3/lzlW0FUKOkMQtMQuo00r@lists.linux.dev
X-Gm-Message-State: AFuF++mi2Tgq4yNwGes2cqjiQHOsOD54AhT0srnIBhKSDwqnCgXDEHQk
	jH91ZSK6Tsk9fkUEkbH5jLYo/W4X0N3xOLgNtQ3GKnoH7E46yWQgsj25
X-Gm-Gg: AR+sD10oQJxFXsP8qxXVXPQwX+ZoZeQEYSWaXRgcDYs+2gXkRla5m8TuZMJIyLnpirY
	/f713MQkkpb1mBLmz6Zm1dIbFErGzAVHRY7PAETR5vDOMo3wmoygxEqlH09BKeXiwNHU7xIKU68
	TlYQrfnbLz/8tIEVMIoU3/FYR5o7JtuUAndLFYDULW7tq3eHgIHCjOBoDvhA9rpUmVkmbTkaiSz
	OdTgde8nNpI6lJWGF7LdeIJZtOtGna63wYD/o6wMGMM05goMkSfF6qKXV5X9JO8wupQm2ToA229
	El8drb61WMyGPF5yhT5URSLOqyxAzu5uhua0se+kabTow6JE8ZfqEssu55tl5jEq3XxeFgxiWr6
	XIcZBz0pd+REWYlpUDKcEqMJzdzPTQ6absuGcsbntEikV35Z5zcxgHKKop18bTRN9q22/ImQGAj
	BkYKH7fnH7NGEzmV3CrRGwhlyJcCLyTGP7PXo0+HPIIS3Qm7ESjo6wqW9ME9b6pxbSeL40cBhZn
	V3sV/K+ZYU5RL6onlnAmb2itfV6o2IROqKDLsjc/Q==
X-Received: by 2002:a05:600d:6402:20b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49cdc42f449mr19066685e9.3.1788289482804;
        Tue, 01 Sep 2026 12:04:42 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:42 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/16] media: ov8858: Extract digital gain programming
Date: Tue,  1 Sep 2026 21:04:23 +0200
Message-ID: <ec1729f6eb60f3d29707fc3d13e247d2b072dfc8.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab833..d95f034de752 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+
+	/*
+	 * Digital gain is assembled as:
+	 * 0x350a[7:0] = dgain[13:6]
+	 * 0x350b[5:0] = dgain[5:0]
+	 * Reassemble the control value to write it in one go.
+	 */
+	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1531,7 +1548,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1570,17 +1586,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0

