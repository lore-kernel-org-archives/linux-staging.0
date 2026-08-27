Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5503D75C2
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872661; cv=none; b=D07avXhbtHiqoPYW4o5lpA/BQf0RRX0jvj6+i+V1eV66/igt57otj9EwO1BPPKEWkju9JGNsLTfj4frPJEoS3Kd2iAogjUUIYiPOveNa4qBsrrhmPaoQi9x2QI4E3qgwiH9VeqDM7cTNIiYZurfnoels0bu+NJjcnlbuMimUf7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872661; c=relaxed/simple;
	bh=xhrDm+Mv7c74PMtacFvusD+88J1ycuEMG7fJpBlsDjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYe7I1iUWk7OqjmEgp+Xk5aFd4rnL8QntkDfQxhAKzCWe4zWWm3TlZ/K7tn6qG2GDmMMDwo2uos/6ZR5dYVE0oMEIxSENqjd1Xd4tJvhO6hST8u1dgltGeBUNfCXoLXgglmVvTzFW83gBbF/31X23dlVH0LtZowrdZrSz3H7VW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8OY2aU4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8OY2aU4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso3212795e9.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872658; x=1788477458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=C8OY2aU4II7tTUnrb8fqDNxDKeRzS79r+ylnmioIQJyHkf1unqKEcnbupnqZHeOgXu
         mM58FACgPqJ/fz0uwAQlb9/l4sdaVH75sajpJtYXNz/J3aHkhkDZwHp0HtFesz/7utHl
         2iall2hVq44okGyGH+8zwH9ZiNdkCUSd8u/6GphBt5OrJX2xcHRyM9bVA3pj3LyXcIhy
         gAVFMrGfHG+XCu6qSepcvRwoxCI/xKTDEiDHvFU/LBXCWklaTi+tE3WlmM22yL5GwBdP
         G5tDs60lQoGYg6SC6gNGXpGQjEso0xur/Q51SAjVisY9yveGebr3BpGMlKj2yk8/idkY
         Ks8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872658; x=1788477458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=DarGqAzco95yADU7le0fBPEmCWNfe6smUJykEEc4joHVrnIT4Ruh/0IqvRZllChJg8
         YZA4U24M3oDaoPnRRYHUU626mjX3c6Ts/I8J6KlxSFlDCsJATpEsU1YjdoOIYZ9A9A0E
         3u4vk0ET6qtjlp89SzSR3IFUUa0EChSGeyS1I+Tj2TjhlrywiLxglQGC2GtgfT3bWpr+
         elVwurK1Kh5e9Hxd/ddZCI3jfR4X9aBpHy3VkrM+KJY3gnkxMt9wr39kNM9iGBnrY82f
         d6nHZgvcDM49sDK7Bq0T5HR1iQGezHUypr01ru0JtxVYqfCCG/gmA5Wu6DQ+QA8Jv8W5
         +AbA==
X-Forwarded-Encrypted: i=1; AHgh+RotDwhf3jmKPtZ9KsKiNr2nTGwEnQBmh4QEoZ7h0lsyxlRJV6VxLGlSwT9cO2Ig89mQbpy4lo+XTiQ8hJ8a@lists.linux.dev
X-Gm-Message-State: AFuF++nqiJRwfJa5oTE91CQQcFxRW8LBT8cTLp7FPVT5VXCUzedL3lXQ
	aa5n8h1Y1AMQ3m5z6hDOqEG+bLZ+t01Y/nDxrIuC/O83toEPUu1PdV86
X-Gm-Gg: AR+sD13bBv7CFlhkEEf9x+YLxkJ1W9rakKXOUZIrEVIJI0OXfvOuvBv8GoF+FFkhSEl
	D788qbgMCl7J/8vMULdJZuD/xdd3VG2t7hN7cRQ6t5eSDQTPFyqYf8haVmODbFd/imQ3A/Gxm08
	r2hsM1FFY2elo+e8IHx58omCwmYeroGf7awPY+nSkze1EcyrtkiqQ6Gq5W7m/Ws6fb8WaQTUeoo
	hdI/5hznFbPZyKdNZ0LADPMunXfwKzSMOGus0ou3Ddfc0pU4XLHK8v9l60kd2W0zibBDnWpaASa
	40o2M9l7XSXRi7JaD7hMN6/cl+R+b4LZ3hIbMGRSzBcW9brBsGB+UEng7TDTzJkeOW1MDASIn54
	VGyNPdObmvKFUMxrNvOOuWlS2cJ8wX/pj1NKw3diuvgeJDcvgZy1pM2r73rwquvkh4OOXs3hpsJ
	2gdR8nBhQq7BGmE1SsCR6bjBKDVpUQwD+JC6Bp5AjiQwu8LcmqTE6mBB6LgqkoX/6HNhH57hN9a
	VQD0h2J3XRjCWY5M8OehJBT5zZYjQ1wrKoVDBz/mPdINq5w22XoAKc=
X-Received: by 2002:a05:600c:3b25:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49b91a67d36mr26027295e9.6.1787872658358;
        Thu, 27 Aug 2026 16:17:38 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:37 -0700 (PDT)
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
Subject: [PATCH v3 01/12] media: ov8858: Extract digital gain programming
Date: Fri, 28 Aug 2026 01:17:19 +0200
Message-ID: <6fa23c0b021ceb31e6137986bff139870e4769ea.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a helper so
clock-specific gain handling can be added separately.

Assisted-by: Codex:gpt-5.6-sol sparse
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

