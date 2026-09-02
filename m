Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3CD4A482D
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360838; cv=none; b=uWsnUCGXNnh0EIDqE1HlXf4Pzr+8pgVveEbTIYVugC/yQMOXuLmi+KMyFVmu3xacLUA56C+QZRninTU0QT0O5Mo1aJCXo4mR5Suc73xHB5Veha8wEZ2wjT9HEC4mIveuG7cq3RBtG3P4HUi08wgu9nOXtlFlylSPmcr+HU3L5Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360838; c=relaxed/simple;
	bh=a4oCgSJxVT+Yvyj6OvJRra4F7RQTRxH4QG/o8/Ybv3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H76eBxECDI306E61Ikow2q1eAqn/M6+e6V469G9bXQb6oUf22hDB++mJaL1sKseR/BhAEY0WN52ZIO0LKKzxdmzEXBn30ZHzZZa9xtb+OGIdqESUelv/4jYmJhTWyf0Ag93UdkdQR40r1Zd2Vxp0plKOXDkHyFMGTZlaA5lMxWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTDSfOeA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTDSfOeA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so11236675e9.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360835; x=1788965635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=oTDSfOeA4Qr2ubu+P/uBP7Ve3U6X0jQ4TRIw7kC3PGb9jAbERQm0qC0KCqHyjixjhO
         1ZSgrJn1xM6hu2cIzhTVG5D4Tp0ylQ8cmOgseSAsQxVVjOKeWW4y9yAei1fAbp2KLx7v
         e7+CJAzo6Yhq+DOOKlmcRPjdAkQCDeU2GszyYHhTHpbhvzG3NaiSBp/NdgQASn0/ejCu
         iQ/YM9zd0BLFMPOdhUA5ZLiq4bZ5U2Z1oIVSIGHoCly1MpQ1ZU3wbuijvH2tEIVzlD/y
         pRX3XZn2q8WPpsDoQjJibqdMUXSZMc/fVYftiF0/cpTg9tbBTsJhKll/YlVAMcn85MYn
         IFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360835; x=1788965635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=RNmhZ66oXflwvCMnFE6hsn2K61bVLxmKR8OvWQlJbkNafkm2loEwD3C1TyFaR21Dq1
         HZTKw/bGF4BXGKgSwAyS9M00t4jx90UWIw+I9Q4SK7E+Qoab1zP3+3kjzkdNnH+q1kIM
         MPZryay/Q3jvFY1d75yGSzVnts/yFuWz8EJ9RbWACvZs9pPwaSNH/R96/Mz8PJDhatQ3
         NWVKM5Ld3dqGcpE8JgGGszXUoIVw4k8Y0uWmPXpk1HSmVpxQdzF7k5jESjrMqaVXzEZd
         3VTsCefxgflEW55gvMlFRO4ppaNtee9E0+ioqMvvcdRQE5mlFU4khFcuI27kodRND+az
         Y0cg==
X-Forwarded-Encrypted: i=1; AKwUvBz7m7Ucrkbe/+NNMN2iEdChl3TPy7O/Q5jdriZYpgPvLGwH6r8LocPKivnmTfjSFUy797NZAXNYuEftmBNn@lists.linux.dev
X-Gm-Message-State: AFuF++l25T4M9mOcoqHNRK8nnThu/Bro2mvcK4t7Q3wlZbXgqnOs8s8P
	KOh82+ANOyTDIchjKTZbUa4OMY/aw8cL+MG5u7851/ypPLB9Yb4hlXt0
X-Gm-Gg: AYBFou3EQ2lJuVOG6Ex3nbY0Smh8vSw1mQXnRX0Lx7rOUocF8frZYC98HIEkc54TA7a
	z280C5n0sSYMpDVah4sTAM9Ye96p4F4U8XGKM4PAM2U0gZaYYN6PYyL1bTImhEqnR4mslErg+J3
	aQiaoIAhaxtiZls1LC5KHU0/oRmAVMmJe6ze/52Et7GPAYMsDUE0cYFPRPrgYd2lc9b3bOC8B/f
	wmY59o+W6DZ3+7PW+j2gIkjISwgFO4TwK6jV1nsXEdI0+3UObgJ6p468q4eZAnnkSKdBCp/cfaS
	9W+Myyz739U56yXnUyF0lGCZWsd5pAzwOePE9A0PYOg3kbw9sSiM1p78mD169zkKiLRJ5Mj7urW
	Ms+eFTACv19IwEYwiQa4p0fuhMiUz0c0nwyEAfbf5pvD0ghEvOhCh/U6qMxFDH+H6Pe/xHLxEjJ
	Lls9Fz8XSGu/ZTnNilsHuHlrwOWOPc40ByvBL3kiW32if0oUZZk/e/7LzkmgYtBnMbfuAbAxlEF
	3kP9mGrSS6WkcqjjOprbLOu1B890EyiDstCCRBj2xEb
X-Received: by 2002:a05:6000:184e:b0:484:3312:f127 with SMTP id ffacd0b85a97d-484913c020amr9110505f8f.27.1788360834456;
        Wed, 02 Sep 2026 07:53:54 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:54 -0700 (PDT)
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
Subject: [PATCH v7 03/16] media: ov2740: Use C99 initializers for ACPI IDs
Date: Wed,  2 Sep 2026 16:53:32 +0200
Message-ID: <12033326593d98fb9bd5902820c1ab29df00c94c.1788360629.git.mauriziocasciano7@gmail.com>
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

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

