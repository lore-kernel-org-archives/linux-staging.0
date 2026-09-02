Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4C4A4852
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360834; cv=none; b=uPqGW22BByekNbphnPOxA0ZrW+2SqWDn9QWnkkoiaYeVmVXoEYcQHihQwBn4IB0zmAthJ8K5bxD6TpX5ibzB78i/9IhLty9aIsp2uwi5gjPQaWNgYqtLp8bUTs7OvUht/vYOyT35Hzi+kMZ7/Ppgd5bhs7Jf9L9K4WrqEFNNgDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360834; c=relaxed/simple;
	bh=IJTIjXefCtpyzFz642pELl2c8LGlNjVMmQXZPOjQ1EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgD4b/TPzwxjfV8kI7q/oZvCsSn1ORqNpjhvyWT2kW/X/4tVu385pFlPrSKwY6FmzGiblMoYAEVDsNqMQsKp1gHpNQgViPjKn70HWF6tueYSEE3Bh/lDxAZnm4aQITUWdF/OzPPyLwKS1FE5fom2yXmWoTnulD5Ems/K58Cynlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGCGJzRV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGCGJzRV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1191761f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360831; x=1788965631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=IGCGJzRV5pXwC9HZQ4SM2U7Zy3kGqaKqpjK77fR1vcvNBXPpjYj5UPY30zWOUhLH9B
         c8KgDzv5GM8Ifn450Gng4Fp8d8FJP9V66Prx32liJx8attuSGIHUQyj5H2RuXPgTf84A
         qGnCPDB7T0s0rPUg+mz+IMxkbOdEvAiPQJtkWOmfZJAUS5/AfbBpS8fH7iFfjmaxm0AT
         iMyVNwuGh+FLL59fvvxUESkGQJbq6CTRWeT4xQkn8iQ47cimWYE2OuhQQK4fhWeNXgjQ
         mW6i6UV76mJoYMKqwyifg4otCYIl/n31NZFSNAA2LG3gUtVaYvi3dQ4ex4xWspWk9C2b
         dAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360831; x=1788965631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=TLnCOW6hFE3kCOmBCUmUomxCw7IrTxQWshzlOma3DlwQO8fgyTdKcHiB/N4GAjtrUQ
         HQOn6pEbzCS4eeAF96PkPH0vHxnvOs8q+WKHXofxiy1P6A5u/Pwwd9Aotmm5I3b+xzR7
         omMcRlTWPb3fXjIZcpuaPrfASmCJwVOnWSa9cxNVGQBJPGtE4PiPifkE7L0QUxb4cn47
         EB7bDM6pfmCrS0zqJY6SmTWO5/CEItxjzdrnBP0pO6QeL2F9uSSG+0MOh0SgXXNL5n26
         IzE1I4EdkCCe++GK8R1LMzUvg54+EVVOQybw9bd1rnIsAIWMSifPQsRpne9bgu+p0Eun
         FvfA==
X-Forwarded-Encrypted: i=1; AKwUvBzPkAeZQ6Lyy1yVRNVTi56IyFO5ibJkKQ+U5qL7+3eneqiGy+t7S2bmDoRy2791Ic7f2J37V39m0QcCK40O@lists.linux.dev
X-Gm-Message-State: AFuF++mvSWS5BcL5yZkl+dGCeZjMW/DkrxLWQGChMj//Mvm3EbKPH0Dv
	Gc2P5FSGovKwqu/PyyiilubDpPFE1oxjli/Cjer8nuw9zGcn6zxxiLn6
X-Gm-Gg: AYBFou2SAxni4V0Xh9n2zsvnOxwu1LUyQTvuX++0y72A0N3iozqdUmBgeOz1WgjQ1xD
	7hfgScjfTF6i1pYFmQfjqGBcT2pJt0y2vaY3frwW2qVnVYf3NFSO/6sSScehN/IPp/agTAV021l
	gjQQLCXQVrr/PNb1HI69di1mAAs2H2OardUxwhWRo8dIJpfSny/tfBh9+uQYK7q7yp/9YGvsiIX
	2FMH43hmFLqo3eYcvJOgMv/AOK1E7RyG6e95Af9HQzIgz1r00FmlIyxVmZ9nlcCK5Irif9S8pI9
	2NKsEU+QT+YHtAp+fsUch9kayWaPoTIejF6rqGYImdgvbmdiZN1rQbA0aj9cRmrwWR5vEEVXalK
	DbfaR9fhL3bphRLEtj6IM7QQO/3fu3qvAtfuXx2WPktO/uT/Xed7u/25da44ZsGjW7hu1tFogwG
	u1XwYhqNQwprKro0k19UNf0OLWPGbsA98NJaUMKdtCccWzPH9uuq9EbOfuP2cRZYXvsR4N4DGiq
	NL06CtX6fvD/jiKUBPdHS3WeD0d+AsVx+w0VRQbBg71
X-Received: by 2002:a05:6000:2211:b0:484:3c87:dc91 with SMTP id ffacd0b85a97d-484913c33bdmr9871534f8f.19.1788360830513;
        Wed, 02 Sep 2026 07:53:50 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:50 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/16] media: ov8858: Extract digital gain programming
Date: Wed,  2 Sep 2026 16:53:30 +0200
Message-ID: <517c4f11075debaaa3eebc4e8bed574ac832565c.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

