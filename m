Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2D2C159E
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401704; cv=none; b=SoXjQOpdqbB7Q6ZdTdvEZykTqRdja+rJzXhgisXr6+ZSSYElG0upZrs2IF/mLXhp/inrSoTqRh/fw4CWR+W/mjj7bg1xiQUMpq81VG5wk6Ug12CC4iQP+8G2S1WCGLp/KBBLLuCv0VofqKBRHK+waWDgVxvKtMiKxXQB7DKTA8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401704; c=relaxed/simple;
	bh=9QiIia74JRTviCdtIm2WitZalTk3wrY+R8Jc1t1WV4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2WaQ09yJqhk8/MuBmTAS696CjtfsdWrtbfKYYBWFoTwPAVKZ1mMdHcEEoXt9tJsksXTwPoPlkpMB6t0EQobl4Rsp5dZnOUGulf7tDJXWvHVfUEO4pFwqWY9DetOYg0nvGGt9gTG5hnAqN9DOA4pQzv7p6AvyjkjuxnYATViw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKncu3K3; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKncu3K3"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb5c9ba82bso681264685a.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401702; x=1773006502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixyfPDI/WWDc0m3/7MrjaM+VTce0ePRwmb8CNDugAvc=;
        b=eKncu3K3ClmajB6fQhcf/lZ2P4zO57eLcXzp9iwy+nr6T7VWYfMZOAPuDJBj1bEpUk
         /IHLwKcA5nCwACN6LguKzyYOiT3cOxX83Ma05jgw0O8T23KJN41UgY/FW752HiNot2hj
         WZgOwtZUmg/qXT1TkN3t9/CtlZfg6PZ2QNsPOuz/8xTTsu5KZYe1sPf3aXKIxSPqHuUO
         8M/fsoirk2S9gCXritXq0dUAIjeeWBtB51mS1kg0QOYmzx1NecgsNHWYHcOtU7FfjDqN
         O1vV/In+AXbyHzu9wP8KsZaZk43/CMsfjfVB0wr+ug7oYMxZcsCyDdLzoIiAJktbwd8/
         hBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401702; x=1773006502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ixyfPDI/WWDc0m3/7MrjaM+VTce0ePRwmb8CNDugAvc=;
        b=PRMji48nRRVJ8j1AAtaUMVubhMX7ekvWVxz5lBMIrcNvdvG5rfUALlNMyDuxy4qd3Q
         thWYvI609f3LEm2xAgIEHKW8nHir4aQKrXGAWi528nhgWZ/y/QQ25jPF/qQKRR9cj/xG
         FXR2RSmQhQsBb9iH95j5FRU8b5/TbXDkCYVws9Djwwdp4P7SZQ7Qk01+WS3yW69h8PlI
         mJs2lA+xqxHM1NZkrNtl3T7m4l9ZEiE9edcrYxLaI6uiDVMUvzlqYNn/UIs0AVBg4c2h
         ojr1n7nNFdPRy4L/foROdBxs6lDXvoGC7uPA2/n1aizoNclZdP5QAQBd45ha8sI9wuKR
         fNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsv0dXFlilkzEsZQQ5cJLVKh6O9JTcvaBhsW+anpCjb/pyhdqQi3oe3VTaR92soD1IdOU4SeiGxetIj42a@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc4EV2gnCYiOqvrQjKOe2v83SaLh40VZqRDq6anCxrKSZPqjZY
	SOvbuFgIY90gMQpZ166utWDpZLXF2x+TlXehsgZ3HZYxpViFC71KxrRY
X-Gm-Gg: ATEYQzyGuEV5sf+dA4QisjMjNtzbRi5V329IWi5w2Ssy4IEjwkHJiGputfVaLYX47Jo
	70RAASnIO0lMMk9YfWbKUG6Z+Q9P4bdFuki4HZbpvAw9Fk2P2BjGT4SgQjXqbH7XWsICjqeJg5o
	H/evWR20dDusVNEryJGiHzYMifnaVIoZ5YDYiTFqsOCIzpLcxtGZGIXP7OcD3WzmoCjngTOtWKM
	PY938R9bdx8RN2Ku+Hu9mE+UFu4ZHnax8qUmIf16ABV9Vs0OR9xJs8R1XeQ2YRKRJUwGBOLeevW
	RyymLBeJy6PEE9efcrdtLpShwvBmKiY0hR6NQS4brkSOowlXQK3WElS1qdKtphBlvAIhmM0f+zA
	00f5e3yhCjX6ktHqMrZCwgdUMKkhXFfLDWJOLtwBXhEXBc/KGhHoqomW/UbauaKkyoPDOZZ4Nw6
	LhPCvMwXUlVtE0G1jxGE1IcD8ht8JOUs3awcDz4zScCtoojvHweICcGDDt8UtDiI4h1mKjzX6b3
	G9/
X-Received: by 2002:a05:620a:2697:b0:8ca:3c67:8918 with SMTP id af79cd13be357-8cbc8ea357bmr1314689085a.76.1772401701721;
        Sun, 01 Mar 2026 13:48:21 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:20 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 03/10] staging: axis-fifo: simplify resource mapping
Date: Sun,  1 Mar 2026 21:48:08 +0000
Message-ID: <20260301214815.2628942-3-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Josh Law <objecting@objecting.org>

Use devm_platform_ioremap_resource() to simplify the code and remove the
unused struct resource pointer.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index d83a0fd5b231..fc8e35696b31 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -450,7 +450,6 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 
 static int axis_fifo_probe(struct platform_device *pdev)
 {
-	struct resource *r_mem;
 	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = NULL;
 	int rc = 0; /* error return value */
@@ -469,7 +468,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	mutex_init(&fifo->read_lock);
 	mutex_init(&fifo->write_lock);
 
-	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
+	fifo->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(fifo->base_addr))
 		return PTR_ERR(fifo->base_addr);
 
-- 
2.43.0

