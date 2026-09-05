Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FB53F5BD7
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616907; cv=none; b=HT+txHF039YDZgPmS+O9bHssPi8pnfLBB0imTZFcvwV8cdW3I9cnvoigEnGOvANp25mHpmu3kbDztT4yWODzHag5UZP4jsCMUWwhRztyqwGtZ9gQZEVnrzmfhGqO4PIe/tGD9/O4L5WFwPCOgguA45kL88+0pw8dSSqDlbjWe+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616907; c=relaxed/simple;
	bh=EizzPFcHBTIh2Y7GKphJQqpoh7RMlGuXmOyHqJPayZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+MxTV5FKOfR/HnwgiErFfUEDHbcm0eJ8Tcsz/bC6hlBa7gwHPkhGoRWu0fXv3a4nx+TH4aRa8fhSorSsu4SQa0qshgcC+YRqnssLt1RFCJU/wMQIins//DzCXSMj1wcHgSDBuV0inUL4ent3yYfWF9Y3Cw/kUpSEX3zpAhw3pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFqYBNuq; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFqYBNuq"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-777c2d69446so1503104137.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616889; x=1789221689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=XFqYBNuqZPoQag5jI1EEBEe+r/92S0UmIpN8Ru4J4TIVQLONUlBoVi/H/w+bh7ir5d
         eEyBoQO/HPNKv7TMkqJLCKZF0r5XT3yHdY5zx6Hqc1j8D2Pl1uOXel4ruMB4PFY2dCbb
         CDwuzVr6E8zc+E5jIpEz+Qybbv4WYblx59DD8oZqf5d05auQ6KOkmD5JOyVFP31W+N0r
         nwePDFRteUYc8BfB1i6K8PxWDo9PSkITkBXOtlfnogdtMkphpOpMzYekCtBG0M0onwYv
         11O2YzyiQuqaKnGyDhKiO0FX2XUqsX1os7vT/yRjI7VfccuKXZq/+bRGODyM3Kt6twhF
         viJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616889; x=1789221689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=F0i8RVXERebBP7DF7OnijLKcoSa4M5UXyzqswUkGMozTrF0qsMsxx0EcfkIF67iIfh
         6mSSZ7cx+B5kwoi8TYF6XBkaHsWKbToE0FXW0m5Xq3Ay7eXn41dqlj6ZcIwj5UR5QvOl
         Tvi0d76jakKFQiAsrTgUQbJiRIlutGB9t2dGiFS1sPXGNCfrFCPhYpS9+rCTjpZHycca
         P95hxk84xxZQtZvOKV848DJXkeXwtejP6et6CgIdJv8otS+b3uxYrhQBLx0kCJq9H56E
         fcdJbpCam7xdZg/WY/5u5NTeW7rbmy7zSDgv1eaz4czJ4inVvTFOnetjDjwb4v7YRMNE
         xdbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJngLbmkv8Y7rjRhxury4dn6LXUnwAaK27M0dY6a8U5Qf0dt/08SNxVJ+yTQqWLfOELaCyty29P8E5bWn0@lists.linux.dev
X-Gm-Message-State: AFuF++kYHxv5dP08gUPx0mir/LlIqmToBDRPCy+A05RA2eiFwM6d3NqH
	SEIsmkzqp7xePeHm2AnD6AfygyezfuyQ1I65CY0AIJ/YXBYHuyubJWjU
X-Gm-Gg: AYBFou2qFkfR8Y57E1qNP3YunACd9inqE3uThxOU93Wjdk0plmObpLhlmUx7lHi37jp
	Viidb2ThAT5XNSJSPi0260GRnIlgMvO14/BGUSfMQ/THzsyEqJ8lIUQlfGdSz6WRzL6W7MPGOew
	vrYkZii0RXdRDnUwMiqN6pPqNKcrzQmYRQL+voBhOmevy41cSKXmaX1DNpl+RMXMV/cZ5B8y1Nm
	KGl2PKfjDw8ncBmntOzYcqG6MMB6ygKh8l/MXsejBmwsz5iFDWrnXot32vJADWTjfQFRS4yZi2V
	+wemZylwVYhy+v7nUQ+KgLwy2hlUCt0Lxe1yWzOf7WjS0TYlox0ceakygwTCDsFImHkzq2a68WS
	M/A2ImLRzNc0QOreryymtEuAInMPKgmrRP2/mbagQqRojb9fvOas+Mxmok2j+bDx/O+7kD30j5D
	hpuWrOUSEbYIAZgzienVAMmhhMYXP8pP+LqVr5HXRVak1ubTjudTPLgoe0tc8Dqht2wYsS6/waL
	XyE2/ZfO9iXpnxRoqvbhaOULdxe7HO9
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id ada2fe7eead31-78a4a90fdd3mr5362480137.2.1788616888537;
        Sat, 05 Sep 2026 07:01:28 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:26 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 11:01:12 -0300
Message-ID: <20260905140113.21638-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905140113.21638-1-breno3011alves@gmail.com>
References: <20260905140113.21638-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..3a0db1be6 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316) += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

