Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AC037F8D9
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777407; cv=none; b=KHVutS3G4rC+lWIrt1Kqhvj/LfatRDErhdfFUpi+KWMgZMtt68b7i3Ov3jR9FI7PDDHq2ea7QvYwKIotgbueVPMyr40kKDBHs8OZh82VWiwVlf5O5iI+TM6Sh8bFmZQfPrMMoL3pzo5PumuyhEx5WYq/C007nyR5HzRoiZI3+nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777407; c=relaxed/simple;
	bh=BtYUDPRydbD7qJguB7Cv1gqWmul/7Eiqmo1Zcx4dX7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyJlNJ+R8Praq2EkSuNhkrr67e74OsVp/jYndQXUfQfQ8HhFlcoHbfGMxLfskoOzFaUSziGwJDEe1HFWB7wft05BwazuJIaJxJjSLG98FZMfRPVwPt9Bvng23DOQA1eXp9qti/R2fi4cEJliYmBkqOVhvxISU1lDL2pnxMjuQtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkG9Arx0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkG9Arx0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc305914so1917652f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777403; x=1770382203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=XkG9Arx0cOWZxmOIf4lu9ZzZheknIFKt9mYPdqKTA01u3SZ8bajAcqZuVnAL1HStlb
         KGucb9XG5PZ6cym4mk3lN0VOYKDHEYElDNii9Tzc7cLeUTgHHuuhSyRc1KedD2ihUZE+
         Qh4TyKfn6bifHdbkx63Rp+au/HbrJn6EUZ4ANCTTggR8CDaLojwbNf+9gbtM/UXozARf
         nsG1p10P0HHx9hs6uMuFCxj7S9GDs5Q+wfxfn1QKV5DRTYA4gXlJUN6Hd5hsBrZY4AdR
         AaKXl52r2Uo30nvlUnqmnc/F5H4oa14u+mI++tpuZRAQwqzCpFOhU9STqnn/bHixfMlk
         GkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777403; x=1770382203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
        b=QfR1eCOJ2Ar0+Kg656U2nV+Y5etbf7I7XWgTzh06v54KuPUaYvVax/HnxcnJu4hj5+
         xdaMQuECj2+pMnmoDe/ux6HwRF87kaVq+5V+BN6Mi71QzL9ap+Y32UOLDXLzd0WHCFnN
         MDojJLdI81IW2EhOoza7y4Z2ooGyM/Tj/0HMHwkG/ACHBbhesNYg0yPprBVLHlgotRQc
         pmGO5tKsas58WD7uOa3JoBK/S4rhHEHt9CE1N7bidm6GXoHzxi70nhqq5mwIGj94Nms/
         g4E0CRLeRg6EZVynk8gD8VM4ryl515F/C9X5uVjtrK1sehd1xHsNrZVpEvvCO8IyLXCp
         xoig==
X-Forwarded-Encrypted: i=1; AJvYcCX+2KwPrxpjCAvNmfLN+XRjoYGYQFijC/uSFXU7pc3ZWkGE0oG+s0Pr9kzY8jOTBLEaica7ln8D2Df2/Hoo@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx1VBfbblYm5xT/SeGlheq8iXnV3PxWlU+4dyyolYaK71Ysndc
	KIJtcHP/1O0+Of1xXhPGQxbCzAlc9GDXqEERZMrpxyKdZuhsbLExXgGD
X-Gm-Gg: AZuq6aK47WTf0ZujCAx3mL3sRGLNVTUKoBXlPY6+LeSFgkEhO/8fU4qIvFanSP2ZqlI
	Y4lRMjJXiSWpGUlpnzPv8+/mtoaU9t8X5Gwy40nyKlXm4ykSd5hUA3ioC5IlNwXPKRK96F4EOJo
	4dIyvy3443RNFrZeDcFiYtOcnwYxVW49acmVTsF8PUmTaBzWYgVWEOKrfLf2UfJpgvw9jxqHYTr
	rSFwdoDwDJnCSCxIeTC3xQIoGk4Zy5RwQwKyncrXcXblWXhcUNXXCW+X0aeN4uu+tgDG3seL0iE
	LtTEaNChj3QwgT8hcTh7ClpvN3jpNCMyc4Ma8yP67Fp+on+q1N6XEk1kni/He1xu4ZOeSrkJ1Gd
	/xJUp1LqsReMIJhqI2cXYJz9iFt250VyKuWJLzZqqkZkZmvUJsUPqyLTd2KNGl/BvHOpcbvPqeq
	D4
X-Received: by 2002:a05:6000:4381:b0:435:9f41:d60 with SMTP id ffacd0b85a97d-435f3ab2020mr4343007f8f.35.1769777403327;
        Fri, 30 Jan 2026 04:50:03 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 08/15] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Fri, 30 Jan 2026 14:49:25 +0200
Message-ID: <20260130124932.351328-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index aa9ff7fec4f9..b2e706fa727b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.51.0

