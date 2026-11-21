Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267972;
	b=CRTRU38KlRu6pR77eaxW+7bJQpzIRw8374cGLOy0MR9kPblfEWv2kz8jRyAnWJGCP/hk
	 uSzmwtjCKdeZii6s5HT6Y2I02g/2TWfO3DFo54uUiQWF4fopbTxI4ugZAW/FxJlibNZBM
	 EKORJHQTMGIKAV4+h0Lx7ux+E2x/o2L1aEMDtJbKmXiIH9WUmlTmdBkVAHP+xzU3yTotn
	 8XE/7sxJWJMe/PLQ5pM+Dg7ItPKfo/aEkPNfD0RV+pAqjVXTW+fnGpIli/2CnmZ07xIpA
	 Z8ogDczAnN83aVXiWdrwGQrY1i7Ik9lZhRu/cZq97+yoJB/I48aKAZ+veJdwurn9Zrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3HnyebDCuntlbrCv9OQomxEOLXwBjjcdpAxNc2VsRr0=;
	b=ZyvAWa/+384RUUISxeAPdRMFGhce6JrdeMyOC3b7HK9X6L6x94jjqxgZfO5O4z8wsGMa
	 wCgrQKS5f/R2PrV41vQumStIXY9EBAiMofyvYf/d7AKfuUgAOjIUTizsMqbm5vp/7p+Vk
	 At2+Vcaxq6j/5csVeIiIoR2Kfnkx6bw+bE3esfJ/Q2i4R7gIoS5AlYmnXOCvCXSONYsaZ
	 Pm+++0xmdmKpxt5JGNuPbC2aP0zhqtlaAWFYEQwSr2KjFQ7yNZAlWIbyi03to1oTnXMm8
	 qXpdX1C9mujUmLGy5TwMBkKyMAmge0u1PKDxh1a9uX2uAq1xx+DZ600UTYRZVW4ilQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyayG2Ii;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC31606A33A
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC31606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyayG2Ii
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so15153445e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267971; x=1795872771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3HnyebDCuntlbrCv9OQomxEOLXwBjjcdpAxNc2VsRr0=;
        b=fyayG2Ii8TpgiKg/PmFl0d6cnPBfq1zXYNpd6hfmzGcNCSZ3qJNvCp97bE1vVKsl7a
         8xq/0tNlGq61ezJWR0+9bXd3aJ4MC4npIDQNd3TWlmUUBbiAFT9iEgMb5lXfLrPsJXNw
         LLB3TaQL3d7CF0FyMwRUgKwifAE+TNYyP1WqLn0Iu0NXDF7VFAOlC3OwPbhWDgHTsCZD
         NEe9bCncXU4+JpVapR0VkwYpFXUOmulFMQCXPdltcP68sj6aTfdMVDG9nVenjTgy6urK
         kQiSbsetCxLS9y+mxzczJBiwm3zoheuzhBk9m71dyCw1H/2N/crABIZr3lL3/30gXzML
         7cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267971; x=1795872771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3HnyebDCuntlbrCv9OQomxEOLXwBjjcdpAxNc2VsRr0=;
        b=rV6KS8bxvdonT9qgTHx3zu7mhsj9mfx4wLSX/GpWWaS/+H8aeA4oUIzTZ0s6e2DJjS
         /n+VM/0uMiOSvJ/fKbRLJnQuJ83GibQNawdCajX9RtH4NVAmUVXFqFdCAl8AUVD7t+M2
         eLz9uZoqZL799aG/fY2+5LgS/U6KA52XJnxrFNCPV1AS8cECGRx7M8TfLVtZb5eXLw0v
         ugxnhxZG801FnNtQdlo+fFYMrVnY/pUhsOS/HwVP7CNKCuNUl53z/ibu9QQMG8qDwyGN
         B5HmSoVzot5QvhQELofIpTGmEnoofbjrSibB2vkk21/qXRgkymMxb9m1KQVs9wE2C30o
         8Ppg==
X-Forwarded-Encrypted: i=1; AL+hErE6peSHeiM2rj7S6aXfiFbFmkJe4NdFxoM9Sye8e0WcUYhZAZHq5JL8U105iCSvQNy8uaD2xZmx9+tzdZZo@lists.linux.dev
X-Gm-Message-State: APuU4Z9T/0GnNzb80Qa2HGJvd/cukRd/CaH84QWznIfVic9SHoWeKC/c
	FyaCXu7FqDEkXH0MYWLG43bNOp/xn+pVZU3E6DsgyFuJMdYgj+oxTNVF
X-Gm-Gg: AZFdTZdlFtYMvNFFTBqHWjiibgNgv6XqZI8RWMIfJ/fe05D0WeC7fP4Yiwd98xhMeJy
	IGyIuUQWIkcAZdGEndDSXnas67g5uJ6xEKTc3Qk+Gs8Uypmq2Y8Q/DP7YGKRLGOMWXY4k+/bH3O
	g0TKAn2wUcSdnj9w5/7ONqQuxh8sP07TMIhRDp8PZwpckOqlrFhFfV0rJ7w+JYRzVoE3mZ3uoXg
	x/7mdW+waAVEOU8aRmnJuxVdMoXvm1Dg9D94pgWGoGZgl+zxbhnWM3T6aEmK5exKCZQJJJvriRQ
	3SF0mvpCylb689FUC9m4JIrtDiKQc1jH+veT7V6VV2dv4oT3UdMPhWZ8SD8xiWbGPM+oRnDcHiy
	LmihKmRt2OPwFTW1dJ+athomNisMbMr9s/SxyFpJr+UQNzAnSMNHZBsqnm7zb1XHACWNASvSt3z
	8z/fS+57u+9QsdxU+kHG2HP2mGw1yI6557zgLyLHRSb5IpBJmw+Ab5zUzioTpICWxY2IcMqTuzX
	3JcO/Al7SZ2jsFV9LsnW4fdbisp85myGMk5OO2xAk5ss3VzUGXQu6BvDYkCuOUaDuwSTuPaX2qH
	PKvcJBzD49bWIrJ0i/4JYSPKBNyBhrWwbTosfF+QPDFYqeCk0KrgpvV7viG7ABP9x7EXL9a24oj
	3bPTf30yBbi2TUnxqrYE8XtfV+UZTsnMu2w==
X-Received: by 2002:a05:600c:c4a2:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb88807d87mr146858345e9.7.1795267970892;
        Sat, 21 Nov 2026 05:32:50 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:50 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 02/14] media: ov8858: Extract digital gain programming
Date: Sat, 21 Nov 2026 14:31:32 +0100
Message-ID: <9fde79c38b265442d4fba0a12bd1bbf04ada510d.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 97448fa75..295c34817 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1525,6 +1525,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
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
@@ -1533,7 +1550,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1572,17 +1588,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
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


