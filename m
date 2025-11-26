Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F9CCA4E
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194959; cv=none; b=lU9bq5YI0qe9VzFGOqqtthLs0Unse8BCUD4XQ0B+b9uwZwcVKHOk2PQ4joSaO2xBizJ8T/yVFXoIAjJGriYrbV93CXmpXmSh3/dCSQoGwsiSRgYf+gZM8mRYnRfUlUTOm3ji71ygkOl3Fn0a3PA7rerr4e9EEd6tfZwoYQheY8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194959; c=relaxed/simple;
	bh=fFJ4O8O+iumC0sGJhycYMA5SybmSXTx9sGfajEwyps4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BRO12W9MdcIAle8rwfTx1xDQmt3WuuguWoS1a+O7AWJDFt92HsBtLUhuY/UH3TIle0th7X0tKXesBXBdYXDLZFZhgKuPlMlOnaACQahwduQB0HIHOH98Hkb7MpBGnDT8xwJ+agJUDstwbUxR9SkzcvXmcV+U1GX2FAWvjqmn5Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYM0qePH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYM0qePH"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3437af8444cso216974a91.2
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 14:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764194958; x=1764799758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgycfg1lCnydPSo8irrQPUUm5jQlUHWZIzj/hIxjmeg=;
        b=OYM0qePHL2k36ARLNgod2y7qMqbNe+GZdAcUWQ/972zOnxGK/4ZyfeHEJTfkYYkjKO
         zLNUnS85ZJhRcRUzYpFbiJ55BO3Ohlx5tH+8uFWkz4OflWeDCe61lCvVr8965tbT1mYb
         WC/j8BxcIX57khGYznjYNGwG+3XTr0Mc/T72spPzjaOblxZ5+g1VvdZ97KfzMXyR9GLA
         3dMWWNKM4eOUbZK6xDZJpLG5Pj4cARyu2JDH9tCLlRGyDPv80ArBf4HuEO8bZlwK2nXg
         5xhZ7LNLk/oqRGX+tFQhHVEnhq53gdO/XN5Od/OxwkaEtjToRIGmij1EmUgMgF80RUic
         oO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194958; x=1764799758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pgycfg1lCnydPSo8irrQPUUm5jQlUHWZIzj/hIxjmeg=;
        b=Q4zQ4HGUTt91B7/mzxAVcX4gqvvbbujTQ4/21qfsd80UTdQQI/NYZLzGAreKbzEMRr
         FoAojnzMFXF1CxzZ3jSN0wqv7EgdtkKsgrEiiGFN0rpcXbOazsURyeCoN4FLvlYRQYBV
         SNC/8iPU5S0F7yhEUSQQLn+7bJgnyawsY/5LnoW/S2iqHwo8TMr/oLZ6XJwHbXcM3Jtm
         nfoP+LwN3xA2HbsikF4ARPNGxZkSfybPjaOeYtybknUw8ekws2/Mh/dEudgtdHbEIZjF
         UmzAL42sevNsG0gL2So2b8gCF3D5PYjERZzR4Ei1EAeNv5e/p9if0/xDMwZE7KY+uluz
         zMfg==
X-Gm-Message-State: AOJu0YyV/kpHGcgG/rlyxayaYIHr9SkxfcGLDOj+2HvSU+i2zlD+iRx2
	Zmx+G+1LR+rH8xUfKSl5USJRlrqDc7z6+NXANITZIXlZjhZ7PNyISMeo
