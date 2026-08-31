Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B536B90A
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199271; cv=none; b=K/sBiR8BZsYPLw4VZJBY3SPW5N1iGzWIa4pKn6Yz+j9UoUNc/WpLu2JqetOuVhRWCXeNJiHVKfomtcgTRk52Mfu3uHPZcnqyiSpRMtGtA9vz5Lk/cso7GOtk+XXiDvJfVWiI4D9VKAEyM8qWF5DTKSMjXBEUyKzMv5AzdTg+JEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199271; c=relaxed/simple;
	bh=+c4zvKKOzyTG8jOPH9TvfJgLdF8RPSCzmK6SpoAiOic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGQXdXqjsSy7N6i8vyFiT7Olpi44i8ghDYp3uP9AgojNJ//iSnzbX3/ZOgY5LGsf5YC3lkO6HfPgMvoo8s72dYfAfRbOop/hI4vrtB3LwbtbYaLrXX7BW8ZgX8DpCeHtV3pYUpAlMj4bgC5mVf1MAaG11etxfAFDLTxeYGcU2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr4ZhM80; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr4ZhM80"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4843e9c5960so30301f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199267; x=1788804067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfJBnn5eTo/6C/oJ9YXkPmfh/d+EU+7KK+XPUfp9+ec=;
        b=Zr4ZhM809T/4Cw7PPHHteTbY6HjxPfamO2ovkMudlKkTz7BqM2swnEpxh27lhLv4X7
         q6lylyeW3P8g7kTwblgy8nBOJFcooYiicNBtUYk3RbeH4zowHEIS1tV/HqRsaLfIoZXU
         gNNgmWh6XId1unQ8Q3mKbQuehtEdw7eLIYwb6gHUH79MpW+ekMtMlvm2rgA/DcwHBO78
         6O4vtLN9zQeuYe3GLFx48RFXDM/yuoTPAELX8hK+nQoyvHGyrRcHesZ7pJ7rWHfi3jPC
         J9yYYtEMZ627h6W4uc2V0Dkovml5UsXrlsXVzKl0LpnhJSO6yGX49lKlo7MHdiBYfh7Z
         h8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199267; x=1788804067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfJBnn5eTo/6C/oJ9YXkPmfh/d+EU+7KK+XPUfp9+ec=;
        b=G5oRvgYyfIOralvgG1US+WSqoISumS3N1OXj+efi+dwO+IKVeIqss5340BV2nfl/RG
         PK1KouIO5iHUrSCOXxbo2FRzzBs5cKy6frh8SEvYBbbhOuQe1TYYO7LAk1qPh3EaB8HN
         vXAHO0NZafIfOihqIf6ISzw37Qr5onG3HYPmrN4fxgwlso0Sw1Wu+S54Zt+EcoLOVqtf
         bt0HqcQ/Dd6MAxi5SGvyI0iOr5j90DoHYKU5CNPHv3BThnIvT0LVoUGSyl+hMzCjDy/j
         ILGsZledQpGIDizRCH5Jui/NCLcF0ey9C2+tasn5CJZdqDheGDwrv+oK1/sIqOT/w+3/
         ROqQ==
X-Forwarded-Encrypted: i=1; AKwUvBygxDLjAXnaTQaKLp/r1j3fIGzrPCjK3qfOWNjcydya7xYtHV692B2zuWTlEIxwtrq2ME92B+wDFp08ujuK@lists.linux.dev
X-Gm-Message-State: AFuF++mOD2AFN8TH6ljgZjCiM1eGn8FyAm/T8mRE66kY0nhAsixImfZi
	6Qwa9uXN5USg2zF9zqLg8TQ2lVeC9fgvvG1jpaCYK4r8ZSXnVTPt8gdy
X-Gm-Gg: AYBFou1cIORzwj8y1Wj3G5Pd95RyvNqu2NEGZNtczF4wIaTWYVG9tyEaCt48p/bFrbA
	1esbxp3fJNnlG6SaBb/WvgtYlvFRzRpz4Dr+mIPe9o2f/5V1dM3eu7Ec8kkzps344IuwZqLG6Vd
	uLXib3GgoVI4LWJs7GFQf2GxXXFyYBlQ7J6J/blNGnMFnxrVdwWeG6vLBSTtnAFd7czfZrzeuWU
	hqHt8UjjOH3OIk1ADt82eZk/VPJjL3eVMGqH/ewoiGp/tcD8TQU08XTed8aoWDuaH8qdczsKqQ/
	A1b6ea9mhv59KKyECjCl0Ge2+dH/YMh9ByiXPxyQ/5xJXEYLvlxyWTr3lLu8/YHJ1Fd01VuRMfC
	OygZVuxEUxMDv3xshmCkGUTZzeLAavPYUgdE1yrL5B+p+EnYcT+92rp74wWwvKJAmpCcr3Ffw3H
	Bjz7BKaQzb8EjLOnNFC/ph4NS0xkEiDFYKpVZ6jA1mB1a520YY/HitDb1GFkSORnAVy5DFWjt6E
	3g0B3t/6wL0gNYAA79sqQGE6lLdasBbvV9Lyov2eKY=
X-Received: by 2002:a05:6000:4705:b0:484:3ad2:27d3 with SMTP id ffacd0b85a97d-4843ad228f2mr17224694f8f.2.1788199267099;
        Mon, 31 Aug 2026 11:01:07 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:06 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 01/16] media: ov8858: Extract digital gain programming
Date: Mon, 31 Aug 2026 20:00:46 +0200
Message-ID: <20260831180101.3109854-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

