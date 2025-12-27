Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BCF24A047
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870877; cv=none; b=ixyrbjNTB85S8rE1pCBfJPjoQBQwz1OKE7M5a74LWnGXPt5OT2vB2Tpy+GySuIbU4FfKcPp/WX5aB+9ddClea/7jird5jsKldfaG94IVaA0eeOpAu8T7PQJB5TUfCahNjWSOac5EPkVvd50iAn1btMUnyJMQ983mt4w6Fv8/E1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870877; c=relaxed/simple;
	bh=90mAUlDTROPfVFCT8zoE0s/7atn+N12hHNBRrzgd2OM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jF9EzhYGFdmNVCt9LwDTvBy9KhLr11H4jEO6iTvbp35iRttUe5HoZQpyeU+ZhYsojB1qhBxynakgvaaK3MynG7vDHu0LWYkcHFpcrDGGKSIK+0LxYTDA+2ygPVmcHPjy27aCSQaKct0gkjfRbPIhCq3W0LxH5SARjMAvb+qhUR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF4/s8eM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF4/s8eM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477563e28a3so49341395e9.1
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 13:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870873; x=1767475673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNJUqZKOGc1SDKNueloceJueHG9n2d7npGprfg7xtZs=;
        b=WF4/s8eMp3xIJyaSSFn7b0ugWqBjS8x1xyBPWm+KYs5vx5sNOoFSQhxjv+CkJe8Ika
         HuWAoyVOxYKayvH/Qs0BV+iH/Ptvn+cx9OP5EvPm33jZSWb5am0Th99crQvk7kACZrWN
         TEDQNuzJj4hWUVXn9nEuUmmLFDka24WcLw5Nh1RCJ5CzlUuHDozahVzGY7V9mJZgZxJ6
         YMnd9y9/e4Mp8d9yVLXpKbXwXRCt3zFUTdbfDTuuqbe+exFc++e6SAQuo28o3YgZgTyD
         7qQoV0KdpJjoyn1uOqX/jEL4kJwsFeeEVotHzGBXsFC5FM8Y680UsqMbsg6eJmiW+PRd
         MxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870873; x=1767475673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNJUqZKOGc1SDKNueloceJueHG9n2d7npGprfg7xtZs=;
        b=XMSEnR4/9+DYqnlg6C1Q578NQ+bMX17KWaKGmcHqWUZGH8pOmLsDYlxjPOrOPoAdaw
         IoHDx90MB0H4cUpoRPYsM3cFtVAUlEBGGec5xMmHdKhxr87gY7wNPo4c8D/MoMkU2pBy
         kcfctTymntC9WD85e+0LhafLVwLbwE0alGMl8RNhYXRLMVbEJNOkqJjbPQfCzgfTOge6
         WbqFF4QJ4qFNEM4nv9MJHIccQvCTcsU5XnK0tA/UdROqr8hjvxGJmc+TAm2jo8kdku8R
         NW5sHpj81RC5fkJWSt1wNlw2QxtSXxKNw2EuBvNVBElKdmnzh1/JbbWS/eut1gkbfgUq
         qbGw==
X-Forwarded-Encrypted: i=1; AJvYcCXC7wxWxLD3IaCbC5pgOtwcdp/AAYD9NA+8lfc81HT5bw7uUQ0FC7LREEKaoTI5+DUeKbZL26lMAu4JNsgl@lists.linux.dev
X-Gm-Message-State: AOJu0YyID+hIsRNRuX/umIZXFFbotHJFeqYLkgTo/wLkY98T10g8pfBQ
	qhPWJinG3Gbzx4SIPb6N2tFybueJiZxnHBihto39GqTsD1U2k7EO+w/E
X-Gm-Gg: AY/fxX7bdo5egD+RqiPuWGyv3DAabzf42aVvLRfy44mvUJuEkVy7G0jAUHWf2gQXlLU
	NGOjOMGH10dTGHt10uYPeyGwvn/0HQpoQmhq3gYVSTD3eegjW0uuh62mf+JtsWC2X+yfPEumqIg
	5E4XUICcSoN3fOcHgj4PW+3GcqxGBKRvCqFJ9wjMOmQo2UHZKH2QAk4LTUs7p2putBQ9MBEpV9A
	x6pfa+tr+8TuEE3DLVP49cn3XOixKWARsKyRHbGDrr1DSjYoxzFrMzqv2epVFrTbvXtdrtNAtHx
	T6ArYVlRl+3rnjm27Fe8ACQ5zMBKcjDSTCQPpvnsTZ3Tj/6TtL5ZmD1FityeB112GDB+tW7BMd4
	qb9XxMrWku1IlPKTlm3nR+9ApqY8NTMBVzJMN9If1Mn87IJxkaLoytYreulqP+vAFC0dV7pxDTc
	CnzO5YLEnpn3IPoRxLDWi24dlG5IgTZN8=
X-Google-Smtp-Source: AGHT+IGMPg76Vdk84Treatcb1rIplR+NzZiB7ZU2/mLvIxRUydL4BAJPqcfR+IjvqfJqpPr4Hto7IA==
X-Received: by 2002:a05:600c:6749:b0:471:665:e688 with SMTP id 5b1f17b1804b1-47d18be89d5mr376171605e9.17.1766870873303;
        Sat, 27 Dec 2025 13:27:53 -0800 (PST)
Received: from ws-linux01 ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm471531835e9.3.2025.12.27.13.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:27:53 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/9] staging: axis-fifo: Use devm_kasprintf for device name allocation
Date: Sat, 27 Dec 2025 23:26:34 +0200
Message-ID: <20251227212640.3321310-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
References: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual kzalloc + snprintf with devm_kasprintf, which is
cleaner and purpose-built for this use case.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index b9b2700410b8..d49bb401a227 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -537,7 +537,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	struct resource *r_mem; /* IO mem resources */
 	struct device *dev = &pdev->dev; /* OS device (from device tree) */
 	struct axis_fifo *fifo = NULL;
-	char *device_name;
 	int rc = 0; /* error return value */
 	int irq;
 
@@ -546,10 +545,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	 * ----------------------------
 	 */
 
-	device_name = devm_kzalloc(dev, 32, GFP_KERNEL);
-	if (!device_name)
-		return -ENOMEM;
-
 	/* allocate device wrapper memory */
 	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
 	if (!fifo)
@@ -612,13 +607,17 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	if (fifo->id < 0)
 		return fifo->id;
 
-	snprintf(device_name, 32, "%s%d", DRIVER_NAME, fifo->id);
-
 	/* create character device */
 	fifo->miscdev.fops = &fops;
 	fifo->miscdev.minor = MISC_DYNAMIC_MINOR;
-	fifo->miscdev.name = device_name;
 	fifo->miscdev.parent = dev;
+	fifo->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+					    DRIVER_NAME, fifo->id);
+	if (!fifo->miscdev.name) {
+		ida_free(&axis_fifo_ida, fifo->id);
+		return -ENOMEM;
+	}
+
 	rc = misc_register(&fifo->miscdev);
 	if (rc < 0) {
 		ida_free(&axis_fifo_ida, fifo->id);
-- 
2.51.0

