Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D413EDAAD
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206767; cv=none; b=TM70SAUHREqKifVEUUSntiV5/El/nv85Cfe+wKSIjvohugw/2yaEv8qGPKVUfQrxaM1y87mxGTR8Ug61eCh4vLmTyaCWxtDK+3av9xK/Zu2FeqmHCSJHDouNNJG3PABpoCuMapPa5Usodcgx3sngie6C8/Zh7VmGNOss/c3sZig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206767; c=relaxed/simple;
	bh=95pyT4Vh6HHV9tUtZR1CnydBNoHE4wMU+h5fgWmoMQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zg+jdQr9e7XG/kJ5c5xwMvUyOUImAJluuKdZI7KU8xIrg+elAwZ8Oa8gSR7V/HJIwpqQkp1rysgQ/H+PzwNVD+TB3OMRYSPdgYJY2rReJNTGyckmXI60QLCdvLA5TWULHtHuWElzbYAxJ0GHDIlmsgY+rkxBHwiF1T4OVabmkKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzJWW24i; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzJWW24i"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso765999866b.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 04:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770206765; x=1770811565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH8ain0P1CfpzApMGJqEysO9x8q6tU0rG1fyS+FPLF0=;
        b=LzJWW24i2O/nd5jVwDYgUrNSSn2S4ldMDYRrOm13whv58l7U0w2TqEIYwKWKtsNrB0
         674bbXYv4FJQWzmcqciPS9NdkI/FstlQNLjzMLsLKhXvq1mMdumFum9OZUbnGc/W0lei
         zddMqggl7v/U5zs3HBpHZYfuH+Xe6hPA0mcr+PM/MfWjnExliLR1NJf8DyRKS+OEiycj
         WHWS6ozhoya9qOxnTFtxYMmlYmsE5v3hCoZX9a1HzrbAI3VYBWlq2BP+KyXOVVO41OIl
         pKbR3iehOdDCrvXlyYgKcX85WgvKbVIJDMJa4tPFK9bDJoO8AzXVKWCoymwcaWGwNUO7
         1BdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206765; x=1770811565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WH8ain0P1CfpzApMGJqEysO9x8q6tU0rG1fyS+FPLF0=;
        b=Wza7zSbZM+dsD2rKPqDsySOcEylp1x1733jiQIGw69aNzAXWvEo/QEqrpzWoKsGx4c
         E5tmW8OdwJvAjp0x/LqXqogrKFJFZ41UW+sPDbgKVJxT7EuoE+uWAL5rG0GEVO1njRMX
         gpr0YQFZ5yTXce1C9kh8WsJ+DLaVB7j/PTc4Sd5vudQz/atb81HgGQteHVjyk/1DX2b8
         w2DfOqUdmDNSKWALeUhpQjWHx6T1yFqsi3TG4uqM0pqOwzjjBx2CLh1yqXYLFahsC6O4
         ExOu8jJb69IAA8TVIcQEZbjHuU1pFfE2WhSD7LYqWpXWq810315YlXgh54HxeFlOETKO
         qOLg==
X-Forwarded-Encrypted: i=1; AJvYcCW4tUmS3QQ+lRC4NFqr+eG9UeAylh/f7Sq/tSha6VR1oIhA6GWhwNmXh1a4vUzP+0sY6Hd3RwvRunORmlXK@lists.linux.dev
X-Gm-Message-State: AOJu0YzBdlC3N6/iO7N9vl/FmVC+3entdcuVE3hDyRMo2SCQMYyZDHcv
	EWR5lrXvyDZaj0CA9EENhj2ersNf35VKSVb3DkUMuoMojjr++jN1E974
X-Gm-Gg: AZuq6aL7wLaUMOCIBWH98IYP3ezeJxbPyQBOFDTtJZf4yF6u2GYImWUWOIZargpBj4e
	ZwHgMlP9s4z+M+tVORYjyrr2zKgv8JDM8LQg13kOv0V+Pcwnv9xzS3Rwwi2e+9PM4lHTT+oOdwF
	ynwJE15+TpALmL+eqn9mNS1ruVfUv51wta8Mf3vZVAsXNyI1xry0x+sXAK1kvqM5t1FN2zCN/L9
	St+rjmhhMg8oGQ/UJ02MX9Chm/NZMzVQaz8YmlMIJMTitP5ss/Vc7eLkVp/Cihmk2QEwXKXRcuP
	f6JMF0OqhN7WwVH2XvTahWsDbp/H3LVYAt9wPIJVpFPUPiQMBxz10x66MqTN3Yu4vzPm3ZWQvhL
	eFVMJzCIcZ8lrth+X2BK+5YROrum5W1h2tLm9jGGzNDgwYuGjTt/FtdoEDQEJoLyO9BVaYZe9Ws
	PBWZcC6iwPlN6p7CEA6DBBcZk8yNt9d2Va0rZ+TGCjsXR3lMDq7HaBgcewqf+wIat+KRxb1/ItS
	Y7Fg8Aw5VoI5DPAUiHYOqe+qDI8Le8i69qYkqSPROsv/hbKC3BhJiSMY7w=
X-Received: by 2002:a17:906:eec8:b0:b88:775c:bd68 with SMTP id a640c23a62f3a-b8e9f10a2a6mr198934066b.28.1770206765140;
        Wed, 04 Feb 2026 04:06:05 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (216.79.91.34.bc.googleusercontent.com. [34.91.79.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8be3sm117979666b.10.2026.02.04.04.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:06:04 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v3 5/5] staging: sm750fb: convert logging to device-based in sm750_hw.c
Date: Wed,  4 Feb 2026 12:06:02 +0000
Message-ID: <20260204120602.6715-5-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204120602.6715-1-iprintercanon@gmail.com>
References: <20260204120602.6715-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert pr_err calls to dev_err using &pdev->dev in hw_sm750_map()
where struct pci_dev *pdev is available as a function parameter.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index e3e4b75d6..bf4c1585c 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -42,7 +42,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	 */
 	ret = pci_request_region(pdev, 1, "sm750fb");
 	if (ret) {
-		pr_err("Can not request PCI regions.\n");
+		dev_err(&pdev->dev, "Can not request PCI regions.\n");
 		goto exit;
 	}
 
@@ -50,7 +50,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->pvReg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
 	if (!sm750_dev->pvReg) {
-		pr_err("mmio failed\n");
+		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
@@ -75,7 +75,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 	if (!sm750_dev->pvMem) {
 		iounmap(sm750_dev->pvReg);
-		pr_err("Map video memory failed\n");
+		dev_err(&pdev->dev, "Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-- 
2.43.0

