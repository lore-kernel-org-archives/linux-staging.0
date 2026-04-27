Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7841032ED55
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303090; cv=none; b=D8EauhYsBgkCZSpQyceqbZ9TevRJLlyjCmHAlHaKCpdiFYHiXXPP+2v9qJAbF7LhrVFUiYYrvXjOD4gvCXjiBBVvXoIVxV/QUQOlvTENi+1zgCEPAaL9a/5/DSHOmMNJ/HvbVZD4SA23PrqXJ2yzJ8dqQGWst1uVru/lTf5SXzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303090; c=relaxed/simple;
	bh=SeLHWJSm3VQuJCEeSaRLCqVnoUtA8KmutbSxFLsMJII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIcxRbAy1MtkQampLwWwBTtGyF9cbcNN+16cJxxhjydsa3dxiFwZ8FB1qDzSIDJhmJRHbvxgOPDyw7smHOE14XkzxYqPNWAhztJTFyurnccJSaadsPKbPMk9ApPS7++WZMSpm2DcLMQ6eSscibkLwETpFUwW+LOZQ1R24fvPm7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb85FqUK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb85FqUK"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8296e257735so418297b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777303089; x=1777907889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeeYoJchmIwBM/6rDWjV5/Iw+D5ZiU05N5VNWiTx3CM=;
        b=Bb85FqUKs4K/043oCX5LpF42ltwcu4XwZTAgeolEL7LQNUDmjNQFsYVXG0UajdXlKT
         kLL+R/FP8tKqxUAtWvO9BGmCNskpG4RNaPmfopG36ETsCw9zXHfLrlwFis/mQtXsK/Vu
         06kvqn+S5HuWDvKdWve9UK1ykoCCBhL/b33sWty1Rnfx0bIuep2yqPkmlYzHIF5ASlZm
         8dC4xqqoaq/0vxapMOirZh+dTK0OPuuoWhuTfFc/bV085bjFpYEhcYVHxEwNMIxIM20Q
         qdDKrMXZqTvuFZqHIjIa+vSlopX6de54H1eIgqB0DedAMrwdKR45M3WPqqrh2klmi051
         XuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303089; x=1777907889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PeeYoJchmIwBM/6rDWjV5/Iw+D5ZiU05N5VNWiTx3CM=;
        b=kstQlOi83Iu+CAhhwYAt1wTWsDiqIJhpd9kkaeGEC3WOXm+ZKOKYSwHBPPqY2HT7z8
         PjM1TDXajsqas+IuYFTqr8HkOCA+ywYPaE8zsVeUihl98nTe//0Gcb86m2QhAk89RVsj
         LqqTDM+NNvX09Ja97u1qEnn/p/wjBdo4M7uTYVB0zpCKn4RB6+G4EaJjsKgJRBvZodb2
         HQs/D2JgnYqV6wEj3hGHUh5xyePiRVL4LnU96vPPT3NyHqvbt7frYSbtUYqiZY0YR4Ec
         r7End8qIM82S5uFXGPwmfpO+88b6JIJlBYw0obemt+X+Xk/FM7zzgrxBzmzBNV6L7S/3
         6egg==
X-Forwarded-Encrypted: i=1; AFNElJ8bK0UPJ5H1BWr0cuuzZNbFm99pcxXN8vW+IjdwdcpEhipDr34xQg4SOqsQNQTM4aeYoKXNWPfWG/1pOCsW@lists.linux.dev
X-Gm-Message-State: AOJu0YyEy0YDSJMA5CZ4Zq0haBQYQicIi6QeU4lVu485/Qqez0/InjZS
	MCuv2MDH0hJmD8aXJz6AD9sSYEXohToawUL+iLuKAui0HGxOAZXPnW04m3HfCw==