X-Gm-Gg: ASbGncvX0nRwUsA5X/SeFJAxJWTLF7xzvMnQgklDPBywBMn6Wr+3/F9h3I3kpSo63NC
	57D8o90aZ5E2gC8R2/3wYAngajiXfamKeBUwh5YKxMyCvEUV8zq4Vw0UYbrX/+fUXst3ogw7Nek
	anJvdI9FHPqxg8UveTp1mnvFM0X7cewLEpVToJ0+RLLp7R0anvE3CqbfTkDSFaQdTzvr4G4FoJI
	FR8DtKndqJ1ildHDC22Hwtt8t2FnSkwYnP6kLeRH4D5uutt1HjcY3AcIHJJg4oeC9UsxcrzTJ2T
	ioDiW73sA5TKRSuhjr/y2R6c5drEbALG9eNR2gSqqwfS589nIjFy9f9NYN/oymil5QO6CQFkrhM
	BTUhQtfLpb+HXGlcBGEAWDmBj2NZnkwMLmRazn8sWg7+uIjBgr+lOqQO+kub1SbUHZpfEbuXJOt
	CkBcQ5K6jj1C3LAZDDs1HLjgYf7NuJlb1RuRp3bmmv0g0EIhHghF1Ot4SbNDBu19r8SPldEXyNd
	F4LLCS/dJEBZHSYrQMpIfqDoU5wZ9Dp0Coy1gn+2XPc6Sxkp2f0TRa5CwMo8sQy5cZdaKDkf2D2
	ay30o3gzV27JD+S3R2qH1y3TA8NHNezrww==
X-Google-Smtp-Source: AGHT+IFtiRLP0ykw3vTEjN2HS8jH7oS9eKLxTNJM8TEYHICm80ZVMAQHCwxZRDjeWAHj+umd/hLZQg==
X-Received: by 2002:a17:90a:d606:b0:343:b610:901c with SMTP id 98e67ed59e1d1-34733f3e4ddmr20870809a91.26.1764194957695;
        Wed, 26 Nov 2025 14:09:17 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174d2c0sm22443347b3a.66.2025.11.26.14.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 14:09:17 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	abdun.nihaal@gmail.com,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v3] most: core: fix resource leak in most_register_interface error paths
Date: Wed, 26 Nov 2025 22:08:56 +0000
Message-ID: <20251126220856.3918-1-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function most_register_interface() did not correctly release resources
if it failed early (before device_register). In these cases, it returned
an error code immediately, leaking the memory allocated for the interface.

Fix this by initializing the device early via device_initialize() and
calling put_device() on all error paths. This ensures the release
callback is triggered to free memory.

Switch to using device_add() instead of device_register() to handle
the split initialization.

Acked-by: Abdun Nihaal <abdun.nihaal@gmail.com>
Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
Changes in v3:
 - Dropped the USB cleanup patch as it was already applied upstream.
 - Added Reported-by and Acked-by tags.

 drivers/most/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/most/core.c b/drivers/most/core.c
index da319d108ea1d..8635fd08035e9 100644
--- a/drivers/most/core.c
+++ b/drivers/most/core.c
@@ -1283,18 +1283,23 @@ int most_register_interface(struct most_interface *iface)
 	struct most_channel *c;
 
 	if (!iface || !iface->enqueue || !iface->configure ||
-	    !iface->poison_channel || (iface->num_channels > MAX_CHANNELS))
+	    !iface->poison_channel || (iface->num_channels > MAX_CHANNELS) ||
+	    !iface->dev)
 		return -EINVAL;
 
+	device_initialize(iface->dev);
+
 	id = ida_alloc(&mdev_id, GFP_KERNEL);
 	if (id < 0) {
 		dev_err(iface->dev, "Failed to allocate device ID\n");
+		put_device(iface->dev);
 		return id;
 	}
 
 	iface->p = kzalloc(sizeof(*iface->p), GFP_KERNEL);
 	if (!iface->p) {
 		ida_free(&mdev_id, id);
+		put_device(iface->dev);
 		return -ENOMEM;
 	}
 
@@ -1304,7 +1309,7 @@ int most_register_interface(struct most_interface *iface)
 	iface->dev->bus = &mostbus;
 	iface->dev->groups = interface_attr_groups;
 	dev_set_drvdata(iface->dev, iface);
-	if (device_register(iface->dev)) {
+	if (device_add(iface->dev)) {
 		dev_err(iface->dev, "Failed to register interface device\n");
 		kfree(iface->p);
 		put_device(iface->dev);
-- 
2.43.0

