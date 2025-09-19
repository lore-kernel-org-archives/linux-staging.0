Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4A82D0267
	for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 19:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758311774; cv=none; b=b2LEqLFOl7Rkst4bgm6ggakDno4a3AObb0U6pxlLwAr0nk66g00TAFClROkhjpDTsdqndItiPlACXxeHKlBjQyRAqrJtPfLT6CghFKYZ9kGHgoAfrt49wiiPzd+dwgreG8/M+/ihdiKtAQMp7NGfGoJOihE2YW310kS4kVkeE6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758311774; c=relaxed/simple;
	bh=sZ87DphZldS+3n0LQT7BxNMEf1yIgvPiSz7rdnDAa0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtqlsTaw6CFbfdGDrupoL7TcTfP5BvATNIyAToemMYXzSu4vrND191kSmv9P0gBEk0gZgOr3Eqrp72pJKLz7FwQwJFigjNppOezo5o5LgBJjed5TdPuv7MFZ1umey/Xu6f6mYtumTzvvryTJgQ8R8uMvVN5VNc7i707gOPfzleo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0Bxw5kF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0Bxw5kF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so17339685e9.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 12:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758311771; x=1758916571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQweL7ildnxUZkvX5C1ntDuxX4C6kDLFi7r7zPykbLE=;
        b=T0Bxw5kFSDQoLWrygA+bJDS1XLnMV0BE7sCwK/h5D0eaM0znBuezL2CCPWWeneEsy/
         ktNLvOyCjkRGpRSJLxdRWJfKzECv4hTDfhABhkRdd+n1xFqvGmQe+2EJ3gt/zvLb3iEF
         yDOMoFvB9V8w+x+H97gpktJt1Kja/L0LC0r+kmTp0bx4FNKWc7kqStOxG+/oufNtM9ve
         Fjl+2Yz8faLy6WoK7vfmlUIEVXDouEebWs46QUv8cvIZN89Vl1go6JWQsi5CVwRlfZNx
         pZ5kxh21lPCxhMNW7F540QVxJu2PIcu6ZO1GpTP9A4VpbcwPTjpvmTO+UU8hmNrASVxL
         Andg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758311771; x=1758916571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQweL7ildnxUZkvX5C1ntDuxX4C6kDLFi7r7zPykbLE=;
        b=BewdDBE5cRwocVwlOLuaV87+tf68BxFSjQ32M/zuZTNbwPjlNvHYwbhpZaqrJnMFkG
         nGo1rlj0eLLisECS1Lb8OKSuSibD9Ek7zBYbkx+27YxQFsPBAMDItOFwsaYazPOigh9x
         fxwS2p3tXAMSzygTIFFXwJMCC726e6CTd/C7ic1hZPphjMmPa6+SreE7tZM1deyzWwtx
         DFnGJAjrKRR7Rgl17gzLSpUKkCQPF3luwMVWqoKZozWjuoshXScLMqJfFaZ6/jO5O9K0
         u+E7etrlpPzxF9FY96tlHCpaXqRGsAU1xzeMZSpTMKzTmO3yu6Wi4X24CsGXr+thv+o7
         6yvA==
X-Forwarded-Encrypted: i=1; AJvYcCWAKaPaLNy23wgVHQYNC37tjDfZB5Dht8tMEmp0+W64vN4jJ6UV7fs/FxczGuM3Zv+f+kJtujF0fLjj/b//@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5OUXPEb16WX/6QJPJn4/pvb2uU8AgP4aRDRk3FZ7fbZaSnhIz
	wnksQhIAe9I06YvPtZZWAR/UqnylJEsKQ76m3Z3E03uAMcOlBTvFc5Fy
X-Gm-Gg: ASbGnctf9ePEb/itaSdJaAlsihrUTfeo+akiTs3pKS3m10NbHlMMPrQsBO8Q0zMQB0o
	+VC/bqgB+i34dOULcwzhOsT3eoEUjTRt2UOCACb7c/oAndxNehxarmlGYW487+2aG9OJwP5Bl4y
	aNp/csHDokHwYcbY36yHHGs68qrT4/6y9rx87tvAtJQztTIqJnY5yvlBqNDJklb2+EX9+UD49Xk
	wFJAi1sfseTGrxHfRCyq9D1irBRx+7Y/nHU7TvVToyGSUEkEERpmAPnC/G7KzckjcsVIGIuoFUC
	dQcwXow89fmdW5XIcK8pOjiXRTXFEb00CY1/GnHdgekwaQccs/8NrNj8SoN7LrfFRQQlc8Fya4Z
	cFkhCPtrj/QQdVdAuAh+WHeGZ235QTSiXjSyEvZDt8LBw
X-Google-Smtp-Source: AGHT+IGTo85Vi1p8AU08ZWHlqAuVlC+41VDkpAZXn+ZCIc5qtVePYQMGMPM1EWc+q66fPqPc+PJyYg==
X-Received: by 2002:a05:600c:c162:b0:45d:e326:96d7 with SMTP id 5b1f17b1804b1-467e77d53f3mr38636125e9.13.1758311770762;
        Fri, 19 Sep 2025 12:56:10 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f162726bsm97025485e9.7.2025.09.19.12.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 12:56:10 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 3/6] staging: axis-fifo: remove unneeded irq field from struct axis_fifo
Date: Fri, 19 Sep 2025 22:53:57 +0300
Message-ID: <20250919195400.3180039-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250919195400.3180039-1-ovidiu.panait.oss@gmail.com>
References: <20250919195400.3180039-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The irq number returned by platform_get_irq() is stored in struct axis_fifo
during probe but it is never used afterwards. Drop the redundant irq field
and use a local variable instead.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 33a8440858d9..c500cb0555b7 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -118,7 +118,6 @@ MODULE_PARM_DESC(write_timeout, "ms to wait before blocking write() timing out;
 
 struct axis_fifo {
 	int id;
-	int irq; /* interrupt */
 	void __iomem *base_addr; /* kernel space memory */
 
 	unsigned int rx_fifo_depth; /* max words in the receive fifo */
@@ -587,6 +586,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	struct axis_fifo *fifo = NULL;
 	char *device_name;
 	int rc = 0; /* error return value */
+	int irq;
 
 	/* ----------------------------
 	 *     init wrapper device
@@ -640,17 +640,16 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	 */
 
 	/* get IRQ resource */
-	rc = platform_get_irq(pdev, 0);
-	if (rc < 0)
-		return rc;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	/* request IRQ */
-	fifo->irq = rc;
-	rc = devm_request_irq(fifo->dt_device, fifo->irq, &axis_fifo_irq, 0,
+	rc = devm_request_irq(fifo->dt_device, irq, &axis_fifo_irq, 0,
 			      DRIVER_NAME, fifo);
 	if (rc) {
 		dev_err(fifo->dt_device, "couldn't allocate interrupt %i\n",
-			fifo->irq);
+			irq);
 		return rc;
 	}
 
-- 
2.50.0