X-Gm-Gg: AeBDievmz9PfY3rN97DZ3LTp75GCXOGRJMfkkUQ4hSbcdAJVKtUP6ZZnzrnJ38Wz12k
	yc3h2V/sN2D5v6L/oikAkKEcGawVRLqGcz6dzNU89eXzYhWT9PYJnOArICvoMVSYFOS5HoEfalD
	8FYl58IQTRMebKQjYIuyjjmK2RRJpQfITFhgP8UkMfpM1qK+an4FR5eYE0K2W6PpmfU5WNgHbGV
	1JS6ttZGqBd4fAVce1IBiWviDduDKPxXL/OEUGnrS+fFHYXS62u2Z7R/dd2u8X9yZDe1zTOWsaV
	zzLkt729OdYwy82Mfs9eegnIaZeIWBxWYdaqY7go0w9mHTCQPGext1FCI1hClPcvIps5KfPkTF/
	f0eBtgRIYtjCD/V5SddQI8k7bAlLCKbczMhw8Fij025kQ4OU4hHcewicith96xULHIdH4aAHe5q
	m5rzV/ptC8s3n5EDQ18m9b7+oYRhRkGdXYXOWI6g84C8DOWrwjVkJS4e884qjMatF4YAEoW8rRI
	GastmxzdOqNd+llz524ixYLEYs=
X-Received: by 2002:a05:6a21:1b81:b0:39b:80f2:7809 with SMTP id adf61e73a8af0-3a08d8dffffmr26783979637.7.1777303088668;
        Mon, 27 Apr 2026 08:18:08 -0700 (PDT)
Received: from fedora ([2401:4900:d824:7468:545f:3159:76d5:30ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm37652931b3a.58.2026.04.27.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:18:08 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ayushmukkanwar@gmail.com
Subject: [PATCH v5 3/4] staging: octeon: ethernet: replace pr_err and pr_info with dev_err and netdev_err
Date: Mon, 27 Apr 2026 20:45:54 +0530
Message-ID: <20260427151556.91153-4-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
References: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_err() and pr_info() calls in cvm_oct_probe() with
dev_err(), netdev_err(), and netdev_info() to include device
information in log messages. Use dev_err() where no net_device
is available (allocation failures), and netdev_err()/netdev_info()
where a net_device exists.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index a7ac29c0a4ca..7c3cfd9efa7e 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -698,7 +698,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	pip = pdev->dev.of_node;
 	if (!pip) {
-		pr_err("Error: No 'pip' in /aliases\n");
+		dev_err(&pdev->dev, "No 'pip' in /aliases\n");
 		return -EINVAL;
 	}
 
@@ -796,16 +796,16 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			dev->max_mtu = OCTEON_MAX_MTU - mtu_overhead;
 
 			if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for POW\n");
+				netdev_err(dev, "Failed to register ethernet device for POW\n");
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[CVMX_PIP_NUM_INPUT_PORTS] = dev;
-				pr_info("%s: POW send group %d, receive group %d\n",
-					dev->name, pow_send_group,
-					pow_receive_group);
+				netdev_info(dev, "POW send group %d, receive group %d\n",
+					    pow_send_group,
+					    pow_receive_group);
 			}
 		} else {
-			pr_err("Failed to allocate ethernet device for POW\n");
+			dev_err(&pdev->dev, "Failed to allocate ethernet device for POW\n");
 		}
 	}
 
@@ -825,8 +825,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			struct net_device *dev =
 			    alloc_etherdev(sizeof(struct octeon_ethernet));
 			if (!dev) {
-				pr_err("Failed to allocate ethernet device for port %d\n",
-				       port);
+				dev_err(&pdev->dev, "Failed to allocate ethernet device for port %d\n",
+					port);
 				continue;
 			}
 
@@ -910,8 +910,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			if (!dev->netdev_ops) {
 				free_netdev(dev);
 			} else if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for interface %d, port %d\n",
-				       interface, priv->port);
+				netdev_err(dev, "Failed to register ethernet device for interface %d, port %d\n",
+					   interface, priv->port);
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[priv->port] = dev;
-- 
2.53.0

