Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE42B4A6CDE
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360856; cv=none; b=Yi1KZSGC+tFIubrOdKbEXAubtQWHt+2eZZnBvjmiruDUFmWLALtQucVQiCLeUIawkrSEBFjmkjHxwN9LYWJZb33u4nPwvwdK9pO6d3eh5DN29Nk1SIMHULCrC29NjqunLmHVEtKMx5P6KyiKafvkNagKfDEtsqaua8Gg+pj5F84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360856; c=relaxed/simple;
	bh=oSQRJqNxqEh6/B1/z4WZhyY4jL7gQ546XKgY1JR+lhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxFAQicP5WKnJw0zMn9PSy+bGMg2y96A/MMwmzQ4uo8pAV2oaAe7MYIQ0FdXrvUxpRv+NCUSjd9xb6yNl03HOcNqmGrnLEKCuQgfV6ONasoZklVclnH7LeT0GXPFvwbg59jf+mZ0uymnRKOwJrd7+hdnT/aC4sGj+oF+/V0VGEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ob60ApIq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ob60ApIq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f96c5b722so863210f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360852; x=1788965652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=ob60ApIqc6+YhhUDA82v2wsZDvY1IHO0DGQrdrYqJi+zI5kC5pFmZtbuDLucEKqVJe
         SpRaKvGbfjZA+AHpD9ZDtW0Un2mJDnU916xRJjHvMwxWVhzo2EOY1EvZd01/cN41Nz8E
         CoUGGIKE+YhPi9tXub4//stV3nnAz+sc1/Hzay/tPiDSjUlj2o8ITmNfXM3yY48Z/qIz
         +Q88BkyHPVTjCetWpixHpw1nlbCFPwHku7IlyiZbWoz2LS28tUJQRo/HhobmzcjA7XPV
         W9slLiywm/9nHBw0O9ACTWvvCWo4aT5GSzWtkHbbkBFUVlSEAAz+5MwJmpfkt2VMiAQ1
         MMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360852; x=1788965652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=SsxmZ8C0Qea1oez8xSY5pqnA7Jc/dJfXT9JUPFkhfwEN9K0Mu4m60PlQ2kElBlMdrJ
         wAbuBOayY/75EQjoo6NIwpQryVZCcPs8ZJnEap0726hrxS/z6hou+BTlx6Y2wXEPRid+
         BMkBLDTYFEeLlMY8Ky861nLuyV4ehdqpnB42ZOj7IQKSBSZcxzyJPApH6gFkWo6VMxZE
         MQkj8hh6M+OqZ8gkpuktXoZjYGLLPXLfnyiIVwGeiCfteAg55c380A4vq/10Lt4igBzO
         iJ7wf9e5RcMuHLivs2CPm8CzYTrQJZxs/YdGw8X4Xxpo3Q7bhTxAYKPJWQjWzkAxpjJP
         1Wfw==
X-Forwarded-Encrypted: i=1; AKwUvBzXiNvPPJ/97IVR0scUaINwREjTfKqyN730pcqOcZWCkr3NiHn5AcrUF2JyqEqxK8zFUctpJPrLOs0gn/0u@lists.linux.dev
X-Gm-Message-State: AFuF++n8aS+yDJ+K+4yYxTBhVdGJDaB2HuW52GulcQAMtefeAgpaiAMy
	dUg9P4RyTM8e/PytcVmAJzoJAylSWVsaHwtvcCoVQD9FYEevDVUNXjnJ
X-Gm-Gg: AYBFou2UoRx06S7yHFgprGE3/ozQweYO8cghn+AiYqaUjP7wx9OORyYvw1c4rLGFPYW
	IpUGlIvOefY7GBrjLXybC2yOePaO8FiRkjvPMBEBDME1uxicyHLS6ED6tK9fOzklIAxoHRFbMfr
	Cbp9Tv922w1JqO/6OpDXw2wz9Vt7pCFj5ZcWe9X/LV/gj4Z+9nBqT6vOHkoaVGVSAomlIIw5GMO
	1DTmhhDCwsES0jrK4VSBvOPy06oUuXF+FP365xKm20wg2AMq9IyMZoEQe+Y81MwQS9dwE1veHre
	PbvgoJPQHDXdqE/zC/Jn9lPQCWi59bns5aes0yFUY/mG5WiFy2F7m4VeG+8o+Zwe1KRMGqX4r5n
	N1i/pagkcVdirt00ZwmQOc9KJLnjAYOFf6W3RaxusV+KHwpIuZvOCUoF4rRt5DcRQA9g2oxBh1B
	EbNcR6AMU0BB/LYFYeo8aAPpbkn14jiQ2Kja6WNGoWxEKWNdcGReMAWiKlLRBNldIVeSHA6POle
	+Els8mV0vov6mv85FtQzaAw+GV2cmm8wPz4oe2AH7Al
X-Received: by 2002:a5d:5850:0:b0:484:3f03:82b3 with SMTP id ffacd0b85a97d-48488f0dfcamr4124411f8f.11.1788360851696;
        Wed, 02 Sep 2026 07:54:11 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:11 -0700 (PDT)
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
Subject: [PATCH v7 12/16] media: ov2740: release group hold after gain write errors
Date: Wed,  2 Sep 2026 16:53:41 +0200
Message-ID: <34f5f77ec2ddc7ff7a000603b120380c80bb73d4.1788360629.git.mauriziocasciano7@gmail.com>
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

Digital-gain updates start a register group before writing the red,
green and blue gains. The current error paths return immediately when
one of those writes fails, leaving the group open and never issuing its
end and launch commands. Later control updates can then be accumulated
in an unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index f3d91c87b3d5..5f381b7972bf 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
2.53.0

