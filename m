Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980E922FE0F
	for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745746291; cv=none; b=IC9zH0ILfG28D3tR8/7KhoRiyJfuzoIzaFgDvceEA68yzOyUO36fZx/qIeRw6Pd0dJbGEpUS6OJIwQ+exjC5JLcLYEbxhXW129fJ9snUihhRF8BO5uIWIsFNvjaDQZxIJ5rvXlAQFhJlBZWUoW9SO2E3vRXDrxUm1eCBWeXPWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745746291; c=relaxed/simple;
	bh=5N+hSozI+ZeQMfPomkR+Uu0oNbUf8g7rTlgBZ0iuMWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u8vh/q/1PVqAAweFfGZGHzclSCwdaLCuDDCBaF8S9D87P64azXL3Tvtq8mgBF5cj7PzA9SdE6MylfKIgMHz5bXcx5eSKYJPGL3Ui6QHjEJCLCbC6ImVysE0s7oM25oUwCbMUBtVHooXmtQHtvjW0D5s1HhZzcZPrEyu/T+Nzb6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyFLaP/G; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyFLaP/G"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2410924f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745746287; x=1746351087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGSXLlYfTCNyEK1sS+8taaZTIKIMp6RlBt29lDZeXCg=;
        b=CyFLaP/GAOByBp4tjG1afDDGynkI5E9+7RypY2TeFaEtgYakQ2zTmpeEiikt+0OhER
         RKZpfL/b7id4QZ9KckTuNZ1MAzbAWoqByYWtrnalOw2dGsJCrKHxd5NT6YvlZ0ZfQhfm
         FQ6dsqL7trZMUozwossHMFwcavmk1C2DeVEV7tWWWWROwb4nTc8BcKldAycqoP1Yn7eJ
         Mafi2l0QE/GdXp4e+rVJq5uYsaQb54y5/IbaNmUaKM++W9s1NhZdL4J5VmAGnvVcfkIk
         lNoYTryVEyET4EXqne5abPHX1GUPE85nO29lJDbTodB0eUPmqn4TFzoSEPU7P1iRxcYt
         MtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745746287; x=1746351087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGSXLlYfTCNyEK1sS+8taaZTIKIMp6RlBt29lDZeXCg=;
        b=ZT7YtH2aPWyUGFBmWL7UDPOkjPMX5KvxClGrfYenTKh487bofMz4XJpkNA+ml/qGbd
         s7oeXfKOK6sJY/Y2R9YXqOcawu4P6ejZJV1PxhaE5RaHW0pR03EipWWldvhjSfd/S22H
         ZuGU0DxIO+WqRhT1J4ZjPzrA5D1kZ7e1G5bgmxrA9XuQdZJHFWI2M5Wyk0JcnKmdlcpn
         /qpqlWrs3u5Nu7d/Zkg32PADyJnhbUzzE1kkxqzIp21QLYM0ic+PBJjd+Lp5Iswp0K0k
         4CrinSQ/BIBU3aEnZSdRPlGXw+Yw3Vypq5OdzuN8i2aVQXIyBZ4j0b2u1WAKGQ37AQg8
         Ex3g==
X-Forwarded-Encrypted: i=1; AJvYcCVAB1ckYfSdA7/mFdUlj3liucFzr09JzJGE7bMKz5YLarF/O7eKWCpHtGHyMOIZ8pWqIgVnFDl076gsjcW7@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf6avaajmGU2Q+73hmA51AXeJFBjApW2cY9h4jJsu1JqbCfRKU
	ndlR9Iv6KOPueqtqeY0RJ+WJKiEPaLIEuHvaz0RgQM8egf9BhTiu
X-Gm-Gg: ASbGnctnqP4ypHS1LisbuFyLamuu5htwmTSdWbVY2Ag5+Da51giEJBf+J/pUCbHZtUh
	IUBNqAAQbF2aJB2oWudLnHsdo821f+kakWWiQ1bXEvyFFLCkHSICJQ46xij11LlWYcT/2uQhF1U
	rsRyPpM+gwqx5zCr5DRaZqjVdd0CLok03jS2bvZd+Tj22ZyM0HZM3l0f60dtHfotxSv/srS/jNT
	cxkFraagfa3hpuowiZswdaeHcVY6ZF7w1ZHKLaj/KgofgPrue5DqTFkVy7LBZhQ72rRcTPbpX1A
	5Z+1+mSF4MrQOBZ/XdlYwHJiFqOBPY8GfwvXDpS+ZcWyiEDBq3ivemUdPg3nujkBF1mIEH8MqUL
	v
X-Google-Smtp-Source: AGHT+IF1iPGBEhuUkDfpQzYO1sUsCZHS8vfSUjGFEM6LDflYs37IgTMzv6Af/wCGkwLP4sT/88uACA==
X-Received: by 2002:a05:6000:2210:b0:3a0:824f:b552 with SMTP id ffacd0b85a97d-3a0824fb5c9mr832776f8f.10.1745746286740;
        Sun, 27 Apr 2025 02:31:26 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c6a0sm7856212f8f.86.2025.04.27.02.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:31:26 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Avoid unused variable warnings
Date: Sun, 27 Apr 2025 11:31:23 +0200
Message-ID: <20250427093123.18565-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses warnings produced by make W=1 with the configuration
parameter CONFIG_GPIB_PCMCIA=y

cb7210/cb7210.c:1251:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
cb7210/cb7210.c:1250:31: warning: variable 'handle' set but not used [-Wunused-but-set-variable]

Remove the declarations and assignments of the unused variables.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index c686896bb088..298ed306189d 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1247,13 +1247,8 @@ static int cb_gpib_config_iteration(struct pcmcia_device *link, void *priv_data)
 
 static int cb_gpib_config(struct pcmcia_device  *link)
 {
-	struct pcmcia_device *handle;
-	struct local_info *dev;
 	int retval;
 
-	handle = link;
-	dev = link->priv;
-
 	retval = pcmcia_loop_config(link, &cb_gpib_config_iteration, NULL);
 	if (retval) {
 		dev_warn(&link->dev, "no configuration found\n");
-- 
2.49.0

