Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1093C465
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 00:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326222; cv=none; b=czr7Briz+wx1p95z3rHWGb+nwK8cZhi4n+EO7SClmWjRpeMrsCrtwS2iIQTZS+fUeUSfvVqxbSSGt/3XhY4UExkgmH62fA0z5OV+fyJqBAu6MqLrx2+QWvWpeuNu7mN8bMk44988VlhhBPRKVwUW6icykbfvexAlErZKCCx0sVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326222; c=relaxed/simple;
	bh=cc0tZZyDVOuJbJmB3ORVkmAH9NghVsqjAK7zxLWUhXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mWXhvaCLu+q1yo3w+k0gLHXTY2FbIUcPk4ES/5KiUiunh8qKBGzDg7MpSm84VXgOzwrD/3brgpivWD736IVz7jNL/OFt5cUZnLm8lXhBfoG7330Ck7+ocszzIM8KbxgiQTV0USfiGqP/NW+FccMuSUeAKs2Wc5g2VtOvSD2oWUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnvvKWzS; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnvvKWzS"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c7199e7f79so456474585a.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 16:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772326220; x=1772931020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzoDSGtih/Mlt9ARvVBqZXwsc/ALwBNBaRQVeYKMnhs=;
        b=bnvvKWzSQ9JTvt6SHjta+h1XZPFmaI2ep5AEfoEX09XslkwSLtnPLpC/FHEXK3QnCF
         Zj33bbSKsoJ59zOIAyY6pL4wp4Gj3RMPGTMDHMy3KsOcgAd8vEZYnmha1FoUYw0f14YI
         ZPxhRcBpVgSXAdDk1OQQYAlnFElKOYoZU4i6acNo2L5aepmHIhWe12PKbriDCxc/J73v
         1qr1gc+00lfZGLzi69ZnGMq/2OvH2MfIg1NUB8RfbGXg5usQOxe/i8C1mM+2FSxymUP1
         gta3jt5fAUmVDhk55chl0xMfywlEeRnwegmy6W5ktg+ulm8SKQXpT7kugjPQUmk8mI7w
         pP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772326220; x=1772931020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzoDSGtih/Mlt9ARvVBqZXwsc/ALwBNBaRQVeYKMnhs=;
        b=Zblg07ctLIQWrCVOcwAqCUXwd5VZaZp5uGMxfX/0JZwFoaIioldyU6OEV5qNoYqn2y
         lbzdglFbCee8u+3s9ZbOyndPDh1sdsRaqIq0YmY54Vg57zFu8CmlnsbPIFU4GdF7oMzh
         9yK8rU/HDyBlKg1xZLpNtbVy7nD5w5roORoXco2nmAMeztFrw2uZB3qMQyYQoqZdfSPj
         s98NlxuullB33bG6Ef8YNPThLL3xypRHvmokIgryTXAbHI1KPq5ceq8pLRnNeX5IKZlo
         8OAYoLzuWgOlBF6Klxb5pV8nIhzeG1Co4z8tSvfsl2VghsjT5V1QvuVNVuSy/GkK4GE1
         2Sfg==
X-Gm-Message-State: AOJu0YzABXLlL4UmfQ1tj26MSoCTQyDsXp9/5c9LZLNqS6CY2KIftqKO
	6xQGaLcl69x2pBA0gx8da6XLHegGVLYzL9kyQGgT7amEavfQU8zMMnvH
X-Gm-Gg: ATEYQzz9mxclHUFQT65JhnBOSgR+TfYWrS2iX3UQaQwkOylfp9z7UHZ2JTlbYw7Rx8n
	AgVnaSJekkSuulgew2swowcW8uEkm4kbzRdqJVkMgVeQjAnz9pti0qXmNRAzra6pkmaJg/R98Fz
	5AaM+Z2u57gR2/QzzJSpBBs5o7wrQ5qaLMGbFjrsRAtQo9lK0iwY30gtAccxqs/H9n5RzGrx0gn
	k6oPxXMUj2Qyyx6hihBs+3B5/P4nGE0hiWNfXvRicP7DbS7LF7e+Y+TIP7AQruUskAxauiIPqF8
	aI6d3WdM8CAHM3aK1jhZJ1Q9pznT00UM4cLjOkSKbbSHLes5ZBE+FZrdBRX/F2zgMoRSqwoxXFJ
	dVVZ+Q9vkV8Rue/QByJtAbxat3Nk7c5FMFYE+brS92ckwX5CYyzcMq82cB8oWc5jPd0YkcdVNg/
	Lw1EMFRZ8B/4Sr2hrtkb/U9ZuKqQ1xhTuv31q9Lvw/XKKKHad3HhgNCTzT6cwjIEXtt0ouebq8v
	kstnryWnCeDomg=
X-Received: by 2002:a05:620a:7108:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cbc8df0b7fmr1048663185a.49.1772326220166;
        Sat, 28 Feb 2026 16:50:20 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ef69b07dsm9008586d6.42.2026.02.28.16.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:50:19 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH] staging: axis-fifo: remove redundant goto end
Date: Sun,  1 Mar 2026 00:50:19 +0000
Message-ID: <20260301005019.2510157-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aac2c58ef9b3..d83a0fd5b231 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -395,22 +395,22 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 				   &value);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
-		goto end;
+		return ret;
 	} else if (value != 32) {
 		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
 				   &value);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,axi-str-txd-tdata-width property\n");
-		goto end;
+		return ret;
 	} else if (value != 32) {
 		dev_err(fifo->dt_device, "xlnx,axi-str-txd-tdata-width only supports 32 bits\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
@@ -418,7 +418,7 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
@@ -426,7 +426,7 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
@@ -434,7 +434,7 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,use-tx-data",
@@ -442,10 +442,9 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
-end:
 	return ret;
 }
 
-- 
2.43.0

