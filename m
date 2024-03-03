Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4608DD26B
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709472754; cv=none; b=PaYJEKdRbPaioT+dmXESAl8gGUfN+RP+LDGtQsO9BBOq771Th1jKbwrTZWllKamHbERr4gbQgyVcZOYxGkcHh/u42ocDMGBuXjm8Twbpl0b51oXMoYpwEei4yjKEeiTb421nIeWJgEfwAdEF8QEB/hDBf/SuM4BrkT0NXmNEhV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709472754; c=relaxed/simple;
	bh=3xboL4uDKO9puxjaC/KLuajulbpu8+6bh9CscgkXE6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JcPjBvK+o8lDSiOt3e+vFIOz+WcPZhphAs+xQ3GYCq75a8DF0K4dV7RjjT4vr9xYTgsLRLPgEsMwN62OwRAp8BEt82ovd8vSMA06N7z5oc3dX905kbrPXNT/QbcrgZ2LuLQryMEMtNxR6ZhkNtDAY9f7LDXyo8ceYx8NdwKY8qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbA0SMne; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbA0SMne"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d95d67ff45so27659325ad.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709472752; x=1710077552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwlx5IgoHl5RII/i/nv9JimUnsVXypM6jybnxn6UlcA=;
        b=kbA0SMnepABytGjHabREBoPlBmsA4Nj297/DSJ5biMZtOSwHUD8AwfvDVpTGGwmyFI
         /rpM520van4sjuxfMldGRtnlBrN6af/rrYZA0f0gw5/3Nsm135Rx/vmSQu1E0dS5HFko
         zsRJodKG/zl5LsqniFd1gUYFNVuTpIQ5smyWD1VNO1IihLI1rkioCUV+4D26IPVZEBqL
         y7ljwQM2UHKahm7s2XfnXc0QX/0l7cybY4HhLjybeJRXAsPwjjLuK8MliJ8+ea/sXLxF
         NYyt/q/kQCvmuO8fRy1c8lN083ZA5/qwtWhrqBDlTEuUkPJGMdRyYhguq3GqK7zOJuvz
         3RqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709472752; x=1710077552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwlx5IgoHl5RII/i/nv9JimUnsVXypM6jybnxn6UlcA=;
        b=wIbHpqBhaokRWizaGkRqUkrH3iDbyfAwFX+jfvyM4XJ3TLS2CjgK5zFFYNuta1S7nv
         qDD9RmnL3EIrwHeezJjcUE6ZQ1GMbKg68WbahUKOYz2XEINz1qrJoZs8/o/BCQzKSiwZ
         iL61SJOVB+ZG6nx7rd+FTdUJ1FOUTO7PZpZ48iQEHpG85/x32oIZz4xhP5YYhXhTiQGK
         WJX2Tszb3aFayjiSj2kQUOR51JzvtNZ9aPPhop6DpwhazTfFu5rZPvNfG1CmQFIbv3/w
         3Ifvutqf7lBeD65tYsuTXT2FkjCevbAFvgjnCANmmZfibxpilQjJ+YI0IDLUhcIO0aUa
         fa6A==
X-Forwarded-Encrypted: i=1; AJvYcCVIh+7VIid2Ok4cdAp8p/X6AFXfsgPOZJqfOjKC45pVGxluE+XuQlnyzRiEzREfP8J7mdLFgkB1tkjeji0vTvLsQkNHXFgbjPC/+wMWAg==
X-Gm-Message-State: AOJu0YyPwLmolXN6O3BXyCpSWHzW7HLNQW8AoJUBqhu5+x3WPUp4fUcT
	Nay+TXy9E2FcburbSCSWWw+ms56zQsKzNICzkwl0QpUUvrdKSlch29BmndMD
X-Google-Smtp-Source: AGHT+IHySZPGneCeilbyiEHd2PBEFR0SDxJNhhWhViVxgeze4L1iRiaZQ0PmXq9Zn3zXXB12k080lQ==
X-Received: by 2002:a17:903:2408:b0:1d8:e4b8:95e5 with SMTP id e8-20020a170903240800b001d8e4b895e5mr6717407plo.32.1709472752496;
        Sun, 03 Mar 2024 05:32:32 -0800 (PST)
Received: from kernel.. ([2402:e280:214c:86:98b4:6d91:d5f4:8f27])
        by smtp.gmail.com with ESMTPSA id u9-20020a170902e80900b001d9a42f6183sm6634803plg.45.2024.03.03.05.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 05:32:32 -0800 (PST)
From: R SUNDAR <prosunofficial@gmail.com>
To: bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	R SUNDAR <prosunofficial@gmail.com>
Subject: [PATCH] Removed reserved1/2 fields to prevent kernel-doc warnings
Date: Sun,  3 Mar 2024 19:02:23 +0530
Message-Id: <20240303133223.5506-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/staging/media/ipu3/include/uapi/intel-ipu3.h:2522: warning: Excess struct member 'reserved1' description in 'ipu3_uapi_acc_param'
./drivers/staging/media/ipu3/include/uapi/intel-ipu3.h:2522: warning: Excess struct member 'reserved2' description in 'ipu3_uapi_acc_param'

Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index caa358e0bae4..926fcf84e33c 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -2485,11 +2485,9 @@ struct ipu3_uapi_anr_config {
  *		&ipu3_uapi_yuvp1_y_ee_nr_config
  * @yds:	y down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @chnr:	chroma noise reduction config. See &ipu3_uapi_yuvp1_chnr_config
- * @reserved1: reserved
  * @yds2:	y channel down scaler config. See &ipu3_uapi_yuvp1_yds_config
  * @tcc:	total color correction config as defined in struct
  *		&ipu3_uapi_yuvp2_tcc_static_config
- * @reserved2: reserved
  * @anr:	advanced noise reduction config.See &ipu3_uapi_anr_config
  * @awb_fr:	AWB filter response config. See ipu3_uapi_awb_fr_config
  * @ae:	auto exposure config  As specified by &ipu3_uapi_ae_config
-- 
2.34.1

