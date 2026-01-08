Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263C35C19A
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885183; cv=none; b=PvlxDwQZbc2xC33j+jKnPU3Z5WCok+kbudpAbMMy+Qwh6bjplPfHgn8yB2rQEzz1gTmOGHPiO61wScspcFMo0ZliI07AGP2nNN8Pc+UqTHHK4jIwk/UTQqkg4TO3K0bZZWMVVSvbyEoVTtbTKMGvNQupdUTjduh4EZ0YNfbgjJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885183; c=relaxed/simple;
	bh=96AtlZIH6oDSHa2on2bdBp8Q/kVE+BJcSB3ZEfpRh0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NV/4U7IuvZQxH3Jllh/0bZGPVsAs/CP4xRv5Av4NQivVTqxjTH4gtaEvA1OGZMfFGz2e48Z41HFG4hKM28Jfo5GD6o9j+/R9Y+ydfERc4kToKwYxp2F2w/+6lp8yltegK6XrPlUEFpCFe2234XY1kI+oqVev1JKGwNBJj9i++LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xkm625d4; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xkm625d4"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so2126429a12.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767885181; x=1768489981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9frDM5lhsIsOta1J2dC3heJ0BptFvIr5tuBxk7iS/w=;
        b=Xkm625d4k/jrvYgtvZCR/kzInt7BDW7yXkXGCEBFw4jRasRLwl2lHdCgBpc5vG4SH1
         yc/aAJlVZkxNgMUga+8ruky620vM6RmKjVhfRMyUS1MzSReWNrzsnd38rKWrpk2TqsWi
         Joy2eDU12bkohrHNurzqbM2G/Es/WuaIa+sCyzE4G0W6fp+2qpcABIWFWkpceap7cv1x
         MJJEBLXwzNwCbV2xtAQF2uq/fsgcPn2EFcwfM+nurzL1oEAfkAMicc5sx9ZNOhb3QZ6H
         JCj8tShHrlKGjlf8nCc0GIOyg4TMJSzMMavCYj1ioRgPSl043XCyZRJGEpy6WHFfzPi+
         PKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885181; x=1768489981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9frDM5lhsIsOta1J2dC3heJ0BptFvIr5tuBxk7iS/w=;
        b=YFFqSiP0U/nHF3CXX/CTXU8zbjNdBwznLHR8BZgHUQFWthIU6i4GvTq695R1L856bI
         IlYE7i8EePpRTAvDuoW/JnL6Bxp6uvMNDhGibXZ5BwGOsbFr3p/vb7n6dc+lwzezIbIU
         RANuU9+pQlgurpDtEHK5rbgrv55EiiPhGLgAt7ifb2Rn8Q8+QiJu5Kx/+ay52SODhaG5
         py0sVT/GmARAClJHi9SOa/fjyK45X0tne7avhEzvA3IFQ3oZFjPLnZ2g4iM+xq5FYK0i
         YI1D0+i7QnWVgIF5YaOcZwS8OvcC+vaMX0nRR7qB/D1myQwjYg21P0yXx5+Jzo0nQWKq
         9gpA==
X-Forwarded-Encrypted: i=1; AJvYcCXIhIBZvyb3d1G03egxelSoZA/vBxyt4at27pF5oy+/6DXWP5wsvSr0N34jCnZgyjqW6wMXSclskA9nnxnH@lists.linux.dev
X-Gm-Message-State: AOJu0YxMKoufnu+Oi3NvWXYq5czJ2ojGrRgFNGud13s3EgibIeTdAR3V
	pC4IioZfUEc9lv/rarPX006cEhmrGUeiEd112gYA3a73IcGBEWy2uvaS
X-Gm-Gg: AY/fxX5DVTHyBnwD8BMVRoiQBmR7NdgEqOUrKkWF8Q1VMtemKP4pWT+Zmssi0p/zPKu
	FD7kVP/ldEKQE93zcy1YcL490Cy/yqMcqiLApEIiYLuGnSeg70U4lFQuEKs0wB+2Vk42DyONefN
	J/hrsygMlZh7CK/eeoHM78imeLBecJa69o69AWyGDj7MQB5NZaCmqQKUeTgr8NfSn9fp1HpwE/8
	3EF8qjTcOsymd5whRn5KIK9WOhu3hV0/pWkrCbycBIWxPlyjEmYd+upXYRck+AvHhRWB1yWCSUp
	PrEdsPhn4rI5twvy9AIL0phH15Tn4hfF7J/P5hpXUzF5TTgMYs2OEa9Z2ykbwuSAdvUqL6qXdtR
	zOVl80L5llGPMX4Qxa3lVIMrQj4X4x9xg+MsMM/AkINJYZ7SySj0oUe8usc/heCXhVZzHbXC/8w
	Dk3L0UMxOLpo3yW1nYCpzOpikYHQ6LFAiGFKAZ16zyj3poEg1im6kNjUHKl7I=
X-Google-Smtp-Source: AGHT+IEzA/mL+RgRg1Lb+6pXizfwPfga2Mz5SLJjfBB2pKPQSloH1grWX2Sz4faegTP/rpZLUzZR7g==
X-Received: by 2002:a05:6a20:3ca7:b0:364:1425:8099 with SMTP id adf61e73a8af0-3898f905cccmr6190413637.24.1767885181241;
        Thu, 08 Jan 2026 07:13:01 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28f6cdsm8188087a12.6.2026.01.08.07.12.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 07:13:00 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaitanya Mishra <chaitanyamishra.ai@gmail.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v4] staging: greybus: lights: avoid NULL deref
Date: Thu,  8 Jan 2026 20:42:54 +0530
Message-ID: <20260108151254.81553-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_lights_light_config() stores channel_count before allocating the
channels array. If kcalloc() fails, gb_lights_release() iterates the
non-zero count and dereferences light->channels, which is NULL.

Allocate channels first and only then publish channels_count so the
cleanup path can't walk a NULL pointer.

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Link: https://lore.kernel.org/all/20260108103700.15384-1-chaitanyamishra.ai@gmail.com/
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
---
Changes in v4:
- Add Link to v1 and carry Reviewed-by.
- Tested: make defconfig, make modules_prepare, make M=drivers/staging/greybus/ modules (AWS EC2 eu-central-2, Amazon Linux 2023 x86_64).

Changes in v3:
- Add version changelog below the --- line (no code changes).

 drivers/staging/greybus/light.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..38c233a706c4 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1008,14 +1008,18 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
 	if (!strlen(conf.name))
 		return -EINVAL;
 
-	light->channels_count = conf.channel_count;
 	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
 	if (!light->name)
 		return -ENOMEM;
-	light->channels = kcalloc(light->channels_count,
+	light->channels = kcalloc(conf.channel_count,
 				  sizeof(struct gb_channel), GFP_KERNEL);
 	if (!light->channels)
 		return -ENOMEM;
+	/*
+	 * Publish channels_count only after channels allocation so cleanup
+	 * doesn't walk a NULL channels pointer on allocation failure.
+	 */
+	light->channels_count = conf.channel_count;
 
 	/* First we collect all the configurations for all channels */
 	for (i = 0; i < light->channels_count; i++) {
-- 
2.50.1 (Apple Git-155)

