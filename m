Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FD22EB878
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 22:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764111392; cv=none; b=R5ygLJcJfZYab1aWy8ufP9Alkyfz7fJWDR0Xje4EmfPNBI08SRanw7YH5yGSqKx1Qw/AdVVKEhvdL/N/SEDu8a0BcsTVlh9otKVAe1oh2StnLrphF4O8r7f4VxQvoe6hQlBm3mjuYh4jyjSctfmoUCMKmknb7Ylx2kRcdnErifQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764111392; c=relaxed/simple;
	bh=nHdXGb2AdP2DgjNFeV3zcq8k0NdmnFBHBirPKHWn4Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geNJsb5KvMVQywdUJRtWtwtM9YBniDK0glhYxDK8y9Woqsyw6X4u532EkIeKGoR4Q6EZYAmGPURk3XU02y1jlqpoFiPjmkD2OABw6zAW+0xP3ttjyHk26/5OnHJiR1ZMFTx1/9mLgBvSFGjhh5wBNaO+E1ehDlNJ7OfQxf1GSjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1lJsnyu; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1lJsnyu"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so5962275a91.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 14:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764111390; x=1764716190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz05WzE00CjGABLWbGj8jFZgzfZ/0bbpM+rkTuSaLU8=;
        b=a1lJsnyu0frghClZVC4jH8KSvAWgki6jIfele3ueFsNKwoabqsVq27wF3mYFMoTaK2
         qu+gp6czjevDkcTIjd4rd8UoEEQ9X79LeX6nSaYMttmI88jKR8XveZQjJiTJscXNKv2X
         lnqVdOGhTQKhnlWP52rlyEcoNxkyVtlMpyCtYnLYpuOvgszk4m/axpNIe26gzAK6tge9
         39Vpls1bPBLhSi+DK6p6xFiESBXG+AaskZF/qQNb+yHwOvONeyHBQZROrJbisQ6IzpVV
         WBpaITmwLb6FeKPjj+jF72h2UvQ/HzIiPk94v8JWdiCPXpdYoESxQu1qrbIWNyiUSs8N
         6zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764111390; x=1764716190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zz05WzE00CjGABLWbGj8jFZgzfZ/0bbpM+rkTuSaLU8=;
        b=HjTNxBLowRLr0qfA2Ofxj8ddbXAWpncrvOq3Ig8nvOfUzrqexBSH9ghGryRdvCsPHc
         tIcCXSRsNL1PNt/nbpy06BC4TpdZj/+ujLG8MFRwiTK5kDSZ9eGS2E0G4+pL47OjEKne
         g61cBIS0dn9GfVr2AcxBW3xrj2MN9SnoxjpxDbLqk3QIyq/OGgUYPpbX3xEUyA1cf8NC
         yRVROCvHwogjGrEWxVz0Yk4t4DkJ38Vl0TaFbgCOe2IQNUavdVUguJtZHt8F/weNjJkM
         gac6DooI37Pmvo5eohTrsCuZbhanF93lW4PripE/zE4U0kb4XItEbXKjddl8oAZMAkXk
         uXDg==
X-Gm-Message-State: AOJu0YxhUFPwBFqMPIb51rq0bCXS01d449cEMn+qKem4B+IfhNnf3ERk
	D/rOIQFRONVeCH2qRiouM5E17VPBS8i8az9TXhXBmMSjYsNa59TSBhZ0
X-Gm-Gg: ASbGncsur4guXZXeYqwDCTm3Y/ox9B4Jyrf+9+a+RZVlImLgTqrlkvfFpnlmQLXiJwS
	h/in/zIY3wUlVOdNU86m9owmDf85d0wWC5vaJR8hAH63y0RnudpoI5vccR7Twyxqn0KZ85GvV6M
	7ASwoWHebnK5FRUwxwgbkYyI5qebihK7QoJizd2MQLoStla6z+2vJPvT3i8O4tZYa05m1QOv2rI
	O1QaE/ujxmgHkEFC9Yx87dS+W0qoPBY92dvKNYPFiWHKyTpAV9CnXddudl2K1psXUypIe0/xBZx
	4Q01NBpox5cuSOPzSWASTV1xt1YUDQTScs2jGSv0G4d3F+QJJ0huRW5OqlEiTGQIlTBE2jSB+yG
	xB6TjPp/N+2q2GzZhGwuD6wd3Qgu63GvoYS1QqDQel5ZEMWZYkvQXwMU9yuNpNpiIPpp8opeaet
	TJscTvXr3aghmp1KUJe7hlexM5z9fBVhroalwy/P5uzz6KVHv+cJ0LXvAUifRXLPBrVlzSrb4ZY
	zKExmmRIViIDUL+Oy/rTaCy60N0DgwM3zieLlPfDjg7bRsRVxrmHae6f0u4Y0JpzEevlViJeiUR
	QbE7Q2Cj/cJyHI9TJc3FwTFChTMyS9ITug==
X-Google-Smtp-Source: AGHT+IHSAMT3z9iKxxRaqeZuqJy1nJTpeo3FuYnyVBT41pXi2yGCB/dHlw7gvfrBZM9/hCr7qkg3UQ==
X-Received: by 2002:a17:90b:5183:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-34733f2278bmr18436896a91.17.1764111390426;
        Tue, 25 Nov 2025 14:56:30 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a546ed0sm471842a91.3.2025.11.25.14.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:56:29 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v2 1/2] most: core: fix resource leak in most_register_interface error paths
Date: Tue, 25 Nov 2025 22:56:05 +0000
Message-ID: <20251125225606.70719-2-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125225606.70719-1-knavaneeth786@gmail.com>
References: <20251125225606.70719-1-knavaneeth786@gmail.com>
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

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
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

