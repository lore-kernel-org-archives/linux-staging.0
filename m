Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F243B27E2
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568136; cv=none; b=DT+YuCU8RszVuaN895haVNDraLzk6BC8FXPk5uKPT3CZn4yqt3d9o4C7yAxhWLEbe6kyODtpCClZvLKFz4fAs1JKcVXWZK9g6fNhN5/y2KEw/GlC1dUTOYWWbfImZY2kb0KJ2LEDStHGrRjmklksE9dHtsCYTNhxjOG0Lr8HW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568136; c=relaxed/simple;
	bh=yJUCgUb4KFcxXLpPv/Qf1WbDX5e+fr80HZIWVnsFP3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdHco0u1ZfuN/gWc9v9u+6rF0aRqsQ9eMqxmU0mZ9cfaJ3r9h+AuPyFSfuhYD8OndXWK9SP0775qvamCqQQSr8BXtWw2B+Q6H2+V++7KL92UxDvXXLxuwxOmrejSYn41r/XvM9WHzvJV1fhneVyQsuJyd9LlSC8ltOG+8DggwO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxmVr8un; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxmVr8un"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0148201fbso1159350e87.3
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 13:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568129; x=1787172929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjB2fBDmkMwtaR91YZkC47S7tI/AMH5A7bYroiu6yaY=;
        b=dxmVr8unxShmmME97409iLI9ChjJzKqFoLLRG7FSfLXft0FBGxJ4Ej9a6oJulC67NK
         yAaRqyy0ivqKUh3vAKqXKOA1cTGo1baHvBBeyT1SLPIBwlaG9g1xs+RGcAUM6w5CEatv
         3sWUKtg1LOPc401jL3KGxgqb4OQwKFfkb9X9mTqCOqW4l6VZp1oEzjAbO6s/mT+lnCSq
         uiqwZu9hHKwDC1XkJ3C1ZqL2Olg4uj5NJlS/EuyVqSXFOwyVkwaNG3iNZxFFWLyx+GMY
         X9Ll2Rmk7AyySBbmrBDP1M7ymGiOBiSqy4EKuwFDnwxIL7r9GjVrHTBJsWfg7ZsNPfCM
         e3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568129; x=1787172929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjB2fBDmkMwtaR91YZkC47S7tI/AMH5A7bYroiu6yaY=;
        b=TxjtBXAuyS1xDU6xeXGGELXseQPEDGZhSrO5soRaTmDYQisovAVy6JVTV7lFR+iRYg
         rg5VcGbsIvNFalGCZeC2ZBcEiVnCAc7gjQ50soF8FIAeKFWI3W7ORRN4utNd/SNVFSCY
         00cYU8OcFdDrt07csuxrXj+IA+PzPGKl1UgyPy0Wo4KbT8e3ix0ILnRPFUIQw/S3PWmL
         QPEojaxYI61SmrnEcqHUrUldXMDtCrVpEIsgov4ftHYCJ0YOPUq8j73J5uA71KVs9LXY
         Cw5Z8jB3x6tNy0r2JNMGqomGbNDEXuHx8GMTzN2Jkgb/lGc+VGI2r82Dn/PxFleMYRY/
         BLPA==
X-Forwarded-Encrypted: i=1; AHgh+RrGsDmA4s/o5Hidw8I60KGP3SEgCjglMyo0Fdslt0Fn466HEMAFRAVcYzUss2I9jR/V1jJoCrt4M7tKRHUY@lists.linux.dev
X-Gm-Message-State: AOJu0YxCD+HYCjvQsceO4ejbJn9I6fMN3EZAhBgy0qQVVGYy/jvJJRSK
	tmv256iBpJiLbvySOMzrC7NkCKjzRpmZUG4BVLu1hc8rQ7GjyyJBEeOqNnVLXQ==
X-Gm-Gg: AR+sD12CxAtwJvddxJ8q2vnFYqF+bMf4VfIIrtWf7+/rOBkaZSIcqTgMFXx3fhJtUUn
	h7s8Ox9bnVIfH7zgZz4iaHEU0XNf6x6uaW/isX5nHoMOOMaba1/JgvCQBkicB2zUpxumY1WudcD
	/i9wKmiEhrLs5PEL0FkI1AXRKVQ3+Jx/JWzu7exoahO431AtRrDanU+D3Sw66fsn/kNDQmZReax
	hNtsrOvY3qXS9AnEcNPX1Xa95BAkIxEArp9INIeGklP6VmFICiXU5pEnGdk0XjhxFfYJacVbLCT
	yVUCzX4masyI8z4yR2RndyZFMz7FfZQYGFcIhEodEdy4uwSPPChvAN8Qs48FShAQft6ZfDN5iV2
	zLTShWDWsdGocDhtePMMhyPrpRPvMbybHGvKV5IfPV53RSFc9OWE2bAoDTIyC1qUSvn2ubPn1mH
	5fs+CvhKZ1rlzN4QMsmGjas4YavyYo+l1RB93Nl9AdGNh3WBVEVm2jCHxlWKc=
X-Received: by 2002:a05:6512:33d0:b0:5b0:137f:9476 with SMTP id 2adb3069b0e04-5b453f464b2mr52173e87.16.1786568128897;
        Wed, 12 Aug 2026 13:55:28 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:28 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v3 4/5] staging: media: atomisp: inline the var_equal_return*() macros
Date: Wed, 12 Aug 2026 23:51:37 +0300
Message-ID: <20260812205429.39181-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812205429.39181-1-nikolayof23@gmail.com>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These macros check the passed variables for equality, hiding the 'if'
and 'return' statements; replace them with a standard conditional to
simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../media/atomisp/include/hmm/hmm_common.h    | 20 -------------------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  6 ++++--
 2 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
index c406fe8b1345..029620347302 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
@@ -12,25 +12,5 @@
 
 #define	HMM_BO_NAME	"HMM"
 
-/*
- * some common use micros
- */
-#define	var_equal_return(var1, var2, exp, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return exp;\
-		} \
-	} while (0)
-
-#define	var_equal_return_void(var1, var2, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return;\
-		} \
-	} while (0)
 
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index dbda4394a239..89e56ce07444 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -396,8 +396,10 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 	}
 
 	root = &bdev->free_rbtree;
-	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
-			 "hmm_bo_device not inited yet.\n");
+	if (!hmm_bo_device_inited(bdev)) {
+		dev_err(atomisp_dev, "hmm_bo_device not inited yet.\n");
+		return NULL;
+	}
 
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
-- 
2.55.0

